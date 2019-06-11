<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="messages" />
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy" />
<!DOCTYPE html>

<div class="descriptmainnomdansform">
	<fmt:message key="bouteilles.voulezvousajouterproducteur"></fmt:message>
</div>


<div class="choisprodexist w-radio">
	<input type="radio" id="choixAjouterProducteur"
		name="choixAjouterProducteur" value="ajouterProducteur"
		class="buttonchoisradio w-radio-input"
		<c:if test="${!empty producteur}">checked</c:if>> <label
		for="choixAjouterProducteur" class="labelformbouteille"><fmt:message
			key="bouteilles.producteur.oui"></fmt:message></label>
</div>

<div class="choisprodexist w-radio">
	<input type="radio" id="choixAjouterProducteur"
		name="choixAjouterProducteur" value="nonAjouterProducteur"
		class="buttonchoisradio w-radio-input"
		<c:if test="${empty producteur}">checked</c:if>> <label
		for="choixAjouterProducteur" class="labelformbouteille"><fmt:message
			key="bouteilles.producteur.non"></fmt:message></label>
</div>





<div id="ajouterProducteur"
	<c:choose>
<c:when test="${!empty producteur}">style="display: block"</c:when>
<c:otherwise>style="display: none"</c:otherwise>
</c:choose>>

	<div class="descriptmainnomdansform">
		<fmt:message key="bouteilles.informationsproducteur"></fmt:message>
	</div>


	<c:if test="${ !empty form.erreurs['choixNouveauProducteur'] }">
		<span class="erreur"><fmt:message
				key="bouteilles.erreur.choixNouveauProducteur"></fmt:message></span>
	</c:if>

	<c:if test="${ !empty sessionUtilisateur.producteurs }">
		<div class="descriptmainnomdansform" style="text-transform: none">
			<fmt:message key="bouteilles.nouveauproducteur"></fmt:message>
		</div>

		<div class="choisprodexist w-radio">
			<input type="radio" id="choixNouveauProducteur"
				name="choixNouveauProducteur" value="nouveauProducteur"
				class="buttonchoisradio w-radio-input"
				<c:if test="${empty producteur.id}">checked</c:if>> <label
				for="choixNouveauProducteur" class="labelformbouteille"><fmt:message
					key="bouteilles.producteur.oui"></fmt:message></label>
		</div>

		<div class="choisprodexist w-radio">
			<input type="radio" id="choixAncienProducteur"
				name="choixNouveauProducteur" value="ancienProducteur"
				class="buttonchoisradio w-radio-input"
				<c:if test="${!empty producteur.id}">checked</c:if>> <label
				for="choixAncienProducteur" class="labelformbouteille"><fmt:message
					key="bouteilles.producteur.non"></fmt:message></label>
		</div>


	</c:if>



	<div id="ancienProducteur"
		<c:choose>
<c:when test="${!empty producteur.id}">style="display: block"</c:when>
<c:otherwise>style="display: none"</c:otherwise>
</c:choose>>
		<select name="listeProducteurs" id="listeProducteurs"
			class="inputformbouteille">

			<c:if test="${!empty producteur}">
				<option class="inputformbouteille" style="color: #faf5f4"
					value="<c:out value="${producteur.id}"/>"><c:out
						value="${producteur.nom}" /></option>
			</c:if>
			<option class="inputformbouteille" value=""><fmt:message
					key="bouteilles.choisissezproducteur"></fmt:message></option>

			<c:forEach items="${ sessionUtilisateur.producteurs }"
				var="mapProducteurs">
				<option class="inputformbouteille" value="${ mapProducteurs.id }">${ mapProducteurs.nom }</option>
			</c:forEach>
		</select>
	</div>

	<div id="nouveauProducteur"
		<c:choose>
<c:when test="${empty producteur.id}">style="display: block"</c:when>
<c:otherwise>style="display: none"</c:otherwise>
</c:choose>>
		<jsp:include page="formProducteur.jsp"></jsp:include>
	</div>

</div>


<div class="descriptmainnomdansform">
	<fmt:message key="bouteilles.informationsbouteille"></fmt:message>
</div>

<c:if test="${!empty form.unsuccessCreationB}">
	<span class="erreur"><fmt:message
			key="bouteilles.unsuccess.creation"></fmt:message>
		${form.unsuccessCreationB}</span>
</c:if>

<c:if test="${!empty form.unsuccessMajB}">
	<span class="erreur"><fmt:message key="bouteilles.unsuccess.maj"></fmt:message>
		${form.unsuccessMajB}</span>
</c:if>

<c:if test="${ !empty form.erreurs['bouteilleExiste']}">
	<span class="erreur"><fmt:message
			key="bouteilles.erreur.nomexistantefirst"></fmt:message>
		${form.erreurs['bouteilleExiste']} <fmt:message
			key="bouteilles.erreur.nomexistantesecond"></fmt:message></span>
</c:if>

<c:if test="${ !empty form.erreurs['erreurDaoBouteille']}">
	<span class="erreur"><fmt:message key="erreur.dao"></fmt:message>
		${form.erreurs['erreurDaoBouteille']}</span>
</c:if>

<label for="nom" class="labelformbouteille"><fmt:message
		key="bouteilles.nom"></fmt:message><span class="requis">*</span></label>
<input type="text" required="required" class="inputformbouteille"
	maxlength="60" name="nom" data-name="nom" id="nom"
	value="<c:out value="${bouteille.nom}"/>">

<div class="ciblechoice">
	<label for="pays" class="labelformbouteille"><fmt:message
			key="bouteilles.pays"></fmt:message><span class="requis">*</span></label> <input
		type="text" required="required" class="inputformbouteille"
		maxlength="30" name="pays" id="pays"
		value="<c:out value="${bouteille.pays}"/>">
	<div class="divinputchoice" id="payschoice" style="display: none;">
	</div>
</div>

<div class="ciblechoice">
	<label for="region" class="labelformbouteille"><fmt:message
			key="bouteilles.region"></fmt:message><span class="requis">*</span></label> <input
		type="text" required="required" class="inputformbouteille"
		maxlength="60" name="region" id="region"
		value="<c:out value="${bouteille.region}"/>">
	<div class="divinputchoice" id="regionchoice" style="display: none;">
		<div class="divchoice" data-name=""></div>
	</div>
</div>

<div class="ciblechoice">
	<label for="appelation" class="labelformbouteille"><fmt:message
			key="bouteilles.appelation"></fmt:message><span class="requis">*</span></label>
	<input type="text" required="required" class="inputformbouteille"
		maxlength="60" name="appelation" id="appelation"
		value="<c:out value="${bouteille.appelation}"/>">
	<div class="divinputchoice" id="appelationchoice"
		style="display: none;"></div>
</div>

<div>
	<label for="cru" class="labelformbouteille"><fmt:message
			key="bouteilles.classement"></fmt:message><span class="requis">*</span></label>
	<input type="text" required="required" class="inputformbouteille"
		maxlength="30" name="cru" id="cru"
		value="<c:choose><c:when test="${!empty bouteille.cru}"><c:out value="${bouteille.cru}"/></c:when><c:otherwise>Grand Cru</c:otherwise></c:choose>">
	<div class="divinputchoice" style="display: none;">
		<div class="divchoice">Grand Cru</div>
		<div class="divchoice">Premier Cru</div>
		<div class="divchoice">Cru Bourgeois</div>
		<div class="divchoice">Cru Classé</div>
		<div class="divchoice">Non Classé</div>
		<div class="divchoice">Village</div>
	</div>
</div>

<div>
	<label for="couleur" class="labelformbouteille"><fmt:message
			key="bouteilles.couleur"></fmt:message><span class="requis">*</span></label>
	<input type="text" required="required" class="inputformbouteille"
		maxlength="30" name="couleur" id="couleur"
		value="<c:choose><c:when test="${!empty bouteille.couleur}"><c:out value="${bouteille.couleur}"/></c:when><c:otherwise>Rouge</c:otherwise></c:choose>">
	<div class="divinputchoice" style="display: none;">
		<div class="divchoice"><fmt:message key="caves.title.rouge"></fmt:message></div>
		<div class="divchoice"><fmt:message key="caves.title.blanc"></fmt:message></div>
		<div class="divchoice"><fmt:message key="caves.title.jaune"></fmt:message></div>
		<div class="divchoice"><fmt:message key="caves.title.rose"></fmt:message></div>
		<div class="divchoice"><fmt:message key="caves.title.effervescent"></fmt:message></div>
		<div class="divchoice"><fmt:message key="caves.title.liquoreux"></fmt:message></div>
	</div>
</div>

<div>
	<label for="taille" class="labelformbouteille"><fmt:message
			key="bouteilles.taille"></fmt:message><span class="requis">*</span> </label>
	<input type="number" required="required" class="inputformbouteille"
		maxlength="7" min="0" step="0.001" name="taille" id="taille"
		value="<c:choose><c:when test="${!empty bouteille.taille}"><c:out value="${bouteille.taille}"/></c:when><c:otherwise>0.75</c:otherwise></c:choose>">
	<div class="divinputchoice" style="display: none;">
		<div class="divchoice">0.375</div>
		<div class="divchoice">0.75</div>
		<div class="divchoice">1.5</div>
		<div class="divchoice">3</div>
		<div class="divchoice">5</div>
		<div class="divchoice">6</div>
		<div class="divchoice">9</div>
		<div class="divchoice">12</div>
		<div class="divchoice">15</div>
		<div class="divchoice">18</div>
	</div>
</div>

<label for="quantiteAchetert" class="labelformbouteille"><fmt:message
		key="bouteilles.quantiteAcheter"></fmt:message></label>
<input type="number" min="0" maxlength="4" name="quantiteAcheter"
	id="quantiteAchetert" data-name="quantiteAcheter"
	class="inputformbouteille"
	value="<c:choose><c:when test="${!empty bouteille.nbrListCourses}"><c:out value="${bouteille.nbrListCourses}"/></c:when><c:otherwise>0</c:otherwise></c:choose>">

<label for="prixAchat" class="labelformbouteille"><fmt:message
		key="bouteilles.prixAchat"></fmt:message>,€</label>
<input type="number" min="0.00" maxlength="11" step=0.01
	name="prixAchat" data-name="prixAchat" id="prixAchat"
	class="inputformbouteille"
	value="<c:choose><c:when test="${!empty bouteille.prixAchat}"><c:out value="${bouteille.prixAchat}"/></c:when><c:otherwise>0.00</c:otherwise></c:choose>">

<label for="prixActuelle" class="labelformbouteille"><fmt:message
		key="bouteilles.prixActuelle"></fmt:message>, €</label>
<input type="number" name="prixActuelle" data-name="prixActuelle"
	id="prixActuelle" class="inputformbouteille"
	value="<c:choose><c:when test="${!empty bouteille.prixActuelle}"><c:out value="${bouteille.prixActuelle}"/></c:when><c:otherwise>0.00</c:otherwise></c:choose>"
	min="0.00" maxlength="11" step=0.01 />

<label for="dateDeProduction" class="labelformbouteille"><fmt:message
		key="bouteilles.dateDeProduction"></fmt:message><span class="requis">*</span></label>
<input type="number" required="required" name="dateDeProduction"
	data-name="dateDeProduction" id="dateDeProduction"
	class="inputformbouteille"
	value="<c:choose><c:when test="${!empty bouteille.dateDeProduction}"><c:out value="${ bouteille.dateDeProduction }"/></c:when><c:otherwise>${year}</c:otherwise></c:choose>"
	min="1900" max="${year}">

<label for="dateGarder" class="labelformbouteille"><fmt:message
		key="bouteilles.dateGarder"></fmt:message><span class="requis">*</span>
</label>
<input type="number" required="required" name="dateGarder"
	data-name="dateGarder" id="dateGarder" class="inputformbouteille"
	value="<c:choose><c:when test="${!empty bouteille.dateGarder}"><c:out value="${bouteille.dateGarder}"/></c:when><c:otherwise>${year}</c:otherwise></c:choose>"
	min="${year}" maxlength="4">

<label for="evaluationt" class="labelformbouteille"><fmt:message
		key="bouteilles.evaluation"></fmt:message></label>
<input type="number" name="evaluation" data-name="evaluation"
	id="evaluationt" class="tabevaluation"
	value="<c:choose><c:when test="${!empty bouteille.evaluation}"><c:out value="${bouteille.evaluation}"/></c:when><c:otherwise>5</c:otherwise></c:choose>"
	min="0" max="5" step="1">

<label for="commentairet" class="labelformbouteille"><fmt:message
		key="bouteilles.commentaire"></fmt:message></label>
<textarea id="commentairet" name="commentaire"
	placeholder="<fmt:message key="bouteilles.commentaire.placeholder"></fmt:message>"
	maxlength="2000" class="inputformbouteille w-input"><c:out
		value="${bouteille.commentaire}" /></textarea>






