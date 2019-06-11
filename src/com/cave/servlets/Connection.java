package com.cave.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cave.beans.Utilisateur;
import com.cave.dao.DAOFactory;
import com.cave.dao.UtilisateurDao;
import com.cave.forms.ConnectionForm;

@WebServlet( "/connection" )
public class Connection extends HttpServlet {
    public static final String VUE              = "/WEB-INF/jsp/public/connection.jsp";
    public static final String VUE_SUCCES       = "/listeCaves";

    public static final String ATT_SESSION_USER = "sessionUtilisateur";
    public static final String ATT_USER         = "utilisateur";
    public static final String ATT_FORM         = "form";
    public static final String PARAM_USER       = "utilisateur";
    public static final String PARAM_FORM       = "form";

    public static final String CONF_DAO_FACTORY = "daofactory";
    /*
     * public static final String COOKIE_DERNIERE_CONNEXION =
     * "derniereConnexion"; public static final String FORMAT_DATE =
     * "dd/MM/yyyy"; public static final String CHAMP_MEMOIRE = "memoire";
     * public static final int COOKIE_MAX_AGE = 60 * 60 * 24 * 365;
     */

    private UtilisateurDao     utilisateurDao;

    public void init() throws ServletException {

        this.utilisateurDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getUtilisateurDao();
    }

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {

        /*
         * ConnectionForm form = (ConnectionForm) request.getAttribute(
         * PARAM_FORM ); Utilisateur utilisateur = (Utilisateur)
         * request.getAttribute( PARAM_USER ); request.setAttribute( ATT_FORM,
         * form ); request.setAttribute( ATT_USER, utilisateur );
         */
        /* Affichage de la page de connexion */
        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );

    }

    public void doPost( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {

        ConnectionForm form = new ConnectionForm( utilisateurDao );
        Utilisateur utilisateur = form.connecterUtilisateur( request );
        HttpSession session = request.getSession();
        if ( form.getErreurs().isEmpty() ) {

            session.setAttribute( ATT_SESSION_USER, utilisateur );
            response.sendRedirect( request.getContextPath() + VUE_SUCCES );

        } else {
            session.setAttribute( ATT_SESSION_USER, null );
            request.setAttribute( ATT_FORM, form );
            request.setAttribute( ATT_USER, utilisateur );

            this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
        }
    }

    /*
     * private static void setCookie( HttpServletResponse response, String nom,
     * String valeur, int maxAge ) { Cookie cookie = new Cookie( nom, valeur );
     * cookie.setMaxAge( maxAge ); response.addCookie( cookie ); }
     */

}