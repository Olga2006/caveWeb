<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html data-wf-page="5c8a4e5935905d04eb6497f8"
	data-wf-site="5bf300026add22d3cd0f2499">
<head>
<meta charset="utf-8">
<title>Connection</title>
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




				<div class="erreur">Vous n'avez pas de compte?</div>

				<a data-w-id="0286df74-097a-f033-0838-aa37db8e0fab"
					style="display: flex" href="<c:url value="/inscription"></c:url>"
					class="tabformul">Créer mon compte</a>



				<div class="butformulairenreg">
					<div class="formblockconnectionsecond">
						<form id="email-form" name="email-form" data-name="Email Form"
							method="post" action="<c:url value="/connection"></c:url>"
							redirect="cave" data-redirect="cave"
							class="formaconnectioninscription">

							<label for="email" class="labelformbouteille"><strong
								class="labelform">Email Address</strong></label> <input type="email"
								class="inputformbouteille w-input" autofocus="true"
								maxlength="60" name="email" placeholder="Votre email" id="email"
								value="<c:out value="${utilisateur.email}"/>"> <label
								for="motdepasseconnection" class="labelformbouteille">Mot
								de passe</label><input type="password"
								class="inputformbouteille w-input" maxlength="60"
								name="motdepasseconnection" id="motdepasseconnection"> <br>
							<br> <br>

							<c:if test="${!empty form.erreurs}">
								<div class="erreur">${form.erreurs['motdepasseconnection']}</div>
								<%-- <a href="<c:url value="/envoyerMDP"></c:url>" class="sansLabel">Mot
								de passe oublié</a> --%>
								<div class="erreur">
									Essayez encore ou cliquez sur
									
									<a  href="#" class="tabmdpoblie">Mote de passe oublié</a>
									
								</div>
							</c:if>

							<input type="submit" value="Connection"
								data-wait="Veuillez patienter..." class="tabformul">
						</form>
<%-- <span class="erreur">${form.resultat}</span> --%>
					</div>
				</div>
			</div>
		</div>
	
	<!-- *********************************************************Form Envoer mail mdp************************************************************ -->
	<div class="divdisapppourtriggerevaluation" id="divdisapppourtriggerdel" style="display: none">
		<div class="formmain">
			<div class="divhrightelementsmall">
				<a title="Sortir" href="#" class="linksortirform" id="sortirformsansrechargement" > 
				
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
						class="labelform">Votre Address Email <span
							class="requis">*</span></strong></label> <input type="email"
						class="inputformbouteille w-input"  maxlength="30"
						name="email" data-name="Email 5"
						value="<c:out value="${utilisateur.email}"/>" id="email"> 
						<span class="erreur">${form.erreurs['email']}</span>

				</div>


				<div class="divhcenterelement">
					<input type="submit" value="Valider"
						data-wait="Merci de patienter ..." class="tabformul w-button">


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