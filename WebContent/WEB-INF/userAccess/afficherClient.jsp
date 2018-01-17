<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Client en cours</title>
<link type="text/css" rel="stylesheet" href="inc/style.css" />
</head>
<c:import url="/inc/inc_menu.jsp" />
<body>
<p class="info"><c:out value="${messageAffichage}" /></p>
<c:if test="${!erreurSaisie}">	
	<p>Nom : <c:out value="${client.nom}" /></p>
	<p>Prénom : <c:out value="${client.prenom}" /></p>
	<p>Adresse de livraison : <c:out value="${client.adresse}" /></p>
	<p>Numéro de téléphone : <c:out value="${client.telephone}" /></p>
	<p>Adresse mail : <c:out value="${client.email}" /></p>
</c:if>
<br />
<span class="succes">${formClient.resultat}</span>
</body>
</html>