package com.cave.dao;

import java.util.List;

import com.cave.beans.Bouteille;

public interface BouteilleDao {
    void creerPourUtilisateur( Bouteille bouteille ) throws DAOException;

    Bouteille trouver( long id ) throws DAOException;

    void update( Bouteille bouteille ) throws DAOException;

    List<Bouteille> listerPourUtilisateur( Long id_utilisateur ) throws DAOException;

    List<Bouteille> listerPourProducteur( Long id_producteur ) throws DAOException;

    void supprimer( Long id ) throws DAOException;

    void ajouterCommentaire( String commentaire, Long id ) throws DAOException;

    void changerLC( Integer quantite_Acheter, Long id ) throws DAOException;

    Bouteille trouver( Bouteille bouteille ) throws DAOException;

    void changerEvaluation( Integer evaluation, Long id ) throws DAOException;

    List<Bouteille> listerPourUtilisateurDateConsDesc( Long id_utilisateur ) throws DAOException;

}
