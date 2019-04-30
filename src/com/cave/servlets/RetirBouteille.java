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

@WebServlet( "/retirerBouteille" )
public class RetirBouteille extends HttpServlet {
    public static final String VUE_SUCCES         = "/listeCaves";
    public static final String ACCES_CONNEXION    = "/connection";

    public static final String PARAM_SESSION_USER = "sessionUtilisateur";
    public static final String PARAM_ID_POSITION  = "idPosition";

    public static final String CONF_DAO_FACTORY   = "daofactory";

    private PositionDao        positionDao;

    public void init() throws ServletException {
        /* Récupération d'une instance de nos DAO */

        this.positionDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getPositionDao();
    }

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Utilisateur sessionUtilisateur = (Utilisateur) session.getValue( PARAM_SESSION_USER );
        if ( sessionUtilisateur != null ) {
            String idPosition = getValeurParametre( request, PARAM_ID_POSITION );
            Long id_Position = Long.parseLong( idPosition );
            positionDao.vider_la_position( id_Position );

            this.getServletContext().getRequestDispatcher( VUE_SUCCES ).forward( request, response );
        } else

            this.getServletContext().getRequestDispatcher( ACCES_CONNEXION ).forward( request, response );
    }

    /*
     * Méthode utilitaire qui retourne null si un paramètre est vide, et son
     * contenu sinon.
     */
    private static String getValeurParametre( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur;
        }
    }

}