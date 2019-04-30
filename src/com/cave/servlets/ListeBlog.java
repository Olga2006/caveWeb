package com.cave.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cave.beans.Blog;
import com.cave.dao.BlogDao;
import com.cave.dao.DAOFactory;

@WebServlet( "/blog" )
public class ListeBlog extends HttpServlet {

    public static final String VUE                 = "/WEB-INF/jsp/public/afficherBlog.jsp";
    public static final String ATT_BLOG            = "blogs";
    public static final String PARAM_SESSION_BLOGS = "sessionBlogs";
    public static final String CONF_DAO_FACTORY    = "daofactory";
    private BlogDao            blogDao;

    public void init() throws ServletException {
        /* Récupération d'une instance de notre DAO Producteur */
        this.blogDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getBlogDao();

    }

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<Blog> sessionBlogs = (List<Blog>) session.getValue( PARAM_SESSION_BLOGS );
        if ( sessionBlogs != null ) {
            request.setAttribute( ATT_BLOG, sessionBlogs );
        } else {
            List<Blog> blogs = blogDao.lister();
            session.setAttribute( ATT_BLOG, blogs );
        }

        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );

    }
}