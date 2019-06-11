package com.cave.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cave.beans.Cave;
import com.cave.beans.Utilisateur;

@WebServlet( "/listeCaves" )
public class ListeCaves extends HttpServlet {

    public static final String VUE                = "/WEB-INF/jsp/restreint/afficherCaves.jsp";
    public static final String VUE_REDACTEUR      = "/WEB-INF/jsp/restreint/afficherRedacteurCave.jsp";

    public static final String ACCES_CONNEXION    = "/connection";

    public static final String PARAM_SESSION_USER = "sessionUtilisateur";
    public static final String ATT_ID_CAVE_R      = "idCaveR";
    public static final String ATT_CAVE_R         = "caveR";
    public static final String ATT_TAB            = "tab";
    /*
     * public static final String COOKIE_DERNIERE_CONNEXION =
     * "derniereConnexion";
     */

    /* public static final String FORMAT_DATE = "dd/MM/yyyy"; */

    public static final String CONF_DAO_FACTORY   = "daofactory";

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utilisateur sessionUtilisateur = (Utilisateur) session.getValue( PARAM_SESSION_USER );
        if ( sessionUtilisateur != null ) {
            session.setAttribute( ATT_TAB, null );
            List<Cave> caves = new ArrayList<Cave>();
            caves = sessionUtilisateur.getCaves();
            if ( caves != null ) {
                int nbrCaves = caves.size();
                if ( nbrCaves == 1 ) {
                    Cave caveR = caves.stream().findFirst().get();
                    session.setAttribute( ATT_CAVE_R, caveR );
                    session.setAttribute( ATT_ID_CAVE_R, caveR.getId() );
                    this.getServletContext().getRequestDispatcher( VUE_REDACTEUR ).forward( request, response );
                } else {
                    this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
                }
            } else {
                this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
            }

        } else

            this.getServletContext().getRequestDispatcher( ACCES_CONNEXION ).forward( request, response );
    }

}