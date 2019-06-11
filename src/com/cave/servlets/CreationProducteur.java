package com.cave.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cave.beans.Producteur;
import com.cave.beans.Utilisateur;
import com.cave.dao.DAOFactory;
import com.cave.dao.ProducteurDao;
import com.cave.dao.UtilisateurDao;
import com.cave.forms.CreationProducteurForm;

@WebServlet( "/creationProducteur" )
public class CreationProducteur extends HttpServlet {

    public static final String VUE_SUCCES          = "/listeProducteurs";
    public static final String VUE_FORM            = "/WEB-INF/jsp/restreint/afficherProducteurs.jsp";
    public static final String ACCES_CONNEXION     = "/connection";

    // public static final String CHEMIN = "chemin";
    public static final String PARAM_SESSION_USER  = "sessionUtilisateur";
    public static final String PARAM_ID_PRODUCTEUR = "idProducteur";

    public static final String ATT_PRODUCTER       = "producteur";
    public static final String ATT_FORM            = "form";
    public static final String ATT_SUCCES          = "succes";
    public static final String ATT_SESSION_USER    = "sessionUtilisateur";

    public static final String CONF_DAO_FACTORY    = "daofactory";

    private Producteur         producteur;

    private ProducteurDao      producteurDao;
    private UtilisateurDao     utilisateurDao;

    public void init() throws ServletException {
        /* Récupération d'une instance de notre DAO Producteur */
        this.producteurDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getProducteurDao();
        this.utilisateurDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getUtilisateurDao();
    }

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utilisateur sessionUtilisateur = (Utilisateur) session.getValue( PARAM_SESSION_USER );
        if ( sessionUtilisateur != null ) {
            String id_Producteur = getValeurParametre( request, PARAM_ID_PRODUCTEUR );

            if ( id_Producteur != null ) {
                Long idProducteur = Long.parseLong( id_Producteur );
                Producteur producteur = producteurDao.trouver( idProducteur );
                request.setAttribute( ATT_PRODUCTER, producteur );
            }
            this.getServletContext().getRequestDispatcher( VUE_FORM ).forward(
                    request, response );

        } else

            this.getServletContext().getRequestDispatcher( ACCES_CONNEXION ).forward(
                    request, response );

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
            CreationProducteurForm form = new CreationProducteurForm( producteurDao );
            if ( request.getParameter( PARAM_ID_PRODUCTEUR ) != null
                    && !request.getParameter( PARAM_ID_PRODUCTEUR ).isEmpty() ) {
                producteur = form.updateProducteur( request, sessionUtilisateur );
            } else {
                producteur = form.creerProducteurPourUtilisateur( request, sessionUtilisateur );
            }

            if ( form.getErreurs().isEmpty() ) {
                request.setAttribute( ATT_FORM, form );
                Long id_sessionUtilisateur = sessionUtilisateur.getId();
                Utilisateur sessionUtilisateurMAJ = utilisateurDao.trouver( id_sessionUtilisateur );
                session.setAttribute( ATT_SESSION_USER, sessionUtilisateurMAJ );
                this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );

            } else {
                request.setAttribute( ATT_PRODUCTER, producteur );
                request.setAttribute( ATT_FORM, form );
                this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
            }

        } else

            this.getServletContext().getRequestDispatcher( ACCES_CONNEXION ).forward( request, response );

    }
}