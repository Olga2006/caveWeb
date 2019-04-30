package com.cave.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cave.beans.Utilisateur;
import com.cave.dao.DAOException;
import com.cave.dao.DAOFactory;
import com.cave.dao.PositionDao;

@WebServlet( "/suppressionPosition" )
public class SuppressionPosition extends HttpServlet {

    public static final String VUE                = "/redigerCave";
    public static final String ACCES_CONNEXION    = "/connection";

    public static final String PARAM_ID_RANGEE    = "idRangee";
    public static final String PARAM_TAB          = "tab";
    public static final String PARAM_SESSION_USER = "sessionUtilisateur";

    public static final String ATT_TAB            = "tab";
    public static final String ATT_ID_RANGEE      = "idRangeeAficher";

    public static final String CONF_DAO_FACTORY   = "daofactory";

    private PositionDao        positionDao;

    public void init() throws ServletException {
        /* Récupération d'une instance de notre DAO Producteur */

        this.positionDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getPositionDao();
    }

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utilisateur sessionUtilisateur = (Utilisateur) session.getValue( PARAM_SESSION_USER );

        if ( sessionUtilisateur != null ) {
            String tab = getValeurParametre( request, PARAM_TAB );
            /* Récupération du paramètre */
            String idRangee = getValeurParametre( request, PARAM_ID_RANGEE );

            if ( idRangee != null ) {
                Long id = Long.parseLong( idRangee );
                session.setAttribute( ATT_ID_RANGEE, id );
                try {

                    positionDao.supprimerLastPosition( id );

                }

                catch ( DAOException e ) {
                    e.printStackTrace();
                }

            }
            if ( tab != null ) {
                session.setAttribute( ATT_TAB, tab );
            }
            response.sendRedirect( request.getContextPath() + VUE + "#aficherRangee" );
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