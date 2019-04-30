package com.cave.dao;

import java.util.List;

import com.cave.beans.Producteur;

public interface ProducteurDao {

    Producteur trouver( long id ) throws DAOException;

    void update( Producteur producteur ) throws DAOException;

    List<Producteur> listerPourUtilisateur( Long id_utilisateur );

    void creerPouUtilisateur( Producteur producteur ) throws DAOException;

    void supprimer( Long id ) throws DAOException;

    Producteur trouver( Producteur producteur ) throws DAOException;

}
