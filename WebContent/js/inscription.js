/**
 * 
 */

function validerPassword(password) {
	var error="";
	
	//test longueur password
	if(password.value.length < 8){
		error+="password min 8 caracteres\n"; //error=error+"password min 8 caracteres"
	}
	
	//test contient un chiffre
	if(password.value.match("[0-9]") == null){
		error+="le mot de passe doit contenir au moins un chiffre\n";
	}
	
	//affichage de l'erreur
	if(error != ""){
		alert(error);	
		//prompt(error, "titi");
		//var retour=confirm(error);
	}
	
}
function validerConfirmPassword(passwordConfirm) {
	var error="";
	//recuperation du password
	var password= document.querySelector("#password");
		
	//test password identique
	if(password.validity.valid == true && passwordConfirm.value != password.value){
		error+="password pas identique\n";
	}
}

function majVille(){
	//preparation de la requete ajax
	var xhr = new XMLHttpRequest();
	
	//preparation de la callback
	xhr.onreadystatechange = function(){
		if(this.readyState == 4 && this.status == 200){
			//on a un retour du serveur
			var villes =JSON.parse(this.responseText);
			var villeSelect=document.querySelector("#ville");
			var options="";
			for (let ville of villes) {
				options+="<option value='"+ville.value+"'>"+ville.label+"</option>";
			}
			villeSelect.innerHTML=options;
		}
	}
	//soumission de l requete
	xhr.open("GET", "ville.json", true);
	xhr.send();
}