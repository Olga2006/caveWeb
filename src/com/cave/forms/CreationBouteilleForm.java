package com.cave.forms;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cave.beans.Bouteille;
import com.cave.beans.Producteur;
import com.cave.beans.Utilisateur;
import com.cave.dao.BouteilleDao;
import com.cave.dao.DAOException;
import com.cave.dao.ProducteurDao;

public final class CreationBouteilleForm {
    public static final String  PARAM_ID_BOUTEILLE            = "idBouteille";
    public static final String  PARAM_NOM_BOUTEILLE           = "nomBouteille";
    private static final String PARAM_IMAGE                   = "image";

    private static final String CHAMP_CHOIX_PRODUCTER         = "choixNouveauProducteur";
    private static final String CHAMP_CHOIX_AJOUTER_PRODUCTER = "choixAjouterProducteur";
    private static final String CHAMP_LISTE_PRODCTEURS        = "listeProducteurs";
    private static final String CHAMP_ERREUR_DAO              = "erreurDaoBouteille";
    private static final String CHAMP_ERREUR_IMAGE            = "erreurImage";
    private static final String CHAMP_NOM                     = "nom";

    private static final String CHAMP_BOTEILLE_EXISTE         = "bouteilleExiste";

    private static final String CHAMP_PAYS                    = "pays";
    private static final String CHAMP_REGION                  = "region";
    private static final String CHAMP_APPELATION              = "appelation";
    private static final String CHAMP_CRU                     = "cru";
    private static final String CHAMP_COLEUR                  = "couleur";
    private static final String CHAMP_TAILLE                  = "taille";

    private static final String CHAMP_QUANTITE_ACHETER        = "quantiteAcheter";
    private static final String CHAMP_PRIX_ACHAT              = "prixAchat";
    private static final String CHAMP_PRIX_ACTUELLE           = "prixActuelle";
    private static final String CHAMP_DATE_DE_PRODUCTION      = "dateDeProduction";
    private static final String CHAMP_DATE_GARDER             = "dateGarder";
    private static final String CHAMP_EVALUATION              = "evaluation";
    private static final String CHAMP_COMMENTAIRE             = "commentaire";

    private static final int    TAILLE_TAMPON                 = 10240;                        // 10ko

    private static final String ANCIEN_PRODUCTER              = "ancienProducteur";
    private static final String AJOUTER_PRODUCTER             = "ajouterProducteur";
    private static final String FORMAT_DATE                   = "dd/MM/yyyy HH:mm:ss";

    public static Integer       beginningimg                  = 1;

    private String              resultat;
    private Map<String, String> erreurs                       = new HashMap<String, String>();

    private BouteilleDao        bouteilleDao;
    private ProducteurDao       producteurDao;

    public CreationBouteilleForm( ProducteurDao producteurDao, BouteilleDao bouteilleDao ) {
        this.bouteilleDao = bouteilleDao;
        this.producteurDao = producteurDao;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public String getResultat() {
        return resultat;
    }

    public Bouteille creerBouteillePourUtilisateur( HttpServletRequest request, Utilisateur sessionUtilisateur,
            String chemin ) {
        Producteur producteur = null;
        String choixNouveauProducteur = getValeurChamp( request, CHAMP_CHOIX_PRODUCTER );
        String choixAjouterProducteur = getValeurChamp( request, CHAMP_CHOIX_AJOUTER_PRODUCTER );
        if ( AJOUTER_PRODUCTER.equals( choixAjouterProducteur ) ) {
            if ( ANCIEN_PRODUCTER.equals( choixNouveauProducteur ) ) {
                /* Récupération du id du Producteur choisi */
                String idAncienProducteur = getValeurChamp( request, CHAMP_LISTE_PRODCTEURS );
                Long id = null;
                try {
                    id = Long.parseLong( idAncienProducteur );
                } catch ( NumberFormatException e ) {
                    setErreur( CHAMP_CHOIX_PRODUCTER,
                            "Producteur inconnu, merci d'utiliser le formulaire prévu à cet effet." );
                    id = 0L;
                }

                List<Producteur> producteurs = null;
                producteurs = sessionUtilisateur.getProducteurs();

                if ( id != null && producteurs != null ) {
                    for ( Producteur producteurCurr : producteurs ) {
                        if ( producteurCurr.getId().equals( id ) ) {
                            producteur = producteurCurr;
                            break;
                        }
                    }
                }

            } else {

                CreationProducteurForm producteurForm = new CreationProducteurForm( producteurDao );
                producteur = producteurForm.creerProducteurPourUtilisateur( request, sessionUtilisateur );
                erreurs = producteurForm.getErreurs();
            }
        }

        Long id = null;
        String nom = getValeurChamp( request, CHAMP_NOM );
        String pays = getValeurChamp( request, CHAMP_PAYS );
        String region = getValeurChamp( request, CHAMP_REGION );
        String appelation = getValeurChamp( request, CHAMP_APPELATION );
        String cru = getValeurChamp( request, CHAMP_CRU );
        String couleur = getValeurChamp( request, CHAMP_COLEUR );
        String taille = getValeurChamp( request, CHAMP_TAILLE );
        String quantiteAcheter = getValeurChamp( request, CHAMP_QUANTITE_ACHETER );
        String prixAchat = getValeurChamp( request, CHAMP_PRIX_ACHAT );
        String prixActuelle = getValeurChamp( request, CHAMP_PRIX_ACTUELLE );
        String dateProduction = getValeurChamp( request, CHAMP_DATE_DE_PRODUCTION );
        String dateGarder = getValeurChamp( request, CHAMP_DATE_GARDER );
        String evaluation = getValeurChamp( request, CHAMP_EVALUATION );
        String commentaire = getValeurChamp( request, CHAMP_COMMENTAIRE );
        String image = request.getParameter( PARAM_IMAGE );
        // DateTime dateDeProduction = getValeurChamp( request,
        // CHAMP_DATE_DE_PRODUCTION );

        Bouteille bouteille = new Bouteille();
        bouteille.setUtilisateur( sessionUtilisateur );
        bouteille.setCommentaire( commentaire );
        if ( image != null ) {
            bouteille.setImage( image );
        } else {
            bouteille.setImage( "defaultetiquette.jpg" );
        }
        traiterProdcteur( producteur, bouteille );
        traiterNom( nom, bouteille );
        traiterPays( pays, bouteille );
        traiterRegion( region, bouteille );
        traiterAppelation( appelation, bouteille );
        traiterCru( cru, bouteille );
        traiterCouleur( couleur, bouteille );
        traiterTaille( taille, bouteille );
        traiterQuantite( quantiteAcheter, bouteille );
        traiterPrixAchat( prixAchat, bouteille );
        traiterPrixActuelle( prixActuelle, bouteille );
        /* traiterImage( bouteille, request, chemin ); */
        traiterDateGarder( dateGarder, bouteille );
        traiterDateProduction( dateProduction, bouteille );
        traiterEvaluation( evaluation, bouteille );
        traiterExistenceBouteille( bouteille, id );

        /*
         * try { String image = validationImage( request, chemin ); if ( image
         * != null && !image.isEmpty() ) { bouteille.setImage( image ); } else {
         * bouteille.setImage( "defaultetiquette.jpg" ); } } catch (
         * FormValidationException e1 ) { // TODO Auto-generated catch block
         * setErreur( CHAMP_ERREUR_IMAGE, e1.getMessage() );
         * e1.printStackTrace(); }
         */

        try {
            if ( erreurs.isEmpty() ) {
                bouteilleDao.creerPourUtilisateur( bouteille );
                resultat = "Succès de la création de la bouteille " + bouteille.getNom();
            } else {
                if ( bouteille.getNom() != null ) {
                    resultat = "Échec de la création de la bouteille " + bouteille.getNom();
                } else {
                    resultat = "Échec de la création de la bouteille ";
                }
            }
        } catch ( DAOException e ) {
            setErreur( CHAMP_ERREUR_DAO, e.getMessage() );
            e.printStackTrace();
        }

        return bouteille;
    }

    public Bouteille updateBouteille( HttpServletRequest request, Utilisateur sessionUtilisateur, String chemin ) {
        Producteur producteur = null;
        String choixNouveauProducteur = getValeurChamp( request, CHAMP_CHOIX_PRODUCTER );
        String choixAjouterProducteur = getValeurChamp( request, CHAMP_CHOIX_AJOUTER_PRODUCTER );
        if ( AJOUTER_PRODUCTER.equals( choixAjouterProducteur ) ) {
            if ( ANCIEN_PRODUCTER.equals( choixNouveauProducteur ) ) {
                /* Récupération du id du Producteur choisi */
                String idAncienProducteur = getValeurChamp( request, CHAMP_LISTE_PRODCTEURS );
                Long id = null;
                try {
                    id = Long.parseLong( idAncienProducteur );
                } catch ( NumberFormatException e ) {
                    setErreur( CHAMP_CHOIX_PRODUCTER,
                            "Producteur inconnu, merci d'utiliser le formulaire prévu à cet effet." );
                    id = 0L;
                }

                List<Producteur> producteurs = null;
                producteurs = sessionUtilisateur.getProducteurs();

                if ( id != null && producteurs != null ) {
                    for ( Producteur producteurCurr : producteurs ) {
                        if ( producteurCurr.getId().equals( id ) ) {
                            producteur = producteurCurr;
                            break;
                        }
                    }
                }

            } else {

                CreationProducteurForm producteurForm = new CreationProducteurForm( producteurDao );
                producteur = producteurForm.creerProducteurPourUtilisateur( request, sessionUtilisateur );
                erreurs = producteurForm.getErreurs();
            }
        }
        Long id = Long.parseLong( request.getParameter( PARAM_ID_BOUTEILLE ) );
        String nom = getValeurChamp( request, CHAMP_NOM );
        String pays = getValeurChamp( request, CHAMP_PAYS );
        String region = getValeurChamp( request, CHAMP_REGION );
        String appelation = getValeurChamp( request, CHAMP_APPELATION );
        String cru = getValeurChamp( request, CHAMP_CRU );
        String couleur = getValeurChamp( request, CHAMP_COLEUR );
        String taille = getValeurChamp( request, CHAMP_TAILLE );
        String quantiteAcheter = getValeurChamp( request, CHAMP_QUANTITE_ACHETER );
        String prixAchat = getValeurChamp( request, CHAMP_PRIX_ACHAT );
        String prixActuelle = getValeurChamp( request, CHAMP_PRIX_ACTUELLE );
        String dateProduction = getValeurChamp( request, CHAMP_DATE_DE_PRODUCTION );
        String dateGarder = getValeurChamp( request, CHAMP_DATE_GARDER );
        String evaluation = getValeurChamp( request, CHAMP_EVALUATION );
        String commentaire = getValeurChamp( request, CHAMP_COMMENTAIRE );

        String image = request.getParameter( PARAM_IMAGE );

        Bouteille bouteille = new Bouteille();
        bouteille.setUtilisateur( sessionUtilisateur );
        bouteille.setId( id );
        bouteille.setCommentaire( commentaire );
        if ( image != null ) {
            bouteille.setImage( image );
        } else {
            Bouteille bouteilleCurr = bouteilleDao.trouver( id );
            bouteille.setImage( bouteilleCurr.getImage() );
        }
        traiterProdcteur( producteur, bouteille );
        traiterNom( nom, bouteille );

        traiterPays( pays, bouteille );
        traiterRegion( region, bouteille );
        traiterAppelation( appelation, bouteille );
        traiterCru( cru, bouteille );
        traiterCouleur( couleur, bouteille );
        traiterTaille( taille, bouteille );

        traiterPrixAchat( prixAchat, bouteille );
        traiterPrixActuelle( prixActuelle, bouteille );
        traiterQuantite( quantiteAcheter, bouteille );
        // traiterImage( bouteille, request, chemin );
        traiterDateGarder( dateGarder, bouteille );
        traiterDateProduction( dateProduction, bouteille );
        traiterEvaluation( evaluation, bouteille );
        traiterExistenceBouteille( bouteille, id );

        try {
            if ( erreurs.isEmpty() ) {
                bouteilleDao.update( bouteille );
                resultat = "Succès mise à jour de la bouteille " + bouteille.getNom();
            } else {
                if ( bouteille.getNom() != null ) {
                    resultat = "Échec mise à jour de la bouteille " + bouteille.getNom();
                } else {
                    resultat = "Échec mise à jour de la bouteille ";
                }
            }
        } catch ( DAOException e ) {
            setErreur( CHAMP_ERREUR_DAO, e.getMessage() );
            e.printStackTrace();
        }

        return bouteille;

    }

    public Bouteille updateEvaluation( HttpServletRequest request, Utilisateur sessionUtilisateur ) {

        String evaluation = getValeurChamp( request, CHAMP_EVALUATION );
        String idBouteille = getValeurParametre( request, PARAM_ID_BOUTEILLE );
        String nomBouteille = getValeurParametre( request, PARAM_NOM_BOUTEILLE );
        Bouteille bouteille = new Bouteille();
        if ( idBouteille != null ) {
            Long id = Long.parseLong( request.getParameter( PARAM_ID_BOUTEILLE ) );
            bouteille.setId( id );
            bouteille.setNom( nomBouteille );
            traiterEvaluation( evaluation, bouteille );

            try {
                if ( erreurs.isEmpty() ) {
                    bouteilleDao.changerEvaluation( bouteille.getEvaluation(), id );
                    resultat = "Succès de la modification de l'evaluation pour " + bouteille.getNom();
                } else {
                    if ( bouteille.getNom() != null ) {
                        resultat = "Échec de la modification de l'evaluation pour " + bouteille.getNom();
                    } else {
                        resultat = "Échec de la modification de l'evaluation ";
                    }
                }
            } catch ( DAOException e ) {
                setErreur( CHAMP_ERREUR_DAO, e.getMessage() );
                e.printStackTrace();
            }

        }

        return bouteille;
    }

    public Bouteille updateQuantiteLC( HttpServletRequest request, Utilisateur sessionUtilisateur ) {
        String idBouteille = getValeurParametre( request, PARAM_ID_BOUTEILLE );
        String nomBouteille = getValeurParametre( request, PARAM_NOM_BOUTEILLE );
        String quantiteAcheter = getValeurChamp( request, CHAMP_QUANTITE_ACHETER );
        Bouteille bouteille = new Bouteille();
        if ( idBouteille != null ) {
            Long id = Long.parseLong( request.getParameter( PARAM_ID_BOUTEILLE ) );
            bouteille.setId( id );
            bouteille.setNom( nomBouteille );
            traiterQuantite( quantiteAcheter, bouteille );

            try {
                if ( erreurs.isEmpty() ) {
                    bouteilleDao.changerLC( bouteille.getNbrListCourses(), id );
                    resultat = "Succès de la modification du nombre bouteille à acheter pour " + bouteille.getNom();
                } else {
                    if ( bouteille.getNom() != null ) {
                        resultat = "Échec de la modification du nombre bouteille à acheter pour " + bouteille.getNom();
                    } else {
                        resultat = "Échec de la modification du nombre bouteille à acheter";
                    }
                }
            } catch ( DAOException e ) {
                setErreur( CHAMP_ERREUR_DAO, e.getMessage() );
                e.printStackTrace();
            }

        }

        return bouteille;
    }

    public Bouteille updateCommentair( HttpServletRequest request, Utilisateur sessionUtilisateur ) {
        String idBouteille = getValeurParametre( request, PARAM_ID_BOUTEILLE );
        String nomBouteille = getValeurParametre( request, PARAM_NOM_BOUTEILLE );
        String commentaire = getValeurChamp( request, CHAMP_COMMENTAIRE );
        Bouteille bouteille = new Bouteille();
        if ( idBouteille != null ) {
            Long id = Long.parseLong( request.getParameter( PARAM_ID_BOUTEILLE ) );
            bouteille.setId( id );
            bouteille.setNom( nomBouteille );
            bouteille.setCommentaire( commentaire );

            try {
                if ( erreurs.isEmpty() ) {
                    bouteilleDao.ajouterCommentaire( bouteille.getCommentaire(), id );
                    resultat = "Succès de la modification des commentaires pour " + bouteille.getNom();
                } else {
                    if ( bouteille.getNom() != null ) {
                        resultat = "Échec de la modification des commentaires pour " + bouteille.getNom();
                    } else {
                        resultat = "Échec de la modification des commentaires";
                    }
                }
            } catch ( DAOException e ) {
                setErreur( CHAMP_ERREUR_DAO, e.getMessage() );
                e.printStackTrace();
            }

        }

        return bouteille;
    }

    private void traiterProdcteur( Producteur producteur, Bouteille bouteille ) {
        if ( producteur == null ) {
            bouteille.setIdProducteur( null );
        } else {
            bouteille.setIdProducteur( producteur.getId() );
        }
        bouteille.setProducteur( producteur );
    }

    private void traiterNom( String nom, Bouteille bouteille ) {
        try {
            validationInformation( nom );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_NOM, e.getMessage() );
        }
        bouteille.setNom( nom );
    }

    private void traiterCouleur( String couleur, Bouteille bouteille ) {
        try {
            validationInformation( couleur );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_COLEUR, e.getMessage() );
        }
        bouteille.setCouleur( couleur );
    }

    private void traiterCru( String cru, Bouteille bouteille ) {

        try {
            validationInformation( cru );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_CRU, e.getMessage() );
        }
        bouteille.setCru( cru );
    }

    private void traiterAppelation( String appelation, Bouteille bouteille ) {

        try {
            validationInformation( appelation );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_APPELATION, e.getMessage() );
        }
        bouteille.setAppelation( appelation );
    }

    private void traiterRegion( String region, Bouteille bouteille ) {

        try {
            validationInformation( region );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_REGION, e.getMessage() );
        }
        bouteille.setRegion( region );
    }

    private void traiterPays( String pays, Bouteille bouteille ) {
        try {
            validationInformation( pays );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_PAYS, e.getMessage() );
        }
        bouteille.setPays( pays );
    }

    private void validationInformation( String information ) throws FormValidationException {
        if ( information != null ) {
            if ( information.length() < 1 ) {
                throw new FormValidationException( "Information doit contenir au moins 1 caractères." );
            }
        } else {
            throw new FormValidationException( "Merci d'entrer information" );
        }
    }

    private void traiterTaille( String taille, Bouteille bouteille ) {

        double valeurMontant = 0;
        try {
            valeurMontant = validationTaille( taille );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_TAILLE, e.getMessage() );
        }
        bouteille.setTaille( valeurMontant );
    }

    private double validationTaille( String nombre ) throws FormValidationException {
        double temp;
        if ( nombre != null ) {
            try {
                temp = Double.parseDouble( nombre );
                if ( temp < 0 ) {
                    throw new FormValidationException( "Le montant doit être un nombre positif." );
                }
            } catch ( NumberFormatException e ) {
                temp = 0;
                throw new FormValidationException( "Le montant doit être un nombre." );
            }
        } else {
            temp = 0;
            throw new FormValidationException( "Merci d'effectuer votre choix." );
        }
        return temp;
    }

    private void traiterPrixActuelle( String prixActuelle, Bouteille bouteille ) {
        double valeurMontant = 0;
        try {
            valeurMontant = validationMontant( prixActuelle );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_PRIX_ACTUELLE, e.getMessage() );
        }
        bouteille.setPrixActuelle( valeurMontant );
    }

    private void traiterPrixAchat( String prixAchat, Bouteille bouteille ) {
        double valeurMontant = 0;
        try {
            valeurMontant = validationMontant( prixAchat );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_PRIX_ACHAT, e.getMessage() );
        }
        bouteille.setPrixAchat( valeurMontant );
    }

    private double validationMontant( String nombre ) throws FormValidationException {
        double temp;
        if ( nombre != null ) {
            try {
                temp = Double.parseDouble( nombre );
                if ( temp < 0 ) {
                    throw new FormValidationException( "Le montant doit être un nombre positif." );
                }
            } catch ( NumberFormatException e ) {
                temp = 0;
                throw new FormValidationException( "Le montant doit être un nombre." );
            }
        } else {
            temp = 0;

        }
        return temp;
    }

    private void traiterQuantite( String quantiteAcheter, Bouteille bouteille ) {
        Integer valeurMontant = 0;
        try {
            valeurMontant = validationNombre( quantiteAcheter );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_QUANTITE_ACHETER, e.getMessage() );
        }
        bouteille.setNbrListCourses( valeurMontant );
    }

    private void traiterEvaluation( String evaluation, Bouteille bouteille ) {
        Integer valeurMontant = 0;
        try {
            valeurMontant = validationNombre( evaluation );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_EVALUATION, e.getMessage() );
        }
        bouteille.setEvaluation( valeurMontant );
    }

    private Integer validationNombre( String nombre ) throws FormValidationException {
        Integer temp;
        if ( nombre != null ) {
            try {
                temp = Integer.parseInt( nombre );
                if ( temp < 0 ) {
                    throw new FormValidationException( "Le montant doit être un nombre positif." );
                }
            } catch ( NumberFormatException e ) {
                temp = 0;
                throw new FormValidationException( "Le montant doit être un nombre." );
            }
        } else {
            temp = 0;

        }
        return temp;
    }

    private void traiterDateProduction( String dateProduction, Bouteille bouteille ) {
        int anee = 0000;
        try {
            anee = validationDate( dateProduction );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_DATE_DE_PRODUCTION, e.getMessage() );
        }
        bouteille.setDateDeProduction( anee );
    }

    private void traiterDateGarder( String dateGarder, Bouteille bouteille ) {
        int anee = 0000;
        try {
            anee = validationDate( dateGarder );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_DATE_GARDER, e.getMessage() );
        }
        bouteille.setDateGarder( anee );
    }

    private Integer validationDate( String anee ) throws FormValidationException {
        Integer temp;
        if ( anee != null ) {
            try {
                temp = Integer.parseInt( anee );
                if ( temp < 0 || anee.length() != 4 ) {
                    throw new FormValidationException(
                            "L'année doit être un nombre positif et contenir 4 caractères." );
                }
            } catch ( NumberFormatException e ) {
                temp = 0000;
                throw new FormValidationException( "L'année doit être un nombre." );
            }

        } else {
            temp = 0000;
            throw new FormValidationException( "Merci d'entrer l'année." );
        }
        return temp;
    }

    private void traiterExistenceBouteille( Bouteille bouteille, Long id ) {
        try {
            validationExistenceBouteille( bouteille, id );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_BOTEILLE_EXISTE, e.getMessage() );
        }

    }

    private void validationExistenceBouteille( Bouteille bouteille, Long id )
            throws FormValidationException {
        Bouteille bouteilleDansList = bouteilleDao.trouver( bouteille );
        if ( bouteilleDansList != null && bouteilleDansList.getId() != id ) {
            throw new FormValidationException(
                    "Cette Bouteille est déjà se trouve dans votre carnet." );
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

    private static String getValeurParametre( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur;
        }
    }

}