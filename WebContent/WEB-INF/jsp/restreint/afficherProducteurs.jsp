<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="messages" />
<!DOCTYPE html>
<html data-wf-page="5c87c9153f656c8f0ad43c3c"
	data-wf-site="5bf300026add22d3cd0f2499">
<head>
<meta charset="utf-8">
<title><fmt:message key="producteurs.title"></fmt:message></title>
<jsp:include page="/WEB-INF/jsp/head/head.jsp"></jsp:include>
</head>
<body class="body">
<div id="coverforformulaire" style="<c:if test="${empty form.erreurs && empty producteur}">display: none</c:if>"></div>
	<jsp:include page="/WEB-INF/jsp/left/left.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/jsp/nav/nav.jsp"></jsp:include>

	<div class="coremembre">
		<div class="bvcellar"></div>


		<c:choose>
			<c:when test="${ empty sessionUtilisateur.producteurs }">

				<div class="divbvdanscave descriptnom">
					<h1 class="heading bvheading">${sessionUtilisateur.nom },</h1>
					<h1 class="heading bvheading">
						<fmt:message key="producteurs.messagecarnetvigneronsvide"></fmt:message>
					</h1>
				</div>




			</c:when>
			<c:otherwise>
				<div class="divbvdanscave">
					<h1 class="heading bvheading">
						<fmt:message key="producteurs.title"></fmt:message>
					</h1>
				</div>

				
				<div class="collectionscroll">
					<input id="filterBouteille" type="text"
						placeholder="<fmt:message key="filter.placeholder"></fmt:message>"
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
										title="<fmt:message key="title.supprimer"></fmt:message>">

									<a title="<fmt:message key="title.maj"></fmt:message>"
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
												<fmt:message key="producteurs.contact"></fmt:message>
												:
												<c:out value="${ mapProducteurs.contact}" />
											</div>
										</div>

										<div class="divdescrp2lh">
											<div class="descriptrest">
												<fmt:message key="producteurs.adresse"></fmt:message>
												:
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
											<c:when test="${ mapBouteilles.couleur.equals('Rouge') or mapBouteilles.couleur.equals('Red') or mapBouteilles.couleur.equals('Czerwone') or mapBouteilles.couleur.equals('Красное')}"><fmt:message key="caves.imgsrc.rouge"></fmt:message></c:when>											
											<c:when test="${ mapBouteilles.couleur.equals('Blanc') or mapBouteilles.couleur.equals('White') or mapBouteilles.couleur.equals('Białe') or mapBouteilles.couleur.equals('Белое') }"><fmt:message key="caves.imgsrc.blanc"></fmt:message></c:when>
											<c:when test="${ mapBouteilles.couleur.equals('Jaune') or mapBouteilles.couleur.equals('Yellow') or mapBouteilles.couleur.equals('Żółte') or mapBouteilles.couleur.equals('Желтое') }"><fmt:message key="caves.imgsrc.jaune"></fmt:message></c:when>
											<c:when test="${ mapBouteilles.couleur.equals('Rosé') or mapBouteilles.couleur.equals('Pink') or mapBouteilles.couleur.equals('Różowe') or mapBouteilles.couleur.equals('Розовое') }"><fmt:message key="caves.imgsrc.rose"></fmt:message></c:when>
											<c:when test="${ mapBouteilles.couleur.equals('Effervescent') or mapBouteilles.couleur.equals('Sparkling') or mapBouteilles.couleur.equals('Musujące') or mapBouteilles.couleur.equals('Шипучее') }"><fmt:message key="caves.imgsrc.effervescent"></fmt:message></c:when>
											<c:when test="${ mapBouteilles.couleur.equals('Liquoreux') or mapBouteilles.couleur.equals('Liquor') or mapBouteilles.couleur.equals('Likierowe') or mapBouteilles.couleur.equals('Ликер') }"><fmt:message key="caves.imgsrc.liquoreux"></fmt:message></c:when>
											<c:otherwise><fmt:message key="caves.imgsrc.autre"></fmt:message></c:otherwise>
										</c:choose>"
														alt="" class="imgcouleur"
														title="<c:out value="${ mapBouteilles.couleur}" />">

													<div class="descriptrest">
														<c:out value="${ mapBouteilles.taille }" />
													</div>

												</div>




												<c:if test="${!empty mapBouteilles.positions}">
													<div class="divdescrp2ch">
														<div class="descripattention">
															<fmt:message key="bouteilles.emplacements"></fmt:message>
														</div>
													</div>

													<c:forEach items="${mapBouteilles.positions}"
														var="mapPositions" varStatus="bouclePositions">
														<div class="divdescrp2ch">
															<div class="descriptrest">
																<a
																	title="<fmt:message key="bouteilles.title.ouvriremplacement"></fmt:message>"
																	href="<c:url value="/redigerCave"><c:param name="idCaveR" value="${ mapPositions.idCave }" /><c:param name="idPositionAficher" value="${ mapPositions.id }" /><c:param name="referenceC" value="${ mapPositions.referenceC }" /></c:url>#aficher">

																	<c:out value="${mapPositions }" />
																</a>
															</div>
														</div>
													</c:forEach>
												</c:if>


											</div>

										</div>




									</c:forEach>

								</div>


								<c:if test="${ !empty mapProducteurs.bouteilles }">

									<div class="divimgexpandsansgradient " style="cursor: pointer;">
										<div class="divdescrrightbottomexpand">
											<div style="cursor: pointer;">
												<fmt:message key="title.plusinformations"></fmt:message>
											</div>
										</div>
										<img src="images/expand.png" class="imgexpand"
											title="<fmt:message key="title.plusinformations"></fmt:message>">
									</div>
								

								<div class="divimgreduce"
									style="cursor: pointer; display: none;">
									<div class="divdescrrightbottomreduce">
										<div style="cursor: pointer;">
											<fmt:message key="title.reduireinformations"></fmt:message>
										</div>
									</div>
									<img src="images/expandh.png" class="imgexpand"
										title="<fmt:message key="title.reduireinformations"></fmt:message>">
								</div>
								
								</c:if>

							</div>





						</div>
					</c:forEach>
					<!-- *********************************************************Fin Collection Bouteilles************************************************************ -->

				</div>


			</c:otherwise>
		</c:choose>
		<a
			title="<fmt:message key="producteurs.title.ajouterviticulteur"></fmt:message>"
			id="linkajouterelementprod" href="#"> <img src="images/addprod.png"
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
				<a title="<fmt:message key="button.title.sortir"></fmt:message>"
					 class="sortirformsansrechargement"> 
					
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

					<c:if test="${!empty erreurs['echecDel']}">
						<span class="erreur"><fmt:message
								key="producteurs.resultat.delfirst"></fmt:message>
							${erreurs['echecDel']} <fmt:message
								key="producteurs.unsuccess.delsecond"></fmt:message></span>
					</c:if>

					<br>
					<c:if test="${!empty erreurs['erreurDao']}">
						<span class="erreur"><fmt:message key="erreur.dao"></fmt:message>
							${erreurs['erreurDao']}</span>
					</c:if>


					<div class="divhcenterelement">
						<a title="<fmt:message key="button.title.sortir"></fmt:message>"
							href="<c:url value="/listeProducteurs"></c:url>"
							class="buttonstandart"><fmt:message key="button.title.sortir"></fmt:message></a>
					</div>
				</c:when>

				<c:otherwise>
					<form method="post" action="" class="forminside" id="formDel">
						<label for="nom-5" class="warningdel"><fmt:message
								key="producteurs.del.warningdel"></fmt:message></label>
						<div class="divhcenterelement">
							<input type="submit"
								value="<fmt:message key="button.valider"></fmt:message>"
								data-wait="<fmt:message key="button.wait"></fmt:message>"
								class="buttonstandart"> <a
								title="<fmt:message key="button.title.sortir"></fmt:message>"
								
								class="buttonstandart sortirformsansrechargement"> <fmt:message
									key="button.title.sortir"></fmt:message>
							</a>
						</div>
					</form>
				</c:otherwise>

			</c:choose>


		</div>
	</div>





	<!-- **********************************************Form Update/Creation Producteur***************************************************** -->

	<div class="divdisapppourtriggerupdate" id="divdisapppourtriggerupdate<c:if test="${empty producteur}">sansrecharger</c:if><c:if test="${!empty producteur}">prod</c:if>"
		style="<c:if test="${empty form.erreurs && empty producteur}">display: none</c:if>">
		<div class="formmain">

			<div class="divhrightelementsmall">
				<a title="<fmt:message key="button.title.sortir"></fmt:message>"
					<c:if test="${!empty producteur}"> href="<c:url value="/listeProducteurs"></c:url>"</c:if> class="sortirformsansrechargement" >
					
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

			
				<jsp:include page="formProducteur.jsp" ></jsp:include>

				<label class="labelformbouteille"> <span class="requis">*<fmt:message
							key="title.champsobligatoires"></fmt:message></span></label>
				<div class="divbutform">
					<input type="submit"
						value="<fmt:message key="button.valider"></fmt:message>"
						data-wait="<fmt:message key="button.wait"></fmt:message>"
						class="buttonstandart"> <input type="reset"
						value="<fmt:message key="button.reinitialiser"></fmt:message>"
						data-wait="<fmt:message key="button.wait"></fmt:message>"
						class="buttonstandart" />
				</div>
			</form>
		</div>
	</div>

	<!-- **********************************************resultat succes***************************************************** -->

	<c:choose>
		<c:when
			test="${empty form.successCreation && empty form.successMaj && empty successDel}"></c:when>
		<c:otherwise>
			<script>
				var timer = setTimeout(function() {
					window.location = 'listeProducteurs'
				}, 3000);
			</script>
		</c:otherwise>
	</c:choose>

	<div class="resultat" id="resultat"
		style="<c:if test="${empty form.successCreation && empty form.successMaj && empty successDel}">display: none</c:if>">
		<div class="formmain">
			<div class="divhrightelementsmall">
				<a title="<fmt:message key="button.title.sortir"></fmt:message>"
					href="<c:url value="/listeProducteurs"></c:url>"
					class="sortirformimg"> <img src="images/sortir.png" width="30"
					height="50"
					style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
					alt="" class="sortirformimg">
				</a>
			</div>
			<div class="divhcenterelement">
				<c:if test="${!empty form.successCreation}">
					<span class="maj"><fmt:message
							key="producteurs.success.creation"></fmt:message>
						${form.successCreation}</span>
				</c:if>
				<c:if test="${!empty form.successMaj}">
					<span class="maj"><fmt:message key="producteurs.success.maj"></fmt:message>
						${form.successMaj}</span>
				</c:if>
				<c:if test="${!empty successDel}">
					<span class="maj"><fmt:message
							key="producteurs.resultat.delfirst"></fmt:message> ${successDel}
						<fmt:message key="producteurs.success.delsecond"></fmt:message></span>
				</c:if>
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