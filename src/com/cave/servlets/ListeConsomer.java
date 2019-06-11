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

@WebServlet( "/listeBouteillesAConsomer" )
public class ListeConsomer extends HttpServlet {

    public static final String VUE                     = "/WEB-INF/jsp/restreint/afficherListConsomer.jsp";
    public static final String ACCES_CONNEXION         = "/connection";
    public static final String PARAM_SESSION_USER      = "sessionUtilisateur";
    public static final String ATT_BOUTEILLES_CONSOMER = "bouteillesConsomer";
    public static final String PARAM_MAX_ANEE          = "maxAnee";
    public static final String ATT_MAX_ANEE            = "maxAnee";

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utilisateur sessionUtilisateur = (Utilisateur) session.getValue( PARAM_SESSION_USER );
        if ( sessionUtilisateur != null ) {
            List<Bouteille> bouteilles = sessionUtilisateur.getBouteilles();
            List<Bouteille> bouteillesConsomer = new ArrayList<>();
            String max_anee;
            Integer maxAnee = 3;
            max_anee = request.getParameter( PARAM_MAX_ANEE );
            if ( max_anee != null ) {
                try {
                    maxAnee = Integer.parseInt( max_anee );
                    if ( maxAnee < 0 ) {
                        maxAnee = 0;
                    }
                } catch ( NumberFormatException e ) {
                    maxAnee = 3;
                }
            } else {
                maxAnee = 3;
            }

            for ( Integer i = 0; i <= maxAnee; i++ ) {
                for ( Bouteille bouteilleCurr : bouteilles ) {
                    if ( (Integer) bouteilleCurr.getNbrAneeABoir().compareTo( i ) == 0 && bouteilleCurr.getPositions() != null ) {
                        bouteillesConsomer.add( bouteilleCurr );
                    }
                }

            }
            /*
             * Collections.sort( bouteillesConsomer,
             * Bouteille.ComparNbrAneeABoir );
             */

            request.setAttribute( ATT_BOUTEILLES_CONSOMER, bouteillesConsomer );
            request.setAttribute( ATT_MAX_ANEE, maxAnee );
            this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
        } else

            this.getServletContext().getRequestDispatcher( ACCES_CONNEXION ).forward( request, response );
    }

}