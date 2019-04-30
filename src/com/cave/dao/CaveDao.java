package com.cave.dao;

import java.util.List;

import com.cave.beans.Cave;
import com.cave.beans.Utilisateur;

public interface CaveDao {
    void creer( Cave cave ) throws DAOException;

    Cave trouver( long id ) throws DAOException;

    /* List<Cave> lister() throws DAOException; */

    void supprimer( Long id_cave ) throws DAOException;

    Cave trouverParNomEtUtilisateur( String nom, Utilisateur sessionUtilisateur ) throws DAOException;

    List<Long> listerIdCavesPourUtilisateur( Long id_sessionUtilisateur ) throws DAOException;

    void update( Cave cave ) throws DAOException;

}
