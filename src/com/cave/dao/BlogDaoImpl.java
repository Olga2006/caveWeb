package com.cave.dao;

import static com.cave.dao.DAOUtilitaire.fermeturesSilencieuses;
import static com.cave.dao.DAOUtilitaire.initialisationRequetePreparee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cave.beans.Blog;

public class BlogDaoImpl implements BlogDao {

    private static final String SQL_SELECT  = "SELECT id, nom_article, nom_auteur, subtheme, date_edition, article1, article2, article3  FROM Blog";

    private static final String MESSAGE_DAO = "Échec. Merci de réessayer dans quelques instants et en cas d'échec informez notre <a class=\"linkErrDao\" href=\"support\">service technique </a> ";

    private static DAOFactory   daoFactory;

    public BlogDaoImpl( DAOFactory daoFactory ) {
        this.daoFactory = daoFactory;
    }

    @Override
    public List<Blog> lister() throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Blog> blogs = new ArrayList<Blog>();
        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_SELECT, false );
            resultSet = preparedStatement.executeQuery();
            /*
             * Parcours de la ligne de données de l'éventuel ResulSet retourné
             */
            while ( resultSet.next() ) {
                blogs.add( map( resultSet ) );
            }
        } catch ( SQLException e ) {
            throw new DAOException( MESSAGE_DAO + e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }

        return blogs;
    }

    /*
     * la correspondance (le mapping) entre une ligne issue de la table des
     * Producteurs (un ResultSet) et un bean Producteur.
     */
    private static Blog map( ResultSet resultSet ) throws SQLException {
        Blog blog = new Blog();
        Long id_blog = resultSet.getLong( "id" );
        blog.setId( id_blog );
        blog.setNomArticle( resultSet.getString( "nom_article" ) );
        blog.setNomAuteur( resultSet.getString( "nom_auteur" ) );
        blog.setSubtheme( resultSet.getString( "subtheme" ) );
        blog.setDateEdition( resultSet.getTimestamp( "date_edition" ) );
        blog.setArticle1( resultSet.getString( "article1" ) );
        blog.setArticle2( resultSet.getString( "article2" ) );
        blog.setArticle3( resultSet.getString( "article3" ) );
        return blog;
    }

}
