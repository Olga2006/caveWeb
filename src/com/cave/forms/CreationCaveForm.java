package com.cave.forms;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cave.beans.Cave;
import com.cave.beans.Utilisateur;
import com.cave.dao.CaveDao;
import com.cave.dao.DAOException;

public final class CreationCaveForm {
    private static final String CHAMP_NOM          = "nom";
    private static final String CHAMP_ROW          = "nbrRow";
    private static final String CHAMP_COMPARTIMENT = "nbrCompartiment";
    private static final String CHAMP_ERREUR_DAO   = "erreurDaoCave";
    public static final String  PARAM_ID_CAVE      = "idCave";

    private String              successCreation;
    private String              successMaj;

    private String              unsuccessCreation;
    private String              unsuccessMaj;

    private Map<String, String> erreurs            = new HashMap<String, String>();
    CaveDao                     caveDao;

    public CreationCaveForm( CaveDao caveDao ) {
        this.caveDao = caveDao;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public String getSuccessCreation() {
        return successCreation;
    }

    public String getSuccessMaj() {
        return successMaj;
    }

    public String getUnsuccessCreation() {
        return unsuccessCreation;
    }

    public String getUnsuccessMaj() {
        return unsuccessMaj;
    }

    public Cave updateCave( HttpServletRequest request, Utilisateur sessionUtilisateur ) {
        Long id = Long.parseLong( request.getParameter( PARAM_ID_CAVE ) );
        String nom = getValeurChamp( request, CHAMP_NOM );

        Cave cave = new Cave();
        cave.setUtilisateur( sessionUtilisateur );
        cave.setId( id );
        cave.setNom( nom );

        traiterExistenceCave( cave, id );

        if ( erreurs.isEmpty() ) {
            try {
                caveDao.update( cave );
                successMaj = " " + cave.getNom();
            } catch ( DAOException e ) {
                setErreur( CHAMP_ERREUR_DAO, e.getMessage() );
                e.printStackTrace();
                unsuccessMaj = " " + cave.getNom();
            }

        } else {
            unsuccessMaj = " " + cave.getNom();
        }

        return cave;
    }

    public Cave creerCave( HttpServletRequest request, Utilisateur sessionUtilisateur ) {
        Long id = null;
        String nom = getValeurChamp( request, CHAMP_NOM );
        String nbrRow = getValeurChamp( request, CHAMP_ROW );
        String nbrCompartiment = getValeurChamp( request, CHAMP_COMPARTIMENT );

        Cave cave = new Cave();
        cave.setUtilisateur( sessionUtilisateur );
        cave.setNom( nom );
        traiterExistenceCave( cave, id );
        traiterNbrCompartiment( nbrCompartiment, cave );
        traiterNbrRow( nbrRow, cave );

        if ( erreurs.isEmpty() ) {
            try {
                caveDao.creer( cave );
                successCreation = " " + cave.getNom();
            } catch ( DAOException e ) {
                setErreur( CHAMP_ERREUR_DAO, e.getMessage() );
                e.printStackTrace();
                unsuccessCreation = " " + cave.getNom();
            }

        } else {
            unsuccessCreation = " " + cave.getNom();
        }

        return cave;
    }

    private void traiterExistenceCave( Cave cave, Long id ) {
        try {
            validationExistenceCave( cave, id );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_NOM, e.getMessage() );
        }

    }

    private void validationExistenceCave( Cave cave, Long id ) throws FormValidationException {
        try {
            Cave caveDansList = caveDao.trouver( cave );
            if ( caveDansList != null && caveDansList.getId() != id ) {
                throw new FormValidationException( cave.getNom() );
            }

        } catch ( DAOException e ) {
            setErreur( CHAMP_ERREUR_DAO, e.getMessage() );
            e.printStackTrace();
        }
    }

    private void traiterNbrCompartiment( String nbrCompartiment, Cave cave ) {
        Integer valeurMontant = 1;
        if ( nbrCompartiment != null ) {
            try {
                valeurMontant = Integer.parseInt( nbrCompartiment );
            } catch ( NumberFormatException e ) {
                valeurMontant = 1;
            }
        }
        cave.setNbrCompartiment( valeurMontant );
    }

    private void traiterNbrRow( String nbrRow, Cave cave ) {
        Integer valeurMontant = 1;
        if ( nbrRow != null ) {
            try {
                valeurMontant = Integer.parseInt( nbrRow );
            } catch ( NumberFormatException e ) {
                valeurMontant = 1;
            }
        }
        cave.setNbrRow( valeurMontant );
    }

    /*
     * Ajoute un message correspondant au champ spécifié à la map des erreurs.
     */
    private void setErreur( String champ, String message ) {
        erreurs.put( champ, message );
    }

    /*
     * Méthode utilitaire qui retourne null si un champ est vide, et son contenu
     * sinon.
     */
    private static String getValeurChamp( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur;
        }
    }

}