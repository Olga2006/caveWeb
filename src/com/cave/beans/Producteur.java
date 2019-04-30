package com.cave.beans;

import java.io.Serializable;
import java.util.List;

public class Producteur implements Serializable {
    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    private Long              id;
    private String            nom;
    private String            adresse;
    private String            contact;

    private List<Bouteille>   bouteilles;
    private Utilisateur       utilisateur;

    public Producteur() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Producteur( Long id, String nom, String adresse, String contact, List<Bouteille> bouteilles,
            Utilisateur utilisateur ) {
        super();
        this.id = id;
        this.nom = nom;
        this.adresse = adresse;
        this.contact = contact;
        this.bouteilles = bouteilles;
        this.utilisateur = utilisateur;
    }

    /*
     * (non-Javadoc)
     * 
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "Producteur [id=" + id + ", nom=" + nom + ", adresse=" + adresse + ", contact=" + contact
                + ", bouteilles=" + bouteilles + ", utilisateur=" + utilisateur + "]";
    }

    /**
     * @return the id
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id
     *            the id to set
     */
    public void setId( Long id ) {
        this.id = id;
    }

    /**
     * @return the nom
     */
    public String getNom() {
        return nom;
    }

    /**
     * @param nom
     *            the nom to set
     */
    public void setNom( String nom ) {
        this.nom = nom;
    }

    /**
     * @return the adresse
     */
    public String getAdresse() {
        return adresse;
    }

    /**
     * @param adresse
     *            the adresse to set
     */
    public void setAdresse( String adresse ) {
        this.adresse = adresse;
    }

    /**
     * @return the contact
     */
    public String getContact() {
        return contact;
    }

    /**
     * @param contact
     *            the contact to set
     */
    public void setContact( String contact ) {
        this.contact = contact;
    }

    /**
     * @return the bouteilles
     */
    public List<Bouteille> getBouteilles() {
        return bouteilles;
    }

    /**
     * @param bouteilles
     *            the bouteilles to set
     */
    public void setBouteilles( List<Bouteille> bouteilles ) {
        this.bouteilles = bouteilles;
    }

    /**
     * @return the utilisateur
     */
    public Utilisateur getUtilisateur() {
        return utilisateur;
    }

    /**
     * @param utilisateur
     *            the utilisateur to set
     */
    public void setUtilisateur( Utilisateur utilisateur ) {
        this.utilisateur = utilisateur;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
