package com.cave.dao;

import java.util.List;

import com.cave.beans.Cave;

public interface CaveDao {
    void creer( Cave cave ) throws DAOException;

    Cave trouver( long id ) throws DAOException;

    Cave trouver( Cave cave ) throws DAOException;

    void supprimer( Long id_cave ) throws DAOException;

    List<Long> listerIdCavesPourUtilisateur( Long id_sessionUtilisateur ) throws DAOException;

    void update( Cave cave ) throws DAOException;

}
