package com.cave.forms;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cave.beans.Utilisateur;
import com.cave.dao.DAOException;
import com.cave.dao.UtilisateurDao;

public final class InscriptionForm {
    /*
     * inclure les constantes des noms des champs la chaîne resultat et la Map
     * erreurs avec ses getters publics la logique de validation a été regroupée
     * dans une méthode inscrireUtilisateur(), qui retourne un bean Utilisateur
     * 
     * les méthodes principales, contenant la logique de validation
     * 
     * la méthode utilitaire getValeurChamp() se charge de vérifier si le
     * contenu d'un champ est vide ou non
     * 
     * dans les blocs catch, englobant la validation de chaque champ du
     * formulaire, nous utilisons une méthode setErreur() qui se charge de
     * mettre à jour la Map erreurs en cas d'envoi d'une exception
     * 
     */
    private static final String CHAMP_EMAIL      = "email";
    private static final String CHAMP_PASS       = "motdepasse";
    private static final String CHAMP_CONF       = "confirmation";
    private static final String CHAMP_NOM        = "nom";
    private static final String CHAMP_ERREUR_DAO = "erreurDao";

    private String              success;
    private String              unsuccess;
    private Map<String, String> erreurs          = new HashMap<String, String>();

    private UtilisateurDao      utilisateurDao;

    public InscriptionForm( UtilisateurDao utilisateurDao ) {
        this.utilisateurDao = utilisateurDao;
    }

    public InscriptionForm() {
        super();
        // TODO Auto-generated constructor stub
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

    public Utilisateur inscrireUtilisateur( HttpServletRequest request ) {
        String email = getValeurChamp( request, CHAMP_EMAIL );
        String motDePasse = getValeurChamp( request, CHAMP_PASS );
        String confirmation = getValeurChamp( request, CHAMP_CONF );
        String nom = getValeurChamp( request, CHAMP_NOM );

        Utilisateur utilisateur = new Utilisateur();

        try {
            traiterEmail( email, utilisateur );
            traiterMotsDePasse( motDePasse, confirmation, utilisateur );
            traiterNom( nom, utilisateur );

            if ( erreurs.isEmpty() ) {
                utilisateurDao.creer( utilisateur );
                success = "Succès de l'inscription.";
            } else {
                unsuccess = "Échec de l'inscription.";
            }
        } catch ( DAOException e ) {
            setErreur( CHAMP_ERREUR_DAO, e.getMessage() );
            e.printStackTrace();
        }

        return utilisateur;
    }

    /*
     * Appel à la validation de l'adresse email reçue et initialisation de la
     * propriété email du bean
     */
    private void traiterEmail( String email, Utilisateur utilisateur ) {
        try {
            validationEmail( email );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_EMAIL, e.getMessage() );
        }
        utilisateur.setEmail( email );
    }

    /* Validation de l'adresse email */
    private void validationEmail( String email ) throws FormValidationException {
        Utilisateur utilisateur = null;
        try {
            utilisateur = utilisateurDao.trouver( email );

        } catch ( Exception e ) {
            setErreur( CHAMP_ERREUR_DAO, e.getMessage() );
            e.printStackTrace();
        }

        if ( utilisateur != null ) {
            throw new FormValidationException(
                    "Cette adresse email est déjà utilisée, merci d'en choisir une autre." );
        }
    }

    /*
     * Appel à la validation des mots de passe reçus, chiffrement du mot de
     * passe et initialisation de la propriété motDePasse du bean
     */
    private void traiterMotsDePasse( String motDePasse, String confirmation, Utilisateur utilisateur ) {
        try {
            validationMotDePasse( motDePasse );
            try {
                validationConfirmationMotsDePasse( motDePasse, confirmation );
            } catch ( Exception e ) {
                setErreur( CHAMP_CONF, e.getMessage() );
            }
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_PASS, e.getMessage() );

        }
        utilisateur.setMotDePasse( motDePasse );
    }

    /* Validation des mots de passe */
    private void validationMotDePasse( String motDePasse ) throws FormValidationException {
        if ( motDePasse.length() < 6 ) {
            throw new FormValidationException( "Les mots de passe doivent contenir au moins 6 caractères." );
        }

    }

    private void validationConfirmationMotsDePasse( String motDePasse, String confirmation )
            throws FormValidationException {
        if ( !motDePasse.equals( confirmation ) ) {
            throw new FormValidationException(
                    "Les mots de passe entrés sont différents, merci de les saisir à nouveau." );
        }
    }

    private void traiterNom( String nom, Utilisateur utilisateur ) {
        try {
            validationNom( nom );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_NOM, e.getMessage() );
        }
        utilisateur.setNom( nom );
    }

    private void validationNom( String nom ) throws FormValidationException {
        if ( nom == null ) {
            throw new FormValidationException( "Merci de saisir votre nom." );
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
            return valeur.trim();
        }
    }

}