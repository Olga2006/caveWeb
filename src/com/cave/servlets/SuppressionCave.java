package com.cave.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cave.beans.Utilisateur;
import com.cave.dao.CaveDao;
import com.cave.dao.DAOException;
import com.cave.dao.DAOFactory;
import com.cave.dao.UtilisateurDao;

@WebServlet( "/suppressionCave" )
public class SuppressionCave extends HttpServlet {
    public static final String  VUE                = "/listeCaves";
    public static final String  VUE_FORM           = "/WEB-INF/jsp/restreint/afficherCaves.jsp";
    public static final String  ACCES_CONNEXION    = "/connection";

    public static final String  PARAM_ID_CAVE      = "idCave";
    public static final String  PARAM_NOM_CAVE     = "nomCave";
    public static final String  PARAM_SESSION_USER = "sessionUtilisateur";

    public static final String  ATT_SUCCES_DEL     = "successDel";
    public static final String  ATT_ERREURS        = "erreurs";
    private static final String CHAMP_ERREUR_DAO   = "erreurDao";
    private static final String CHAMP_ECHEC_DEL    = "echecDel";
    public static final String  ATT_SESSION_USER   = "sessionUtilisateur";

    public static final String  CONF_DAO_FACTORY   = "daofactory";

    private CaveDao             caveDao;
    private UtilisateurDao      utilisateurDao;

    private String              successDel;

    private Map<String, String> erreurs            = new HashMap<String, String>();

    public void init() throws ServletException {
        /* Récupération d'une instance de notre DAO Producteur */
        this.caveDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getCaveDao();
        this.utilisateurDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getUtilisateurDao();
    }

    public void doPost( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utilisateur sessionUtilisateur = (Utilisateur) session.getValue( PARAM_SESSION_USER );
        if ( sessionUtilisateur != null ) {
            /* Récupération du paramètre */
            String idCave = getValeurParametre( request, PARAM_ID_CAVE );
            String nomCave = getValeurParametre( request, PARAM_NOM_CAVE );
            if ( idCave != null ) {
                Long id = Long.parseLong( idCave );
                try {
                    caveDao.supprimer( id );
                } catch ( DAOException e ) {
                    e.printStackTrace();
                    erreurs.put( CHAMP_ERREUR_DAO, e.getMessage() );
                    erreurs.put( CHAMP_ECHEC_DEL, nomCave );
                }
            }

            if ( erreurs.isEmpty() ) {
                successDel = nomCave;
                request.setAttribute( ATT_SUCCES_DEL, successDel );
                Long id_sessionUtilisateur = sessionUtilisateur.getId();
                Utilisateur sessionUtilisateurMAJ = utilisateurDao.trouver( id_sessionUtilisateur );
                session.setAttribute( ATT_SESSION_USER, sessionUtilisateurMAJ );

            } else {
                request.setAttribute( ATT_ERREURS, erreurs );

            }

            this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
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