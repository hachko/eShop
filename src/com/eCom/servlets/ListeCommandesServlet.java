package com.eCom.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListeCommandesServlet extends HttpServlet{

	public static final String ATT_COMMANDE = "commande";
	public static final String ATT_FORM     = "form";

	public static final String VUE          = "/WEB-INF/userAccess/listerCommandes.jsp";

	public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		/* � la r�ception d'une requ�te GET, affichage de la liste des commandes */
		this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
	}

}
