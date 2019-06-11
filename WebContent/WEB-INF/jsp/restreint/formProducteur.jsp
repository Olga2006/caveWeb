<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="messages" />

<c:if test="${!empty form.unsuccessCreation}">
	<span class="erreur"><fmt:message
			key="producteurs.unsuccess.creation"></fmt:message>
		${form.unsuccessCreation}</span>
</c:if>
<c:if test="${!empty form.unsuccessMaj}">
	<span class="erreur"><fmt:message
			key="producteurs.unsuccess.maj"></fmt:message> ${form.unsuccessMaj}</span>
</c:if>

<c:if test="${!empty form.erreurs['erreurDaoProd']}">
	<span class="erreur"> <fmt:message key="erreur.dao"></fmt:message>
		${form.erreurs['erreurDaoProd']}
	</span>
</c:if>

<label for="nomP" class="labelformbouteille"><fmt:message
		key="producteurs.nom"></fmt:message><span class="requis">*</span> </label>
<span class="erreur"> <c:if
		test="${!empty form.erreurs['producteurExiste']}">
		<fmt:message key="producteurs.erreur.nomexistantefirst"></fmt:message>
		<c:out value="${form.erreurs['producteurExiste']}" />, <fmt:message
			key="producteurs.erreur.nomexistantesecond"></fmt:message>
	</c:if>
</span>
<c:out value="${requiredvar}"></c:out>

<input type="text" class="inputformbouteille w-input" maxlength="30"
	name="nomP" id="nomP" required="required" value="<c:out value="${producteur.nom}"/>" >

<label for="adresse" class="labelformbouteille"><fmt:message
		key="producteurs.adresse"></fmt:message></label>
<input type="text" class="inputformbouteille w-input" maxlength="80"
	name="adresse" data-name="adresse" id="adresse"
	value="<c:choose><c:when test="${!empty producteur.adresse}"><c:out value="${producteur.adresse}"/></c:when><c:otherwise><fmt:message key="producteurs.nonindique"></fmt:message></c:otherwise></c:choose>">

<label for="contact" class="labelformbouteille"><fmt:message
		key="producteurs.contact"></fmt:message></label>
<input type="text" class="inputformbouteille w-input" maxlength="20"
	name="contact" data-name="contact" id="contact"
	value="<c:choose><c:when test="${!empty producteur.contact}"><c:out value="${producteur.contact}"/></c:when><c:otherwise><fmt:message key="producteurs.nonindique"></fmt:message></c:otherwise></c:choose>">

