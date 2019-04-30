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
import com.cave.dao.RangeeDao;

@WebServlet( "/suppressionRangee" )
public class SuppressionRangee extends HttpServlet {

    public static final String VUE                   = "/redigerCave";
    public static final String ACCES_CONNEXION       = "/connection";

    public static final String PARAM_ID_COMPARTIMENT = "idCompartiment";
    public static final String PARAM_SESSION_USER    = "sessionUtilisateur";
    public static final String PARAM_TAB             = "tab";

    public static final String ATT_TAB               = "tab";
    public static final String ATT_ID_COMPARTIMENT   = "idCompartimentAficher";
    public static final String ATT_ID_RANGEE         = "idRangeeAficher";

    public static final String CONF_DAO_FACTORY      = "daofactory";

    private RangeeDao          rangeeDao;

    public void init() throws ServletException {
        /* Récupération d'une instance de notre DAO Producteur */

        this.rangeeDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getRangeeDao();
    }

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utilisateur sessionUtilisateur = (Utilisateur) session.getValue( PARAM_SESSION_USER );
        session.setAttribute( ATT_ID_RANGEE, null );
        if ( sessionUtilisateur != null ) {
            String tab = getValeurParametre( request, PARAM_TAB );
            /* Récupération du paramètre */
            String idCompartiment = getValeurParametre( request, PARAM_ID_COMPARTIMENT );

            if ( idCompartiment != null ) {
                Long id = Long.parseLong( idCompartiment );
                session.setAttribute( ATT_ID_COMPARTIMENT, id );
                try {

                    rangeeDao.supprimerLastRangee( id );

                }

                catch ( DAOException e ) {
                    e.printStackTrace();
                }

            }
            if ( tab != null ) {
                session.setAttribute( ATT_TAB, tab );
            }

            /* Redirection vers la fiche récapitulative */
            response.sendRedirect( request.getContextPath() + VUE + "#aficherCompartiment" );
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