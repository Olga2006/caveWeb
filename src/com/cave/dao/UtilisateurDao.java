package com.cave.dao;

import com.cave.beans.Utilisateur;

public interface UtilisateurDao {

    void creer( Utilisateur utilisateur ) throws DAOException;

    Utilisateur trouver( String email ) throws DAOException;

    Utilisateur trouver( long id ) throws DAOException;

    Utilisateur verifier( String email, String motDePasse ) throws DAOException;

}
