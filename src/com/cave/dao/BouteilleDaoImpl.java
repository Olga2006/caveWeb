package com.cave.dao;

import static com.cave.dao.DAOUtilitaire.fermeturesSilencieuses;
import static com.cave.dao.DAOUtilitaire.initialisationRequetePreparee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cave.beans.Bouteille;
import com.cave.beans.Position;

public class BouteilleDaoImpl implements BouteilleDao {

    private static final String SQL_SELECT_POUR_UTILISATEUR                = "SELECT Bouteille.id, Bouteille.id_producteur, producteur.nom as nom_producteur, \r\n"
            +
            "Bouteille.nom, Bouteille.couleur, Bouteille.taille, Bouteille.pays, Bouteille.region, Bouteille.appelation, Bouteille.cru, Bouteille.evaluation,  Bouteille.commentaire, Bouteille.nbr_list_courses, Bouteille.date_de_production, \r\n"
            +
            "Bouteille.date_garder, ((Bouteille.date_garder) - (YEAR(NOW()))) AS nbr_anee_boir_bouteille, Bouteille.image, Bouteille.id_utilisateur, bouteille.prix_achat, bouteille.prix_actuelle,\r\n"
            +
            "bouteille.commentaire, bouteille.nbr_list_courses \r\n" +
            "FROM Bouteille \r\n" +
            "LEFT OUTER JOIN Producteur ON Producteur.id = Bouteille.id_producteur\r\n" +
            "WHERE Bouteille.id_utilisateur = ? ORDER BY Bouteille.nom";

    private static final String SQL_SELECT_POUR_UTILISATEUR_DATE_CONS_DESC = "SELECT Bouteille.id, Bouteille.id_producteur, producteur.nom as nom_producteur, \r\n"
            +
            "Bouteille.nom, Bouteille.couleur, Bouteille.taille, Bouteille.pays, Bouteille.region, Bouteille.appelation, Bouteille.cru, Bouteille.evaluation,  Bouteille.commentaire, Bouteille.nbr_list_courses, Bouteille.date_de_production, \r\n"
            +
            "Bouteille.date_garder, ((Bouteille.date_garder) - (YEAR(NOW()))) AS nbr_anee_boir_bouteille, Bouteille.image, Bouteille.id_utilisateur, bouteille.prix_achat, bouteille.prix_actuelle,\r\n"
            +
            "bouteille.commentaire, bouteille.nbr_list_courses \r\n" +
            "FROM Bouteille \r\n" +
            "LEFT OUTER JOIN Producteur ON Producteur.id = Bouteille.id_producteur\r\n" +
            "WHERE Bouteille.id_utilisateur = ? ORDER BY Bouteille.date_garder";

    private static final String SQL_SELECT_PAR_ID                          = "SELECT Bouteille.id, Bouteille.id_producteur, producteur.nom as nom_producteur, \r\n"
            +
            "Bouteille.nom, Bouteille.couleur, Bouteille.taille, Bouteille.pays, Bouteille.region, Bouteille.appelation, Bouteille.cru, Bouteille.evaluation, Bouteille.commentaire, Bouteille.nbr_list_courses, Bouteille.date_de_production, \r\n"
            +
            "Bouteille.date_garder, ((Bouteille.date_garder) - (YEAR(NOW()))) AS nbr_anee_boir_bouteille, Bouteille.image, Bouteille.id_utilisateur, bouteille.prix_achat, bouteille.prix_actuelle,\r\n"
            +
            "bouteille.commentaire, bouteille.nbr_list_courses \r\n" +
            "FROM Bouteille \r\n" +
            "LEFT OUTER JOIN Producteur ON Producteur.id = Bouteille.id_producteur\r\n" +
            "WHERE Bouteille.id = ? ORDER BY Bouteille.nom";
    private static final String SQL_SELECT_POUR_PRODUCTEUR                 = "SELECT Bouteille.id, Bouteille.id_producteur, producteur.nom as nom_producteur,\r\n"
            +
            "Bouteille.nom, Bouteille.couleur, Bouteille.taille, Bouteille.pays, Bouteille.region, Bouteille.appelation, Bouteille.cru, Bouteille.evaluation, Bouteille.commentaire, Bouteille.nbr_list_courses, Bouteille.date_de_production, \r\n"
            +
            "Bouteille.date_garder, ((Bouteille.date_garder) - (YEAR(NOW()))) AS nbr_anee_boir_bouteille, Bouteille.image, Bouteille.id_utilisateur, bouteille.prix_achat, bouteille.prix_actuelle,\r\n"
            +
            "bouteille.commentaire, bouteille.nbr_list_courses \r\n" +
            "FROM Bouteille \r\n" +
            "LEFT OUTER JOIN Producteur ON Producteur.id = Bouteille.id_producteur\r\n" +
            "WHERE Bouteille.id_producteur = ? ORDER BY Bouteille.nom";

    private static final String SQL_SELECT_PAR_NOM                         = "SELECT Bouteille.id, Bouteille.id_producteur, producteur.nom as nom_producteur, \r\n"
            +
            "Bouteille.nom, Bouteille.couleur, Bouteille.taille, Bouteille.pays, Bouteille.region, Bouteille.appelation, Bouteille.cru, Bouteille.evaluation, Bouteille.commentaire, Bouteille.nbr_list_courses, Bouteille.date_de_production, \r\n"
            +
            "Bouteille.date_garder, ((Bouteille.date_garder) - (YEAR(NOW()))) AS nbr_anee_boir_bouteille, Bouteille.image, Bouteille.id_utilisateur, bouteille.prix_achat, bouteille.prix_actuelle,\r\n"
            +
            "bouteille.commentaire, bouteille.nbr_list_courses \r\n" +
            "FROM Bouteille \r\n" +
            "LEFT OUTER JOIN Producteur ON Producteur.id = Bouteille.id_producteur\r\n" +
            "WHERE Bouteille.id_utilisateur=? AND Bouteille.id_producteur = ? AND Bouteille.nom = ? AND  \r\n" +
            "Bouteille.couleur =? AND Bouteille.cru =? AND Bouteille.date_de_production =? AND Bouteille.taille =? AND \r\n"
            +
            "bouteille.prix_achat=?";

    private static final String SQL_INSERT                                 = "INSERT INTO Bouteille (nom, couleur, pays, region, appelation, cru, taille, prix_achat, prix_actuelle, \r\n"
            + "date_de_production, date_garder, image, id_producteur, id_utilisateur, nbr_list_courses, commentaire, evaluation) \r\n"
            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    private static final String SQL_DELETE_PAR_ID                          = "DELETE FROM Bouteille  WHERE id = ?";
    private static final String SQL_UPDATE_COMMENTAIRE                     = "UPDATE bouteille SET  commentaire = ? WHERE id = ?";
    private static final String SQL_UPDATE_LIST_COURSES                    = "UPDATE bouteille SET  nbr_list_courses = ? WHERE id = ?";
    private static final String SQL_UPDATE_EVALUATION                      = "UPDATE bouteille SET  evaluation = ? WHERE id = ?";

    private static final String SQL_UPDATE                                 = "UPDATE bouteille SET  nom = ?, couleur = ?, pays = ?, region = ?, appelation = ?, cru = ?, taille = ?, prix_achat = ?,"
            + " prix_actuelle = ?, date_de_production = ?, date_garder = ?, image = ?, id_producteur = ?, "
            + "nbr_list_courses = ?, commentaire = ?, evaluation = ?  WHERE id = ?";

    private static final String MESSAGE_DAO                                = "Échec. Merci de réessayer dans quelques instants et en cas d'échec informez notre service technique ";

    private static DAOFactory   daoFactory;

    public BouteilleDaoImpl( DAOFactory daoFactory ) {
        this.daoFactory = daoFactory;
    }

    @Override
    public void creerPourUtilisateur( Bouteille bouteille ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet valeursAutoGenerees = null;

        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_INSERT, true, bouteille.getNom(),
                    bouteille.getCouleur(), bouteille.getPays(), bouteille.getRegion(), bouteille.getAppelation(),
                    bouteille.getCru(), bouteille.getTaille(), bouteille.getPrixAchat(), bouteille.getPrixActuelle(),
                    bouteille.getDateDeProduction(), bouteille.getDateGarder(), bouteille.getImage(),
                    bouteille.getIdProducteur(), bouteille.getUtilisateur().getId(),
                    bouteille.getNbrListCourses(), bouteille.getCommentaire(), bouteille.getEvaluation() );
            int statut = preparedStatement.executeUpdate();
            /* Analyse du statut retourné par la requête d'insertion */
            if ( statut == 0 ) {
                throw new DAOException( MESSAGE_DAO );
            }
            /* Récupération de l'id auto-généré par la requête d'insertion */
            valeursAutoGenerees = preparedStatement.getGeneratedKeys();
            if ( valeursAutoGenerees.next() ) {
                /*
                 * Puis initialisation de la propriété id du bean Utilisateur
                 * avec sa valeur
                 */
                bouteille.setId( valeursAutoGenerees.getLong( 1 ) );
            } else {
                throw new DAOException( MESSAGE_DAO );
            }
        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( valeursAutoGenerees, preparedStatement, connexion );
        }

    }

    @Override
    public void update( Bouteille bouteille ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet valeursAutoGenerees = null;

        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_UPDATE, true, bouteille.getNom(),
                    bouteille.getCouleur(), bouteille.getPays(), bouteille.getRegion(), bouteille.getAppelation(),
                    bouteille.getCru(), bouteille.getTaille(),
                    bouteille.getPrixAchat(), bouteille.getPrixActuelle(),
                    bouteille.getDateDeProduction(), bouteille.getDateGarder(),
                    bouteille.getImage(), bouteille.getIdProducteur(), bouteille.getNbrListCourses(),
                    bouteille.getCommentaire(), bouteille.getEvaluation(), bouteille.getId() );

            int statut = preparedStatement.executeUpdate();
            /* Analyse du statut retourné par la requête d'insertion */
            if ( statut == 0 ) {
                throw new DAOException( MESSAGE_DAO );
            }

        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( valeursAutoGenerees, preparedStatement, connexion );
        }

    }

    @Override
    public Bouteille trouver( long id ) throws DAOException {
        return trouver( SQL_SELECT_PAR_ID, id );
    }

    @Override
    public Bouteille trouver( Bouteille bouteille ) throws DAOException {
        return trouver( SQL_SELECT_PAR_NOM, bouteille.getUtilisateur().getId(), bouteille.getIdProducteur(),
                bouteille.getNom(), bouteille.getCouleur(),
                bouteille.getCru(), bouteille.getDateDeProduction(), bouteille.getTaille(), bouteille.getPrixAchat() );
    }

    @Override
    public List<Bouteille> listerPourUtilisateur( Long id_utilisateur ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Bouteille> bouteilles = new ArrayList<Bouteille>();
        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_SELECT_POUR_UTILISATEUR, false,
                    id_utilisateur );
            resultSet = preparedStatement.executeQuery();
            /*
             * Parcours de la ligne de données de l'éventuel ResulSet retourné
             */
            while ( resultSet.next() ) {
                bouteilles.add( map( resultSet ) );
            }
        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }

        return bouteilles;
    }

    @Override
    public List<Bouteille> listerPourUtilisateurDateConsDesc( Long id_utilisateur ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Bouteille> bouteilles = new ArrayList<Bouteille>();
        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_SELECT_POUR_UTILISATEUR_DATE_CONS_DESC,
                    false,
                    id_utilisateur );
            resultSet = preparedStatement.executeQuery();
            /*
             * Parcours de la ligne de données de l'éventuel ResulSet retourné
             */
            while ( resultSet.next() ) {
                bouteilles.add( map( resultSet ) );
            }
        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }

        return bouteilles;
    }

    @Override
    public List<Bouteille> listerPourProducteur( Long id_producteur ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Bouteille> bouteilles = new ArrayList<Bouteille>();
        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_SELECT_POUR_PRODUCTEUR, false,
                    id_producteur );
            resultSet = preparedStatement.executeQuery();
            /*
             * Parcours de la ligne de données de l'éventuel ResulSet retourné
             */
            while ( resultSet.next() ) {
                bouteilles.add( map( resultSet ) );
            }
        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }

        return bouteilles;
    }

    @Override
    public void supprimer( Long id ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_DELETE_PAR_ID, false, id );
            int statut = preparedStatement.executeUpdate();
            /* Analyse du statut retourné par la requête d'insertion */
            if ( statut == 0 ) {
                throw new DAOException( MESSAGE_DAO );
            } else {
                id = null;
            }

        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( preparedStatement, connexion );
        }

    }

    @Override
    public void ajouterCommentaire( String commentaire, Long id ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_UPDATE_COMMENTAIRE, false, commentaire,
                    id );
            int statut = preparedStatement.executeUpdate();
            /* Analyse du statut retourné par la requête d'insertion */
            if ( statut == 0 ) {
                throw new DAOException( MESSAGE_DAO );
            } else {
                commentaire = null;
            }

        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( preparedStatement, connexion );
        }

    }

    @Override
    public void changerLC( Integer quantite_Acheter, Long id ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_UPDATE_LIST_COURSES, false,
                    quantite_Acheter, id );
            int statut = preparedStatement.executeUpdate();
            /* Analyse du statut retourné par la requête d'insertion */
            if ( statut == 0 ) {
                throw new DAOException( MESSAGE_DAO );
            } else {
                quantite_Acheter = 0;
            }

        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( preparedStatement, connexion );
        }

    }

    @Override
    public void changerEvaluation( Integer evaluation, Long id ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_UPDATE_EVALUATION, false,
                    evaluation, id );
            int statut = preparedStatement.executeUpdate();
            /* Analyse du statut retourné par la requête d'insertion */
            if ( statut == 0 ) {
                throw new DAOException( MESSAGE_DAO );
            } else {
                evaluation = 0;
            }

        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( preparedStatement, connexion );
        }

    }

    /*
     * Méthode générique utilisée pour retourner un producteur depuis la base de
     * données, correspondant à la requête SQL donnée prenant en paramètres les
     * objets passés en argument.
     */
    private Bouteille trouver( String sql, Object... objets ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Bouteille bouteille = null;

        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            /*
             * Préparation de la requête avec les objets passés en arguments
             * (ici, uniquement un id) et exécution.
             */
            preparedStatement = initialisationRequetePreparee( connexion, sql, false, objets );
            resultSet = preparedStatement.executeQuery();
            /* Parcours de la ligne de données retournée dans le ResultSet */
            if ( resultSet.next() ) {
                bouteille = map( resultSet );
            }
        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }

        return bouteille;
    }

    /*
     * la correspondance (le mapping) entre une ligne issue de la table des
     * Producteurs (un ResultSet) et un bean Producteur.
     */
    private static Bouteille map( ResultSet resultSet ) throws SQLException {
        Bouteille bouteille = new Bouteille();
        Long id_bouteille = resultSet.getLong( "id" );
        bouteille.setId( id_bouteille );
        bouteille.setNom( resultSet.getString( "nom" ) );
        bouteille.setCouleur( resultSet.getString( "couleur" ) );
        bouteille.setAppelation( resultSet.getString( "appelation" ) );
        bouteille.setCru( resultSet.getString( "cru" ) );
        bouteille.setPays( resultSet.getString( "pays" ) );
        bouteille.setRegion( resultSet.getString( "region" ) );
        bouteille.setTaille( resultSet.getDouble( "taille" ) );
        bouteille.setPrixAchat( resultSet.getDouble( "prix_achat" ) );
        bouteille.setPrixActuelle( resultSet.getDouble( "prix_actuelle" ) );
        bouteille.setDateDeProduction( resultSet.getInt( "date_de_production" ) );
        bouteille.setDateGarder( resultSet.getInt( "date_garder" ) );
        bouteille.setImage( resultSet.getString( "image" ) );
        bouteille.setIdProducteur( resultSet.getLong( "id_producteur" ) );
        bouteille.setIdUtilisateur( resultSet.getLong( "id_utilisateur" ) );
        bouteille.setNomProducteur( resultSet.getString( "nom_producteur" ) );

        bouteille.setCommentaire( resultSet.getString( "commentaire" ) );
        bouteille.setNbrListCourses( resultSet.getInt( "nbr_list_courses" ) );
        bouteille.setEvaluation( resultSet.getInt( "evaluation" ) );
        bouteille.setNbrAneeABoir( resultSet.getInt( "nbr_anee_boir_bouteille" ) );

        PositionDao positionDao = daoFactory.getPositionDao();
        List<Position> positions = positionDao.listerPourBouteille( id_bouteille );
        if ( !positions.isEmpty() ) {
            bouteille.setPositions( positions );
        }
        int nbrTotal;
        nbrTotal = positions.size();
        bouteille.setNbrTotal( nbrTotal );

        return bouteille;
    }

}
