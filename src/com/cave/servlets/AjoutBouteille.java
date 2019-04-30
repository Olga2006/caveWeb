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
import com.cave.dao.PositionDao;
import com.cave.dao.UtilisateurDao;

@WebServlet( "/ajouterBouteille" )
public class AjoutBouteille extends HttpServlet {
    public static final String VUE_SUCCES             = "/redigerCave";
    public static final String VUE_FORM               = "/WEB-INF/jsp/restreint/afficherRedacteurCave.jsp";
    public static final String ACCES_CONNEXION        = "/connection";

    public static final String PARAM_SESSION_USER     = "sessionUtilisateur";
    public static final String PARAM_ID_LAST_POSITION = "idLastPosition";
    public static final String PARAM_ID_POSITION      = "idPosition";
    public static final String PARAM_ID_BOUTEILLE     = "idBouteille";
    public static final String PARAM_TAB              = "tab";

    public static final String ATT_FORM               = "form";
    public static final String ATT_TAB                = "tab";
    public static final String ATT_SESSION_USER       = "sessionUtilisateur";
    public static final String ATT_ID_POSITION        = "idPositionAficher";

    public static final String CONF_DAO_FACTORY       = "daofactory";

    private PositionDao        positionDao;
    private UtilisateurDao     utilisateurDao;

    public void init() throws ServletException {
        /* Récupération d'une instance de nos DAO */

        this.positionDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getPositionDao();
        this.utilisateurDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getUtilisateurDao();
    }

    public void doGet( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Utilisateur sessionUtilisateur = (Utilisateur) session.getValue( PARAM_SESSION_USER );
        if ( sessionUtilisateur != null ) {
            String tab = getValeurChamp( request, PARAM_TAB );
            String idLastPosition = getValeurChamp( request, PARAM_ID_LAST_POSITION );

            String idPosition = getValeurChamp( request, PARAM_ID_POSITION );
            Long id_position = Long.parseLong( idPosition );
            String idBouteille = getValeurChamp( request, PARAM_ID_BOUTEILLE );

            if ( idLastPosition != null && idBouteille != null ) {
                Long id_bouteille = Long.parseLong( idBouteille );
                Long id_last_position = Long.parseLong( idLastPosition );
                positionDao.changer_la_position_bouteille( id_bouteille, id_position, id_last_position );
            } else

            if ( idBouteille != null ) {
                Long id_bouteille = Long.parseLong( idBouteille );
                positionDao.ajouter_la_bouteille( id_bouteille, id_position );
            } else {
                positionDao.ajouter_la_bouteille( null, id_position );
            }

            if ( tab != null ) {
                session.setAttribute( ATT_TAB, tab );
            }
            Long id_sessionUtilisateur = sessionUtilisateur.getId();
            Utilisateur sessionUtilisateurMAJ = utilisateurDao.trouver( id_sessionUtilisateur );
            session.setAttribute( ATT_SESSION_USER, sessionUtilisateurMAJ );
            session.setAttribute( ATT_ID_POSITION, id_position );
            response.sendRedirect( request.getContextPath() + VUE_SUCCES + "#aficher" );

        } else

            this.getServletContext().getRequestDispatcher( ACCES_CONNEXION ).forward( request, response );

    }

    private static String getValeurChamp( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur;
        }
    }

}