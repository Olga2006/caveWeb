package com.cave.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import com.cave.dao.BouteilleDao;
import com.cave.dao.DAOFactory;
import com.cave.dao.ProducteurDao;

public class PrechargementFilter implements Filter {
    public static final String CONF_DAO_FACTORY       = "daofactory";
    public static final String ATT_SESSION_PRODUCTERS = "producteurs";
    public static final String ATT_SESSION_BOUTEILLES = "bouteilles";

    private ProducteurDao      producteurDao;
    private BouteilleDao       bouteilleDao;

    public void init( FilterConfig config ) throws ServletException {
        /* Récupération d'une instance de nos DAO Client et Commande */
        this.producteurDao = ( (DAOFactory) config.getServletContext().getAttribute( CONF_DAO_FACTORY ) )
                .getProducteurDao();
        this.bouteilleDao = ( (DAOFactory) config.getServletContext().getAttribute( CONF_DAO_FACTORY ) )
                .getBouteilleDao();
    }

    public void doFilter( ServletRequest req, ServletResponse res, FilterChain chain ) throws IOException,
            ServletException {
        /*
         * Cast de l'objet request HttpServletRequest request =
         * (HttpServletRequest) req;
         * 
         * Récupération de la session depuis la requête HttpSession session =
         * request.getSession();
         * 
         * 
         * Si la map des producteurs n'existe pas en session, alors
         * l'utilisateur se connecte pour la première fois et nous devons
         * précharger en session les infos contenues dans la BDD.
         * 
         * if ( session.getAttribute( ATT_SESSION_PRODUCTERS ) == null ) {
         * 
         * Récupération de la liste des producteurs existants, et enregistrement
         * en session
         * 
         * List<Producteur> listeProducteurs = producteurDao.lister(); Map<Long,
         * Producteur> mapProducteurs = new HashMap<Long, Producteur>(); for (
         * Producteur producteur : listeProducteurs ) { mapProducteurs.put(
         * producteur.getId(), producteur ); } session.setAttribute(
         * ATT_SESSION_PRODUCTERS, mapProducteurs ); }
         * 
         * if ( session.getAttribute( ATT_SESSION_BOUTEILLES ) == null ) {
         * 
         * List<Bouteille> listeBouteilles = bouteilleDao.lister(); Map<Long,
         * Bouteille> mapBouteilles = new HashMap<Long, Bouteille>(); for (
         * Bouteille bouteille : listeBouteilles ) { mapBouteilles.put(
         * bouteille.getId(), bouteille ); } session.setAttribute(
         * ATT_SESSION_BOUTEILLES, mapBouteilles ); }
         * 
         * Pour terminer, poursuite de la requête en cours chain.doFilter(
         * request, res );
         */
    }

    public void destroy() {
    }
}