package com.cave.forms;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cave.beans.Utilisateur;
import com.cave.dao.DAOException;
import com.cave.dao.UtilisateurDao;

public final class ConnectionForm {

    private static final String CHAMP_EMAIL      = "email";
    private static final String CHAMP_PASS       = "motdepasseconnection";
    private static final String CHAMP_ERREUR_DAO = "erreurDao";
    private String              success;
    private String              unsuccess;
    private Map<String, String> erreurs          = new HashMap<String, String>();

    private UtilisateurDao      utilisateurDao;

    public ConnectionForm( UtilisateurDao utilisateurDao ) {
        this.utilisateurDao = utilisateurDao;
    }

    public ConnectionForm() {
        super();
    }

    public String getSuccess() {
        return success;
    }

    public String getUnsuccess() {
        return unsuccess;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public Utilisateur connecterUtilisateur( HttpServletRequest request ) {
        /* Récupération des champs du formulaire */
        String email = getValeurChamp( request, CHAMP_EMAIL );
        String motdepasseconnection = getValeurChamp( request, CHAMP_PASS );

        Utilisateur utilisateur = new Utilisateur();
        utilisateur.setEmail( email );

        try {
            utilisateur = validationUtilisateur( email, motdepasseconnection );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_PASS, e.getMessage() );
        }

        /* Initialisation du résultat global de la validation. */
        if ( erreurs.isEmpty() ) {
            success = "Succès de la connexion.";
        } else {
            unsuccess = "Échec de la connexion.";

        }
        return utilisateur;
    }

    /* Validation de l'adresse email */
    private Utilisateur validationUtilisateur( String email, String motdepasseconnection )
            throws FormValidationException {
        Utilisateur utilisateur = null;
        try {
            utilisateur = utilisateurDao.verifier( email, motdepasseconnection );
            if ( utilisateur == null ) {

                throw new FormValidationException(
                        "Email ou mot de passe incorrecte" );
            }

        } catch ( DAOException e ) {
            setErreur( CHAMP_ERREUR_DAO, e.getMessage() );
            e.printStackTrace();
        }
        return utilisateur;
    }

    public Utilisateur trouverUtilisateurParMail( HttpServletRequest request ) {
        String email = getValeurChamp( request, CHAMP_EMAIL );
        Utilisateur utilisateur = new Utilisateur();
        utilisateur.setEmail( email );

        try {
            utilisateur = validationUtilisateurParMail( email );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_EMAIL, e.getMessage() );
        }

        /* Initialisation du résultat global de la validation. */
        if ( erreurs.isEmpty() ) {
            success = "Un email vous a été envoyé avec votre mot de passe";
        } else {
            unsuccess = "Échec";

        }

        return utilisateur;
    }

    /* Validation de l'adresse email */
    private Utilisateur validationUtilisateurParMail( String email )
            throws FormValidationException {
        Utilisateur utilisateur = null;
        try {
            utilisateur = utilisateurDao.trouver( email );
            if ( utilisateur == null ) {

                throw new FormValidationException(
                        "Email incorrect" );
            }

        } catch ( DAOException e ) {
            setErreur( CHAMP_ERREUR_DAO, e.getMessage() );
            e.printStackTrace();
        }

        return utilisateur;

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