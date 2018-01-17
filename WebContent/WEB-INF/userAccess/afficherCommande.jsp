<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Commande en cours</title>
<link type="text/css" rel="stylesheet" href=<c:url value="inc/style.css" /> />
</head>
<body>
	<c:import url="/inc/inc_menu.jsp" />
	
			
	<span class="succes">${formCommande.resultat}</span>			
	<p><c:out value="INFOS CLIENT" /></p>
	<p><c:out value="Nom : ${commande.client.nom}" /></p>
	<p><c:out value=" Prénom : ${commande.client.prenom}" /></p>
	<p><c:out value="Adresse de livraison : ${commande.client.adresse}" /></p>
	<p><c:out value="Numéro de téléphone : ${commande.client.telephone}" /></p>
	<p><c:out value="Adresse mail : ${commande.client.email}" /></p>
	<br>
	<p><c:out value="INFOS COMMANDE : " /></p>
	<p><c:out value="Date de commande : ${commande.date}" /></p>
	<p><c:out value="Montant de la commande : ${commande.montant}" /></p>
	<p><c:out value="Mode de livraison : ${commande.modeLivraison}" /></p>
	<p><c:out value="Statut livraison : ${commande.statutLivraison}" /></p>
	<p><c:out value="Mode de paiement : ${commande.modePaiement}" /></p>
	<p><c:out value="Statut du paiement : ${commande.statutPaiement}" /></p>
	<br />
	

</body>
</html>