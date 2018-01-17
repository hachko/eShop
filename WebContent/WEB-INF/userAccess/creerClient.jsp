<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Création d'un client</title>
<link type="text/css" rel="stylesheet" href="inc/style.css" />
</head>
<body>
	<c:import url="/inc/inc_menu.jsp" />
	<form method="post" action="saisirClient" enctype="multipart/form-data">
		<c:import url="/inc/inc_client_form.jsp" />
		<input type="submit" value="Valider" /> <input type="reset"
			value="Remettre à zéro" /> <br />
	</form>
	<span class="erreur">${formClient.resultat}</span>
</body>
</html>