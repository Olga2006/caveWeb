package com.cave.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cave.beans.Cave;
import com.cave.beans.Utilisateur;
import com.cave.dao.CaveDao;
import com.cave.dao.DAOFactory;
import com.cave.dao.UtilisateurDao;
import com.cave.forms.CreationCaveForm;

@WebServlet( "/creationCave" )
public class CreationCave extends HttpServlet {
    public static final String VUE_SUCCES         = "/listeCaves";
    public static final String VUE_FORM           = "/WEB-INF/jsp/restreint/afficherCaves.jsp";

    public static final String ACCES_CONNEXION    = "/connection";

    public static final String PARAM_SESSION_USER = "sessionUtilisateur";
    public static final String PARAM_ID_CAVE      = "idCave";
    public static final String PARAM_IS_CREATION  = "isCreation";

    public static final String ATT_CAVE           = "cave";
    public static final String ATT_IS_CREATION    = "isCreation";
    public static final String ATT_FORM           = "form";

    public static final String ATT_SESSION_USER   = "sessionUtilisateur";

    public static final String CONF_DAO_FACTORY   = "daofactory";

    private Cave               cave;

    private CaveDao            caveDao;
    private UtilisateurDao     utilisateurDao;
    /* String controlCorrection; */

    public void init() throws ServletException {
        this.caveDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getCaveDao();
        this.utilisateurDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getUtilisateurDao();
    }

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utilisateur sessionUtilisateur = (Utilisateur) session.getValue( PARAM_SESSION_USER );
        if ( sessionUtilisateur != null ) {
            String id_Cave = getValeurParametre( request, PARAM_ID_CAVE );
            String isCreation = getValeurParametre( request, PARAM_IS_CREATION );
            if ( id_Cave != null ) {
                Long idCave = Long.parseLong( id_Cave );
                Cave cave = caveDao.trouver( idCave );
                request.setAttribute( ATT_CAVE, cave );
            }

            if ( isCreation != null ) {
                request.setAttribute( ATT_IS_CREATION, isCreation );
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
            CreationCaveForm form = new CreationCaveForm( caveDao );
            if ( request.getParameter( PARAM_ID_CAVE ) != null
                    && !request.getParameter( PARAM_ID_CAVE ).isEmpty() ) {
                cave = form.updateCave( request, sessionUtilisateur );
            } else {
                cave = form.creerCave( request, sessionUtilisateur );
            }

            if ( form.getErreurs().isEmpty() ) {
                request.setAttribute( ATT_FORM, form );
                Long id_sessionUtilisateur = sessionUtilisateur.getId();
                Utilisateur sessionUtilisateurMAJ = utilisateurDao.trouver( id_sessionUtilisateur );
                session.setAttribute( ATT_SESSION_USER, sessionUtilisateurMAJ );
                this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );

            } else {
                request.setAttribute( ATT_CAVE, cave );
                request.setAttribute( ATT_FORM, form );
                this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
            }

        }

        else
            this.getServletContext().getRequestDispatcher( ACCES_CONNEXION ).forward( request, response );
    }
}