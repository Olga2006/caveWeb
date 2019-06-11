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
import com.cave.dao.DAOException;
import com.cave.dao.DAOFactory;
import com.cave.dao.ProducteurDao;
import com.cave.dao.UtilisateurDao;

@WebServlet( "/suppressionProducteur" )
public class SuppressionProducteur extends HttpServlet {
    public static final String  VUE                  = "/listeProducteurs";
    public static final String  VUE_FORM             = "/WEB-INF/jsp/restreint/afficherProducteurs.jsp";
    public static final String  ACCES_CONNEXION      = "/connection";

    public static final String  PARAM_ID_PRODUCTEUR  = "idProducteur";
    public static final String  PARAM_NOM_PRODUCTEUR = "nomProducteur";
    public static final String  PARAM_SESSION_USER   = "sessionUtilisateur";

    public static final String  ATT_SUCCES_DEL       = "successDel";
    public static final String  ATT_ERREURS          = "erreurs";
    private static final String CHAMP_ERREUR_DAO     = "erreurDao";
    private static final String CHAMP_ECHEC_DEL      = "echecDel";
    public static final String  ATT_SESSION_USER     = "sessionUtilisateur";

    public static final String  CONF_DAO_FACTORY     = "daofactory";

    private ProducteurDao       producteurDao;
    private UtilisateurDao      utilisateurDao;

    private String              successDel;
    private Map<String, String> erreurs              = new HashMap<String, String>();

    public void init() throws ServletException {
        /* Récupération d'une instance de notre DAO Producteur */
        this.producteurDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getProducteurDao();
        this.utilisateurDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getUtilisateurDao();
    }

    public void doPost( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utilisateur sessionUtilisateur = (Utilisateur) session.getValue( PARAM_SESSION_USER );

        if ( sessionUtilisateur != null ) {
            /* Récupération du paramètre */
            String idProducteur = getValeurParametre( request, PARAM_ID_PRODUCTEUR );
            String nomProducteur = getValeurParametre( request, PARAM_NOM_PRODUCTEUR );
            if ( idProducteur != null ) {
                Long id = Long.parseLong( idProducteur );
                try {
                    producteurDao.supprimer( id );
                } catch ( DAOException e ) {
                    e.printStackTrace();
                    erreurs.put( CHAMP_ERREUR_DAO, e.getMessage() );
                    erreurs.put( CHAMP_ECHEC_DEL, nomProducteur );
                }
            }

            if ( erreurs.isEmpty() ) {
                successDel = nomProducteur;
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