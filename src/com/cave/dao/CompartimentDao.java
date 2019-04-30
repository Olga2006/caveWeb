package com.cave.dao;

import java.util.List;

import com.cave.beans.Compartiment;

public interface CompartimentDao {

    List<Compartiment> listerCompartimentsAPourCave( Long id ) throws DAOException;

    List<Compartiment> listerCompartimentsBPourCave( Long id ) throws DAOException;

    Compartiment trouver( long id_compartiment ) throws DAOException;

}
