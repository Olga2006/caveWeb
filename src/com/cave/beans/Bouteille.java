package com.cave.beans;

import java.io.Serializable;
import java.util.List;

public class Bouteille implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    private Long              id;
    private String            nom;
    private String            couleur;
    private String            region;
    private String            pays;
    private String            cru;
    private String            appelation;
    private Double            taille;
    private Integer           quantite;
    private Double            prixAchat;
    private Double            prixActuelle;
    private Integer           dateDeProduction;
    private Integer           dateGarder;
    private Integer           nbrAneeABoir;
    private Integer           nbrListCourses;
    private Integer           nbrTotal;
    private String            image;
    private String            commentaire;
    private Producteur        producteur;
    private List<Position>    positions;
    private Utilisateur       utilisateur;
    private Long              idProducteur;
    private String            nomProducteur;
    private Long              idUtilisateur;
    private Integer           evaluation;

    public Bouteille() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Bouteille( Long id, String nom, String couleur, String region, String pays, String cru, String appelation,
            Double taille, Integer quantite, Double prixAchat, Double prixActuelle, Integer dateDeProduction,
            Integer dateGarder, Integer nbrAneeABoir, Integer nbrListCourses, Integer nbrTotal, String image,
            String commentaire, Producteur producteur, List<Position> positions, Utilisateur utilisateur,
            Long idProducteur, String nomProducteur, Long idUtilisateur, Integer evaluation ) {
        super();
        this.id = id;
        this.nom = nom;
        this.couleur = couleur;
        this.region = region;
        this.pays = pays;
        this.cru = cru;
        this.appelation = appelation;
        this.taille = taille;
        this.quantite = quantite;
        this.prixAchat = prixAchat;
        this.prixActuelle = prixActuelle;
        this.dateDeProduction = dateDeProduction;
        this.dateGarder = dateGarder;
        this.nbrAneeABoir = nbrAneeABoir;
        this.nbrListCourses = nbrListCourses;
        this.nbrTotal = nbrTotal;
        this.image = image;
        this.commentaire = commentaire;
        this.producteur = producteur;
        this.positions = positions;
        this.utilisateur = utilisateur;
        this.idProducteur = idProducteur;
        this.nomProducteur = nomProducteur;
        this.idUtilisateur = idUtilisateur;
        this.evaluation = evaluation;
    }

    /*
     * (non-Javadoc)
     * 
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "Bouteille [id=" + id + ", nom=" + nom + ", couleur=" + couleur + ", region=" + region + ", pays=" + pays
                + ", cru=" + cru + ", appelation=" + appelation + ", taille=" + taille + ", quantite=" + quantite
                + ", prixAchat=" + prixAchat + ", prixActuelle=" + prixActuelle + ", dateDeProduction="
                + dateDeProduction + ", dateGarder=" + dateGarder + ", nbrAneeABoir=" + nbrAneeABoir
                + ", nbrListCourses=" + nbrListCourses + ", nbrTotal=" + nbrTotal + ", image=" + image
                + ", commentaire=" + commentaire + ", producteur=" + producteur + ", positions=" + positions
                + ", utilisateur=" + utilisateur + ", idProducteur=" + idProducteur + ", nomProducteur=" + nomProducteur
                + ", idUtilisateur=" + idUtilisateur + ", evaluation=" + evaluation + "]";
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
     * @return the couleur
     */
    public String getCouleur() {
        return couleur;
    }

    /**
     * @param couleur
     *            the couleur to set
     */
    public void setCouleur( String couleur ) {
        this.couleur = couleur;
    }

    /**
     * @return the region
     */
    public String getRegion() {
        return region;
    }

    /**
     * @param region
     *            the region to set
     */
    public void setRegion( String region ) {
        this.region = region;
    }

    /**
     * @return the pays
     */
    public String getPays() {
        return pays;
    }

    /**
     * @param pays
     *            the pays to set
     */
    public void setPays( String pays ) {
        this.pays = pays;
    }

    /**
     * @return the cru
     */
    public String getCru() {
        return cru;
    }

    /**
     * @param cru
     *            the cru to set
     */
    public void setCru( String cru ) {
        this.cru = cru;
    }

    /**
     * @return the appelation
     */
    public String getAppelation() {
        return appelation;
    }

    /**
     * @param appelation
     *            the appelation to set
     */
    public void setAppelation( String appelation ) {
        this.appelation = appelation;
    }

    /**
     * @return the taille
     */
    public Double getTaille() {
        return taille;
    }

    /**
     * @param taille
     *            the taille to set
     */
    public void setTaille( Double taille ) {
        this.taille = taille;
    }

    /**
     * @return the quantite
     */
    public Integer getQuantite() {
        return quantite;
    }

    /**
     * @param quantite
     *            the quantite to set
     */
    public void setQuantite( Integer quantite ) {
        this.quantite = quantite;
    }

    /**
     * @return the prixAchat
     */
    public Double getPrixAchat() {
        return prixAchat;
    }

    /**
     * @param prixAchat
     *            the prixAchat to set
     */
    public void setPrixAchat( Double prixAchat ) {
        this.prixAchat = prixAchat;
    }

    /**
     * @return the prixActuelle
     */
    public Double getPrixActuelle() {
        return prixActuelle;
    }

    /**
     * @param prixActuelle
     *            the prixActuelle to set
     */
    public void setPrixActuelle( Double prixActuelle ) {
        this.prixActuelle = prixActuelle;
    }

    /**
     * @return the dateDeProduction
     */
    public Integer getDateDeProduction() {
        return dateDeProduction;
    }

    /**
     * @param dateDeProduction
     *            the dateDeProduction to set
     */
    public void setDateDeProduction( Integer dateDeProduction ) {
        this.dateDeProduction = dateDeProduction;
    }

    /**
     * @return the dateGarder
     */
    public Integer getDateGarder() {
        return dateGarder;
    }

    /**
     * @param dateGarder
     *            the dateGarder to set
     */
    public void setDateGarder( Integer dateGarder ) {
        this.dateGarder = dateGarder;
    }

    /**
     * @return the nbrAneeABoir
     */
    public Integer getNbrAneeABoir() {
        /*
         * Calendar now = Calendar.getInstance(); Integer yearNow = now.get(
         * Calendar.YEAR ); nbrAneeABoir = this.dateGarder - yearNow;
         */
        return nbrAneeABoir;
    }

    /**
     * @param nbrAneeABoir
     *            the nbrAneeABoir to set
     */
    public void setNbrAneeABoir( Integer nbrAneeABoir ) {
        this.nbrAneeABoir = nbrAneeABoir;
    }

    /**
     * @return the nbrListCourses
     */
    public Integer getNbrListCourses() {
        return nbrListCourses;
    }

    /**
     * @param nbrListCourses
     *            the nbrListCourses to set
     */
    public void setNbrListCourses( Integer nbrListCourses ) {
        this.nbrListCourses = nbrListCourses;
    }

    /**
     * @return the nbrTotal
     */
    public Integer getNbrTotal() {
        return nbrTotal;
    }

    /**
     * @param nbrTotal
     *            the nbrTotal to set
     */
    public void setNbrTotal( Integer nbrTotal ) {
        this.nbrTotal = nbrTotal;
    }

    /**
     * @return the image
     */
    public String getImage() {
        return image;
    }

    /**
     * @param image
     *            the image to set
     */
    public void setImage( String image ) {
        this.image = image;
    }

    /**
     * @return the commentaire
     */
    public String getCommentaire() {
        return commentaire;
    }

    /**
     * @param commentaire
     *            the commentaire to set
     */
    public void setCommentaire( String commentaire ) {
        this.commentaire = commentaire;
    }

    /**
     * @return the producteur
     */
    public Producteur getProducteur() {
        return producteur;
    }

    /**
     * @param producteur
     *            the producteur to set
     */
    public void setProducteur( Producteur producteur ) {
        this.producteur = producteur;
    }

    /**
     * @return the positions
     */
    public List<Position> getPositions() {
        return positions;
    }

    /**
     * @param positions
     *            the positions to set
     */
    public void setPositions( List<Position> positions ) {
        this.positions = positions;
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
     * @return the idProducteur
     */
    public Long getIdProducteur() {
        return idProducteur;
    }

    /**
     * @param idProducteur
     *            the idProducteur to set
     */
    public void setIdProducteur( Long idProducteur ) {
        this.idProducteur = idProducteur;
    }

    /**
     * @return the nomProducteur
     */
    public String getNomProducteur() {
        return nomProducteur;
    }

    /**
     * @param nomProducteur
     *            the nomProducteur to set
     */
    public void setNomProducteur( String nomProducteur ) {
        this.nomProducteur = nomProducteur;
    }

    /**
     * @return the idUtilisateur
     */
    public Long getIdUtilisateur() {
        return idUtilisateur;
    }

    /**
     * @param idUtilisateur
     *            the idUtilisateur to set
     */
    public void setIdUtilisateur( Long idUtilisateur ) {
        this.idUtilisateur = idUtilisateur;
    }

    /**
     * @return the evaluation
     */
    public Integer getEvaluation() {
        return evaluation;
    }

    /**
     * @param evaluation
     *            the evaluation to set
     */
    public void setEvaluation( Integer evaluation ) {
        this.evaluation = evaluation;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
