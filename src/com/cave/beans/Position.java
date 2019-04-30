package com.cave.beans;

import java.io.Serializable;

public class Position implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    private Long              id;
    private Integer           referenceP;
    private Integer           referenceR;
    private String            referenceC;
    private String            nomCave;
    private Long              idCave;
    private Long              idBouteille;
    private String            nomBouteille;
    private String            couleurBouteille;
    private String            volumBouteille;
    private String            nomProdBouteille;
    private String            regionBouteille;
    private Integer           nbrAneeABoirBouteille;
    private Integer           nbrTotalBouteille;

    private Bouteille         bouteille;
    private Rangee            rangee;

    public Position() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Position( Long id, Integer referenceP, Integer referenceR, String referenceC, String nomCave, Long idCave,
            Long idBouteille, String nomBouteille, String couleurBouteille, String volumBouteille,
            String nomProdBouteille, String regionBouteille, Integer nbrAneeABoirBouteille, Integer nbrTotalBouteille,
            Bouteille bouteille, Rangee rangee ) {
        super();
        this.id = id;
        this.referenceP = referenceP;
        this.referenceR = referenceR;
        this.referenceC = referenceC;
        this.nomCave = nomCave;
        this.idCave = idCave;
        this.idBouteille = idBouteille;
        this.nomBouteille = nomBouteille;
        this.couleurBouteille = couleurBouteille;
        this.volumBouteille = volumBouteille;
        this.nomProdBouteille = nomProdBouteille;
        this.regionBouteille = regionBouteille;
        this.nbrAneeABoirBouteille = nbrAneeABoirBouteille;
        this.nbrTotalBouteille = nbrTotalBouteille;
        this.bouteille = bouteille;
        this.rangee = rangee;
    }

    /*
     * (non-Javadoc)
     * 
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return nomCave + " " + referenceC + "R" + referenceR + "P" + referenceP;
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
     * @return the referenceP
     */
    public Integer getReferenceP() {
        return referenceP;
    }

    /**
     * @param referenceP
     *            the referenceP to set
     */
    public void setReferenceP( Integer referenceP ) {
        this.referenceP = referenceP;
    }

    /**
     * @return the referenceR
     */
    public Integer getReferenceR() {
        return referenceR;
    }

    /**
     * @param referenceR
     *            the referenceR to set
     */
    public void setReferenceR( Integer referenceR ) {
        this.referenceR = referenceR;
    }

    /**
     * @return the referenceC
     */
    public String getReferenceC() {
        return referenceC;
    }

    /**
     * @param referenceC
     *            the referenceC to set
     */
    public void setReferenceC( String referenceC ) {
        this.referenceC = referenceC;
    }

    /**
     * @return the nomCave
     */
    public String getNomCave() {
        return nomCave;
    }

    /**
     * @param nomCave
     *            the nomCave to set
     */
    public void setNomCave( String nomCave ) {
        this.nomCave = nomCave;
    }

    /**
     * @return the idCave
     */
    public Long getIdCave() {
        return idCave;
    }

    /**
     * @param idCave
     *            the idCave to set
     */
    public void setIdCave( Long idCave ) {
        this.idCave = idCave;
    }

    /**
     * @return the idBouteille
     */
    public Long getIdBouteille() {
        return idBouteille;
    }

    /**
     * @param idBouteille
     *            the idBouteille to set
     */
    public void setIdBouteille( Long idBouteille ) {
        this.idBouteille = idBouteille;
    }

    /**
     * @return the nomBouteille
     */
    public String getNomBouteille() {
        return nomBouteille;
    }

    /**
     * @param nomBouteille
     *            the nomBouteille to set
     */
    public void setNomBouteille( String nomBouteille ) {
        this.nomBouteille = nomBouteille;
    }

    /**
     * @return the couleurBouteille
     */
    public String getCouleurBouteille() {
        return couleurBouteille;
    }

    /**
     * @param couleurBouteille
     *            the couleurBouteille to set
     */
    public void setCouleurBouteille( String couleurBouteille ) {
        this.couleurBouteille = couleurBouteille;
    }

    /**
     * @return the volumBouteille
     */
    public String getVolumBouteille() {
        return volumBouteille;
    }

    /**
     * @param volumBouteille
     *            the volumBouteille to set
     */
    public void setVolumBouteille( String volumBouteille ) {
        this.volumBouteille = volumBouteille;
    }

    /**
     * @return the nomProdBouteille
     */
    public String getNomProdBouteille() {
        return nomProdBouteille;
    }

    /**
     * @param nomProdBouteille
     *            the nomProdBouteille to set
     */
    public void setNomProdBouteille( String nomProdBouteille ) {
        this.nomProdBouteille = nomProdBouteille;
    }

    /**
     * @return the regionBouteille
     */
    public String getRegionBouteille() {
        return regionBouteille;
    }

    /**
     * @param regionBouteille
     *            the regionBouteille to set
     */
    public void setRegionBouteille( String regionBouteille ) {
        this.regionBouteille = regionBouteille;
    }

    /**
     * @return the nbrAneeABoirBouteille
     */
    public Integer getNbrAneeABoirBouteille() {
        return nbrAneeABoirBouteille;
    }

    /**
     * @param nbrAneeABoirBouteille
     *            the nbrAneeABoirBouteille to set
     */
    public void setNbrAneeABoirBouteille( Integer nbrAneeABoirBouteille ) {
        this.nbrAneeABoirBouteille = nbrAneeABoirBouteille;
    }

    /**
     * @return the nbrTotalBouteille
     */
    public Integer getNbrTotalBouteille() {
        return nbrTotalBouteille;
    }

    /**
     * @param nbrTotalBouteille
     *            the nbrTotalBouteille to set
     */
    public void setNbrTotalBouteille( Integer nbrTotalBouteille ) {
        this.nbrTotalBouteille = nbrTotalBouteille;
    }

    /**
     * @return the bouteille
     */
    public Bouteille getBouteille() {
        return bouteille;
    }

    /**
     * @param bouteille
     *            the bouteille to set
     */
    public void setBouteille( Bouteille bouteille ) {
        this.bouteille = bouteille;
    }

    /**
     * @return the rangee
     */
    public Rangee getRangee() {
        return rangee;
    }

    /**
     * @param rangee
     *            the rangee to set
     */
    public void setRangee( Rangee rangee ) {
        this.rangee = rangee;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
