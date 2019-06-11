package com.cave.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet( "/changerLanguage" )
public class ChangeLanguage extends HttpServlet {

    public static final String PARAM_LANGUAGE      = "language";
    public static final String PARAM_LOCATION_HREF = "locationhref";
    public static final String ATT_LANGUAGE        = "language";

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        String language = getValeurParametre( request, PARAM_LANGUAGE );
        String locationhref = getValeurParametre( request, PARAM_LOCATION_HREF );
        HttpSession session = request.getSession();
        session.setAttribute( ATT_LANGUAGE, language );
        response.sendRedirect( locationhref );

    }

    private static String getValeurParametre( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur;
        }
    }
}