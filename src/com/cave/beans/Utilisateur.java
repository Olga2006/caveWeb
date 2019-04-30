package com.cave.beans;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

public class Utilisateur implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    private Long              id;
    private String            nom;
    private String            email;
    private String            motDePasse;
    private Timestamp         dateInscription;
    private List<Cave>        caves;
    private List<Bouteille>   bouteilles;
    private List<Producteur>  producteurs;

    public Utilisateur() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Utilisateur( Long id, String nom, String email, String motDePasse, Timestamp dateInscription,
            List<Cave> caves, List<Bouteille> bouteilles, List<Producteur> producteurs ) {
        super();
        this.id = id;
        this.nom = nom;
        this.email = email;
        this.motDePasse = motDePasse;
        this.dateInscription = dateInscription;
        this.caves = caves;
        this.bouteilles = bouteilles;
        this.producteurs = producteurs;
    }

    /*
     * (non-Javadoc)
     * 
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "Utilisateur [id=" + id + ", nom=" + nom + ", email=" + email + ", motDePasse=" + motDePasse
                + ", dateInscription=" + dateInscription + ", caves=" + caves + ", bouteilles=" + bouteilles
                + ", producteurs=" + producteurs + "]";
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
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email
     *            the email to set
     */
    public void setEmail( String email ) {
        this.email = email;
    }

    /**
     * @return the motDePasse
     */
    public String getMotDePasse() {
        return motDePasse;
    }

    /**
     * @param motDePasse
     *            the motDePasse to set
     */
    public void setMotDePasse( String motDePasse ) {
        this.motDePasse = motDePasse;
    }

    /**
     * @return the dateInscription
     */
    public Timestamp getDateInscription() {
        return dateInscription;
    }

    /**
     * @param dateInscription
     *            the dateInscription to set
     */
    public void setDateInscription( Timestamp dateInscription ) {
        this.dateInscription = dateInscription;
    }

    /**
     * @return the caves
     */
    public List<Cave> getCaves() {
        return caves;
    }

    /**
     * @param caves
     *            the caves to set
     */
    public void setCaves( List<Cave> caves ) {
        this.caves = caves;
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
     * @return the producteurs
     */
    public List<Producteur> getProducteurs() {
        return producteurs;
    }

    /**
     * @param producteurs
     *            the producteurs to set
     */
    public void setProducteurs( List<Producteur> producteurs ) {
        this.producteurs = producteurs;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}