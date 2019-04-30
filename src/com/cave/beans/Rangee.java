package com.cave.beans;

import java.io.Serializable;
import java.util.List;

public class Rangee implements Serializable {
    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    private Long              id;
    private Integer           referenceR;
    private Compartiment      compartiment;
    private List<Position>    positions;

    public Rangee() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Rangee( Long id, Integer referenceR, Compartiment compartiment, List<Position> positions ) {
        super();
        this.id = id;
        this.referenceR = referenceR;
        this.compartiment = compartiment;
        this.positions = positions;
    }

    /*
     * (non-Javadoc)
     * 
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "Rangee [id=" + id + ", referenceR=" + referenceR + ", compartiment=" + compartiment + ", positions="
                + positions + "]";
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
     * @return the compartiment
     */
    public Compartiment getCompartiment() {
        return compartiment;
    }

    /**
     * @param compartiment
     *            the compartiment to set
     */
    public void setCompartiment( Compartiment compartiment ) {
        this.compartiment = compartiment;
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

}
