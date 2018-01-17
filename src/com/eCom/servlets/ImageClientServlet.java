package com.eCom.servlets;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ImageClientServlet extends HttpServlet {

	private static final int DEFAULT_BUFFER_SIZE = 10240; // 10 ko
	private static final int TAILLE_TAMPON = 10240;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String chemin = this.getServletConfig().getInitParameter("chemin");
		String fichierRequis = request.getPathInfo();
		
		if(fichierRequis.equals("/") || fichierRequis==null ) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		
		fichierRequis = URLDecoder.decode(fichierRequis,"UTF-8");
		File fichier = new File(chemin,fichierRequis);
		
		if(!fichier.exists()){
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		
		
		response.reset();
	    response.setBufferSize( DEFAULT_BUFFER_SIZE );
	    response.setContentType( "image" );
	    response.setHeader( "Content-Length", String.valueOf( fichier.length() ) );
	    response.setHeader( "Content-Disposition", "inline; filename=\"" + fichier.getName() + "\"" );
	    
	    BufferedInputStream entree = null;
	    BufferedOutputStream sortie = null;
	    try {
	        /* Ouvre les flux */
	        entree = new BufferedInputStream( new FileInputStream( fichier ), TAILLE_TAMPON );
	        sortie = new BufferedOutputStream( response.getOutputStream(), TAILLE_TAMPON );
	     
	        /* Lit le fichier et écrit son contenu dans la réponse HTTP */
	        byte[] tampon = new byte[TAILLE_TAMPON];
	        int longueur;
	        while ( ( longueur= entree.read( tampon ) ) > 0 ) {
	            sortie.write( tampon, 0, longueur );
	        }
	        
	    } finally {
	        try {
	            sortie.close();
	        } catch ( IOException ignore ) {
	        }
	        try {
	            entree.close();
	        } catch ( IOException ignore ) {
	        }
	    }
		
		
	}
}
