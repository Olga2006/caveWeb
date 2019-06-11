package com.cave.dao;

import static com.cave.dao.DAOUtilitaire.fermeturesSilencieuses;
import static com.cave.dao.DAOUtilitaire.initialisationRequetePreparee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cave.beans.Cave;
import com.cave.beans.Compartiment;

public class CaveDaoImpl implements CaveDao {

    private static final String SQL_SELECT_PAR_ID                      = "call afficher_all_data_cave(?)";

    private static final String SQL_SELECT_ID_CAVES_PAR_ID_UTILISATEUR = "SELECT id FROM Cave WHERE id_utilisateur = ?";

    private static final String SQL_INSERT                             = "CALL cree_cave_avec_compartiments(?, ?, ?, ?)";

    private static final String SQL_SELECT_PAR_NOM_ET_UTILISATEUR      = "SELECT id FROM Cave WHERE nom = ? AND id_utilisateur = ? ";

    private static final String SQL_DELETE_PAR_ID                      = "DELETE FROM Cave WHERE id = ?";

    private static final String SQL_UPDATE                             = "UPDATE Cave SET nom = ? WHERE id = ? ";

    private static final String MESSAGE_DAO                            = " ";

    private static DAOFactory   daoFactory;

    public CaveDaoImpl( DAOFactory daoFactory ) {
        this.daoFactory = daoFactory;
    }

    @Override
    public void update( Cave cave ) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet valeursAutoGenerees = null;

        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_UPDATE, true, cave.getNom(),
                    cave.getId() );
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
    public void creer( Cave cave ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet valeursAutoGenerees = null;

        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_INSERT, true, cave.getNom(),
                    cave.getUtilisateur().getId(), cave.getNbrCompartiment(), cave.getNbrRow() );
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
    public Cave trouver( long id_cave ) throws DAOException {

        return trouver( SQL_SELECT_PAR_ID, id_cave );
    }

    /*
     * @Override public Cave trouver( Cave cave ) throws DAOException { return
     * trouver( SQL_SELECT_PAR_NOM_ET_UTILISATEUR,
     * cave.getUtilisateur().getId(), cave.getNom() ); }
     */

    @Override
    public Cave trouver( Cave cave ) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Cave caveDansList = null;
        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_SELECT_PAR_NOM_ET_UTILISATEUR, false, cave.getNom(), cave.getUtilisateur().getId() );
            resultSet = preparedStatement.executeQuery();
            /*
             * Parcours de la ligne de données de l'éventuel ResulSet retourné
             */
            if ( resultSet.next() ) {
                caveDansList = new Cave();
                Long id_cave = resultSet.getLong( "id" );
                caveDansList.setId( id_cave );
                caveDansList.setNom( cave.getNom() );
            }
        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }

        return caveDansList;
    }

    @Override
    public List<Long> listerIdCavesPourUtilisateur( Long id_sessionUtilisateur ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Long> idCaves = new ArrayList<Long>();
        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_SELECT_ID_CAVES_PAR_ID_UTILISATEUR, false,
                    id_sessionUtilisateur );
            resultSet = preparedStatement.executeQuery();
            /*
             * Parcours de la ligne de données de l'éventuel ResulSet retourné
             */
            while ( resultSet.next() ) {
                idCaves.add( resultSet.getLong( "id" ) );
            }
        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }

        return idCaves;
    }

    @Override
    public void supprimer( Long id_cave ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;

        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_DELETE_PAR_ID, false,
                    id_cave );
            int statut = preparedStatement.executeUpdate();

            /*
             * if ( statut == 0 ) { throw new DAOException( MESSAGE_DAO ); }
             * else { id_cave = null; }
             */

        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( preparedStatement, connexion );
        }

    }

    /*
     * Méthodes générique
     */
    private Cave trouver( String sql, Object... objets ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Cave cave = null;

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
                cave = map( resultSet );
            }
        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }

        return cave;
    }

    private static Cave map( ResultSet resultSet ) throws SQLException {
        Cave cave = new Cave();
        Long id_cave = resultSet.getLong( "id" );
        cave.setId( id_cave );
        cave.setNom( resultSet.getString( "nom" ) );
        cave.setNbrCompartiment( resultSet.getInt( "nbr_compartiment" ) );
        cave.setNbrRow( resultSet.getInt( "nbr_row" ) );

        CompartimentDao compartimentDao = daoFactory.getCompartimentDao();
        List<Compartiment> compartimentsA = compartimentDao.listerCompartimentsAPourCave( id_cave );
        List<Compartiment> compartimentsB = compartimentDao.listerCompartimentsBPourCave( id_cave );
        if ( !compartimentsA.isEmpty() ) {
            cave.setCompartiments( compartimentsA );
        }
        if ( !compartimentsB.isEmpty() ) {
            cave.setCompartimentsB( compartimentsB );
        }

        cave.setNbrTotal( resultSet.getInt( "nbr_total" ) );
        cave.setNbrRouge( resultSet.getInt( "nbr_rouge" ) );
        cave.setNbrBlanc( resultSet.getInt( "nbr_blanc" ) );
        cave.setNbrJaune( resultSet.getInt( "nbr_jaune" ) );
        cave.setNbrRose( resultSet.getInt( "nbr_rose" ) );
        cave.setNbrEffervescent( resultSet.getInt( "nbr_effervescent" ) );
        cave.setNbrLiquoreux( resultSet.getInt( "nbr_liquoreux" ) );

        cave.setNbrGC( resultSet.getInt( "nbr_gc" ) );
        cave.setNbrPC( resultSet.getInt( "nbr_pc" ) );

        cave.setNbrCB( resultSet.getInt( "nbr_cb" ) );
        cave.setNbrCC( resultSet.getInt( "nbr_cc" ) );
        cave.setNbrNC( resultSet.getInt( "nbr_nc" ) );

        cave.setNbrV( resultSet.getInt( "nbr_v" ) );
        cave.setPrixTotalActuelle( resultSet.getInt( "prix_total_actuelle" ) );
        cave.setPrixTotalAchat( resultSet.getInt( "prix_total_achat" ) );
        return cave;

    }

}
