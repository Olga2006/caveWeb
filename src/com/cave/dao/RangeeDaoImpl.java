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
import com.cave.beans.Rangee;

public class RangeeDaoImpl implements RangeeDao {
    private static final String SQL_SELECT_PAR_ID_COMPARTIMENT     = "SELECT id, reference_r, id_compartiment FROM Rangee WHERE id_compartiment = ? ORDER BY reference_r DESC";
    private static final String SQL_SELECT_PAR_ID_COMPARTIMENT_ASC = "SELECT id, reference_r, id_compartiment FROM Rangee WHERE id_compartiment = ? ORDER BY reference_r ASC";
    private static final String SQL_SELECT_PAR_ID_UTILISATEUR      = "SELECT Cave.id_utilisateur, Utilisateur.nom, Utilisateur.date_inscription, "
            + "Utilisateur.email, Utilisateur.mot_de_passe, Compartiment.id_cave, Cave.nom, Cave.nbr_compartiment, Cave.nbr_row, Rangee.id_compartiment, "
            + "Compartiment.reference_c, Rangee.id AS id_rangee, Rangee.reference_r FROM Rangee INNER JOIN Compartiment ON "
            + "Compartiment.id = Rangee.id_compartiment INNER JOIN Cave ON Cave.id = Compartiment.id_cave INNER JOIN Utilisateur ON "
            + "Utilisateur.id = Cave.id_utilisateur WHERE Utilisateur.id = ?;";
    private static final String SQL_SELECT_PAR_ID                  = "SELECT id, reference_r, id_compartiment FROM Rangee WHERE id = ? ORDER BY reference_r DESC";
    private static final String SQL_INSERT                         = "INSERT INTO Rangee (reference_r, id_compartiment) VALUES (?, ?)";
    private static final String SQL_DELETE_PAR_ID                  = "DELETE FROM Rangee WHERE id = ?";

    private static final String MESSAGE_DAO                        = "Échec. Merci de réessayer dans quelques instants et en cas d'échec informez notre <a class=\"linkErrDao\" href=\"support\">service technique </a> ";

    private static DAOFactory   daoFactory;

    public RangeeDaoImpl( DAOFactory daoFactory ) {
        this.daoFactory = daoFactory;
    }

    /*
     * *******************************usedALL***********************************
     * *** *********
     */
    @Override
    public void creer( Long id_compartiment ) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        int ref_lastRangee = 0;

        List<Rangee> rangees = listerPourCompartimentAsc( id_compartiment );
        if ( rangees != null && !rangees.isEmpty() ) {

            for ( Rangee rangeeCurr : rangees ) {

                ref_lastRangee = rangeeCurr.getReferenceR();
            }
        } else
            ref_lastRangee = 0;
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_INSERT, true, ref_lastRangee + 1,
                    id_compartiment );
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

    @Override
    public List<Rangee> listerPourCompartiment( Long id_compartriment ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Rangee> rangees = new ArrayList<Rangee>();
        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_SELECT_PAR_ID_COMPARTIMENT, false,
                    id_compartriment );
            resultSet = preparedStatement.executeQuery();
            /*
             * Parcours de la ligne de données de l'éventuel ResulSet retourné
             */
            while ( resultSet.next() ) {
                rangees.add( map( resultSet ) );
            }
        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }

        return rangees;
    }

    @Override
    public List<Rangee> listerPourCompartimentAsc( Long id_compartriment ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Rangee> rangees = new ArrayList<Rangee>();
        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_SELECT_PAR_ID_COMPARTIMENT_ASC, false,
                    id_compartriment );
            resultSet = preparedStatement.executeQuery();
            /*
             * Parcours de la ligne de données de l'éventuel ResulSet retourné
             */
            while ( resultSet.next() ) {
                rangees.add( map( resultSet ) );
            }
        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }

        return rangees;
    }

    @Override
    public void supprimerLastRangee( Long id_compartiment ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        Long id_rangeeCurr = null;
        Rangee lastRangee = null;

        List<Rangee> rangees = listerPourCompartimentAsc( id_compartiment );
        if ( rangees != null ) {
            for ( Rangee rangeeCurr : rangees ) {
                lastRangee = rangeeCurr;
                id_rangeeCurr = rangeeCurr.getId();
            }
        }
        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_DELETE_PAR_ID, false,
                    id_rangeeCurr );
            int statut = preparedStatement.executeUpdate();
            /* Analyse du statut retourné par la requête d'insertion */
            if ( statut == 0 ) {
                throw new DAOException( MESSAGE_DAO );
            } else {
                lastRangee.setId( null );
            }

        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( preparedStatement, connexion );
        }

    }

    @Override
    public List<Rangee> listerPourUtilisateur( Long idSessionUtilisateur ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Rangee> rangees = new ArrayList<Rangee>();
        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_SELECT_PAR_ID_UTILISATEUR, false,
                    idSessionUtilisateur );
            resultSet = preparedStatement.executeQuery();
            /*
             * Parcours de la ligne de données de l'éventuel ResulSet retourné
             */
            while ( resultSet.next() ) {
                rangees.add( map( resultSet ) );
            }
        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }

        return rangees;
    }

    @Override
    public Rangee trouver( long id ) throws DAOException {

        return trouver( SQL_SELECT_PAR_ID, id );
    }

    private Rangee trouver( String sql, Object... objets ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Rangee rangee = null;

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
                rangee = map( resultSet );
            }
        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }

        return rangee;
    }

    /*
     * la correspondance (le mapping) entre une ligne issue de la table des
     * Producteurs (un ResultSet) et un bean Producteur.
     */
    private static Rangee map( ResultSet resultSet ) throws SQLException {
        Rangee rangee = new Rangee();
        Long id_rangee = resultSet.getLong( "id" );
        rangee.setId( id_rangee );
        rangee.setReferenceR( resultSet.getInt( "reference_r" ) );

        PositionDao positionDao = daoFactory.getPositionDao();
        List<Position> positions = positionDao.lister( id_rangee );
        if ( !positions.isEmpty() ) {
            rangee.setPositions( positions );
        }
        return rangee;
    }

}
