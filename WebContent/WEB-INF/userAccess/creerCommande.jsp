<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Création d'une commande</title>
<link type="text/css" rel="stylesheet" href=<c:url value="inc/style.css" /> />
<script type="text/javascript" src="inc/scripts/menuCommande.js"></script>
</head>
<body>
<c:import url="/inc/inc_menu.jsp" />
	<div>	
	<form method="post" action="saisirCommande" enctype="multipart/form-data">
		<div>
			<span>				
				<input type="radio" name="saisieClient" value="nouveau" id="clientNouveau" onClick="majChamps()" checked> Nouveau client <br />
				<input type="radio" name="saisieClient" value ="existant" id="clientExistant" onClick="majChamps()"> Client existant 			
			</span>
		
			<span id="comboClient" style="visibility:hidden">
				<select name=nomClientExistant>			
					<c:forEach var="clientCombo" items="${sessionScope.clients}">
						<option value="${clientCombo.key}"><c:out value="${clientCombo.value.nom} ${clientCombo.value.prenom}"/></option>
					</c:forEach>
				</select>
			</span>
		</div>
			
		
		<c:set var="client" value="${commande.client}" scope="request" />				
		
		<c:import url="/inc/inc_client_form.jsp" />
		<fieldset>
			<legend>Informations commande</legend>
			<label for="dateCommande">Date</label>
			<input type="text" id="dateCommande" name="dateCommande" value="<c:out value="${commande.date}" />" size="20" maxlength="20" disabled/>
			<br /> 
			<label for="montantCommande">Montant <span class="requis">*</span></label>
			<input type="text" id="montantCommande" name="montantCommande" value="<c:out value="${commande.montant}" />" size="20" maxlength="20" />
			<span class="erreur">${formCommande.erreurs['montantCommande']}</span>
			<br /> 
			<label for="modePaiementCommande">Mode de paiement <span class="requis">*</span></label> 
			<input type="text" id="modePaiementCommande" name="modePaiementCommande" value="<c:out value="${commande.modePaiement}" />" size="20" maxlength="20" />
			<span class="erreur">${formCommande.erreurs['modePaiementCommande']}</span> 
			<br /> 
			<label for="statutPaiementCommande">Statut du paiement</label> 
			<input type="text" id="statutPaiementCommande" name="statutPaiementCommande" value="<c:out value="${commande.statutPaiement}" />" size="20" maxlength="20" />
			<span class="erreur">${formCommande.erreurs['statutPaiementCommande']}</span>
			<br /> 
			<label for="modeLivraisonCommande">Mode de livraison <span class="requis">*</span> </label> 
			<input type="text" id="modeLivraisonCommande" name="modeLivraisonCommande" value="<c:out value="${commande.modeLivraison}" />" size="20" maxlength="20" />
			<span class="erreur">${formCommande.erreurs['modeLivraisonCommande']}</span>
			<br /> 
			<label for="statutLivraisonCommande">Statut de la livraison</label> 
			<input type="text" id="statutLivraisonCommande" name="statutLivraisonCommande" value="<c:out value="${commande.statutLivraison}" />" size="20" maxlength="20" />
			<span class="erreur">${formCommande.erreurs['statutLivraisonCommande']}</span>
			<br />
		</fieldset>
		<input type="submit" value="Valider" /> <input type="reset" value="Remettre à zéro" /> 
		<br />
		</form>
		<span class="erreur">${formCommande.resultat}</span>
	</div>
</body>
</html>