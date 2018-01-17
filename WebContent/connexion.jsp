<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Connexion</title>
<link type="text/css" rel="stylesheet" href="inc/style.css" />
</head>
<body>
<form method="post" action=<c:url value="/connexion" /> >
	<fieldset>
		<legend>Connexion</legend>
        <p>Vous pouvez vous connecter via ce formulaire.</p>
		<label for="login">Login <span class="requis">*</span></label> 
		<input type="text" id="login" name="login"	value="<c:out value="${utilisateur.login}"/>" size="20" maxlength="60" /> 
		<span class="erreur">${form.erreurs['login']}</span>
		<br /> 		
		<label for="motdepasse">Mot de passe <span class="requis">*</span></label> 
		<input type="password" id="motdepasse" name="mdp" value="" size="20" maxlength="20" /> 
		<span class="erreur">${form.erreurs['mdp']}</span>		 
		<br /> <input type="submit" value="Connexion" class="sansLabel" /> 
		<br />
	</fieldset>
</form>
</body>
</html>