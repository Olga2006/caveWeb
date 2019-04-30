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

import com.cave.beans.Bouteille;
import com.cave.beans.Utilisateur;

@WebServlet( "/listeCourses" )
public class ListeCourses extends HttpServlet {

    public static final String VUE                = "/WEB-INF/jsp/restreint/afficherLC.jsp";
    public static final String ACCES_CONNEXION    = "/connection";
    public static final String PARAM_SESSION_USER = "sessionUtilisateur";
    public static final String ATT_BOUTEILLES_LC  = "bouteillesLC";

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utilisateur sessionUtilisateur = (Utilisateur) session.getValue( PARAM_SESSION_USER );
        if ( sessionUtilisateur != null ) {
            List<Bouteille> bouteilles = sessionUtilisateur.getBouteilles();
            List<Bouteille> bouteillesLC = new ArrayList<>();
            for ( Bouteille bouteilleCurr : bouteilles ) {
                if ( bouteilleCurr.getNbrListCourses() > 0 ) {
                    bouteillesLC.add( bouteilleCurr );
                }
            }
            request.setAttribute( ATT_BOUTEILLES_LC, bouteillesLC );

            this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
        } else

            this.getServletContext().getRequestDispatcher( ACCES_CONNEXION ).forward( request, response );
    }

}