<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="inc/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Liste des clients</title>
</head>
<c:import url="/inc/inc_menu.jsp" />
<body>
	<h1>Liste des clients :</h1>

	<table>
		<thead>
		<tr>
			<td>Nom</td>
			<td>Prénom</td>
			<td>Téléphone</td>
			<td>Adresse</td>
			<td>Email</td>
			<td>Image</td>
			<td class="action">Action</td>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="client" items="${sessionScope.clients}">
		<tr>
			<td><c:out value="${client.value.nom}" /></td>
			<td><c:out value="${client.value.prenom}" /></td>
			<td><c:out value="${client.value.telephone}" /></td>
			<td><c:out value="${client.value.adresse}" /></td>
			<td><c:out value="${client.value.email}" /></td>
						
			<c:url value="/fichiers/" var="imageClientUrl" scope="request">
			</c:url>
			<td class="action" align="center"><b><a href="${imageClientUrl}${client.value.image}"> Voir </a></b></td>
			
			<c:url value="/suppressionClient" var="suppClientUrl" scope="request">
				<c:param name="nomClient" value="${client.key}" />
			</c:url>
			<td class="action" align="center"><b><a href="${suppClientUrl}"> X </a></b></td>
		</tr>			
		</c:forEach>		
		</tbody>
	</table>

</body>
</html>