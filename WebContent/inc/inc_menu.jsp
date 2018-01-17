<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="contenant">
	<div class = "incMenu">
		<a href="<c:url value="/saisirClient"/>">Créer un nouveau client</a> <br>
		<a href="<c:url value="/saisirCommande"/>">Créer une nouvelle commande</a> <br>
		<a href="<c:url value="/listerClients"/>">Voir les clients existants</a> <br>
		<a href="<c:url value="/listerCommandes"/>">Voir les commandes existantes</a> <br>	
	</div>
	<div class = "incMenu">		 
		<a href="<c:url value="/deconnexion"/>">Déconnexion</a>		
	</div>
</div>