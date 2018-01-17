<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div>
	<fieldset id="infosClient">
		<legend>Informations Client</legend>
		<label for="nomClient">Nom <span class="requis">*</span></label> 
		<input type="text" class="champClient" id="nomClient" name="nomClient" value="<c:out value="${client.nom}" />" size="20" maxlength="20" />
		<span class="erreur">${formClient.erreurs['nomClient']}</span>
		<br /> 
		<label for="prenomClient">Prénom </label>
		<input type="text" class="champClient" id="prenomClient" name="prenomClient" value="<c:out value="${client.prenom}" />" size="20" maxlength="20" />
		<span class="erreur">${formClient.erreurs['prenomClient']}</span> 
		<br /> 
		<label for="adresseClient">Adresse de livraison <span class="requis">*</span></label>
		<input type="text" class="champClient" id="adresseClient" name="adresseClient" value="<c:out value="${client.adresse}" />" size="20" maxlength="20" /> 
		<span class="erreur">${formClient.erreurs['adresseClient']}</span>
		<br /> 
		<label for="telephoneClient">Numéro de téléphone <span class="requis">*</span></label> 
		<input type="text" class="champClient" id="telephoneClient" name="telephoneClient" value="<c:out value="${client.telephone}" />" size="20" maxlength="20" /> 
		<span class="erreur">${formClient.erreurs['telephoneClient']}</span>
		<br /> 
		<label for="emailClient">Adresse mail</label>		
		<input type="text" class="champClient" id="emailClient" name="emailClient" value="<c:out value="${client.email}" />" size="20" maxlength="60" />		
		<span class="erreur">${formClient.erreurs['emailClient']}</span>
		<br />
		<label for="imageClient">Image client</label>
		<input type="file" class="champClient" id="imageClient" name="imageClient" value="<c:out value="${client.image }" />" size="20" maxlength="60" />
		<span class="erreur">${formClient.erreurs['imageClient']}</span>
	</fieldset>
</div>
