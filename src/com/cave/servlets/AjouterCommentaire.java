package com.cave.servlets;

import java.io.IOException;
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
import com.cave.dao.DAOFactory;
import com.cave.dao.ProducteurDao;
import com.cave.dao.UtilisateurDao;
import com.cave.forms.CreationBouteilleForm;

@WebServlet( "/ajouterCommentaire" )
public class AjouterCommentaire extends HttpServlet {
    public static final String  VUE                = "/listeBouteilles";
    public static final String  VUE_FORM           = "/WEB-INF/jsp/restreint/afficherBouteilles.jsp";
    public static final String  ACCES_CONNEXION    = "/connection";

    public static final String  PARAM_SESSION_USER = "sessionUtilisateur";

    public static final String  ATT_SUCCES         = "succes";
    public static final String  ATT_SESSION_USER   = "sessionUtilisateur";
    public static final String  ATT_BOUTEILLE      = "bouteilleComment";
    private static final String ATT_BOUTEILLES     = "bouteilles";
    public static final String  ATT_FORM           = "form";

    public static final String  CONF_DAO_FACTORY   = "daofactory";

    private Bouteille           bouteille;

    private BouteilleDao        bouteilleDao;
    private ProducteurDao       producteurDao;
    private UtilisateurDao      utilisateurDao;

    public void init() throws ServletException {
        this.bouteilleDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getBouteilleDao();
        this.producteurDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getProducteurDao();
        this.utilisateurDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getUtilisateurDao();
    }

    public void doPost( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utilisateur sessionUtilisateur = (Utilisateur) session.getValue( PARAM_SESSION_USER );

        if ( sessionUtilisateur != null ) {
            CreationBouteilleForm form = new CreationBouteilleForm( producteurDao, bouteilleDao );
            bouteille = form.updateCommentair( request, sessionUtilisateur );
            if ( form.getErreurs().isEmpty() ) {
                Long id_sessionUtilisateur = sessionUtilisateur.getId();
                Utilisateur sessionUtilisateurMAJ = utilisateurDao.trouver( id_sessionUtilisateur );
                session.setAttribute( ATT_SESSION_USER, sessionUtilisateurMAJ );
                List<Bouteille> bouteilles = sessionUtilisateurMAJ.getBouteilles();
                request.setAttribute( ATT_BOUTEILLES, bouteilles );
            } else {
                request.setAttribute( ATT_BOUTEILLE, bouteille );

            }
            request.setAttribute( ATT_FORM, form );
            this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );

        } else

            this.getServletContext().getRequestDispatcher( ACCES_CONNEXION ).forward( request, response );
    }

}