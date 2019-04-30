package com.cave.servlets;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.cave.beans.Bouteille;
import com.cave.beans.Producteur;
import com.cave.beans.Utilisateur;
import com.cave.dao.BouteilleDao;
import com.cave.dao.DAOFactory;
import com.cave.dao.ProducteurDao;
import com.cave.forms.FormValidationException;

import eu.medsea.mimeutil.MimeUtil;

@WebServlet( urlPatterns = {
        "/prechargerImg" }, initParams = @WebInitParam( name = "chemin", value = "D:\\FormationJEE\\eclipse-workspace\\caveWeb\\WebContent\\fichiers\\" ) )
@MultipartConfig( location = "D:\\FormationJEE\\eclipse-workspace\\caveWeb\\WebContent\\tmp\\", maxFileSize = 2 * 1024
        * 1024, maxRequestSize = 2 * 1024
                * 1024, fileSizeThreshold = 2 * 1024 * 1024 )
public class PrechargementImg extends HttpServlet {

    public static final String  VUE_SUCCES                    = "/listeBouteilles";
    public static final String  VUE_FORM                      = "/WEB-INF/jsp/restreint/afficherBouteilles.jsp";
    public static final String  ACCES_CONNEXION               = "/connection";

    public static final String  PARAM_ID_BOUTEILLE            = "idBouteille";

    private static final String PARAM_AJOUTER_PRODUCTEUR      = "ajouterProducteurTemp";
    private static final String PARAM_NOUVEAU_PRODUCTER       = "nouveauProducteurTemp";
    private static final String ANCIEN_PRODUCTER              = "ancienProducteur";
    private static final String AJOUTER_PRODUCTER             = "ajouterProducteur";

    private static final String PARAM_NOM_TEMP                = "nomTemp";
    private static final String PARAM_PAYS_TEMP               = "paysTemp";
    private static final String PARAM_REGION_TEMP             = "regionTemp";
    private static final String PARAM_APPELATION_TEMP         = "appelationTemp";
    private static final String PARAM_CRU_TEMP                = "cruTemp";
    private static final String PARAM_COLEUR_TEMP             = "couleurTemp";
    private static final String PARAM_TAILLE_TEMP             = "tailleTemp";
    private static final String PARAM_QUANTITE_ACHETER_TEMP   = "quantiteAcheterTemp";
    private static final String PARAM_PRIX_ACHAT_TEMP         = "prixAchatTemp";
    private static final String PARAM_PRIX_ACTUELLE_TEMP      = "prixActuelleTemp";
    private static final String PARAM_DATE_DE_PRODUCTION_TEMP = "dateDeProductionTemp";
    private static final String PARAM_DATE_GARDER_TEMP        = "dateGarderTemp";
    private static final String PARAM_EVALUATION_TEMP         = "evaluationTemp";
    private static final String PARAM_COMMENTAIRE_TEMP        = "commentaireTemp";

    private static final String PARAM_ID_P_TEMP               = "idPTemp";
    private static final String PARAM_NOM_P_TEMP              = "nomPTemp";
    private static final String PARAM_ADRESS_TEMP             = "adresseTemp";
    private static final String PARAM_CONTACT_TEMP            = "contactTemp";

    public static final String  PARAM_SESSION_USER            = "sessionUtilisateur";

    private static final String CHAMP_ERREUR_IMAGE            = "erreurImage";
    private static final String CHAMP_IMAGE                   = "image";
    public static final String  ATT_BOUTEILLE                 = "bouteille";
    public static final String  ATT_PRODUCTER                 = "producteur";
    public static final String  ATT_FORM                      = "form";
    public static final String  ATT_SUCCES                    = "succes";
    public static final String  ATT_IMAGE_PRECHARGEE          = "imagePrechargee";

    public static final String  CHEMIN                        = "chemin";
    private static final int    TAILLE_TAMPON                 = 10240;                                          // 10ko
    public static Integer       beginningimg                  = 1;
    /*
     * public static final String ATT_PRODUCTERS = "producteurs"; public static
     * final String ATT_IS_CREATION = "isCreationBouteille";
     */

    public static final String  CONF_DAO_FACTORY              = "daofactory";

    private String              succes;
    private String              erreurImage                   = null;

    private Bouteille           bouteille;
    private Producteur          producteur;

    private ProducteurDao       producteurDao;
    private BouteilleDao        bouteilleDao;

    public void init() throws ServletException {
        /* Récupération d'une instance de nos DAO Client et Commande */
        this.producteurDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getProducteurDao();
        this.bouteilleDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getBouteilleDao();

    }

    public void doPost( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utilisateur sessionUtilisateur = (Utilisateur) session.getValue( PARAM_SESSION_USER );
        if ( sessionUtilisateur != null ) {

            String id_Bouteille = getValeurParametre( request, PARAM_ID_BOUTEILLE );

            if ( id_Bouteille != null ) {
                Long idBouteille = Long.parseLong( id_Bouteille );
                bouteille = bouteilleDao.trouver( idBouteille );
                Long idProd = bouteille.getIdProducteur();
                producteur = producteurDao.trouver( idProd );
                request.setAttribute( ATT_BOUTEILLE, bouteille );
                request.setAttribute( ATT_PRODUCTER, producteur );
            } else {
                Producteur producteurTemp = null;
                String ajouterProducteurTemp = getValeurParametre( request, PARAM_AJOUTER_PRODUCTEUR );
                String nouveauProducteurTemp = getValeurParametre( request, PARAM_NOUVEAU_PRODUCTER );

                if ( AJOUTER_PRODUCTER.equals( ajouterProducteurTemp ) ) {
                    if ( ANCIEN_PRODUCTER.equals( nouveauProducteurTemp ) ) {
                        String idPTemp = getValeurParametre( request, PARAM_ID_P_TEMP );
                        Long idP = null;
                        if ( idPTemp != null ) {
                            idP = Long.parseLong( idPTemp );
                        }
                        producteurTemp = producteurDao.trouver( idP );
                    } else {
                        String nomPTemp = getValeurParametre( request, PARAM_NOM_P_TEMP );
                        String adresseTemp = getValeurParametre( request, PARAM_ADRESS_TEMP );
                        String contactTemp = getValeurParametre( request, PARAM_CONTACT_TEMP );
                        producteurTemp = new Producteur( null, nomPTemp, adresseTemp, contactTemp, null, null );
                    }
                    request.setAttribute( ATT_PRODUCTER, producteurTemp );

                }

                String nomTemp = getValeurParametre( request, PARAM_NOM_TEMP );
                String paysTemp = getValeurParametre( request, PARAM_PAYS_TEMP );
                String regionTemp = getValeurParametre( request, PARAM_REGION_TEMP );
                String appelationTemp = getValeurParametre( request, PARAM_APPELATION_TEMP );
                String cruTemp = getValeurParametre( request, PARAM_CRU_TEMP );
                String couleurTemp = getValeurParametre( request, PARAM_COLEUR_TEMP );
                String tailleTemp = getValeurParametre( request, PARAM_TAILLE_TEMP );
                Double taille = null;
                if ( tailleTemp != null ) {
                    taille = Double.parseDouble( tailleTemp );
                }

                String quantiteAcheterTemp = getValeurParametre( request, PARAM_QUANTITE_ACHETER_TEMP );
                Integer quantiteAcheter = null;
                if ( quantiteAcheterTemp != null ) {
                    quantiteAcheter = Integer.parseInt( quantiteAcheterTemp );
                }
                String prixAchatTemp = getValeurParametre( request, PARAM_PRIX_ACHAT_TEMP );
                Double prixAchat = null;
                if ( prixAchatTemp != null ) {
                    prixAchat = Double.parseDouble( prixAchatTemp );
                }
                String prixActuelleTemp = getValeurParametre( request, PARAM_PRIX_ACTUELLE_TEMP );
                Double prixActuelle = null;
                if ( prixActuelleTemp != null ) {
                    prixActuelle = Double.parseDouble( prixActuelleTemp );
                }
                String dateDeProductionTemp = getValeurParametre( request, PARAM_DATE_DE_PRODUCTION_TEMP );
                Integer dateDeProduction = null;
                if ( dateDeProductionTemp != null ) {
                    dateDeProduction = Integer.parseInt( dateDeProductionTemp );
                }
                String dateGarderTemp = getValeurParametre( request, PARAM_DATE_GARDER_TEMP );
                Integer dateGarder = null;
                if ( dateGarderTemp != null ) {
                    dateGarder = Integer.parseInt( dateGarderTemp );
                }
                String evaluationTemp = getValeurParametre( request, PARAM_EVALUATION_TEMP );
                Integer evaluation = null;
                if ( evaluationTemp != null ) {
                    evaluation = Integer.parseInt( evaluationTemp );
                }

                String commentaireTemp = getValeurParametre( request, PARAM_COMMENTAIRE_TEMP );

                Bouteille bouteilleTemp = new Bouteille( null, nomTemp, couleurTemp, regionTemp, paysTemp, cruTemp,
                        appelationTemp,
                        taille, null, prixAchat, prixActuelle, dateDeProduction, dateGarder, null, quantiteAcheter,
                        null, null,
                        commentaireTemp, null, null, null, null, null, null, evaluation );

                request.setAttribute( ATT_BOUTEILLE, bouteilleTemp );
            }

            String chemin = this.getServletConfig().getInitParameter( CHEMIN );

            try {
                String imagePrechargee = validationImage( request, chemin );
                if ( imagePrechargee != null && !imagePrechargee.isEmpty() ) {
                    request.setAttribute( ATT_IMAGE_PRECHARGEE, imagePrechargee );
                } else {
                    request.setAttribute( ATT_IMAGE_PRECHARGEE, null );
                }
            } catch ( FormValidationException e1 ) {
                // TODO Auto-generated catch block
                erreurImage = "Erreur chargement d'image " + e1.getMessage();
                e1.printStackTrace();
                request.setAttribute( CHAMP_ERREUR_IMAGE, erreurImage );
            }

            this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );

        } else {

            this.getServletContext().getRequestDispatcher( ACCES_CONNEXION ).forward( request, response );
        }
    }

    private String validationImage( HttpServletRequest request, String chemin ) throws FormValidationException {
        /*
         * Récupération du contenu du champ image du formulaire. Il faut ici
         * utiliser la méthode getPart().
         */
        String nomFichier = null;
        InputStream contenuFichier = null;
        try {
            Part part = request.getPart( CHAMP_IMAGE );
            nomFichier = getNomFichier( part );

            /*
             * Si la méthode getNomFichier() a renvoyé quelque chose, il s'agit
             * donc d'un champ de type fichier (input type="file").
             */
            if ( nomFichier != null && !nomFichier.isEmpty() ) {
                /*
                 * Antibug pour Internet Explorer, qui transmet pour une raison
                 * mystique le chemin du fichier local à la machine du client...
                 * 
                 * Ex : C:/dossier/sous-dossier/fichier.ext
                 * 
                 * On doit donc faire en sorte de ne sélectionner que le nom et
                 * l'extension du fichier, et de se débarrasser du superflu.
                 */
                nomFichier = nomFichier.substring( nomFichier.lastIndexOf( '/' ) + 1 )
                        .substring( nomFichier.lastIndexOf( '\\' ) + 1 );
                String strAdd = ( beginningimg++ ).toString();
                nomFichier = strAdd.concat( nomFichier );

                /* Récupération du contenu du fichier */
                contenuFichier = part.getInputStream();

                /* Extraction du type MIME du fichier depuis l'InputStream */
                MimeUtil.registerMimeDetector( "eu.medsea.mimeutil.detector.MagicMimeMimeDetector" );
                Collection<?> mimeTypes = MimeUtil.getMimeTypes( contenuFichier );

                /*
                 * Si le fichier est bien une image, alors son en-tête MIME
                 * commence par la chaîne "image"
                 */
                if ( mimeTypes.toString().startsWith( "image" ) ) {
                    /* Ecriture du fichier sur le disque */
                    ecrireFichier( contenuFichier, nomFichier, chemin );
                } else {
                    throw new FormValidationException( "Le fichier envoyé doit être une image." );
                }
            }
        } catch ( IllegalStateException e ) {
            /*
             * Exception retournée si la taille des données dépasse les limites
             * définies dans la section <multipart-config> de la déclaration de
             * notre servlet d'upload dans le fichier web.xml
             */
            e.printStackTrace();
            throw new FormValidationException( "Le fichier envoyé ne doit pas dépasser 2Mo." );
        } catch ( IOException e ) {
            /*
             * Exception retournée si une erreur au niveau des répertoires de
             * stockage survient (répertoire inexistant, droits d'accès
             * insuffisants, etc.)
             */
            e.printStackTrace();
            throw new FormValidationException( "Erreur de configuration du serveur." );
        } catch ( ServletException e ) {
            /*
             * Exception retournée si la requête n'est pas de type
             * multipart/form-data.
             */
            e.printStackTrace();
            throw new FormValidationException(
                    "Ce type de requête n'est pas supporté, merci d'utiliser le formulaire prévu pour envoyer votre fichier." );
        }

        return nomFichier;
    }

    /*
     * Méthode utilitaire qui a pour but d'écrire le fichier passé en paramètre
     * sur le disque, dans le répertoire donné et avec le nom donné.
     */
    private void ecrireFichier( InputStream contenuFichier, String nomFichier, String chemin )
            throws FormValidationException {
        /* Prépare les flux. */
        BufferedInputStream entree = null;
        BufferedOutputStream sortie = null;
        try {
            /* Ouvre les flux. */
            entree = new BufferedInputStream( contenuFichier, TAILLE_TAMPON );
            sortie = new BufferedOutputStream( new FileOutputStream( new File( chemin + nomFichier ) ),
                    TAILLE_TAMPON );

            /*
             * Lit le fichier reçu et écrit son contenu dans un fichier sur le
             * disque.
             */
            byte[] tampon = new byte[TAILLE_TAMPON];
            int longueur = 0;
            while ( ( longueur = entree.read( tampon ) ) > 0 ) {
                sortie.write( tampon, 0, longueur );
            }
        } catch ( Exception e ) {
            throw new FormValidationException( "Erreur lors de l'écriture du fichier sur le disque." );
        } finally {
            try {
                sortie.close();
            } catch ( IOException ignore ) {
            }
            try {
                entree.close();
            } catch ( IOException ignore ) {
            }
        }
    }

    private static String getNomFichier( Part part ) {
        /*
         * Boucle sur chacun des paramètres de l'en-tête "content-disposition".
         */
        for ( String contentDisposition : part.getHeader( "content-disposition" ).split( ";" ) ) {
            /* Recherche de l'éventuelle présence du paramètre "filename". */
            if ( contentDisposition.trim().startsWith( "filename" ) ) {
                /*
                 * Si "filename" est présent, alors renvoi de sa valeur,
                 * c'est-à-dire du nom de fichier sans guillemets.
                 */
                return contentDisposition.substring( contentDisposition.indexOf( '=' ) + 1 ).trim().replace( "\"", "" );
            }
        }
        /* Et pour terminer, si rien n'a été trouvé... */
        return null;
    }

    private static String getValeurParametre( HttpServletRequest request,
            String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur;
        }
    }

}