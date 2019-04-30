<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html data-wf-page="5c8a4e5935905d04eb6497f8"
	data-wf-site="5bf300026add22d3cd0f2499">
<head>
<meta charset="utf-8">
<title>Inscription</title>
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
				
		
				
				
				<div class="erreur">Vous avez une compte?</div>

						<a data-w-id="0286df74-097a-f033-0838-aa37db8e0fab"
							style="display: flex" href="<c:url value="/connection"></c:url>"
							class="tabformul">Connecter à mon compte</a>
				
				
				
			<div class="butformulairenreg">
				<div class="formblockconnectionsecond">
					<form id="email-form" name="email-form" data-name="Email Form"
						method="post" action="<c:url value="/inscription"></c:url>" redirect="cave"
						data-redirect="cave" class="formaconnectioninscription">

						<label for="nom" class="labelformbouteille">Prénom
							d&#x27;utilisateur<span class="requis">*</span></label>						
							<input type="text" class="inputformbouteille w-input"
							autofocus="true" maxlength="30" name="nom" data-name="Nom 3"
							value="<c:out value="${utilisateur.nom}"/>" id="nom" required="">
							<span class="erreur">${form.erreurs['nom']}</span>
							
							<label
							for="email" class="labelformbouteille"><strong class="labelform">Email
								Address<span class="requis">*</span></strong></label>							
								<input type="email" class="inputformbouteille w-input"
							autofocus="true" maxlength="30" name="email"
							data-name="Email 5" value="<c:out value="${utilisateur.email}"/>" id="email"
							required="">
							<span class="erreur">${form.erreurs['email']}</span>
							
							
							<label for="motdepasse" class="labelformbouteille">Mot de passe</label>
							<input
							type="password" maxlength="30" name="motdepasse"
						  required="" id="motdepasse"
							class="inputformbouteille w-input">
							<span class="erreur">${form.erreurs['motdepasse']}</span>
							
							<label for="confirmation"
							class="labelformbouteille">Confirmation du mot de passe</label>
							<input
							type="password" maxlength="30" name="confirmation"
							 required="" id="confirmation"
							class="inputformbouteille w-input">
							<span class="erreur">${form.erreurs['confirmation']}</span>

						<input type="submit" value="Inscription"
							data-wait="Veuillez patienter..."
							class="tabformul">
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