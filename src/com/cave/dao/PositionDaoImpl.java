package com.cave.dao;

import static com.cave.dao.DAOUtilitaire.fermeturesSilencieuses;
import static com.cave.dao.DAOUtilitaire.initialisationRequetePreparee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cave.beans.Position;

public class PositionDaoImpl implements PositionDao {
    private static final String SQL_SELECT_PAR_ID_RANGEE              = "SELECT Position.id, Position.reference_p, Position.id_rangee, Position.id_bouteille, \r\n"
            +
            "Rangee.reference_r ,Compartiment.reference_c, Cave.nom as nom_cave, Cave.id as id_cave, \r\n" +
            "bouteille.nom AS nom_bouteille, bouteille.couleur AS couleur_bouteille, bouteille.taille AS volum_bouteille, \r\n"
            +
            "            producteur.nom AS nom_prod_bouteille, bouteille.region AS region_bouteille, \r\n" +
            "            ((bouteille.date_garder) - (YEAR(NOW()))) AS nbr_anee_boir_bouteille\r\n" +
            "            FROM Position \r\n" +
            "            LEFT OUTER JOIN bouteille ON bouteille.id = position.id_bouteille \r\n" +
            "            LEFT OUTER JOIN producteur ON producteur.id = bouteille.id_producteur\r\n" +
            "            LEFT OUTER JOIN rangee ON rangee.id = position.id_rangee \r\n" +
            "            LEFT OUTER JOIN compartiment ON compartiment.id = rangee.id_compartiment \r\n" +
            "            LEFT OUTER JOIN cave ON cave.id = compartiment.id_cave \r\n" +
            "            WHERE Position.id_rangee = ? ORDER BY Position.reference_p";

    private static final String SQL_SELECT_PAR_ID_BOUTEILLE           = "SELECT Position.id, Position.reference_p, Position.id_rangee, Position.id_bouteille, \r\n"
            +
            "Rangee.reference_r ,Compartiment.reference_c, Cave.nom as nom_cave, Cave.id as id_cave, \r\n" +
            "bouteille.nom AS nom_bouteille, bouteille.couleur AS couleur_bouteille, bouteille.taille AS volum_bouteille, \r\n"
            +
            "            producteur.nom AS nom_prod_bouteille, bouteille.region AS region_bouteille, \r\n" +
            "            ((bouteille.date_garder) - (YEAR(NOW()))) AS nbr_anee_boir_bouteille\r\n" +
            "            FROM Position \r\n" +
            "            LEFT OUTER JOIN bouteille ON bouteille.id = position.id_bouteille \r\n" +
            "            LEFT OUTER JOIN producteur ON producteur.id = bouteille.id_producteur\r\n" +
            "            LEFT OUTER JOIN rangee ON rangee.id = position.id_rangee \r\n" +
            "            LEFT OUTER JOIN compartiment ON compartiment.id = rangee.id_compartiment \r\n" +
            "            LEFT OUTER JOIN cave ON cave.id = compartiment.id_cave \r\n" +
            "            WHERE Position.id_bouteille = ? ORDER BY Position.reference_p ";
    private static final String SQL_INSERT                            = "INSERT INTO Position (reference_p, id_rangee) VALUES (?, ?)";
    private static final String SQL_DELETE_PAR_ID                     = "DELETE FROM Position WHERE id = ?";
    private static final String SQL_UPDATE_AJOUTER_BOUTEILLE          = "UPDATE Position SET  id_bouteille = ? WHERE id = ?";
    private static final String SQL_UPDATE_RETIRER_BOUTEILLE          = "UPDATE Position SET  id_bouteille = null WHERE id = ?";
    private static final String SQL_UPDATE_CHANGER_POSITION_BOUTEILLE = "CALL remplacer_bouteille(?,?,?)";

    private static final String MESSAGE_DAO                           = "Échec. Merci de réessayer dans quelques instants et en cas d'échec informez notre service technique ";

    private static DAOFactory   daoFactory;

    public PositionDaoImpl( DAOFactory daoFactory ) {
        this.daoFactory = daoFactory;
    }

    @Override
    public void vider_la_position( Long idPosition ) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet valeursAutoGenerees = null;

        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_UPDATE_RETIRER_BOUTEILLE, true,
                    idPosition );

            int statut = preparedStatement.executeUpdate();
            /* Analyse du statut retourné par la requête d'insertion */
            if ( statut == 0 ) {
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
    public void ajouter_la_bouteille( Long idBouteille, Long idPosition ) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet valeursAutoGenerees = null;

        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_UPDATE_AJOUTER_BOUTEILLE, true,
                    idBouteille, idPosition );

            int statut = preparedStatement.executeUpdate();
            /* Analyse du statut retourné par la requête d'insertion */
            if ( statut == 0 ) {
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
    public void changer_la_position_bouteille( Long id_bouteille, Long id_position, Long id_last_position ) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet valeursAutoGenerees = null;

        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_UPDATE_CHANGER_POSITION_BOUTEILLE, true,
                    id_bouteille, id_position, id_last_position );

            int statut = preparedStatement.executeUpdate();
            /* Analyse du statut retourné par la requête d'insertion */
            if ( statut == 0 ) {
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
    public void supprimerLastPosition( Long id_rangee ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        Long id_positionCurr = null;
        Position lastPosition = null;

        List<Position> positions = lister( id_rangee );
        if ( positions != null ) {
            for ( Position positionCurr : positions ) {
                lastPosition = positionCurr;
                id_positionCurr = positionCurr.getId();
            }
        }
        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_DELETE_PAR_ID, false,
                    id_positionCurr );
            int statut = preparedStatement.executeUpdate();
            /* Analyse du statut retourné par la requête d'insertion */
            if ( statut == 0 ) {
                throw new DAOException( MESSAGE_DAO );
            } else {
                lastPosition.setId( null );
            }

        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( preparedStatement, connexion );
        }

    }

    @Override
    public List<Position> lister( Long id_rangee ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Position> positions = new ArrayList<Position>();
        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_SELECT_PAR_ID_RANGEE, false,
                    id_rangee );
            resultSet = preparedStatement.executeQuery();
            /*
             * Parcours de la ligne de données de l'éventuel ResulSet retourné
             */
            while ( resultSet.next() ) {
                positions.add( map( resultSet ) );
            }
        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }

        return positions;
    }

    @Override
    public List<Position> listerPourBouteille( Long id_bouteille ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Position> positions = new ArrayList<Position>();
        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_SELECT_PAR_ID_BOUTEILLE, false,
                    id_bouteille );
            resultSet = preparedStatement.executeQuery();
            /*
             * Parcours de la ligne de données de l'éventuel ResulSet retourné
             */
            while ( resultSet.next() ) {
                positions.add( map( resultSet ) );
            }
        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }

        return positions;
    }

    @Override
    public void creer( Long id_rangee ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        int ref_lastPosition = 0;

        List<Position> positions = lister( id_rangee );
        if ( positions != null && !positions.isEmpty() ) {

            for ( Position positionCurr : positions ) {

                ref_lastPosition = positionCurr.getReferenceP();
            }
        } else
            ref_lastPosition = 0;
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_INSERT, true, ref_lastPosition + 1,
                    id_rangee );
            int statut = preparedStatement.executeUpdate();
            /* Analyse du statut retourné par la requête d'insertion */
            if ( statut == 0 ) {
                throw new DAOException( MESSAGE_DAO );
            }

        } catch (

        SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }

    }

    private static Position map( ResultSet resultSet ) throws SQLException {
        Position position = new Position();
        Long id_position = resultSet.getLong( "id" );
        position.setId( id_position );
        position.setReferenceP( resultSet.getInt( "reference_p" ) );
        position.setReferenceR( resultSet.getInt( "reference_r" ) );
        position.setReferenceC( resultSet.getString( "reference_c" ) );
        position.setNomCave( resultSet.getString( "nom_cave" ) );
        position.setIdCave( resultSet.getLong( "id_cave" ) );

        position.setIdBouteille( resultSet.getLong( "id_bouteille" ) );

        position.setNomBouteille( resultSet.getString( "nom_bouteille" ) );
        position.setCouleurBouteille( resultSet.getString( "couleur_bouteille" ) );
        position.setVolumBouteille( resultSet.getString( "volum_bouteille" ) );
        position.setNomProdBouteille( resultSet.getString( "nom_prod_bouteille" ) );
        position.setRegionBouteille( resultSet.getString( "region_bouteille" ) );
        position.setNbrAneeABoirBouteille( resultSet.getInt( "nbr_anee_boir_bouteille" ) );

        return position;
    }

}
