<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="messages"/>
<!DOCTYPE html>
<html data-wf-page="5c8a4e5935905d04eb6497f8"
	data-wf-site="5bf300026add22d3cd0f2499">
<head>
<meta charset="utf-8">
<title><fmt:message key="support.title"></fmt:message></title>
<jsp:include page="/WEB-INF/jsp/head/head.jsp"></jsp:include>
</head>
<body>

	
	<jsp:include page="/WEB-INF/jsp/nav/nav.jsp"></jsp:include>

		<div class="imgbv w-clearfix">
			<img src="images/vetka.png" alt="" class="vetkaimg">
			<div class="core">
				<div class="espase"></div>


<c:if test="${ !empty sessionUtilisateur}"><jsp:include page="/WEB-INF/jsp/left/left.jsp"></jsp:include></c:if>


				<div class="warningdel"><fmt:message key="support.bvmessage"></fmt:message></div>



				<div class="butformulairenreg">
					<div class="formblockconnectionsecond">
						<form id="email-form" name="email-form" 
							method="post" action="<c:url value="/support"></c:url>"
							class="formaconnectioninscription">

							<label for="nom" class="labelformbouteille"><fmt:message key="inscription.label.prenom"></fmt:message><span
								class="requis">*</span></label> <input type="text"
								class="inputformbouteille w-input" maxlength="30" name="nom"
								value="<c:out value="${utilisateur.nom}"/>" id="nom" required="required"> 
								 
								
								<label for="email"
								class="labelformbouteille"><strong class="labelform"><fmt:message key="connection.label.email"></fmt:message><span class="requis">*</span>
							</strong></label> 
							<input type="email" class="inputformbouteille w-input"
								maxlength="30" name="email" data-name="Email 5"
								value="<c:out value="${utilisateur.email}"/>" id="email" required="required">
							
							
							 <label
								for="commentaire" class="labelformbouteille"><fmt:message key="support.label.message"></fmt:message></label>
							<textarea id="message" name="messageSupport" style="width: 200px; height: 100px;"
								placeholder="<fmt:message key="support.placeholder.message"></fmt:message>" maxlength="2000"
								class="inputformbouteille w-input" required="required"></textarea>



							<input type="submit" value="<fmt:message key="button.envoyer"></fmt:message>"
								data-wait="<fmt:message key="button.wait"></fmt:message>" class="buttonstandart">
								<input
						type="reset" value="<fmt:message key="button.reinitialiser"></fmt:message>"
						data-wait="<fmt:message key="button.wait"></fmt:message>" class="buttonstandart" />
						</form>
						<%-- <span class="erreur">${form.resultat}</span> --%>
					</div>
				</div>
			</div>
		</div>



	<script
		src="https://d1tdp7z6w94jbb.cloudfront.net/js/jquery-3.3.1.min.js"
		type="text/javascript"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script src="js/jqcave.js" type="text/javascript"></script>
	<script src="js/jscave.js" type="text/javascript"></script>
	<!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
</body>
</html>