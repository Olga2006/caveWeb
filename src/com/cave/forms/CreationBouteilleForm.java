package com.cave.forms;

import java.util.Calendar;
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

    private static final String ANCIEN_PRODUCTER              = "ancienProducteur";
    private static final String AJOUTER_PRODUCTER             = "ajouterProducteur";

    public static Integer       beginningimg                  = 1;

    private String              successCreation;
    private String              successMaj;
    private String              successCreationB;
    private String              successMajB;
    private String              successMajLC;
    private String              successMajEvaluation;
    private String              successMajCommentaire;

    private String              unsuccessCreation;
    private String              unsuccessMaj;
    private String              unsuccessCreationB;
    private String              unsuccessMajB;
    private String              unsuccessMajLC;
    private String              unsuccessMajEvaluation;
    private String              unsuccessMajCommentaire;

    /* ------------------Pour producteur---------------------------- */
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
    /* ------------------fin---------------------------- */

    public void setUnsuccessMajCommentaire( String unsuccessMajCommentaire ) {
        this.unsuccessMajCommentaire = unsuccessMajCommentaire;
    }

    private Map<String, String> erreurs = new HashMap<String, String>();

    private BouteilleDao        bouteilleDao;
    private ProducteurDao       producteurDao;

    public String getSuccessCreationB() {
        return successCreationB;
    }

    public String getSuccessMajB() {
        return successMajB;
    }

    public String getSuccessMajLC() {
        return successMajLC;
    }

    public String getSuccessMajEvaluation() {
        return successMajEvaluation;
    }

    public String getSuccessMajCommentaire() {
        return successMajCommentaire;
    }

    public String getUnsuccessCreationB() {
        return unsuccessCreationB;
    }

    public String getUnsuccessMajB() {
        return unsuccessMajB;
    }

    public String getUnsuccessMajLC() {
        return unsuccessMajLC;
    }

    public String getUnsuccessMajEvaluation() {
        return unsuccessMajEvaluation;
    }

    public String getUnsuccessMajCommentaire() {
        return unsuccessMajCommentaire;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public CreationBouteilleForm( ProducteurDao producteurDao, BouteilleDao bouteilleDao ) {
        this.bouteilleDao = bouteilleDao;
        this.producteurDao = producteurDao;
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
                            " " );
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
                successCreation = producteurForm.getSuccessCreation();
                unsuccessCreation = producteurForm.getUnsuccessCreation();
                successMaj = producteurForm.getSuccessMaj();
                unsuccessMaj = producteurForm.getUnsuccessMaj();
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

        Bouteille bouteille = new Bouteille();
        bouteille.setUtilisateur( sessionUtilisateur );
        bouteille.setNom( nom );
        bouteille.setPays( pays );
        bouteille.setRegion( region );
        bouteille.setAppelation( appelation );
        bouteille.setCru( cru );
        bouteille.setCouleur( couleur );
        bouteille.setCommentaire( commentaire );
        if ( image != null ) {
            bouteille.setImage( image );
        } else {
            bouteille.setImage( "defaultetiquette.jpg" );
        }
        traiterProdcteur( producteur, bouteille );
        traiterTaille( taille, bouteille );
        traiterQuantite( quantiteAcheter, bouteille );
        traiterPrixAchat( prixAchat, bouteille );
        traiterPrixActuelle( prixActuelle, bouteille );
        traiterDateGarder( dateGarder, bouteille );
        traiterDateProduction( dateProduction, bouteille );
        traiterEvaluation( evaluation, bouteille );
        traiterExistenceBouteille( bouteille, id );

        if ( erreurs.isEmpty() ) {
            try {
                bouteilleDao.creerPourUtilisateur( bouteille );
                successCreationB = " " + bouteille.getNom();
            } catch ( DAOException e ) {
                setErreur( CHAMP_ERREUR_DAO, e.getMessage() );
                e.printStackTrace();
                unsuccessCreationB = " " + bouteille.getNom();
            }
        } else {
            unsuccessCreationB = " " + bouteille.getNom();
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
                            " " );
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
                successCreation = producteurForm.getSuccessCreation();
                unsuccessCreation = producteurForm.getUnsuccessCreation();
                successMaj = producteurForm.getSuccessMaj();
                unsuccessMaj = producteurForm.getUnsuccessMaj();
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
        bouteille.setNom( nom );
        bouteille.setPays( pays );
        bouteille.setRegion( region );
        bouteille.setAppelation( appelation );
        bouteille.setCru( cru );
        bouteille.setCouleur( couleur );
        bouteille.setCommentaire( commentaire );
        if ( image != null ) {
            bouteille.setImage( image );
        } else {
            Bouteille bouteilleCurr = bouteilleDao.trouver( id );
            bouteille.setImage( bouteilleCurr.getImage() );
        }
        traiterProdcteur( producteur, bouteille );
        traiterTaille( taille, bouteille );
        traiterPrixAchat( prixAchat, bouteille );
        traiterPrixActuelle( prixActuelle, bouteille );
        traiterQuantite( quantiteAcheter, bouteille );
        // traiterImage( bouteille, request, chemin );
        traiterDateGarder( dateGarder, bouteille );
        traiterDateProduction( dateProduction, bouteille );
        traiterEvaluation( evaluation, bouteille );
        traiterExistenceBouteille( bouteille, id );

        if ( erreurs.isEmpty() ) {
            try {
                bouteilleDao.update( bouteille );
                successMajB = " " + bouteille.getNom();
            } catch ( DAOException e ) {
                setErreur( CHAMP_ERREUR_DAO, e.getMessage() );
                e.printStackTrace();
                unsuccessMajB = " " + bouteille.getNom();
            }

        } else {
            unsuccessMajB = " " + bouteille.getNom();
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
                bouteilleDao.changerEvaluation( bouteille.getEvaluation(), id );
                successMajEvaluation = " " + bouteille.getNom();
            } catch ( DAOException e ) {
                setErreur( CHAMP_ERREUR_DAO, e.getMessage() );
                e.printStackTrace();
                unsuccessMajEvaluation = " " + bouteille.getNom();
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
                bouteilleDao.changerLC( bouteille.getNbrListCourses(), id );
                successMajLC = " " + bouteille.getNom();
            } catch ( DAOException e ) {
                setErreur( CHAMP_ERREUR_DAO, e.getMessage() );
                e.printStackTrace();
                unsuccessMajLC = " " + bouteille.getNom();
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
                bouteilleDao.ajouterCommentaire( bouteille.getCommentaire(), id );
                successMajCommentaire = " " + bouteille.getNom();
            } catch ( DAOException e ) {
                setErreur( CHAMP_ERREUR_DAO, e.getMessage() );
                e.printStackTrace();
                unsuccessMajCommentaire = " " + bouteille.getNom();
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

    private void traiterTaille( String taille, Bouteille bouteille ) {
        double valeurMontant = 0;
        valeurMontant = validationDouble( taille );
        bouteille.setTaille( valeurMontant );
    }

    private void traiterPrixActuelle( String prixActuelle, Bouteille bouteille ) {
        double valeurMontant = 0;
        valeurMontant = validationDouble( prixActuelle );
        bouteille.setPrixActuelle( valeurMontant );
    }

    private void traiterPrixAchat( String prixAchat, Bouteille bouteille ) {
        double valeurMontant = 0;
        valeurMontant = validationDouble( prixAchat );
        bouteille.setPrixAchat( valeurMontant );
    }

    private double validationDouble( String nombre ) {
        double temp;
        if ( nombre != null ) {
            try {
                temp = Double.parseDouble( nombre );
                if ( temp < 0 ) {
                    temp = 0;
                }
            } catch ( NumberFormatException e ) {
                temp = 0;
            }
        } else {
            temp = 0;

        }
        return temp;
    }

    private void traiterQuantite( String quantiteAcheter, Bouteille bouteille ) {
        Integer valeurMontant = 0;
        valeurMontant = validationNombre( quantiteAcheter );
        bouteille.setNbrListCourses( valeurMontant );
    }

    private void traiterEvaluation( String evaluation, Bouteille bouteille ) {
        Integer valeurMontant = 0;
        valeurMontant = validationNombre( evaluation );
        bouteille.setEvaluation( valeurMontant );
    }

    private Integer validationNombre( String nombre ) {
        Integer temp;
        if ( nombre != null ) {
            try {
                temp = Integer.parseInt( nombre );
                if ( temp < 0 ) {
                    temp = 0;
                }
            } catch ( NumberFormatException e ) {
                temp = 0;
            }
        } else {
            temp = 0;

        }
        return temp;
    }

    private void traiterDateProduction( String dateProduction, Bouteille bouteille ) {
        int anee = 0000;

        anee = validationAnee( dateProduction );
        bouteille.setDateDeProduction( anee );
    }

    private void traiterDateGarder( String dateGarder, Bouteille bouteille ) {
        int anee = 0000;
        anee = validationAnee( dateGarder );
        bouteille.setDateGarder( anee );
    }

    private Integer validationAnee( String anee ) {
        Integer temp;
        Calendar now = Calendar.getInstance();
        Integer yearNow = now.get( Calendar.YEAR );

        if ( anee != null ) {
            try {
                temp = Integer.parseInt( anee );
                if ( temp < 0 ) {
                    temp = yearNow;
                }
            } catch ( NumberFormatException e ) {
                temp = yearNow;
            }
        } else {
            temp = yearNow;

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
        try {
            Bouteille bouteilleDansList = bouteilleDao.trouver( bouteille );

            if ( bouteilleDansList != null ) {
                Long idProdDansList = bouteilleDansList.getIdProducteur();
                Long idProd = bouteille.getIdProducteur();
                if ( idProdDansList == 0 && idProd == null && bouteilleDansList.getId() != id ) {
                    throw new FormValidationException( bouteille.getNom() );
                }
                if ( bouteilleDansList.getId() != id && idProdDansList == idProd ) {
                    throw new FormValidationException( bouteille.getNom() );
                }
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

    private static String getValeurParametre( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur;
        }
    }

}