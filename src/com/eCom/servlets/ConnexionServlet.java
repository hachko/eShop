package com.eCom.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eCom.beans.Utilisateur;
import com.eCom.forms.ConnexionForm;

public class ConnexionServlet extends HttpServlet {
	public static final String ATT_USER         = "utilisateur";
	public static final String ATT_FORM         = "form";
	public static final String ATT_SESSION_USER = "sessionUtilisateur";
	public static final String VUE_CONNEXION              = "/WEB-INF/connexion.jsp";
	public static final String VUE_SAISIE_CLIENT = "/WEB-INF/userAccess/creerClient.jsp";

	public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		/* Affichage de la page de connexion */
		this.getServletContext().getRequestDispatcher( VUE_CONNEXION ).forward( request, response );
	}

	public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		/* Pr�paration de l'objet formulaire */
		ConnexionForm form = new ConnexionForm();

		/* Traitement de la requ�te et r�cup�ration du bean en r�sultant */
		Utilisateur utilisateur = form.connecterUtilisateur( request );
		
		/* Stockage du formulaire et du bean dans l'objet request */
		request.setAttribute( ATT_FORM, form );
		request.setAttribute( ATT_USER, utilisateur );

		/* R�cup�ration de la session depuis la requ�te */
		HttpSession session = request.getSession();
		
		/* variable pour stocker la bonne vue vers laquelle dispatcher */
		String vue;

		/**
		 * Si aucune erreur de validation n'a eu lieu, alors ajout du bean
		 * Utilisateur � la session, sinon suppression du bean de la session.
		 */
		if ( form.getErreurs().isEmpty() ) {
			session.setAttribute( ATT_SESSION_USER, utilisateur );
			vue = VUE_SAISIE_CLIENT;
		} else {
			session.setAttribute( ATT_SESSION_USER, null );
			vue = VUE_CONNEXION;
		}

	

		this.getServletContext().getRequestDispatcher(vue).forward( request, response );
	}
}
