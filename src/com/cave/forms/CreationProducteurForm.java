package com.cave.forms;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cave.beans.Producteur;
import com.cave.beans.Utilisateur;
import com.cave.dao.DAOException;
import com.cave.dao.ProducteurDao;

public final class CreationProducteurForm {
    private static final String CHAMP_NOM               = "nomP";
    private static final String CHAMP_PRODUCTEUR_EXISTE = "producteurExiste";
    private static final String CHAMP_ADRESSE           = "adresse";
    private static final String CHAMP_CONTACT           = "contact";
    private static final String CHAMP_ERREUR_DAO        = "erreurDaoProd";

    public static final String  PARAM_ID_PRODUCTEUR     = "idProducteur";

    private String              resultat;
    private Map<String, String> erreurs                 = new HashMap<String, String>();
    ProducteurDao               producteurDao;

    public CreationProducteurForm( ProducteurDao producteurDao ) {
        this.producteurDao = producteurDao;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public String getResultat() {
        return resultat;
    }

    public Producteur creerProducteurPourUtilisateur( HttpServletRequest request, Utilisateur sessionUtilisateur ) {
        Long id = null;
        String nom = getValeurChamp( request, CHAMP_NOM );
        String adresse = getValeurChamp( request, CHAMP_ADRESSE );
        String contact = getValeurChamp( request, CHAMP_CONTACT );
        Producteur producteur = new Producteur();
        producteur.setUtilisateur( sessionUtilisateur );
        traiterNom( nom, producteur );
        traiterAdresse( adresse, producteur );
        traiterContact( contact, producteur );
        traiterExistenceProducteur( producteur, id );

        try {
            if ( erreurs.isEmpty() ) {
                producteurDao.creerPouUtilisateur( producteur );
                resultat = "Succès de la création du producteur " + producteur.getNom();
            } else {
                if ( producteur.getNom() != null ) {
                    resultat = "Échec de la création du producteur " + producteur.getNom();
                } else {
                    resultat = "Échec de la création du producteur ";
                }

            }
        } catch ( DAOException e ) {
            setErreur( CHAMP_ERREUR_DAO, e.getMessage() );
            e.printStackTrace();
        }

        return producteur;
    }

    public Producteur updateProducteur( HttpServletRequest request, Utilisateur sessionUtilisateur ) {
        String nom = getValeurChamp( request, CHAMP_NOM );
        String adresse = getValeurChamp( request, CHAMP_ADRESSE );
        String contact = getValeurChamp( request, CHAMP_CONTACT );
        Long id = Long.parseLong( request.getParameter( PARAM_ID_PRODUCTEUR ) );

        Producteur producteur = new Producteur();
        producteur.setUtilisateur( sessionUtilisateur );
        producteur.setId( id );
        traiterNom( nom, producteur );
        traiterAdresse( adresse, producteur );
        traiterContact( contact, producteur );
        traiterExistenceProducteur( producteur, id );

        try {
            if ( erreurs.isEmpty() ) {
                producteurDao.update( producteur );
                resultat = "Succès mise à jour du producteur " + producteur.getNom();
            } else {
                if ( producteur.getNom() != null ) {
                    resultat = "Échec mise à jour du producteur " + producteur.getNom();
                } else {
                    resultat = "Échec mise à jour du producteur ";
                }
            }
        } catch ( DAOException e ) {
            setErreur( CHAMP_ERREUR_DAO, e.getMessage() );
            e.printStackTrace();
        }

        return producteur;
    }

    private void traiterNom( String nom, Producteur producteur ) {
        try {
            validationNom( nom );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_NOM, e.getMessage() );
            e.printStackTrace();
        }
        producteur.setNom( nom );
    }

    private void validationNom( String nom ) throws FormValidationException {
        if ( nom == null ) {
            throw new FormValidationException( "Merci d'entrer un nom de producteur." );
        }
    }

    private void traiterAdresse( String adresse, Producteur producteur ) {
        try {
            validationAdresse( adresse );
            if ( adresse == null ) {
                adresse = "non indiqué";
            }
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_ADRESSE, e.getMessage() );
        }
        producteur.setAdresse( adresse );
    }

    private void validationAdresse( String adresse ) throws FormValidationException {

        /*
         * if ( !adresse.matches(
         * "\\d+\\s+([a-zA-Z]+|[a-zA-Z]+\\s[a-zA-Z]+)+\\s+ \\d+ ([a-zA-Z]+|[a-zA-Z]+\\\\s[a-zA-Z]+) "
         * ) ) { throw new FormValidationException(
         * "Merci de saisir une adresse valide. Ex. 123, rue X, ZZZZ Ville" ); }
         */
    }

    private void traiterContact( String contact, Producteur producteur ) {
        try {
            validationContact( contact );
            if ( contact == null ) {
                contact = "non indiqué";
            }
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_CONTACT, e.getMessage() );
        }
        producteur.setContact( contact );
    }

    private void validationContact( String contact ) throws FormValidationException {

        /*
         * if ( !contact.matches(
         * "\\d{10}|(?:\\d{3}-){2}\\d{4}|\\(\\d{3}\\)\\d{3}-?\\d{4}" ) ) { throw
         * new FormValidationException(
         * "Merci de saisir une contact valide. Ex.1234567890 ou 123-456-7890"
         * ); }
         */
    }

    private void traiterExistenceProducteur( Producteur producteur, Long id ) {
        try {
            validationExistenceProducteur( producteur, id );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_PRODUCTEUR_EXISTE, e.getMessage() );
        }

    }

    private void validationExistenceProducteur( Producteur producteur, Long id )
            throws FormValidationException {
        Producteur producteurDansList = producteurDao.trouver( producteur );
        if ( producteurDansList != null && producteurDansList.getId() != id ) {
            throw new FormValidationException(
                    "Un viticulteur avec les mêmes nom, adress et contact est déjà se trouve dans votre carnet." );
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