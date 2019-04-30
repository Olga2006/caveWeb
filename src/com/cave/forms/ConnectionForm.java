package com.cave.forms;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cave.beans.Utilisateur;
import com.cave.dao.UtilisateurDao;

public final class ConnectionForm {

    private static final String CHAMP_EMAIL      = "email";
    private static final String CHAMP_PASS       = "motdepasseconnection";
    private static final String ALGO_CHIFFREMENT = "SHA-256";
    private static final String CHAMP_ERREUR_DAO = "erreurDao";
    private String              resultat;
    private Map<String, String> erreurs          = new HashMap<String, String>();

    private UtilisateurDao      utilisateurDao;

    public ConnectionForm( UtilisateurDao utilisateurDao ) {
        this.utilisateurDao = utilisateurDao;
    }

    public ConnectionForm() {
        super();
        // TODO Auto-generated constructor stub
    }

    public String getResultat() {
        return resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public Utilisateur connecterUtilisateur( HttpServletRequest request ) {
        /* Récupération des champs du formulaire */
        String email = getValeurChamp( request, CHAMP_EMAIL );
        String motdepasseconnection = getValeurChamp( request, CHAMP_PASS );

        /*
         * ConfigurablePasswordEncryptor passwordEncryptor = new
         * ConfigurablePasswordEncryptor(); passwordEncryptor.setAlgorithm(
         * ALGO_CHIFFREMENT ); passwordEncryptor.setPlainDigest( false ); String
         * motDePasseChiffre = passwordEncryptor.encryptPassword( motDePasse );
         */

        Utilisateur utilisateur = new Utilisateur();
        utilisateur.setEmail( email );
        /*
         * Validation du champ email. try { validationEmail( email ); } catch (
         * FormValidationException e ) { setErreur( CHAMP_EMAIL, e.getMessage()
         * ); }
         * 
         * Validation du champ mot de passe. try { validationMotDePasse(
         * motDePasse ); } catch ( FormValidationException e ) { setErreur(
         * CHAMP_PASS, e.getMessage() ); }
         */

        /* Validation Utilisateur. */
        try {
            utilisateur = validationUtilisateur( email, motdepasseconnection );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_PASS, e.getMessage() );
        }

        /* Initialisation du résultat global de la validation. */
        if ( erreurs.isEmpty() ) {
            resultat = "Succès de la connexion.";
        } else {
            resultat = "Échec de la connexion.";

        }
        /*
         * utilisateur.setEmail( email ); utilisateur.setMotDePasse( motDePasse
         * );
         */
        /* utilisateur = utilisateurDao.trouver( email ); */

        return utilisateur;
    }

    /*    *//**
             * Valide l'adresse email saisie.
             */

    /*
     * private void validationEmail( String email ) throws
     * FormValidationException { if ( email != null && !email.matches(
     * "([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)" ) ) { throw new
     * FormValidationException( "Merci de saisir une adresse mail valide." ); }
     * }
     * 
     *//**
        * Valide le mot de passe saisi.
        * 
        * @param utilisateur
        *//*
           * private void validationMotDePasse( String motDePasse ) throws
           * FormValidationException { if ( motDePasse != null ) { if (
           * motDePasse.length() < 3 ) { throw new FormValidationException(
           * "Le mot de passe doit contenir au moins 3 caractères." ); } } else
           * { throw new FormValidationException(
           * "Merci de saisir votre mot de passe." ); } }
           */

    /* Validation de l'adresse email */
    private Utilisateur validationUtilisateur( String email, String motdepasseconnection )
            throws FormValidationException {
        Utilisateur utilisateur;
        utilisateur = utilisateurDao.verifier( email, motdepasseconnection );
        if ( utilisateur == null ) {

            throw new FormValidationException(
                    "Email ou Mot de passe incorrecte" );
        } else {

            return utilisateur;
        }
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
            /*
             * Properties props = new Properties(); props.put( "mail.smtp.host",
             * "http://localhost:8080/caveWeb" ); props.put( "PH6061974",
             * "olgareshetnik20@gmail.com" ); Session session =
             * Session.getInstance( props, null );
             * 
             * try { MimeMessage msg = new MimeMessage( session );
             * msg.setFrom(); msg.setRecipients( Message.RecipientType.TO,
             * "olga20reba@gmail.com" ); msg.setSubject(
             * "JavaMail hello world example" ); msg.setSentDate( new Date() );
             * msg.setText( "Hello, world!\n" ); Transport.send( msg ); } catch
             * ( MessagingException mex ) { System.out.println(
             * "send failed, exception: " + mex ); }
             */

            resultat = "Un email vous a été envoyé avec votre mot de passe";
        } else {
            resultat = "Échec";

        }

        return utilisateur;
    }

    /* Validation de l'adresse email */
    private Utilisateur validationUtilisateurParMail( String email )
            throws FormValidationException {
        Utilisateur utilisateur;
        utilisateur = utilisateurDao.trouver( email );
        if ( utilisateur == null ) {

            throw new FormValidationException(
                    "Email incorrecte" );
        } else {

            return utilisateur;
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