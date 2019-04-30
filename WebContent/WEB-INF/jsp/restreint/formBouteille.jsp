<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<div class="descriptmainnomdansform">Voulez vous ajouter les
	données d'un Producteur pour cette bouteille ?</div>
	

<div class="choisprodexist w-radio">
	<input type="radio" id="choixAjouterProducteur"
		name="choixAjouterProducteur" value="ajouterProducteur"
		class="buttonchoisradio w-radio-input"
		<c:if test="${!empty producteur}">checked</c:if>> <label
		for="choixAjouterProducteur" class="labelformbouteille">Oui</label>
</div>

<div class="choisprodexist w-radio">
	<input type="radio" id="choixAjouterProducteur"
		name="choixAjouterProducteur" value="nonAjouterProducteur"
		class="buttonchoisradio w-radio-input"
		<c:if test="${empty producteur}">checked</c:if>> <label
		for="choixAjouterProducteur" class="labelformbouteille">Non</label>
</div>





<div id="ajouterProducteur"
	<c:choose>
<c:when test="${!empty producteur}">style="display: block"</c:when>
<c:otherwise>style="display: none"</c:otherwise>
</c:choose>>

	<div class="descriptmainnomdansform">Informations Producteur</div>
	<span class="erreur">${form.erreurs['choixNouveauProducteur']}</span>

	<c:if test="${ !empty sessionUtilisateur.producteurs }">
		<div class="descriptmainnomdansform" style="text-transform: none">Nouveau
			producteur ?</div>
	
		<div class="choisprodexist w-radio">
			<input type="radio" id="choixNouveauProducteur"
				name="choixNouveauProducteur" value="nouveauProducteur"
				class="buttonchoisradio w-radio-input" <c:if test="${empty producteur.id}">checked</c:if>> <label
				for="choixNouveauProducteur" class="labelformbouteille">Oui</label>
		</div>

		<div class="choisprodexist w-radio">
			<input type="radio" id="choixAncienProducteur"
				name="choixNouveauProducteur" value="ancienProducteur"
				class="buttonchoisradio w-radio-input" <c:if test="${!empty producteur.id}">checked</c:if>> <label
				for="choixAncienProducteur" class="labelformbouteille">Non</label>
		</div>


	</c:if>



	<div id="ancienProducteur"<c:choose>
<c:when test="${!empty producteur.id}">style="display: block"</c:when>
<c:otherwise>style="display: none"</c:otherwise>
</c:choose>>
		<select name="listeProducteurs" id="listeProducteurs"
			class="inputformbouteille w-input">

			<c:if test="${!empty producteur}">
				<option style="color: #faf5f4"
					value="<c:out value="${producteur.id}"/>"><c:out
						value="${producteur.nom}" /></option>
			</c:if>
			<option value="">Choisissez un producteur...</option>

			<c:forEach items="${ sessionUtilisateur.producteurs }" var="mapProducteurs">
				<option value="${ mapProducteurs.id }">${ mapProducteurs.nom }</option>
			</c:forEach>
		</select>
	</div>

	<div id="nouveauProducteur"<c:choose>
<c:when test="${empty producteur.id}">style="display: block"</c:when>
<c:otherwise>style="display: none"</c:otherwise>
</c:choose>>
		<jsp:include page="formProducteur.jsp"></jsp:include>
	</div>

</div>




<div class="descriptmainnomdansform">Informations bouteille</div>
<span class="erreur">${form.erreurs['bouteilleExiste']}</span>
<span class="erreur">${form.erreurs['erreurDao']}</span>









<label for="nom" class="labelformbouteille">Nom du vin<span
	class="requis">*</span></label>
<span class="erreur">${form.erreurs['nom']}</span>
<input type="text" class="inputformbouteille" 
	maxlength="60" name="nom" data-name="nom" id="nom"
	value="<c:out value="${bouteille.nom}"/>">



<div class="ciblechoice">
<label for="pays" class="labelformbouteille">Pays<span
	class="requis">*</span></label>
<span class="erreur">${form.erreurs['pays']}</span>
<input type="text" class="inputformbouteille" maxlength="30" name="pays" id="pays" value="<c:out value="${bouteille.pays}"/>" >
<div  class="divinputchoice" id="payschoice"  style="display: none;" >
</div>
</div>

<div class="ciblechoice">
<label for="region" class="labelformbouteille">Region<span
	class="requis">*</span></label>
<span class="erreur">${form.erreurs['region']}</span>
<input type="text" class="inputformbouteille" maxlength="60" name="region" id="region" value="<c:out value="${bouteille.region}"/>" >
<div  class="divinputchoice" id="regionchoice"  style="display: none;" >
<div  class="divchoice" data-name=""></div>
</div>
</div>

<div class="ciblechoice">
<label for="appelation" class="labelformbouteille">Appelation<span
	class="requis">*</span></label>
<span class="erreur">${form.erreurs['appelation']}</span>
<input type="text" class="inputformbouteille" maxlength="60" name="appelation" id="appelation" value="<c:out value="${bouteille.appelation}"/>" >
<div  class="divinputchoice" id="appelationchoice"  style="display: none;" >
</div>
</div>




<div >
<label for="cru" class="labelformbouteille">Classement<span
	class="requis">*</span></label>
<span class="erreur">${form.erreurs['cru']}</span>
<input type="text" class="inputformbouteille" maxlength="30" name="cru" id="cru" value="<c:out value="${bouteille.cru}"/>" >
<div  class="divinputchoice"  style="display: none;" >
<div  class="divchoice" >Grand Cru</div>
<div  class="divchoice">Premier Cru</div>
<div  class="divchoice">Cru Bourgeois</div>
<div  class="divchoice">Cru classé</div>
<div  class="divchoice">Non Classé</div> 
<div  class="divchoice">Village</div>

</div>
</div>




<div>
<label for="couleur" class="labelformbouteille">Couleur<span
	class="requis">*</span></label>
<span class="erreur">${form.erreurs['couleur']}</span>
<input type="text" class="inputformbouteille" maxlength="30" name="couleur" id="couleur" value="<c:out value="${bouteille.couleur}"/>" >
<div  class="divinputchoice"  style="display: none;" >
<div  class="divchoice">Rouge</div>
<div  class="divchoice">Blanc</div>
<div  class="divchoice">Jaune</div>
<div  class="divchoice">Rosé</div>
<div  class="divchoice">Effervescent</div> 
<div  class="divchoice">Liquoreux</div>
</div>
</div>



<div>
<label for="taille" class="labelformbouteille">Volume de la
	bouteille, cl<span class="requis">*</span>
</label>
<span class="erreur">${form.erreurs['taille']}</span>
<input type="number" class="inputformbouteille" maxlength="5" min="0" step="0.5" name="taille" id="taille" value="<c:out value="${bouteille.taille}"/>" >
<div  class="divinputchoice"  style="display: none;" >
<div  class="divchoice">37.5</div>
<div  class="divchoice">75</div>
<div  class="divchoice">150</div>
<div  class="divchoice">300</div>
<div  class="divchoice">500</div> 
<div  class="divchoice">600</div>
<div  class="divchoice">900</div>
<div  class="divchoice">1200</div>
<div  class="divchoice">1500</div> 
<div  class="divchoice">1800</div>
</div>
</div>

<label for="quantiteAchetert" class="labelformbouteille">Quantite
	à acheter</label>
<span class="erreur">${form.erreurs['quantiteAcheter']}</span>
<input type="number" min="0" maxlength="4" name="quantiteAcheter"
	id="quantiteAchetert" data-name="quantiteAcheter" class="inputformbouteille"
	value="<c:out value="${bouteille.nbrListCourses}"/>">

<label for="prixAchat" class="labelformbouteille">Prix d'achat,
	€</label>
<span class="erreur">${form.erreurs['prixAchat']}</span>
<input type="number" min="0.00" maxlength="11" step=0.01
	name="prixAchat" data-name="prixAchat" id="prixAchat"
	class="inputformbouteille"
	value="<c:out value="${bouteille.prixAchat}"/>">

<label for="prixActuelle" class="labelformbouteille">Prix
	actuelle, €</label>
<span class="erreur">${form.erreurs['prixActuelle']}</span>
<input type="number" name="prixActuelle" data-name="prixActuelle"
	id="prixActuelle" class="inputformbouteille"
	value="<c:out value="${bouteille.prixActuelle}"/>" min="0.00"
	maxlength="11" step=0.01 />

<label for="dateDeProduction" class="labelformbouteille">Millésime<span
	class="requis">*</span></label>
<span class="erreur">${form.erreurs['dateDeProduction']}</span>
<input type="number" name="dateDeProduction"
	data-name="dateDeProduction" id="dateDeProduction"
	class="inputformbouteille"
	value="<c:choose><c:when test="${!empty bouteille.dateDeProduction}"><c:out value="${ bouteille.dateDeProduction }"/></c:when><c:otherwise>2018</c:otherwise></c:choose>" min="1900"
	max="2018" >
<label for="dateGarder" class="labelformbouteille">Meilleur
	année de la consommation<span class="requis">*</span>
</label>
<span class="erreur">${form.erreurs['dateGarder']}</span>
<input type="number" name="dateGarder" data-name="dateGarder"
	id="dateGarder" class="inputformbouteille"
	value="<c:choose><c:when test="${!empty bouteille.dateGarder}"><c:out value="${bouteille.dateGarder}"/></c:when><c:otherwise>2019</c:otherwise></c:choose>" min="2019"
	maxlength="4">

<label for="evaluationt" class="labelformbouteille">Evaluation
	sur 5</label>
<span class="erreur">${form.erreurs['evaluation']}</span>
<input type="number" name="evaluation" data-name="evaluation"
	id="evaluationt" class="tabevaluation"
	value="<c:out  value="${ bouteille.evaluation }"/>" min="0" max="5"
	step="1" >

<label for="commentairet" class="labelformbouteille">Ajoutez
	Votre Commentaire</label>
<textarea id="commentairet" name="commentaire" placeholder="Vos commentaires" maxlength="2000"class="inputformbouteille w-input" value="<c:out value="${bouteille.commentaire}"/>"></textarea>
	
	




