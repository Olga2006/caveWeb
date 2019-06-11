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

    private String              successCreation;
    private String              successMaj;

    private String              unsuccessCreation;
    private String              unsuccessMaj;

    private Map<String, String> erreurs                 = new HashMap<String, String>();
    ProducteurDao               producteurDao;

    public CreationProducteurForm( ProducteurDao producteurDao ) {
        this.producteurDao = producteurDao;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public String getSuccessCreation() {
        return successCreation;
    }

    public String getSuccessMaj() {
        return successMaj;
    }

    public String getUnsuccessCreation() {
        return unsuccessCreation;
    }

    public String getUnsuccessMaj() {
        return unsuccessMaj;
    }

    public Producteur creerProducteurPourUtilisateur( HttpServletRequest request, Utilisateur sessionUtilisateur ) {
        Long id = null;
        String nom = getValeurChamp( request, CHAMP_NOM );
        String adresse = getValeurChamp( request, CHAMP_ADRESSE );
        String contact = getValeurChamp( request, CHAMP_CONTACT );
        Producteur producteur = new Producteur();
        producteur.setUtilisateur( sessionUtilisateur );
        producteur.setNom( nom );
        producteur.setAdresse( adresse );
        producteur.setContact( contact );
        traiterExistenceProducteur( producteur, id );

        if ( erreurs.isEmpty() ) {
            try {
                producteurDao.creerPouUtilisateur( producteur );
                successCreation = " " + producteur.getNom();
            } catch ( DAOException e ) {
                setErreur( CHAMP_ERREUR_DAO, e.getMessage() );
                e.printStackTrace();
                unsuccessCreation = " " + producteur.getNom();
            }
        } else {
            unsuccessCreation = " " + producteur.getNom();
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
        producteur.setNom( nom );
        producteur.setAdresse( adresse );
        producteur.setContact( contact );
        traiterExistenceProducteur( producteur, id );

        if ( erreurs.isEmpty() ) {
            try {
                producteurDao.update( producteur );
                successMaj = " " + producteur.getNom();
            } catch ( DAOException e ) {
                setErreur( CHAMP_ERREUR_DAO, e.getMessage() );
                e.printStackTrace();
                unsuccessMaj = " " + producteur.getNom();
            }
        } else {
            unsuccessMaj = " " + producteur.getNom();
        }

        return producteur;
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
        try {
            Producteur producteurDansList = producteurDao.trouver( producteur );
            if ( producteurDansList != null && producteurDansList.getId() != id ) {
                throw new FormValidationException( producteur.getNom() );
            }
        } catch ( DAOException e ) {
            setErreur( CHAMP_ERREUR_DAO, e.getMessage() );
            e.printStackTrace();
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