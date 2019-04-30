package com.cave.forms;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cave.beans.Cave;
import com.cave.beans.Utilisateur;
import com.cave.dao.CaveDao;
import com.cave.dao.DAOException;

public final class CreationCaveForm {
    private static final String CHAMP_NOM          = "nom";
    private static final String CHAMP_ROW          = "nbrRow";
    private static final String CHAMP_COMPARTIMENT = "nbrCompartiment";
    private static final String CHAMP_ERREUR_DAO   = "erreurDaoCave";
    public static final String  PARAM_ID_CAVE      = "idCave";
    private String              resultat;
    private Map<String, String> erreurs            = new HashMap<String, String>();
    CaveDao                     caveDao;

    public CreationCaveForm( CaveDao caveDao ) {
        this.caveDao = caveDao;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public String getResultat() {
        return resultat;
    }

    public Cave updateCave( HttpServletRequest request, Utilisateur sessionUtilisateur ) {
        Long id = Long.parseLong( request.getParameter( PARAM_ID_CAVE ) );
        String nom = getValeurChamp( request, CHAMP_NOM );

        Cave cave = new Cave();
        cave.setId( id );

        traiterNom( nom, cave, sessionUtilisateur );

        try {
            if ( erreurs.isEmpty() ) {
                caveDao.update( cave );
                resultat = "Succès mise à jour de la cave " + cave.getNom();
            } else {
                if ( cave.getNom() != null ) {
                    resultat = "Échec mise à jour de la cave " + cave.getNom();
                } else {
                    resultat = "Échec mise à jour de la cave";
                }
            }
        } catch ( DAOException e ) {

            setErreur( CHAMP_ERREUR_DAO, e.getMessage() );
            e.printStackTrace();
        }

        return cave;
    }

    public Cave creerCave( HttpServletRequest request, Utilisateur sessionUtilisateur ) {
        String nom = getValeurChamp( request, CHAMP_NOM );
        String nbrRow = getValeurChamp( request, CHAMP_ROW );
        String nbrCompartiment = getValeurChamp( request, CHAMP_COMPARTIMENT );

        Cave cave = new Cave();
        cave.setUtilisateur( sessionUtilisateur );
        traiterNom( nom, cave, sessionUtilisateur );
        traiterNbrCompartiment( nbrCompartiment, cave );
        traiterNbrRow( nbrRow, cave );

        try {
            if ( erreurs.isEmpty() ) {
                caveDao.creer( cave );
                resultat = "Succès de la création de la cave " + cave.getNom();
            } else {
                if ( cave.getNom() != null ) {
                    resultat = "Échec de la création de la cave " + cave.getNom();
                } else {
                    resultat = "Échec de la création de la cave ";
                }
            }
        } catch ( DAOException e ) {

            setErreur( CHAMP_ERREUR_DAO, e.getMessage() );
            e.printStackTrace();
        }

        return cave;
    }

    private void traiterNom( String nom, Cave cave, Utilisateur sessionUtilisateur ) {
        try {
            validationNom( nom, sessionUtilisateur );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_NOM, e.getMessage() );
        }
        cave.setNom( nom );
    }

    private void validationNom( String nom, Utilisateur sessionUtilisateur ) throws FormValidationException {
        if ( nom != null ) {
            if ( caveDao.trouverParNomEtUtilisateur( nom, sessionUtilisateur ) != null ) {
                throw new FormValidationException(
                        "Un nom " + nom + " est déjà utilisée parmis vos caves, merci d'en choisir une autre." );
            }

        } else {
            throw new FormValidationException( "Merci de remplir la champ." );
        }
    }

    private void traiterNbrCompartiment( String nbrCompartiment, Cave cave ) {
        Integer valeurMontant = 0;
        try {
            valeurMontant = validationMont( nbrCompartiment );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_COMPARTIMENT, e.getMessage() );
        }
        cave.setNbrCompartiment( valeurMontant );
    }

    private Integer validationMont( String mont ) throws FormValidationException {
        Integer temp;
        if ( mont != null ) {
            try {
                temp = Integer.parseInt( mont );
                if ( temp < 0 ) {
                    throw new FormValidationException( "Merci d'entrer un nombre positif." );
                }
            } catch ( NumberFormatException e ) {
                temp = 0;
                throw new FormValidationException( "Merci d'entrer un nombre." );
            }
        } else {
            temp = 0;
            throw new FormValidationException( "Merci de remplir la champ." );
        }
        return temp;
    }

    private void traiterNbrRow( String nbrRow, Cave cave ) {
        Integer valeurMontant = 0;
        try {

            valeurMontant = Integer.parseInt( nbrRow );
            validationChoix( valeurMontant );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_ROW, e.getMessage() );
        }
        cave.setNbrRow( valeurMontant );
    }

    private void validationChoix( Integer information ) throws FormValidationException {
        if ( information == null || information == 0 ) {
            throw new FormValidationException( "Merci d'effectuer votre choix." );
        }
    }

    /*
     * Ajoute un message correspondant au champ spécifié à la map des erreurs.
     */
    private void setErreur( String champ, String message ) {
        erreurs.put( champ, message );
    }

    /*
     * Méthode utilitaire qui retourne null si un champ est vide, et son contenu
     * sinon.
     */
    private static String getValeurChamp( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur;
        }
    }

}