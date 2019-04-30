package com.cave.beans;

import java.io.Serializable;
import java.sql.Timestamp;

public class Blog implements Serializable {
    private Long      id;
    private String    nomArticle;
    private String    subtheme;
    private Timestamp dateEdition;
    private String    nomAuteur;
    private String    article1;
    private String    article2;
    private String    article3;

    public Blog() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Blog( Long id, String nomArticle, String subtheme, Timestamp dateEdition, String nomAuteur, String article1,
            String article2, String article3 ) {
        super();
        this.id = id;
        this.nomArticle = nomArticle;
        this.subtheme = subtheme;
        this.dateEdition = dateEdition;
        this.nomAuteur = nomAuteur;
        this.article1 = article1;
        this.article2 = article2;
        this.article3 = article3;
    }

    /*
     * (non-Javadoc)
     * 
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "Blog [id=" + id + ", nomArticle=" + nomArticle + ", subtheme=" + subtheme + ", dateEdition="
                + dateEdition + ", nomAuteur=" + nomAuteur + ", article1=" + article1 + ", article2=" + article2
                + ", article3=" + article3 + "]";
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
     * @return the nomArticle
     */
    public String getNomArticle() {
        return nomArticle;
    }

    /**
     * @param nomArticle
     *            the nomArticle to set
     */
    public void setNomArticle( String nomArticle ) {
        this.nomArticle = nomArticle;
    }

    /**
     * @return the subtheme
     */
    public String getSubtheme() {
        return subtheme;
    }

    /**
     * @param subtheme
     *            the subtheme to set
     */
    public void setSubtheme( String subtheme ) {
        this.subtheme = subtheme;
    }

    /**
     * @return the dateEdition
     */
    public Timestamp getDateEdition() {
        return dateEdition;
    }

    /**
     * @param dateEdition
     *            the dateEdition to set
     */
    public void setDateEdition( Timestamp dateEdition ) {
        this.dateEdition = dateEdition;
    }

    /**
     * @return the nomAuteur
     */
    public String getNomAuteur() {
        return nomAuteur;
    }

    /**
     * @param nomAuteur
     *            the nomAuteur to set
     */
    public void setNomAuteur( String nomAuteur ) {
        this.nomAuteur = nomAuteur;
    }

    /**
     * @return the article1
     */
    public String getArticle1() {
        return article1;
    }

    /**
     * @param article1
     *            the article1 to set
     */
    public void setArticle1( String article1 ) {
        this.article1 = article1;
    }

    /**
     * @return the article2
     */
    public String getArticle2() {
        return article2;
    }

    /**
     * @param article2
     *            the article2 to set
     */
    public void setArticle2( String article2 ) {
        this.article2 = article2;
    }

    /**
     * @return the article3
     */
    public String getArticle3() {
        return article3;
    }

    /**
     * @param article3
     *            the article3 to set
     */
    public void setArticle3( String article3 ) {
        this.article3 = article3;
    }

}
