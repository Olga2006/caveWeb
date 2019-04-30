<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html data-wf-page="5c87c9153f656c8f0ad43c3c"
	data-wf-site="5bf300026add22d3cd0f2499">
<head>
<meta charset="utf-8">
<title>Carnet Vignerons</title>
<jsp:include page="/WEB-INF/jsp/head/head.jsp"></jsp:include>
</head>
<body class="body">
	<jsp:include page="/WEB-INF/jsp/left/left.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/jsp/nav/nav.jsp"></jsp:include>

	<div class="coremembre">
		<div class="bvcellar"></div>



		<c:choose>
			<c:when test="${ empty sessionUtilisateur.producteurs }">

				<div class="divbvdanscave descriptnom">
					<h1 class="heading bvheading">${sessionUtilisateur.nom },
						votre carnet des vignerons est vide. Veuillez enregistrer votre
						première viticulteur!</h1>
				</div>

			


			</c:when>
			<c:otherwise>
				<div class="divbvdanscave">
					<h1 class="heading bvheading">Carnet des vignerons</h1>
				</div>
				<div class="collectionscroll">
					<input id="filterBouteille" type="text" placeholder="Search.."
						class="inputformbouteille">
					<!-- *********************************************************Collection Producteurs********************************** -->
					<c:forEach items="${sessionUtilisateur.producteurs }"
						var="mapProducteurs" varStatus="boucle">
						<div class="ciblebouteille">
							<div class="blockoneitem">
								<div class="sousblockoneitem">



									<img src="images/supprimer.png" alt=""
										class="imgajouterinfoproducteurdel"
										id="${ mapProducteurs.id} ${ mapProducteurs.nom}"
										title="Supprimer">
										
										 <a title="Mettre à jour"
										href="<c:url value="/creationProducteur">
											<c:param name="idProducteur" value="${ mapProducteurs.id }" /></c:url>">
										<img src="images/corriger.png" alt=""
										class="imgajouterinfobouteilleupdate">
									</a>



									<div class="divnombrechaquebdanscave">
										<div class="divdescrp2lh">
											<div class="descriptmainnom">
												<c:out value="${ mapProducteurs.nom }" />
											</div>
										</div>

										<div class="divdescrp2lh">
											<div class="descriptrest">
												Contact:
												<c:out value="${ mapProducteurs.contact}" />
											</div>
										</div>

										<div class="divdescrp2lh">
											<div class="descriptrest">
												Adresse:
												<c:out value="${ mapProducteurs.adresse}" />
											</div>
										</div>
									</div>


								</div>




								<div class="sousblockoneitemclosed"
									style="display: none; padding-left: 12px">

									<c:forEach items="${mapProducteurs.bouteilles}"
										var="mapBouteilles" varStatus="boucleBouteilles">


										<div class="divdoscrbouteillepourprod">
											<!-- <div class="divdescrp2ch">
													
												</div> -->
											<div class="divdescrp2lh">

												<div class="divdescrp2ch">
													<div class="descriptsecondnom">
														<c:out value="${ mapBouteilles.nom}" />
													</div>
												</div>
												<div class="divdescrp2ch">

													<img width="40"
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
										</c:choose>"
														alt="" class="imgcountry"
														title="<c:out value="${ mapBouteilles.pays}" />">
													<div class="descriptrest">
														<c:out value="${ mapBouteilles.region}" />
													</div>
												</div>


												<div class="divdescrp2ch">
													<div class="descripattention">
														<%-- <c:forEach items="${mapBouteilles.positions}"
															var="mapPositions" varStatus="bouclePositions">
															<c:set var="countPositions"
																value="${ bouclePositions.count }" />
														</c:forEach> --%>
														<c:out value="${mapBouteilles.nbrTotal}" />
														X
													</div>

													<img width="70"
														src="<c:choose>
											<c:when test="${ mapBouteilles.couleur.equals( 'Rouge' ) }">images/butkr.png</c:when>											
											<c:when test="${ mapBouteilles.couleur.equals( 'Blanc' ) }">images/butb.png</c:when>
											<c:when test="${ mapBouteilles.couleur.equals( 'Jaune' ) }">images/bute.png</c:when>
											<c:when test="${ mapBouteilles.couleur.equals( 'Rosé' ) }">images/butr.png</c:when>
											<c:when test="${ mapBouteilles.couleur.equals( 'Effervescent' ) }">images/butch.png</c:when>
											<c:when test="${ mapBouteilles.couleur.equals( 'Liquoreux' ) }">images/butl.png</c:when>
											
											<c:otherwise>images/butn.png</c:otherwise>
										</c:choose>"
														alt="" class="imgcouleur"
														title="<c:out value="${ mapBouteilles.couleur}" />">

													<div class="descriptrest">
														<c:out value="${ mapBouteilles.taille }" />
													</div>

												</div>




<c:if test="${!empty mapBouteilles.positions}"><div class="divdescrp2ch">
													<div class="descripattention">Se trouve dans</div>
												</div>

												<c:forEach items="${mapBouteilles.positions}"
													var="mapPositions" varStatus="bouclePositions">
													<div class="divdescrp2ch">
														<div class="descriptrest">
															<a title="Montrer dans la cave"
																href="<c:url value="/redigerCave"><c:param name="idCaveR" value="${ mapPositions.idCave }" /><c:param name="idPositionAficher" value="${ mapPositions.id }" /><c:param name="referenceC" value="${ mapPositions.referenceC }" /></c:url>#aficher">

																<c:out value="${mapPositions }" />
															</a>
														</div>
													</div>
												</c:forEach></c:if>
												

											</div>

										</div>




									</c:forEach>

								</div>






								<div class="divimgexpand">
									<%-- <div class="descripattention">Total <c:out value="${countBouteillesProd}"/> Bouteilles</div> --%>
									<img src="images/expand.png" alt="plus information"
										class="imgexpand">
								</div>
							</div>





						</div>
					</c:forEach>
					<!-- *********************************************************Fin Collection Bouteilles************************************************************ -->

				</div>
				

			</c:otherwise>
		</c:choose>
		<a title="Ajouter un viticulteur" id="linkajouterelement" href="#">					
					<img
					src="images/addprod.png"
					data-w-id="2268c7f2-5bc3-7d72-53f7-e00c170ae7a0"
					style="-webkit-transform: translate3d(0, -143PX, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); 
					-moz-transform: translate3d(0, -143PX, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); 
					-ms-transform: translate3d(0, -143PX, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); 
					transform: translate3d(0, -143PX, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
					alt="" class="ajouteelemimg">
					
					</a>
	</div>





	<!-- *********************************************************Form Confirm Del************************************************************ -->
	<div class="divdisapppourtriggerdel" id="divdisapppourtriggerdel"
		style="<c:if test="${empty erreurs}">display: none</c:if>">
		<div class="formmain">
			<div class="divhrightelementsmall">
				<a title="Sortir" href="<c:url value="/listeProducteurs"></c:url>"
					class="sortirformimg"> 
					<img src="images/sortir.png" width="30"
					height="50"
					style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); 
					-moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); 
					-ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); 
					transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
					alt="" class="sortirformimg">
				</a>
			</div>

			<c:choose>
				<c:when test="${!empty erreurs}">
					<span class="erreur">${echec}</span>
					<br>
					<span class="erreur">${erreurs['erreurDel']}</span>
					<div class="divhcenterelement">
						<a title="Sortir" href="<c:url value="/listeProducteurs"></c:url>"
							class="tabformul w-button"> Sortir </a>
					</div>
				</c:when>

				<c:otherwise>
					<form method="post" action="" class="forminside" id="formDel">
						<label for="nom-5" class="warningdel">Suppression un
							Producteur de votre carnet vas provoquer de l'annulation cet
							Producteur pour les bouteille concernées. </label>
						<div class="divhcenterelement">
							<input type="submit" value="Valider"
								data-wait="Merci de patienter ..." class="tabformul w-button">
							<a title="Sortir" href="#" class="tabformul w-button"> Sortir
							</a>
						</div>
					</form>
				</c:otherwise>

			</c:choose>


		</div>
	</div>





	<!-- **********************************************Form Update/Creation Producteur***************************************************** -->

	<div class="divdisapppourtriggerupdate" id="divdisapppourtriggerupdate"
		style="<c:if test="${empty form && empty producteur}">display: none</c:if>">
		<div class="formmain">

			<div class="divhrightelementsmall">
				<a title="Sortir" href="<c:url value="/listeProducteurs"></c:url>"
					class="sortirformimg"> 
					<img src="images/sortir.png" width="30"
					height="50"
					style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); 
					-moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); 
					-ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); 
					transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
					alt="" class="sortirformimg">
				</a>
			</div>
			<form id="formCreation" name="email-form" data-name="Email Form"
				class="forminside" method="post"
				action="<c:url value="/creationProducteur"><c:if test="${!empty producteur}"><c:param name="idProducteur" value="${ producteur.id }" /></c:if></c:url>">


				<span class="erreur">${form.resultat}</span> <span class="erreur">${form.erreurs['erreurDaoProd']}</span>

				<jsp:include page="formProducteur.jsp"></jsp:include>


				<div class="divbutform">
					<input type="submit" value="Valider"
						data-wait="Merci de patienter ..." class="tabformul"> <input
						type="reset" value="Remettre à initiale"
						data-wait="Merci de patienter ..." class="tabformul" />
				</div>
			</form>
		</div>
	</div>

	<!-- **********************************************resultat succes***************************************************** -->

	<c:if test="${!empty succes}">
		<script>
        var timer = setTimeout(function() {
            window.location='listeProducteurs'
        }, 3000);
    </script> 
	</c:if>

	<div class="resultat" id="resultat"
		style="<c:if test="${empty succes}">display: none</c:if>">
		<div class="formmain">
			<div class="divhrightelementsmall">
				<a title="Sortir" href="<c:url value="/listeProducteurs"></c:url>"
					class="sortirformimg"> <img src="images/sortir.png" width="30"
					height="50"
					style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); 
					-moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); 
					-ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); 
					transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
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
		type="text/javascript"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script src="js/jqcave.js" type="text/javascript"></script>
	<script src="js/jscave.js" type="text/javascript"></script>
	<!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
</body>
</html>