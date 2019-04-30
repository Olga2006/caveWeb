package com.cave.dao;

import java.util.List;

import com.cave.beans.Position;

public interface PositionDao {

    List<Position> lister( Long id_rangee ) throws DAOException;

    void creer( Long id_rangee ) throws DAOException;

    void supprimerLastPosition( Long id_rangee ) throws DAOException;

    List<Position> listerPourBouteille( Long id_bouteille ) throws DAOException;

    void vider_la_position( Long idPosition );

    void ajouter_la_bouteille( Long idBouteille, Long idPosition ) throws DAOException;

    void changer_la_position_bouteille( Long id_bouteille, Long id_position, Long id_last_position )
            throws DAOException;

}
