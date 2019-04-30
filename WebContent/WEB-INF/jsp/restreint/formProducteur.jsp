<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<span class="erreur">${form.erreurs['producteurExiste']}</span>
<label for="nomP" class="labelformbouteille">Nom de
	Producteur <span class="requis">*</span>
</label>
<span class="erreur">${form.erreurs['nomP']}</span>
<input type="text" class="inputformbouteille w-input" 
	maxlength="30" name="nomP" id="nomP"
	value="<c:out value="${producteur.nom}"/>">

<label for="adresse" class="labelformbouteille">Adresse</label>
<input type="text" class="inputformbouteille w-input" 
	maxlength="80" name="adresse" data-name="adresse" id="adresse"
	value="<c:out value="${producteur.adresse}"/>">

<label for="contact" class="labelformbouteille">Contact</label>
<input type="text" class="inputformbouteille w-input" 
	maxlength="20" name="contact" data-name="contact" id="contact"
	value="<c:out value="${producteur.contact}"/>">
<span class="erreur">${form.erreurs['erreurDaoProd']}</span>
