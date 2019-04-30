<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html data-wf-page="5bf300026add225c390f24bd"
	data-wf-site="5bf300026add22d3cd0f2499">
<head>
<meta charset="utf-8">
<title>List Courses</title>
<!--   <meta content="About 1" property="og:title"> -->
<jsp:include page="/WEB-INF/jsp/head/head.jsp"></jsp:include>
</head>

<body class="body">
	<jsp:include page="/WEB-INF/jsp/left/left.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/jsp/nav/nav.jsp"></jsp:include>



	<div class="coremembre">
		<div class="bvcellar"></div>

		<c:choose>
			<c:when test="${ empty bouteillesLC }">

				<div class="divbvdanscave descriptnom">
					<h1 class="heading bvheading">${sessionUtilisateur.nom },
						votre liste de courses est vide. </h1>
				</div>

	
			</c:when>
			<c:otherwise>
				<div class="divbvdanscave">
					<h1 class="heading bvheading">List de courses</h1>
				</div>
				<div class="collectionscroll">

					<!-- *********************************************************Collection Bouteilles************************************************************ -->
					<c:forEach items="${bouteillesLC }" var="mapBouteilles"
						varStatus="boucle">
						

							<div class="cible">
								<div class="blockoneitem">

									<div class="sousblockoneitem">
										<div class="collectionmain w-row">
											<div
												class="column-3 w-col w-col-2 w-col-small-2 w-col-tiny-2">

												<img
													src=" <c:choose>
												<c:when test="${ mapBouteilles.evaluation.toString().equals('5') }">images/rating5.png</c:when>
                                                <c:when test="${ mapBouteilles.evaluation.toString().equals('4') }">images/rating4.png</c:when>
                                                <c:when test="${ mapBouteilles.evaluation.toString().equals('3') }">images/rating3.png</c:when>
                                                <c:when test="${ mapBouteilles.evaluation.toString().equals('2') }">images/rating2.png</c:when>
                                                <c:when test="${ mapBouteilles.evaluation.toString().equals('1') }">images/rating1.png</c:when>
												<c:otherwise>images/rating0.png</c:otherwise>
											</c:choose>"
													alt="" class="imgraiting" style="cursor: text" >


											</div>
											<div
												class="column-4 w-col w-col-5 w-col-small-5 w-col-tiny-5">
												<div class="divdescrp2lh w-clearfix">
													<div class="descriptmainnom" style="cursor: text;">
														<c:out value="${ mapBouteilles.nom }" />
													</div>
													<div class="descriptrest">
														<c:out value="${ mapBouteilles.dateDeProduction }" />
													</div>
												</div>
												<div class="divdescrp2lh w-clearfix">

													<img width="40" title="${ mapBouteilles.pays }"
														alt="" class="imgcountry"
														src="<c:choose>
											<c:when test="${ mapBouteilles.pays.equals('France')}">images/flag/flagfr.jpg</c:when>											
											<c:when test="${ mapBouteilles.pays.equals('Italie')}">images/flag/flagit.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Espagne')}">images/flag/flages.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Afrique du Sud')}">images/flag/flagaf.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Allemagne')}">images/flag/flagal.jpg</c:when>										
											<c:when test="${ mapBouteilles.pays.equals('Argentine')}">images/flag/flagar.jpg</c:when>											
											<c:when test="${ mapBouteilles.pays.equals('Australie')}">images/flag/flagau.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Brésil')}">images/flag/flagbr.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Chili')}">images/flag/flagchili.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Chine')}">images/flag/flagch.jpg</c:when>											
											<c:when test="${ mapBouteilles.pays.equals('Etats-Unis')}">images/flag/flagusa.jpg</c:when>											
											<c:when test="${ mapBouteilles.pays.equals('Grèce')}">images/flag/flaggr.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Nouvelle-Zélande')}">images/flag/flagnz.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Portugal')}">images/flag/flagpo.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Roumanie')}">images/flag/flagro.jpg</c:when>										
											<c:when test="${ mapBouteilles.pays.equals('Russie' )}">images/flag/flagru.jpg</c:when>											
											<c:when test="${ mapBouteilles.pays.equals('Turquie')}">images/flag/flagtu.jpg</c:when>
											<c:otherwise>images/flag/flagn.jpg</c:otherwise>
										</c:choose>">

													<div class="descriptsecondnom">
														<c:out value="${ mapBouteilles.nomProducteur}" />
													</div>
													<div class="descripattention">
														<c:out value="${ mapBouteilles.region}" />
													</div>

												</div>



												<div class="divdescrp2lh w-clearfix">
												<div class="descriptrest">
														<c:out value="${ mapBouteilles.appelation }" />
													</div>
													<div class="descriptrest">
														<c:out value="${ mapBouteilles.cru }" />
													</div>

												</div>


												<div class="divdescrp2lh w-clearfix">
													<div class="descripattention">
														Valeur actuelle
														<c:out value="${ mapBouteilles.prixActuelle }" />
														, €
													</div>
												</div>




											</div>
											<div
												class="column-2 w-col w-col-3 w-col-small-3 w-col-tiny-3">
												<div class="divdescrp2ch w-clearfix">
													<div class="descripattention">
														<c:out value="${ mapBouteilles.nbrTotal}" />
													</div>
													<img width="70" alt="" class="imgcouleur"
														title="${ mapBouteilles.couleur }"
														src="<c:choose>
											<c:when test="${ mapBouteilles.couleur.equals( 'Rouge' ) }">images/butkr.png</c:when>											
											<c:when test="${ mapBouteilles.couleur.equals( 'Blanc' ) }">images/butb.png</c:when>
											<c:when test="${ mapBouteilles.couleur.equals( 'Jaune' ) }">images/bute.png</c:when>
											<c:when test="${ mapBouteilles.couleur.equals( 'Rosé' ) }">images/butr.png</c:when>
											<c:when test="${ mapBouteilles.couleur.equals( 'Effervescent' ) }">images/butch.png</c:when>
											<c:when test="${ mapBouteilles.couleur.equals( 'Liquoreux' ) }">images/butl.png</c:when>
											<c:otherwise>images/butn.png</c:otherwise>
										</c:choose>">


													<div class="descriptrest">
														<c:out value="${ mapBouteilles.taille }" />
													</div>
												</div>
												<div class="divdescrp2ch w-clearfix">
													<img src="images/aConsomer.png" alt="" class="imgsmallchar">
													<div class="descriptrest">
														<c:choose>
															<c:when
																test="${ mapBouteilles.nbrAneeABoir.toString().equals('1') }">dans 1 an</c:when>
															<c:when
																test="${ mapBouteilles.nbrAneeABoir.toString().equals('0') }">maintenant</c:when>
															<c:otherwise>dans <c:out
																	value="${ mapBouteilles.nbrAneeABoir }" /> ans</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
											<div
												class="column-11 w-col w-col-2 w-col-small-2 w-col-tiny-2">
												<div class="divhcenterelement">
													<div class="descriptrestlc"><c:out value="${ mapBouteilles.nbrListCourses }" /></div>
													<img src="images/addboutshoppinglist.png"
													id="${ mapBouteilles.id} ${ mapBouteilles.nom}" alt=""
													class="imgajouterinfobouteilleshoplistfromlc"
													title="Changer quantité dans la liste de courses"> 

												</div>
												<div class="divdescrp2lh w-clearfix">
													<div class="descriptrest">
														<c:if test="${(!empty mapBouteilles.commentaire)}">
											Vos commentaires:
											<c:out value="${ mapBouteilles.commentaire }" />
														</c:if>

													</div>
												</div>
											</div>
										</div>

									</div>

								</div>			
							</div>
						
					</c:forEach>
					<!-- *********************************************************Fin Collection Bouteilles************************************************************ -->
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	
	
	
		<!-- *********************************************************Form Ajoute bouteille dans la liste des courses************************************************************ -->
	<div class="divdisapppourtriggeraddshoplist"
		id="divdisapppourtriggeraddshoplist"
		style="<c:if test="${empty formLC && empty bouteilleLC}">display: none</c:if>">
		<div class="formmain">
			<div class="divhrightelementsmall">
				<a title="Sortir" href="<c:url value="/listeCourses"></c:url>"
					class="linksortirform"> <img src="images/sortir.png" width="30"
					height="50"
					style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); 
					-moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); 
					-ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); 
					transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
					alt="" class="sortirformimg">
				</a>
			</div>

			<form method="post" id="formLC" action="" class="forminside">
<span class="erreur">${formLC.resultat}</span> <span class="erreur">${formLC.erreurs['erreurDaoBouteille']}</span>
				<label for="quantiteAcheter" class="warningdel">Combien
					bouteilles Vous voulez avoir dans la list des courses ?</label> <span
					class="erreur">${formLC.erreurs['quantiteAcheter']}</span> <input
					type="number" min="0" maxlength="4" name="quantiteAcheter"
					id="quantiteAcheter" class="inputformbouteille w-input"
					value="<c:out value="${bouteilleLC.nbrListCourses}"/>">



				<div class="divhcenterelement">
					<input type="submit" value="Valider"
						data-wait="Merci de patienter ..." class="tabformul w-button">
					<input type="reset" value="Remettre à initiale"
						data-wait="Merci de patienter ..." class="tabformul w-button" />

				</div>
			</form>
		</div>
	</div>
	
	<c:if test="${!empty succes}">
		<script>
			var timer = setTimeout(function() {
				window.location = 'listeCourses'
			}, 3000);
		</script>
	</c:if>

	<div class="resultat" id="resultat"
		style="<c:if test="${empty succes}">display: none</c:if>">
		<div class="formmain">
			<div class="divhrightelementsmall">
				<a title="Sortir" href="<c:url value="/listeCourses"></c:url>"
					class="sortirformimg"> <img src="images/sortir.png" width="30"
					height="50"
					style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
					alt="" class="sortirformimg">
				</a>
			</div>
			<div class="divhcenterelement">
				<span class="maj">${succes}</span>
			</div>

		</div>
	</div>
	

	<script
		src="https://d1tdp7z6w94jbb.cloudfront.net/js/jquery-3.3.1.min.js"
		type="text/javascript"></script>

	<script src="js/jqcave.js" type="text/javascript"></script>
	<script src="js/jscave.js" type="text/javascript"></script>
	<!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
</body>
</html>