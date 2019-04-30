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
import com.cave.beans.Producteur;

public class ProducteurDaoImpl implements ProducteurDao {

    private static final String SQL_SELECT_PAR_ID           = "SELECT id, nom, adresse, contact, id_utilisateur  FROM Producteur WHERE id = ?";

    private static final String SQL_SELECT_POUR_UTILISATEUR = " SELECT DISTINCT Producteur.id, Producteur.nom, Producteur.adresse, Producteur.contact, Producteur.id_utilisateur\r\n"
            + "FROM Producteur WHERE producteur.id_utilisateur = ? ORDER BY Producteur.nom";
    private static final String SQL_SELECT_PAR_NOM          = "SELECT id, nom, adresse, contact, id_utilisateur  FROM Producteur WHERE id_utilisateur = ? AND "
            + "nom = ? AND adresse = ? AND contact = ? ";
    private static final String SQL_INSERT_POUR_UTILISATEUR = "INSERT INTO Producteur (nom, adresse, contact, id_utilisateur ) VALUES (?, ?, ?, ?)";
    private static final String SQL_DELETE_PAR_ID           = "DELETE FROM Producteur WHERE id = ?";
    private static final String SQL_UPDATE                  = "UPDATE producteur SET nom = ?, adresse = ?, contact = ? WHERE id = ? ";

    private static final String MESSAGE_DAO                 = "Échec. Merci de réessayer dans quelques instants et en cas d'échec informez notre <a class=\"linkErrDao\" href=\"support\">service technique </a> ";

    private static DAOFactory   daoFactory;

    public ProducteurDaoImpl( DAOFactory daoFactory ) {
        this.daoFactory = daoFactory;
    }

    /* ***********************usedALL**************************** */

    @Override
    public List<Producteur> listerPourUtilisateur( Long id_utilisateur ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Producteur> producteurs = new ArrayList<Producteur>();
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
                producteurs.add( map( resultSet ) );
            }
        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }

        return producteurs;
    }

    @Override
    public void creerPouUtilisateur( Producteur producteur ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet valeursAutoGenerees = null;

        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_INSERT_POUR_UTILISATEUR, true,
                    producteur.getNom(),
                    producteur.getAdresse(), producteur.getContact(),
                    producteur.getUtilisateur().getId() );
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
                producteur.setId( valeursAutoGenerees.getLong( 1 ) );
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
    public void update( Producteur producteur ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet valeursAutoGenerees = null;

        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_UPDATE, true, producteur.getNom(),
                    producteur.getAdresse(), producteur.getContact(),
                    producteur.getId() );
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
    public Producteur trouver( long id ) throws DAOException {

        return trouver( SQL_SELECT_PAR_ID, id );
    }

    @Override
    public Producteur trouver( Producteur producteur ) throws DAOException {
        return trouver( SQL_SELECT_PAR_NOM, producteur.getUtilisateur().getId(), producteur.getNom(),
                producteur.getAdresse(), producteur.getContact() );
    }

    @Override
    public void supprimer( Long id ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;

        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_DELETE_PAR_ID, false,
                    id );
            preparedStatement.executeUpdate();
            /* Analyse du statut retourné par la requête d'insertion */
            /*
             * if ( statut == 0 ) { throw new DAOException( MESSAGE_DAO ); }
             * else { id = null; }
             */

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
    private Producteur trouver( String sql, Object... objets ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Producteur producteur = null;

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
                producteur = map( resultSet );
            }
        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }

        return producteur;
    }

    /*
     * la correspondance (le mapping) entre une ligne issue de la table des
     * Producteurs (un ResultSet) et un bean Producteur.
     */
    private static Producteur map( ResultSet resultSet ) throws SQLException {
        Producteur producteur = new Producteur();
        Long id_producteur = resultSet.getLong( "id" );
        producteur.setId( id_producteur );
        producteur.setNom( resultSet.getString( "nom" ) );
        producteur.setAdresse( resultSet.getString( "adresse" ) );
        producteur.setContact( resultSet.getString( "contact" ) );
        BouteilleDao bouteilleDao = daoFactory.getBouteilleDao();
        List<Bouteille> bouteilles = bouteilleDao.listerPourProducteur( id_producteur );
        if ( !bouteilles.isEmpty() ) {
            producteur.setBouteilles( bouteilles );
        }

        return producteur;
    }

}
