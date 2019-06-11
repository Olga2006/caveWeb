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
import com.cave.beans.Cave;
import com.cave.beans.Producteur;
import com.cave.beans.Utilisateur;

public class UtilisateurDaoImpl implements UtilisateurDao {
    private static final String SQL_SELECT_PAR_EMAIL     = "SELECT id, email, nom, mot_de_passe, date_inscription FROM Utilisateur WHERE email = ?";
    private static final String SQL_SELECT_PAR_ID        = "SELECT id, email, nom, mot_de_passe, date_inscription FROM Utilisateur WHERE id = ?";
    private static final String SQL_SELECT_PAR_EMAIL_MDP = "SELECT id, email, nom, mot_de_passe, date_inscription FROM Utilisateur WHERE email = ? AND mot_de_passe = ? ";
    private static final String SQL_INSERT               = "INSERT INTO Utilisateur (email, mot_de_passe, nom, date_inscription) VALUES (?, ?, ?, NOW())";

    private static final String MESSAGE_DAO              = "";

    private static DAOFactory   daoFactory;

    public UtilisateurDaoImpl( DAOFactory daoFactory ) {
        this.daoFactory = daoFactory;
    }

    /*
     * ****************************ALL
     * used***************************************** *****
     */

    /* Implémentation de la méthode définie dans l'interface UtilisateurDao */
    @Override
    public void creer( Utilisateur utilisateur ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet valeursAutoGenerees = null;

        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_INSERT, true, utilisateur.getEmail(),
                    utilisateur.getMotDePasse(), utilisateur.getNom() );
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
                utilisateur.setId( valeursAutoGenerees.getLong( 1 ) );
            } else {
                throw new DAOException(
                        MESSAGE_DAO );
            }
        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( valeursAutoGenerees, preparedStatement, connexion );
        }
    }

    @Override
    public Utilisateur trouver( String email ) throws DAOException {
        return trouverG( SQL_SELECT_PAR_EMAIL, email );
    }

    @Override
    public Utilisateur trouver( long id ) throws DAOException {
        return trouverG( SQL_SELECT_PAR_ID, id );
    }

    @Override
    public Utilisateur verifier( String email, String motDePasse ) throws DAOException {
        return trouverG( SQL_SELECT_PAR_EMAIL_MDP, email, motDePasse );
    }

    /*
     * Méthodes génériques
     */
    private Utilisateur trouverG( String sql, Object... objets ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Utilisateur utilisateur = null;

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
                utilisateur = map( resultSet );
            }
        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }

        return utilisateur;
    }

    /*
     * Simple méthode utilitaire permettant de faire la correspondance (le
     * mapping) entre une ligne issue de la table des utilisateurs (un
     * ResultSet) et un bean Utilisateur.
     */
    private static Utilisateur map( ResultSet resultSet ) throws SQLException {
        Utilisateur utilisateur = new Utilisateur();
        Long id_sessionUtilisateur = resultSet.getLong( "id" );
        utilisateur.setId( id_sessionUtilisateur );
        utilisateur.setEmail( resultSet.getString( "email" ) );
        utilisateur.setMotDePasse( resultSet.getString( "mot_de_passe" ) );
        utilisateur.setNom( resultSet.getString( "nom" ) );
        utilisateur.setDateInscription( resultSet.getTimestamp( "date_inscription" ) );

        CaveDao caveDao = daoFactory.getCaveDao();
        List<Cave> caves = new ArrayList<Cave>();
        List<Long> id_caves = caveDao.listerIdCavesPourUtilisateur( id_sessionUtilisateur );
        for ( Long currIdCave : id_caves ) {
            caves.add( caveDao.trouver( currIdCave ) );
        }
        utilisateur.setCaves( caves );

        BouteilleDao bouteilleDao = daoFactory.getBouteilleDao();
        List<Bouteille> bouteilles = new ArrayList<Bouteille>();
        bouteilles = bouteilleDao.listerPourUtilisateur( id_sessionUtilisateur );
        utilisateur.setBouteilles( bouteilles );

        ProducteurDao producteurDao = daoFactory.getProducteurDao();
        List<Producteur> producteurs = new ArrayList<Producteur>();
        producteurs = producteurDao.listerPourUtilisateur( id_sessionUtilisateur );
        utilisateur.setProducteurs( producteurs );

        return utilisateur;
    }

}
