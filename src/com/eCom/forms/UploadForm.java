package com.eCom.forms;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import eu.medsea.mimeutil.MimeUtil;


public class UploadForm {

	//variables statiques relatives à l'upload
	
	private static final String CHAMP_FICHIER     = "imageClient";
	private static final int    TAILLE_TAMPON     = 10240;                        // 10 ko
	
	private Map<String, String> erreurs = new HashMap<String,String>();	
	
	private String resultat;

	public String enregistrerFichier( HttpServletRequest request, String chemin ) {
		
		String nomFichier = null;
		InputStream contenuFichier = null;
		try {
			
			Part part = request.getPart( CHAMP_FICHIER );			
			
			nomFichier = getNomFichier( part );

		
			if ( nomFichier != null && !nomFichier.isEmpty() ) {
				/*
				 * Antibug pour Internet Explorer
				 */
				nomFichier = nomFichier.substring( nomFichier.lastIndexOf( '/' ) + 1 )
						.substring( nomFichier.lastIndexOf( '\\' ) + 1 );

				/* Récupération du contenu du fichier */
				contenuFichier = part.getInputStream();

			}
		} catch ( IllegalStateException e ) {
		
			setErreur( CHAMP_FICHIER, "Les données envoyées sont trop volumineuses." );
		} catch ( IOException e ) {
		
			e.printStackTrace();
			setErreur( CHAMP_FICHIER, "Erreur de configuration du serveur." );
		} catch ( ServletException e ) {
			/*
			 pirate ! :|
			 */
			e.printStackTrace();
			setErreur( CHAMP_FICHIER,
					"Ce type de requête n'est pas supporté, merci d'utiliser le formulaire prévu pour envoyer votre fichier." );
		}	

		catch(Exception e) {
			e.printStackTrace();
			setErreur( CHAMP_FICHIER, "Autre type d'erreur liée au fichier");
		}
		
		

		/* Si aucune erreur n'est survenue jusqu'à présent */
		if ( erreurs.isEmpty() ) {
			/* Validation du champ fichier. */
			try {
				validationFichier( nomFichier, contenuFichier );
			} catch ( Exception e ) {
				setErreur( CHAMP_FICHIER, e.getMessage() );
			}
			
		}

		/* Si aucune erreur n'est survenue jusqu'à présent */
		if ( erreurs.isEmpty() ) {
			/*
			 * Gestion du type MIME
			 * */
			MimeUtil.registerMimeDetector( "eu.medsea.mimeutil.detector.MagicMimeMimeDetector" );
			Collection<?> mimeTypes = MimeUtil.getMimeTypes(contenuFichier);
			if ( !mimeTypes.toString().startsWith("image") ) {
				setErreur(CHAMP_FICHIER,"le type mime du fichier doit être une image");
			} else {
				
				/* Écriture du fichier sur le disque */
				try {
					ecrireFichier( contenuFichier, nomFichier, chemin );
				} catch ( Exception e ) {
					setErreur( CHAMP_FICHIER, "Erreur lors de l'écriture du fichier sur le disque." );
				}
				
			}
			
		}

		/* Initialisation du résultat global de la validation. */
		if ( erreurs.isEmpty() ) {
			setResultat("Succès de l'envoi du fichier.");
		} else {
			setResultat("Échec de l'envoi du fichier.");
		}

		return nomFichier;
	}

	private void ecrireFichier( InputStream contenu, String nomFichier, String chemin ) throws Exception {
		/* Prépare les flux. */
		BufferedInputStream entree = null;
		BufferedOutputStream sortie = null;
		try {
			/* Ouvre les flux. */
			entree = new BufferedInputStream( contenu, TAILLE_TAMPON );
			sortie = new BufferedOutputStream( new FileOutputStream( new File( chemin + nomFichier ) ),
					TAILLE_TAMPON );

			/*
			 * Lit le fichier reçu et écrit son contenu dans un fichier sur le
			 * disque.
			 */
			byte[] tampon = new byte[TAILLE_TAMPON];
			int longueur = 0;
			while ( ( longueur = entree.read( tampon ) ) > 0 ) {
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

	/*
	 * Méthode utilitaire qui a pour but d'analyser l'en-tête
	 * "content-disposition"
	 */
	private static String getNomFichier( Part part ) {
		/* Boucle sur chacun des paramètres de l'en-tête "content-disposition". */
		for ( String contentDisposition : part.getHeader( "content-disposition" ).split( ";" ) ) {
			/* Recherche de l'éventuelle présence du paramètre "filename". */
			if ( contentDisposition.trim().startsWith( "filename" ) ) {
				/*
				 * Si "filename" est présent, alors renvoi de sa valeur,
				 * c'est-à-dire du nom de fichier sans guillemets.
				 */
				return contentDisposition.substring( contentDisposition.indexOf( '=' ) + 1 ).trim().replace( "\"", "" );
			}
		}
		/* Et pour terminer, si rien n'a été trouvé... */
		return null;
	}
	
	/*
	 * Méthode utilitaire qui retourne null si un champ est vide, et son contenu
	 * sinon.
	 */
	private static String getValeurChamp( HttpServletRequest request, String nomChamp ) {
		String valeur = request.getParameter( nomChamp );
		if ( valeur == null || valeur.trim().length() == 0 ) {
			return null;
		} else {
			return valeur;
		}
	}

	/*
	 * Ajoute un message correspondant au champ spécifié à la map des erreurs.
	 */
	private void setErreur( String champ, String message ) {
		erreurs.put( champ, message );
	}
	
	/*
	 * Valide le fichier envoyé.
	 */
	private void validationFichier( String nomFichier, InputStream contenuFichier ) throws Exception {
		if ( nomFichier == null || contenuFichier == null ) {
			throw new Exception( "Merci de sélectionner un fichier à envoyer." );
		}
	}
	

	public void setResultat(String resultat) {
		this.resultat = resultat;
	}

	public Map<String, String> getErreurs() {
		return this.erreurs;
	}

}
