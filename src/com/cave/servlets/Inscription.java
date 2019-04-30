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
import com.cave.forms.InscriptionForm;

@WebServlet( "/inscription" )
public class Inscription extends HttpServlet {
    public static final String VUE              = "/WEB-INF/jsp/public/inscription.jsp";
    public static final String VUE_SUCCES       = "/listeCaves";

    public static final String ATT_SESSION_USER = "sessionUtilisateur";
    public static final String ATT_USER         = "utilisateur";
    public static final String ATT_FORM         = "form";

    public static final String CONF_DAO_FACTORY = "daofactory";
    private UtilisateurDao     utilisateurDao;

    public void init() throws ServletException {
        /* Récupération d'une instance de notre DAO Utilisateur */
        this.utilisateurDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getUtilisateurDao();
    }

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {

        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
    }

    public void doPost( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {

        InscriptionForm form = new InscriptionForm( utilisateurDao );
        Utilisateur utilisateur = form.inscrireUtilisateur( request );
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
}