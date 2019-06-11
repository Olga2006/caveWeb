package com.cave.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cave.beans.Bouteille;
import com.cave.beans.Producteur;
import com.cave.beans.Utilisateur;
import com.cave.dao.BouteilleDao;
import com.cave.dao.DAOException;
import com.cave.dao.DAOFactory;
import com.cave.dao.PositionDao;
import com.cave.dao.ProducteurDao;
import com.cave.dao.UtilisateurDao;
import com.cave.forms.CreationBouteilleForm;

@WebServlet( urlPatterns = {
        "/creationBouteille" }, initParams = @WebInitParam( name = "chemin", value = "D:\\FormationJEE\\eclipse-workspace\\caveWeb\\WebContent\\fichiers\\" ) )
@MultipartConfig( location = "D:\\FormationJEE\\eclipse-workspace\\caveWeb\\WebContent\\tmp\\", maxFileSize = 2 * 1024
        * 1024, maxRequestSize = 2 * 1024
                * 1024, fileSizeThreshold = 2 * 1024 * 1024 )
public class CreationBouteille extends HttpServlet {

    public static final String  VUE_SUCCES           = "/listeBouteilles";
    public static final String  VUE_FORM             = "/WEB-INF/jsp/restreint/afficherBouteilles.jsp";
    public static final String  ACCES_CONNEXION      = "/connection";
    private static final String CHAMP_ERREUR_AJOT    = "erreurAjout";

    public static final String  VUE_SUCCES_REDACTEUR = "/redigerCave";
    public static final String  VUE_FORM_REDACTEUR   = "/WEB-INF/jsp/restreint/afficherRedacteurCave.jsp";

    public static final String  PARAM_SESSION_USER   = "sessionUtilisateur";
    public static final String  PARAM_ID_BOUTEILLE   = "idBouteille";
    public static final String  PARAM_ID_POSITION    = "idPosition";
    public static final String  PARAM_TAB            = "tab";

    public static final String  ATT_TAB              = "tab";
    private static final String ATT_BOUTEILLES       = "bouteilles";
    public static final String  ATT_BOUTEILLE        = "bouteille";
    public static final String  ATT_PRODUCTER        = "producteur";
    public static final String  ATT_FORM             = "form";
    public static final String  ATT_SUCCES           = "succes";
    public static final String  ATT_SESSION_USER     = "sessionUtilisateur";
    public static final String  ATT_ID_POSITION      = "idPositionAficher";

    public static final String  CHEMIN               = "chemin";

    /*
     * public static final String ATT_PRODUCTERS = "producteurs"; public static
     * final String ATT_IS_CREATION = "isCreationBouteille";
     */

    public static final String  CONF_DAO_FACTORY     = "daofactory";

    private String              erreurAjout;

    private Bouteille           bouteille;
    private Producteur          producteur;

    private ProducteurDao       producteurDao;
    private BouteilleDao        bouteilleDao;
    private UtilisateurDao      utilisateurDao;
    private PositionDao         positionDao;

    public void init() throws ServletException {
        /* Récupération d'une instance de nos DAO Client et Commande */
        this.producteurDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getProducteurDao();
        this.bouteilleDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getBouteilleDao();
        this.utilisateurDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getUtilisateurDao();
        this.positionDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getPositionDao();

    }

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
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
                List<Bouteille> bouteilles = sessionUtilisateur.getBouteilles();
                request.setAttribute( ATT_BOUTEILLES, bouteilles );
                this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );

            }

        } else {

            this.getServletContext().getRequestDispatcher( ACCES_CONNEXION ).forward( request, response );
        }
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

    public void doPost( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Utilisateur sessionUtilisateur = (Utilisateur) session.getValue( PARAM_SESSION_USER );
        if ( sessionUtilisateur != null ) {
            String chemin = this.getServletConfig().getInitParameter( CHEMIN );
            String idPosition = getValeurParametre( request, PARAM_ID_POSITION );
            CreationBouteilleForm form = new CreationBouteilleForm( producteurDao, bouteilleDao );
            if ( getValeurParametre( request, PARAM_ID_BOUTEILLE ) != null
                    && !getValeurParametre( request, PARAM_ID_BOUTEILLE ).isEmpty() ) {
                bouteille = form.updateBouteille( request, sessionUtilisateur, chemin );
            } else {
                bouteille = form.creerBouteillePourUtilisateur( request, sessionUtilisateur, chemin );
            }
            if ( form.getErreurs().isEmpty() ) {

                if ( idPosition != null ) {
                    Long id_position = Long.parseLong( idPosition );
                    try {
                        positionDao.ajouter_la_bouteille( bouteille.getId(), id_position );
                        session.setAttribute( ATT_ID_POSITION, id_position );
                    } catch ( DAOException e ) {
                        e.printStackTrace();
                        erreurAjout = "La bouteille " + bouteille.getNom() + " n’a pas été mise dans la cave."
                                + e.getMessage();
                        request.setAttribute( CHAMP_ERREUR_AJOT, erreurAjout );
                    }
                    Long id_sessionUtilisateur = sessionUtilisateur.getId();
                    Utilisateur sessionUtilisateurMAJ = utilisateurDao.trouver( id_sessionUtilisateur );
                    session.setAttribute( ATT_SESSION_USER, sessionUtilisateurMAJ );
                    response.sendRedirect( request.getContextPath() + VUE_SUCCES_REDACTEUR + "#aficher" );
                } else {
                    Long id_sessionUtilisateur = sessionUtilisateur.getId();
                    Utilisateur sessionUtilisateurMAJ = utilisateurDao.trouver( id_sessionUtilisateur );
                    session.setAttribute( ATT_SESSION_USER, sessionUtilisateurMAJ );
                    List<Bouteille> bouteilles = sessionUtilisateurMAJ.getBouteilles();
                    request.setAttribute( ATT_BOUTEILLES, bouteilles );
                    request.setAttribute( ATT_FORM, form );
                    this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
                }

            } else {
                request.setAttribute( ATT_PRODUCTER, bouteille.getProducteur() );
                request.setAttribute( ATT_BOUTEILLE, bouteille );
                List<Bouteille> bouteilles = sessionUtilisateur.getBouteilles();
                request.setAttribute( ATT_BOUTEILLES, bouteilles );
                request.setAttribute( ATT_FORM, form );
                if ( idPosition != null ) {
                    this.getServletContext().getRequestDispatcher( VUE_FORM_REDACTEUR ).forward( request,
                            response );
                } else
                    this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
            }
        }

        else

            this.getServletContext().getRequestDispatcher( ACCES_CONNEXION ).forward( request, response );
    }
}