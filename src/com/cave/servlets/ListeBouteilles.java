package com.cave.servlets;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cave.beans.Bouteille;
import com.cave.beans.Utilisateur;
import com.cave.dao.BouteilleDao;
import com.cave.dao.DAOException;
import com.cave.dao.DAOFactory;

@WebServlet( "/listeBouteilles" )
public class ListeBouteilles extends HttpServlet {

    public static final String VUE                = "/WEB-INF/jsp/restreint/afficherBouteilles.jsp";
    public static final String ACCES_CONNEXION    = "/connection";
    public static final String ATT_BOUTEILLES     = "bouteilles";
    public static final String ATT_ERR_DAO_TRI    = "erreurDaoTri";
    public static final String ATT_TRI            = "tri";

    public static final String PARAM_SESSION_USER = "sessionUtilisateur";
    public static final String PARAM_TRI          = "tri";

    public static final String CONF_DAO_FACTORY   = "daofactory";

    private BouteilleDao       bouteilleDao;

    private String             erreurDao;

    public void init() throws ServletException {
        /* Récupération d'une instance de nos DAO Client et Commande */
        this.bouteilleDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getBouteilleDao();

    }

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utilisateur sessionUtilisateur = (Utilisateur) session.getValue( PARAM_SESSION_USER );
        if ( sessionUtilisateur != null ) {
            Long id_utilisateur = sessionUtilisateur.getId();
            List<Bouteille> bouteilles = sessionUtilisateur.getBouteilles();

            String tri;
            tri = request.getParameter( PARAM_TRI );
            if ( tri != null ) {
                switch ( tri ) {
                case "parNom":

                    break;
                case "parPays":
                    try {
                        bouteilles = bouteilleDao.listerPourUtilisateurPaysDesc( id_utilisateur );
                    } catch ( DAOException e ) {
                        e.printStackTrace();
                        erreurDao = e.getMessage();
                    }
                    break;
                case "parRegion":
                    try {
                        bouteilles = bouteilleDao.listerPourUtilisateurRegionDesc( id_utilisateur );
                    } catch ( DAOException e ) {
                        e.printStackTrace();
                        erreurDao = e.getMessage();
                    }
                    break;

                case "parAppelation":
                    try {
                        bouteilles = bouteilleDao.listerPourUtilisateurAppelationDesc( id_utilisateur );
                    } catch ( DAOException e ) {
                        e.printStackTrace();
                        erreurDao = e.getMessage();
                    }
                    break;
                case "parCru":
                    try {
                        bouteilles = bouteilleDao.listerPourUtilisateurCruDesc( id_utilisateur );
                    } catch ( DAOException e ) {
                        e.printStackTrace();
                        erreurDao = e.getMessage();
                    }
                    break;
                case "parCouleur":
                    try {
                        bouteilles = bouteilleDao.listerPourUtilisateurCouleurDesc( id_utilisateur );
                    } catch ( DAOException e ) {
                        e.printStackTrace();
                        erreurDao = e.getMessage();
                    }
                    break;
                case "parTaille":
                    try {
                        bouteilles = bouteilleDao.listerPourUtilisateurTailleDesc( id_utilisateur );
                    } catch ( DAOException e ) {
                        e.printStackTrace();
                        erreurDao = e.getMessage();
                    }
                    break;
                case "parPrixAchat":
                    try {
                        bouteilles = bouteilleDao.listerPourUtilisateurPrixAchatDesc( id_utilisateur );
                    } catch ( DAOException e ) {
                        e.printStackTrace();
                        erreurDao = e.getMessage();
                    }

                    break;
                case "parPrixActuelle":
                    try {
                        bouteilles = bouteilleDao.listerPourUtilisateurPrixActuelleDesc( id_utilisateur );
                    } catch ( DAOException e ) {
                        e.printStackTrace();
                        erreurDao = e.getMessage();
                    }
                    break;
                case "parDateDeProduction":
                    try {
                        bouteilles = bouteilleDao.listerPourUtilisateurDateDeProductionDesc( id_utilisateur );
                    } catch ( DAOException e ) {
                        e.printStackTrace();
                        erreurDao = e.getMessage();
                    }
                    break;
                case "parDateGarder":
                    try {
                        bouteilles = bouteilleDao.listerPourUtilisateurDateConsDesc( id_utilisateur );
                    } catch ( DAOException e ) {
                        e.printStackTrace();
                        erreurDao = e.getMessage();
                    }
                    break;
                case "triNbrTotal":
                    Collections.sort( bouteilles, Bouteille.ComparNbrTotal );
                    break;

                default:
                    break;
                }

            }

            request.setAttribute( ATT_TRI, tri );
            request.setAttribute( ATT_ERR_DAO_TRI, erreurDao );
            request.setAttribute( ATT_BOUTEILLES, bouteilles );
            this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
        } else

            this.getServletContext().getRequestDispatcher( ACCES_CONNEXION ).forward( request, response );
    }
}