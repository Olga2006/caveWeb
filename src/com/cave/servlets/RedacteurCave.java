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

@WebServlet( "/redigerCave" )
public class RedacteurCave extends HttpServlet {

    public static final String VUE                   = "/WEB-INF/jsp/restreint/afficherRedacteurCave.jsp";

    public static final String ACCES_CONNEXION       = "/connection";

    public static final String PARAM_SESSION_USER    = "sessionUtilisateur";
    public static final String PARAM_ID_CAVE_R       = "idCaveR";
    public static final String PARAM_ID_POSITION     = "idPositionAficher";
    public static final String PARAM_ID_RANGEE       = "idRangeeAficher";
    public static final String PARAM_ID_COMPARTIMENT = "idCompartimentAficher";
    public static final String PARAM_REF_COMP        = "referenceC";

    /*
     * public static final String ATT_INTERVALLE_CONNEXIONS =
     * "intervalleConnexions"; public static final String ATT_DERNIERE_CONNEXION
     * = "derniereConnexion";
     */
    public static final String ATT_CAVE_R            = "caveR";
    public static final String ATT_ID_CAVE_R         = "idCaveR";
    public static final String ATT_ID_POSITION       = "idPositionAficher";
    public static final String ATT_ID_RANGEE         = "idRangeeAficher";
    public static final String ATT_ID_COMPARTIMENT   = "idCompartimentAficher";
    public static final String ATT_TAB               = "tab";

    public static final String CONF_DAO_FACTORY      = "daofactory";

    private CaveDao            caveDao;

    public void init() throws ServletException {

        this.caveDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getCaveDao();
    }

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utilisateur sessionUtilisateur = (Utilisateur) session.getValue( PARAM_SESSION_USER );
        String tabAficher = null;
        if ( sessionUtilisateur != null ) {
            Long idCave = null;
            String id_cave = request.getParameter( PARAM_ID_CAVE_R );

            String idPositionAficher = request.getParameter( PARAM_ID_POSITION );
            String idRangeeAficher = request.getParameter( PARAM_ID_RANGEE );
            String idCompartimentAficher = request.getParameter( PARAM_ID_COMPARTIMENT );

            if ( idPositionAficher != null ) {
                Long id_Position_Aficher = Long.parseLong( idPositionAficher );
                request.setAttribute( ATT_ID_POSITION, id_Position_Aficher );
            } else {
                Long id_Position_Aficher = (Long) session.getValue( PARAM_ID_POSITION );
                request.setAttribute( ATT_ID_POSITION, id_Position_Aficher );
            }

            if ( idRangeeAficher != null ) {
                Long id_Rangee_Aficher = Long.parseLong( idRangeeAficher );
                request.setAttribute( ATT_ID_RANGEE, id_Rangee_Aficher );
            } else {
                Long id_Rangee_Aficher = (Long) session.getValue( PARAM_ID_RANGEE );
                request.setAttribute( ATT_ID_RANGEE, id_Rangee_Aficher );
            }

            if ( idCompartimentAficher != null ) {
                Long id_Compartiment_Aficher = Long.parseLong( idCompartimentAficher );
                request.setAttribute( ATT_ID_COMPARTIMENT, id_Compartiment_Aficher );
            } else {
                Long id_Compartiment_Aficher = (Long) session.getValue( PARAM_ID_COMPARTIMENT );
                request.setAttribute( ATT_ID_COMPARTIMENT, id_Compartiment_Aficher );
            }

            String referenceC = request.getParameter( PARAM_REF_COMP );
            if ( referenceC != null && referenceC.startsWith( "B" ) ) {
                tabAficher = "tabB";
            } else if ( referenceC != null && referenceC.startsWith( "A" ) ) {
                tabAficher = "tabA";
            }
            if ( tabAficher != null ) {
                session.setAttribute( ATT_TAB, tabAficher );
            }

            if ( id_cave != null ) {
                idCave = Long.parseLong( id_cave );
                session.setAttribute( ATT_ID_CAVE_R, idCave );
            } else {
                idCave = (Long) session.getValue( PARAM_ID_CAVE_R );
            }

            Cave caveR = caveDao.trouver( idCave );
            session.setAttribute( ATT_CAVE_R, caveR );

            this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );

        } else

            this.getServletContext().getRequestDispatcher( ACCES_CONNEXION ).forward( request, response );
    }

}