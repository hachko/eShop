<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" rel="stylesheet" href="inc/style.css" />
<title>Liste des commandes en cours</title>
</head>
<c:import url="/inc/inc_menu.jsp" />
<body>
	<h1>Liste des commandes :</h1>

	<table>
		<thead>
		<tr>
			<td>Nom Client</td>
			<td>Date</td>
			<td>Montant</td>
			<td>Mode de paiement</td>
			<td>Statut de paiement</td>
			<td>Mode de livraison</td>
			<td>Statut de livraison</td>
			<td class="action">Action</td>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="commande" items="${sessionScope.commandes}">
		<tr>
			<td><c:out value="${commande.value.client.nom}" /></td>
			<td><c:out value="${commande.key}" /></td>
			<td><c:out value="${commande.value.montant}" /></td>
			<td><c:out value="${commande.value.modePaiement}" /></td>
			<td><c:out value="${commande.value.statutPaiement}" /></td>
			<td><c:out value="${commande.value.modeLivraison}" /></td>
			<td><c:out value="${commande.value.statutLivraison}" /></td>
			<c:url value="/suppressionCommande" var="suppCommandeUrl" scope="request">
				<c:param name="dateCommande" value="${commande.key}" />
			</c:url>
			<td class="action" align="center"><b><a href="${suppCommandeUrl}"> X </a></b></td>
		</tr>			
		</c:forEach>		
		</tbody>
	</table>

</body>
</html>