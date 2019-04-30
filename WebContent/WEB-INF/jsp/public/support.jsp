<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html data-wf-page="5c8a4e5935905d04eb6497f8"
	data-wf-site="5bf300026add22d3cd0f2499">
<head>
<meta charset="utf-8">
<title>Support</title>
<jsp:include page="/WEB-INF/jsp/head/head.jsp"></jsp:include>
</head>
<body>

	
	<jsp:include page="/WEB-INF/jsp/nav/nav.jsp"></jsp:include>

		<div class="imgbv w-clearfix">
			<img src="images/vetka.png" alt="" class="vetkaimg">
			<div class="core">
				<div class="espase"></div>


<c:if test="${ !empty sessionUtilisateur}"><jsp:include page="/WEB-INF/jsp/left/left.jsp"></jsp:include></c:if>


				<div class="warningdel">Merci de nous envoyer une message si vous avez rencontré des problemmes pendant utilisation l'application via sette formulaire.</div>



				<div class="butformulairenreg">
					<div class="formblockconnectionsecond">
						<form id="email-form" name="email-form" data-name="Email Form"
							method="post" action="<c:url value="/support"></c:url>"
							class="formaconnectioninscription">

							<label for="nom" class="labelformbouteille">Votre Prénom<span
								class="requis">*</span></label> <input type="text"
								class="inputformbouteille w-input" maxlength="30" name="nom"
								value="<c:out value="${utilisateur.nom}"/>" id="nom"> <span
								class="erreur">${form.erreurs['nom']}</span> <label for="email"
								class="labelformbouteille"><strong class="labelform">Email
									Address<span class="requis">*</span>
							</strong></label> <input type="email" class="inputformbouteille w-input"
								maxlength="30" name="email" data-name="Email 5"
								value="<c:out value="${utilisateur.email}"/>" id="email">
							<span class="erreur">${form.erreurs['email']}</span> <label
								for="commentaire" class="labelformbouteille">Votre
								Message</label>
							<textarea id="message" name="messageSupport" style="width: 200px; height: 100px;"
								placeholder="message" maxlength="2000"
								class="inputformbouteille w-input"
								value="<c:out  value="${ utilisateur.messageSupport }"/>"></textarea>



							<input type="submit" value="Envoyer"
								data-wait="Veuillez patienter..." class="tabformul">
								<input
						type="reset" value="Vider"
						data-wait="Veuillez patienter..." class="tabformul" />
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