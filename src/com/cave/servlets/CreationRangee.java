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

@WebServlet( "/creationRangee" )
public class CreationRangee extends HttpServlet {

    public static final String VUE                   = "/redigerCave";
    public static final String ACCES_CONNEXION       = "/connection";

    public static final String PARAM_SESSION_USER    = "sessionUtilisateur";
    public static final String PARAM_ID_COMPARTIMENT = "idCompartiment";
    public static final String PARAM_TAB             = "tab";

    public static final String ATT_TAB               = "tab";
    public static final String ATT_ID_COMPARTIMENT   = "idCompartimentAficher";
    public static final String ATT_ID_RANGEE         = "idRangeeAficher";

    public static final String CONF_DAO_FACTORY      = "daofactory";

    private RangeeDao          rangeeDao;

    public void init() throws ServletException {
        this.rangeeDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) )
                .getRangeeDao();

    }

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utilisateur sessionUtilisateur = (Utilisateur) session.getValue( PARAM_SESSION_USER );
        if ( sessionUtilisateur != null ) {
            String idCompartiment = getValeurParametre( request, PARAM_ID_COMPARTIMENT );
            String tab = getValeurParametre( request, PARAM_TAB );
            session.setAttribute( ATT_ID_RANGEE, null );
            if ( idCompartiment != null ) {
                Long id_compartiment = Long.parseLong( idCompartiment );
                session.setAttribute( ATT_ID_COMPARTIMENT, id_compartiment );
                try {
                    rangeeDao.creer( id_compartiment );
                } catch ( DAOException e ) {
                    e.printStackTrace();
                }

            }
            if ( tab != null ) {
                session.setAttribute( ATT_TAB, tab );
            }

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