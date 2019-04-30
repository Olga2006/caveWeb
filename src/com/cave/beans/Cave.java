package com.cave.beans;

import java.io.Serializable;
import java.util.List;

public class Cave implements Serializable {

    /**
     * new wsdwd
     * 
     */
    private static final long  serialVersionUID = 1L;
    private Long               id;
    private String             nom;
    private Integer            nbrCompartiment;
    private Utilisateur        utilisateur;
    private List<Compartiment> compartiments;
    private List<Compartiment> compartimentsB;
    private Integer            nbrRow;

    private Integer            nbrTotal;
    private Integer            nbrRouge;
    private Integer            nbrBlanc;
    private Integer            nbrJaune;
    private Integer            nbrRose;
    private Integer            nbrEffervescent;
    private Integer            nbrLiquoreux;
    private Integer            nbrAutreCol;
    private Integer            nbrAutreCru;
    private Integer            nbrGC;
    private Integer            nbrPC;
    private Integer            nbrCB;
    private Integer            nbrCC;
    private Integer            nbrNC;
    private Integer            nbrV;

    private Integer            prixTotalActuelle;
    private Integer            prixTotalAchat;

    public Cave() {

        super();
        // TODO Auto-generated constructor stub
    }

    public Cave( Long id, String nom, Integer nbrCompartiment, Utilisateur utilisateur,
            List<Compartiment> compartiments, List<Compartiment> compartimentsB, Integer nbrRow, Integer nbrTotal,
            Integer nbrRouge, Integer nbrBlanc, Integer nbrJaune, Integer nbrRose, Integer nbrEffervescent,
            Integer nbrLiquoreux, Integer nbrAutreCol, Integer nbrGC, Integer nbrPC, Integer nbrCB, Integer nbrCC,
            Integer nbrNC, Integer nbrV, Integer nbrAutreCru, Integer prixTotalActuelle, Integer prixTotalAchat ) {
        super();
        this.id = id;
        this.nom = nom;
        this.nbrCompartiment = nbrCompartiment;
        this.utilisateur = utilisateur;
        this.compartiments = compartiments;
        this.compartimentsB = compartimentsB;
        this.nbrRow = nbrRow;
        this.nbrTotal = nbrTotal;
        this.nbrRouge = nbrRouge;
        this.nbrBlanc = nbrBlanc;
        this.nbrJaune = nbrJaune;
        this.nbrRose = nbrRose;
        this.nbrEffervescent = nbrEffervescent;
        this.nbrLiquoreux = nbrLiquoreux;
        this.nbrAutreCol = nbrAutreCol;
        this.nbrGC = nbrGC;
        this.nbrPC = nbrPC;
        this.nbrCB = nbrCB;
        this.nbrCC = nbrCC;
        this.nbrNC = nbrNC;
        this.nbrV = nbrV;
        this.nbrAutreCru = nbrAutreCru;
        this.prixTotalActuelle = prixTotalActuelle;
        this.prixTotalAchat = prixTotalAchat;
    }

    /*
     * (non-Javadoc)
     * 
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "Cave [id=" + id + ", nom=" + nom + ", nbrCompartiment=" + nbrCompartiment + ", utilisateur="
                + utilisateur + ", compartiments=" + compartiments + ", compartimentsB=" + compartimentsB + ", nbrRow="
                + nbrRow + ", nbrTotal=" + nbrTotal + ", nbrRouge=" + nbrRouge + ", nbrBlanc=" + nbrBlanc
                + ", nbrJaune=" + nbrJaune + ", nbrRose=" + nbrRose + ", nbrEffervescent=" + nbrEffervescent
                + ", nbrLiquoreux=" + nbrLiquoreux + ", nbrAutreCol=" + nbrAutreCol + ", nbrGC=" + nbrGC + ", nbrPC="
                + nbrPC + ", nbrCB=" + nbrCB + ", nbrCC=" + nbrCC + ", nbrNC=" + nbrNC + ", nbrV=" + nbrV
                + ", nbrAutreCru=" + nbrAutreCru + ", prixTotalActuelle=" + prixTotalActuelle + ", prixTotalAchat="
                + prixTotalAchat + "]";
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
     * @return the nbrCompartiment
     */
    public Integer getNbrCompartiment() {
        return nbrCompartiment;
    }

    /**
     * @param nbrCompartiment
     *            the nbrCompartiment to set
     */
    public void setNbrCompartiment( Integer nbrCompartiment ) {
        this.nbrCompartiment = nbrCompartiment;
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
     * @return the compartiments
     */
    public List<Compartiment> getCompartiments() {
        return compartiments;
    }

    /**
     * @param compartiments
     *            the compartiments to set
     */
    public void setCompartiments( List<Compartiment> compartiments ) {
        this.compartiments = compartiments;
    }

    /**
     * @return the compartimentsB
     */
    public List<Compartiment> getCompartimentsB() {
        return compartimentsB;
    }

    /**
     * @param compartimentsB
     *            the compartimentsB to set
     */
    public void setCompartimentsB( List<Compartiment> compartimentsB ) {
        this.compartimentsB = compartimentsB;
    }

    /**
     * @return the nbrRow
     */
    public Integer getNbrRow() {
        return nbrRow;
    }

    /**
     * @param nbrRow
     *            the nbrRow to set
     */
    public void setNbrRow( Integer nbrRow ) {
        this.nbrRow = nbrRow;
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
     * @return the nbrRouge
     */
    public Integer getNbrRouge() {
        return nbrRouge;
    }

    /**
     * @param nbrRouge
     *            the nbrRouge to set
     */
    public void setNbrRouge( Integer nbrRouge ) {
        this.nbrRouge = nbrRouge;
    }

    /**
     * @return the nbrBlanc
     */
    public Integer getNbrBlanc() {
        return nbrBlanc;
    }

    /**
     * @param nbrBlanc
     *            the nbrBlanc to set
     */
    public void setNbrBlanc( Integer nbrBlanc ) {
        this.nbrBlanc = nbrBlanc;
    }

    /**
     * @return the nbrJaune
     */
    public Integer getNbrJaune() {
        return nbrJaune;
    }

    /**
     * @param nbrJaune
     *            the nbrJaune to set
     */
    public void setNbrJaune( Integer nbrJaune ) {
        this.nbrJaune = nbrJaune;
    }

    /**
     * @return the nbrRose
     */
    public Integer getNbrRose() {
        return nbrRose;
    }

    /**
     * @param nbrRose
     *            the nbrRose to set
     */
    public void setNbrRose( Integer nbrRose ) {
        this.nbrRose = nbrRose;
    }

    /**
     * @return the nbrEffervescent
     */
    public Integer getNbrEffervescent() {
        return nbrEffervescent;
    }

    /**
     * @param nbrEffervescent
     *            the nbrEffervescent to set
     */
    public void setNbrEffervescent( Integer nbrEffervescent ) {
        this.nbrEffervescent = nbrEffervescent;
    }

    /**
     * @return the nbrLiquoreux
     */
    public Integer getNbrLiquoreux() {
        return nbrLiquoreux;
    }

    /**
     * @param nbrLiquoreux
     *            the nbrLiquoreux to set
     */
    public void setNbrLiquoreux( Integer nbrLiquoreux ) {
        this.nbrLiquoreux = nbrLiquoreux;
    }

    /**
     * @return the nbrAutreCol
     */

    public Integer getNbrAutreCol() {
        nbrAutreCol = this.nbrTotal - ( this.nbrRouge + this.nbrBlanc + this.nbrJaune + this.nbrRose
                + this.nbrEffervescent + this.nbrLiquoreux );
        return nbrAutreCol;
    }

    /**
     * @param nbrAutreCol
     *            the nbrAutreCol to set
     */
    public void setNbrAutreCol( Integer nbrAutreCol ) {
        this.nbrAutreCol = nbrAutreCol;
    }

    /**
     * @return the nbrGC
     */
    public Integer getNbrGC() {
        return nbrGC;
    }

    /**
     * @param nbrGC
     *            the nbrGC to set
     */
    public void setNbrGC( Integer nbrGC ) {
        this.nbrGC = nbrGC;
    }

    /**
     * @return the nbrPC
     */
    public Integer getNbrPC() {
        return nbrPC;
    }

    /**
     * @param nbrPC
     *            the nbrPC to set
     */
    public void setNbrPC( Integer nbrPC ) {
        this.nbrPC = nbrPC;
    }

    /**
     * @return the nbrCB
     */
    public Integer getNbrCB() {
        return nbrCB;
    }

    /**
     * @param nbrCB
     *            the nbrCB to set
     */
    public void setNbrCB( Integer nbrCB ) {
        this.nbrCB = nbrCB;
    }

    /**
     * @return the nbrCC
     */
    public Integer getNbrCC() {
        return nbrCC;
    }

    /**
     * @param nbrCC
     *            the nbrCC to set
     */
    public void setNbrCC( Integer nbrCC ) {
        this.nbrCC = nbrCC;
    }

    /**
     * @return the nbrNC
     */
    public Integer getNbrNC() {
        return nbrNC;
    }

    /**
     * @param nbrNC
     *            the nbrNC to set
     */
    public void setNbrNC( Integer nbrNC ) {
        this.nbrNC = nbrNC;
    }

    /**
     * @return the nbrV
     */
    public Integer getNbrV() {
        return nbrV;
    }

    /**
     * @param nbrV
     *            the nbrV to set
     */
    public void setNbrV( Integer nbrV ) {
        this.nbrV = nbrV;
    }

    /**
     * @return the nbrAutreCru
     */

    public Integer getNbrAutreCru() {
        nbrAutreCru = this.nbrTotal - this.nbrV - this.nbrNC - this.nbrCC - this.nbrCB - this.nbrPC - this.nbrGC;
        return nbrAutreCru;
    }

    /**
     * @param nbrAutreCru
     *            the nbrAutreCru to set
     */
    public void setNbrAutreCru( Integer nbrAutreCru ) {
        this.nbrAutreCru = nbrAutreCru;
    }

    /**
     * @return the prixTotalActuelle
     */
    public Integer getPrixTotalActuelle() {
        return prixTotalActuelle;
    }

    /**
     * @param prixTotalActuelle
     *            the prixTotalActuelle to set
     */
    public void setPrixTotalActuelle( Integer prixTotalActuelle ) {
        this.prixTotalActuelle = prixTotalActuelle;
    }

    /**
     * @return the prixTotalAchat
     */
    public Integer getPrixTotalAchat() {
        return prixTotalAchat;
    }

    /**
     * @param prixTotalAchat
     *            the prixTotalAchat to set
     */
    public void setPrixTotalAchat( Integer prixTotalAchat ) {
        this.prixTotalAchat = prixTotalAchat;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
