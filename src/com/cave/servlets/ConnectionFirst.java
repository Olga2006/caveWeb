package com.cave.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet( "/connectionUser" )
public class ConnectionFirst extends HttpServlet {
    public static final String VUE_FIRST = "/WEB-INF/jsp/public/connectionFirst.jsp";

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {

        /* Affichage de la page de connexion */
        this.getServletContext().getRequestDispatcher( VUE_FIRST ).forward( request, response );

    }

}