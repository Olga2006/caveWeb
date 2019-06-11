<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="messages"/>
<!DOCTYPE html>
<html data-wf-page="5c8a4e5935905d04eb6497f8"
	data-wf-site="5bf300026add22d3cd0f2499">
<head>
<meta charset="utf-8">
<title><fmt:message key="connection.title"></fmt:message></title>
<jsp:include page="/WEB-INF/jsp/head/head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/nav/nav.jsp"></jsp:include>
	<div class="cible">
		<div class="imgbv w-clearfix">
			<img src="images/vetka.png" alt="" class="vetkaimg">
			<div class="core">
				<div class="espase"></div>
				<img src="images/zolotoy_kluch-600x190.png"
					style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0DEG) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0DEG) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0DEG) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0DEG) rotateY(0) rotateZ(0) skew(0, 0); transform-style: preserve-3d"
					alt="" class="keyimg">




				<div class="erreur"><fmt:message key="connection.pasdecompte"></fmt:message></div>

				<a  href="<c:url value="/inscription"></c:url>"
					class="buttonstandart"><fmt:message key="connection.creercompte"></fmt:message></a>



				<div class="butformulairenreg">
					<div class="formblockconnectionsecond">
						<form id="email-form" name="email-form"
							method="post" action="<c:url value="/connection"></c:url>" class="formaconnectioninscription">

							<label for="email" class="labelformbouteille"><strong
								class="labelform"><fmt:message key="connection.label.email"></fmt:message></strong></label> <input type="email"
								class="inputformbouteille w-input" required="required"
								maxlength="60" name="email" placeholder="Email" id="email"
								value="<c:out value="${utilisateur.email}"/>"> 
								
								<label
								for="motdepasseconnection" class="labelformbouteille"><fmt:message key="connection.label.motdepasseconnection"></fmt:message></label><input type="password"
								class="inputformbouteille w-input" maxlength="60" required="required"
								name="motdepasseconnection" id="motdepasseconnection"> <br>
							<br> <br>

							<c:if test="${!empty form.erreurs['motdepasseconnection']}">
								<%-- <a href="<c:url value="/envoyerMDP"></c:url>" class="sansLabel">Mot
								de passe oublié</a> --%>
								<div class="erreur"><fmt:message key="connection.unsuccess"></fmt:message></div>
								<div class="erreur"><fmt:message key="connection.erreur.motdepasse"></fmt:message></div>
								<div class="erreur"><fmt:message key="connection.essayezencore"></fmt:message>
									
									<a  href="#" class="tabmdpoblie"><fmt:message key="connection.button.motdepasseoublie"></fmt:message></a>
									
								</div>
							</c:if>
							<c:if test="${!empty form.erreurs['erreurDao']}">
								<div class="erreur"><fmt:message key="erreur.dao"></fmt:message> ${form.erreurs['erreurDao']}</div>								
							</c:if>
							
							
							

							<input type="submit" value="<fmt:message key="button.connection"></fmt:message>"
								data-wait="<fmt:message key="button.wait"></fmt:message>" class="buttonstandart">
						</form>

					</div>
				</div>
			</div>
		</div>
	
	<!-- *********************************************************Form Envoer mail mdp************************************************************ -->
	<div class="divdisapppourtriggerevaluation" id="divdisapppourtriggerdel" style="display: none">
		<div class="formmain">
			<div class="divhrightelementsmall">
				<a title="<fmt:message key="button.title.sortir"></fmt:message>" href="#" class="linksortirform" id="sortirformsansrechargement" > 
				
				<img
					src="images/sortir.png" width="30" height="50"
					style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); 
					-moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); 
					-ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); 
					transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
					alt="" class="sortirformimg">
				</a>
			</div>

			<form method="post" action="<c:url value="/envoerMailMDP"></c:url>"
				class="forminside">
				<div class="divhcenterelement">

					<label for="email" class="labelformbouteille"><strong
						class="labelform"><fmt:message key="connection.label.votreaddresseemail"></fmt:message><span
							class="requis">*</span></strong></label> <input type="email"
						class="inputformbouteille w-input"  maxlength="30"
						name="email" data-name="Email 5"
						value="<c:out value="${utilisateur.email}"/>" id="email"> 
                             <c:if test="${!empty form.erreurs['email']}">
								<div class="erreur"><fmt:message key="connection.erreur.email"></fmt:message></div>
							</c:if>
				</div>


				<div class="divhcenterelement">
					<input type="submit" value="<fmt:message key="button.valider"></fmt:message>"
						data-wait="<fmt:message key="button.wait"></fmt:message>" class="buttonstandart">


				</div>
			</form>
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