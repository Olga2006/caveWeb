package com.cave.dao;

import static com.cave.dao.DAOUtilitaire.fermeturesSilencieuses;
import static com.cave.dao.DAOUtilitaire.initialisationRequetePreparee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cave.beans.Compartiment;
import com.cave.beans.Rangee;

public class CompartimentDaoImpl implements CompartimentDao {

    private static final String SQL_SELECT_A_PAR_ID_CAVE = "SELECT id, reference_c, id_cave FROM Compartiment WHERE id_cave = ? AND reference_c LIKE 'A%'  ";
    private static final String SQL_SELECT_B_PAR_ID_CAVE = "SELECT id, reference_c , id_cave FROM Compartiment WHERE id_cave = ? AND reference_c LIKE 'B%'  ";
    private static final String SQL_SELECT_PAR_ID        = "SELECT id, reference_c , id_cave FROM Compartiment WHERE id = ? ";
    private static final String MESSAGE_DAO              = "Échec. Merci de réessayer dans quelques instants et en cas d'échec informez notre <a class=\"linkErrDao\" href=\"support\">service technique </a> ";
    private static DAOFactory   daoFactory;

    public CompartimentDaoImpl( DAOFactory daoFactory ) {
        this.daoFactory = daoFactory;
    }

    /*
     * @Override public void creerPourCave( Cave cave ) throws DAOException {
     * Connection connexion = null; PreparedStatement preparedStatement = null;
     * ResultSet valeursAutoGenerees = null; try { Récupération d'une connexion
     * depuis la Factory connexion = daoFactory.getConnection(); int
     * nbrCompartiment = cave.getNbrCompartiment(); int nbrRow =
     * cave.getNbrRow(); Long id_cave = cave.getId(); Long id_compartiment; Long
     * id_row; String[] tab = { "A", "B" }; for ( int i = 0; i < nbrRow; i++ ) {
     * 
     * for ( int j = 1; j <= nbrCompartiment; j++ ) { String reference_c =
     * tab[i] + j; Integer reference_r = 1; preparedStatement =
     * initialisationRequetePreparee( connexion, SQL_INSERT_PAR_ID_CAVE, true,
     * reference_c, id_cave ); int statut = preparedStatement.executeUpdate();
     * Analyse du statut retourné par la requête d'insertion if ( statut == 0 )
     * { throw new DAOException(
     * "Échec de la création du compartiments, aucune ligne ajoutée dans la table."
     * ); }
     * 
     * Récupération de l'id auto-généré par la requête d'insertion
     * 
     * valeursAutoGenerees = preparedStatement.getGeneratedKeys(); if (
     * valeursAutoGenerees.next() ) { id_compartiment =
     * valeursAutoGenerees.getLong( 1 ); preparedStatement =
     * initialisationRequetePreparee( connexion, SQL_INSERT_PAR_ID_COMPARTIMENT,
     * true, reference_r, id_compartiment ); statut =
     * preparedStatement.executeUpdate();
     * 
     * Analyse du statut retourné par la requête d'insertion
     * 
     * if ( statut == 0 ) { throw new DAOException(
     * "Échec de la création des rangée, aucune ligne ajoutée dans la table." );
     * }
     * 
     * Récupération de l'id auto-généré par la requête d'insertion
     * 
     * valeursAutoGenerees = preparedStatement.getGeneratedKeys(); if (
     * valeursAutoGenerees.next() ) { id_row = valeursAutoGenerees.getLong( 1 );
     * } else { throw new DAOException(
     * "Échec de la création des Échec de la création des rangée en base, aucun ID auto-généré retourné."
     * ); }
     * 
     * } else { throw new DAOException(
     * "Échec de la création des compartiments en base, aucun ID auto-généré retourné."
     * ); }
     * 
     * } } }
     * 
     * catch ( SQLException e ) { throw new DAOException( e ); } finally {
     * fermeturesSilencieuses( valeursAutoGenerees, preparedStatement, connexion
     * ); }
     * 
     * }
     */

    /*
     * ***********************************used**********************************
     * ***************
     */
    @Override
    public List<Compartiment> listerCompartimentsAPourCave( Long id_cave ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Compartiment> compartiments = new ArrayList<Compartiment>();
        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_SELECT_A_PAR_ID_CAVE, false, id_cave );
            resultSet = preparedStatement.executeQuery();

            /*
             * Parcours de la ligne de données de l'éventuel ResulSet retourné
             */
            while ( resultSet.next() ) {
                compartiments.add( map( resultSet ) );
            }

        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        }

        finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }

        return compartiments;
    }

    /*
     * ***********************************used**********************************
     * ***************
     */
    @Override
    public List<Compartiment> listerCompartimentsBPourCave( Long id_cave ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Compartiment> compartiments = new ArrayList<Compartiment>();
        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_SELECT_B_PAR_ID_CAVE, false, id_cave );
            resultSet = preparedStatement.executeQuery();

            /*
             * Parcours de la ligne de données de l'éventuel ResulSet retourné
             */
            while ( resultSet.next() ) {
                compartiments.add( map( resultSet ) );
            }

        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        }

        finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }

        return compartiments;
    }

    @Override
    public Compartiment trouver( long id_compartiment ) throws DAOException {
        return trouver( SQL_SELECT_PAR_ID, id_compartiment );
    }

    private Compartiment trouver( String sql, Object... objets ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Compartiment compartiment = null;

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
                compartiment = map( resultSet );
            }
        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }

        return compartiment;
    }

    /*
     * la correspondance (le mapping) entre une ligne issue de la table des
     * Producteurs (un ResultSet) et un bean Producteur.
     */
    private static Compartiment map( ResultSet resultSet ) throws SQLException {
        Compartiment compartiment = new Compartiment();
        Long id_compartiment = resultSet.getLong( "id" );
        compartiment.setId( id_compartiment );
        compartiment.setReferenceC( resultSet.getString( "reference_c" ) );

        RangeeDao rangeeDao = daoFactory.getRangeeDao();
        List<Rangee> rangees = rangeeDao.listerPourCompartiment( id_compartiment );
        if ( !rangees.isEmpty() ) {
            compartiment.setRangees( rangees );
        }

        return compartiment;
    }

}
