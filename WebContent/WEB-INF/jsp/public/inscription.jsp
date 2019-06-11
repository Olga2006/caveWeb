<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="messages"/>
<!DOCTYPE html>
<html data-wf-page="5c8a4e5935905d04eb6497f8"
	data-wf-site="5bf300026add22d3cd0f2499">
<head>
<meta charset="utf-8">
<title><fmt:message key="inscription.title"></fmt:message></title>
<jsp:include page="/WEB-INF/jsp/head/head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/nav/nav.jsp"></jsp:include>

	<div class="imgbv w-clearfix">
		<img src="images/vetka.png" alt="" class="vetkaimg">
		<div class="core">
			<div class="espase"></div>
			<img src="images/zolotoy_kluch-600x190.png"
				style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0DEG) rotateY(0) rotateZ(0) skew(0, 0); 
				-moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0DEG) rotateY(0) rotateZ(0) skew(0, 0); 
				-ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0DEG) rotateY(0) rotateZ(0) skew(0, 0); 
				transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0DEG) rotateY(0) rotateZ(0) skew(0, 0); 
				transform-style: preserve-3d"
				alt="" class="keyimg">
				
		
				
				
				<div class="erreur"><fmt:message key="inscription.vousavezcompte"></fmt:message></div>

						<a 
							 href="<c:url value="/connection"></c:url>"
							class="buttonstandart"><fmt:message key="connection.meconnecter"></fmt:message></a>
				
				
				
			<div class="butformulairenreg">
				<div class="formblockconnectionsecond">
					<form id="email-form" name="email-form"
						method="post" action="<c:url value="/inscription"></c:url>" class="formaconnectioninscription">

						<label for="nom" class="labelformbouteille"><fmt:message key="inscription.label.prenom"></fmt:message><span class="requis">*</span></label>						
							<c:if test="${!empty form.erreurs['nom']}">
								<span class="erreur"><fmt:message key="inscription.erreur.nom"></fmt:message></span>								
							</c:if>
							<input type="text" class="inputformbouteille w-input"
							required="required" maxlength="30" name="nom" 
							value="<c:out value="${utilisateur.nom}"/>" id="nom">
							
							
							
							<label
							for="email" class="labelformbouteille"><strong class="labelform"><fmt:message key="connection.label.email"></fmt:message><span class="requis">*</span></strong></label>							
								<c:if test="${!empty form.erreurs['email']}">
								<span class="erreur"><fmt:message key="inscription.erreur.email"></fmt:message></span>								
							</c:if>
								<input type="email" class="inputformbouteille w-input"  maxlength="30" name="email"
							 value="<c:out value="${utilisateur.email}"/>" id="email" required="required">
							 
							 
														
							<label for="motdepasse" class="labelformbouteille"><fmt:message key="connection.label.motdepasseconnection"></fmt:message><span class="requis">*(<fmt:message key="inscription.span.required.motdepasse"></fmt:message>)</span></label>
							<c:if test="${!empty form.erreurs['motdepasse']}">
								<span class="erreur"><fmt:message key="inscription.erreur.motdepasse"></fmt:message></span>								
							</c:if>
							<input
							type="password" maxlength="30" name="motdepasse" required="required" id="motdepasse"
							class="inputformbouteille w-input">
							
							
                            <c:if test="${!empty form.erreurs['confirmation']}">
								<span class="erreur"><fmt:message key="inscription.erreur.confirmation"></fmt:message></span>								
							</c:if>	
							
							<label for="confirmation"
							class="labelformbouteille"><fmt:message key="inscription.label.motdepasseconfirmation"></fmt:message><span class="requis">*</span></label>
							<input
							type="password" maxlength="30" name="confirmation"
							 required="required" id="confirmation"
							class="inputformbouteille w-input">
							
													
							
                            <c:if test="${!empty form.erreurs['erreurDao']}">
								<div class="erreur"><fmt:message key="erreur.dao"></fmt:message> ${form.erreurs['erreurDao']}</div>								
							</c:if>
							
						<input type="submit" value="<fmt:message key="button.inscription"></fmt:message>"
							data-wait="<fmt:message key="button.wait"></fmt:message>"
							class="buttonstandart">
					</form>

				</div>
			</div>
		</div>
	</div>
	<script
		src="https://d1tdp7z6w94jbb.cloudfront.net/js/jquery-3.3.1.min.js"
		type="text/javascript"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script src="js/jscave.js" type="text/javascript"></script>
	<!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
</body>
</html>