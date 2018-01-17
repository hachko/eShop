/**
 * Fonctions utiles à la gestion des champs dans le menu commande
 */


/*Fonction Main : récupération de la valeur sélectionnée dans le combo */
function majChamps() {	
	
	//récupération de la valeur du bouton radio sélectionné
	var newClient = document.getElementById("clientNouveau").checked;
	if(newClient) {
		document.getElementById("infosClient").style.visibility="visible";
		document.getElementById("comboClient").style.visibility="hidden";
	} else {
		document.getElementById("infosClient").style.visibility="hidden";
		document.getElementById("comboClient").style.visibility="visible";
	}
}


