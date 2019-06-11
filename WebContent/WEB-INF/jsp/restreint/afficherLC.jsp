<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="messages" />
<!DOCTYPE html>
<html data-wf-page="5bf300026add225c390f24bd"
	data-wf-site="5bf300026add22d3cd0f2499">
<head>
<meta charset="utf-8">
<title><fmt:message key="listcourses.title"></fmt:message></title>
<!--   <meta content="About 1" property="og:title"> -->
<jsp:include page="/WEB-INF/jsp/head/head.jsp"></jsp:include>
</head>

<body class="body">
<div id="coverforformulaire" style="display: none"></div>
	<jsp:include page="/WEB-INF/jsp/left/left.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/jsp/nav/nav.jsp"></jsp:include>



	<div class="coremembre">
		<div class="bvcellar"></div>

		<c:choose>
			<c:when test="${ empty bouteillesLC }">

				<div class="divbvdanscave descriptnom">
					<h1 class="heading bvheading">${sessionUtilisateur.nom },
						<fmt:message key="listcourses.messagelistcoursesvide"></fmt:message>
					</h1>
				</div>


			</c:when>
			<c:otherwise>
				<div class="divbvdanscave">
					<h1 class="heading bvheading">
						<fmt:message key="listcourses.title"></fmt:message>
					</h1>

				</div>


				<div class="collectionscroll">

					<!-- *********************************************************Collection Bouteilles************************************************************ -->
					<c:forEach items="${bouteillesLC }" var="mapBouteilles"
						varStatus="boucle">


						<div class="cible">
							<div class="blockoneitem">

								<div class="sousblockoneitem">
									<div class="collectionmain w-row">
										<div class="column-3 w-col w-col-2 w-col-small-2 w-col-tiny-2">

											<img
												src=" <c:choose>
												<c:when test="${ mapBouteilles.evaluation.toString().equals('5') }">images/rating5.png</c:when>
                                                <c:when test="${ mapBouteilles.evaluation.toString().equals('4') }">images/rating4.png</c:when>
                                                <c:when test="${ mapBouteilles.evaluation.toString().equals('3') }">images/rating3.png</c:when>
                                                <c:when test="${ mapBouteilles.evaluation.toString().equals('2') }">images/rating2.png</c:when>
                                                <c:when test="${ mapBouteilles.evaluation.toString().equals('1') }">images/rating1.png</c:when>
												<c:otherwise>images/rating0.png</c:otherwise>
											</c:choose>"
												alt="" class="imgraiting" style="cursor: text">


										</div>
										<div class="column-4 w-col w-col-5 w-col-small-5 w-col-tiny-5">
											<div class="divdescrp2lh w-clearfix">
												<div class="descriptmainnom" style="cursor: text;">
													<c:out value="${ mapBouteilles.nom }" />
												</div>
												<div class="descriptrest">
													<c:out value="${ mapBouteilles.dateDeProduction }" />
												</div>
											</div>
											<div class="divdescrp2lh w-clearfix">

												<img width="40" title="${ mapBouteilles.pays }" alt=""
													class="imgcountry"
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
													<fmt:message key="bouteilles.prixactuel"></fmt:message>
													<c:out value="${ mapBouteilles.prixActuelle }" />
													, €
												</div>
											</div>




										</div>
										<div class="column-2 w-col w-col-3 w-col-small-3 w-col-tiny-3">
											<div class="divdescrp2ch w-clearfix">
												<div class="descripattention">
													<c:out value="${ mapBouteilles.nbrTotal}" />
												</div>
												<img width="70" alt="" class="imgcouleur"
													title="${ mapBouteilles.couleur }"
													src="<c:choose>
											<c:when test="${ mapBouteilles.couleur.equals('Rouge') or mapBouteilles.couleur.equals('Red') or mapBouteilles.couleur.equals('Czerwone') or mapBouteilles.couleur.equals('Красное')}"><fmt:message key="caves.imgsrc.rouge"></fmt:message></c:when>											
											<c:when test="${ mapBouteilles.couleur.equals('Blanc') or mapBouteilles.couleur.equals('White') or mapBouteilles.couleur.equals('Białe') or mapBouteilles.couleur.equals('Белое') }"><fmt:message key="caves.imgsrc.blanc"></fmt:message></c:when>
											<c:when test="${ mapBouteilles.couleur.equals('Jaune') or mapBouteilles.couleur.equals('Yellow') or mapBouteilles.couleur.equals('Żółte') or mapBouteilles.couleur.equals('Желтое') }"><fmt:message key="caves.imgsrc.jaune"></fmt:message></c:when>
											<c:when test="${ mapBouteilles.couleur.equals('Rosé') or mapBouteilles.couleur.equals('Pink') or mapBouteilles.couleur.equals('Różowe') or mapBouteilles.couleur.equals('Розовое') }"><fmt:message key="caves.imgsrc.rose"></fmt:message></c:when>
											<c:when test="${ mapBouteilles.couleur.equals('Effervescent') or mapBouteilles.couleur.equals('Sparkling') or mapBouteilles.couleur.equals('Musujące') or mapBouteilles.couleur.equals('Шипучее') }"><fmt:message key="caves.imgsrc.effervescent"></fmt:message></c:when>
											<c:when test="${ mapBouteilles.couleur.equals('Liquoreux') or mapBouteilles.couleur.equals('Liquor') or mapBouteilles.couleur.equals('Likierowe') or mapBouteilles.couleur.equals('Ликер') }"><fmt:message key="caves.imgsrc.liquoreux"></fmt:message></c:when>
											<c:otherwise><fmt:message key="caves.imgsrc.autre"></fmt:message></c:otherwise>
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
															test="${ mapBouteilles.nbrAneeABoir.toString().equals('0') }">
															<fmt:message key="listconsomer.maintenant"></fmt:message>
														</c:when>
														<c:when
															test="${ mapBouteilles.nbrAneeABoir.toString().equals('1') }">
															<fmt:message key="listconsomer.dansan"></fmt:message>
														</c:when>
														<c:when
															test="${ mapBouteilles.nbrAneeABoir.toString().equals('2') }">
															<fmt:message key="listconsomer.dans"></fmt:message>
															<c:out value="${ mapBouteilles.nbrAneeABoir }" />
															<fmt:message key="listconsomer.ans"></fmt:message>
														</c:when>
														<c:when
															test="${ mapBouteilles.nbrAneeABoir.toString().equals('3') }">
															<fmt:message key="listconsomer.dans"></fmt:message>
															<c:out value="${ mapBouteilles.nbrAneeABoir }" />
															<fmt:message key="listconsomer.ans"></fmt:message>
														</c:when>
														<c:when
															test="${ mapBouteilles.nbrAneeABoir.toString().equals('4') }">
															<fmt:message key="listconsomer.dans"></fmt:message>
															<c:out value="${ mapBouteilles.nbrAneeABoir }" />
															<fmt:message key="listconsomer.ans"></fmt:message>
														</c:when>

														<c:otherwise>
															<fmt:message key="listconsomer.dans"></fmt:message>
															<c:out value="${ mapBouteilles.nbrAneeABoir }" />
															<fmt:message key="listconsomer.ansdecinq"></fmt:message>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
										</div>
										<div
											class="column-11 w-col w-col-2 w-col-small-2 w-col-tiny-2">
											<div class="divhcenterelement">
												<div class="descriptrestlc" >
													<c:out value="${ mapBouteilles.nbrListCourses }" />
												</div>
												<img src="images/addboutshoppinglist.png"
													id="${ mapBouteilles.id} ${ mapBouteilles.nom}" data-nbr="<c:out value="${ mapBouteilles.nbrListCourses }" />" alt=""
													class="imgajouterinfobouteilleshoplistfromlc"
													title="<fmt:message key="bouteilles.title.changerquantite"></fmt:message>">

											</div>
											<div class="divdescrp2lh w-clearfix">
												<div class="descriptrest">
													<c:if test="${(!empty mapBouteilles.commentaire)}">
														<fmt:message key="bouteilles.commentaire"></fmt:message>
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
		style="<c:if test="${empty form.erreurs && empty bouteilleLC}">display: none</c:if>">
		<div class="formmain">
			<div class="divhrightelementsmall">
				<a title="<fmt:message key="button.title.sortir"></fmt:message>"
					class="sortirformsansrechargement">
					<img src="images/sortir.png" width="30" height="50"
					style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
					alt="" class="sortirformimg">
				</a>
			</div>

			<form method="post" id="formLC" action="" class="forminside">

				<c:if test="${!empty form.unsuccessMajLC}">
					<span class="erreur"><fmt:message
							key="listcourses.unsuccess.maj"></fmt:message>
						${form.unsuccessMajLC}</span>
				</c:if>

				<c:if test="${!empty form.erreurs['erreurDaoBouteille']}">
					<span class="erreur"> <fmt:message key="erreur.dao"></fmt:message>
						${form.erreurs['erreurDaoBouteille']}
					</span>
				</c:if>

				<div for="quantiteAcheter" class="warningdel">
					<div id="nombouteillepourquantiteacheter"></div>
					<fmt:message key="bouteilles.maj.ccombienbouteillesdanslc"></fmt:message>
				</div>

				<input type="number" min="0" maxlength="4" name="quantiteAcheter"
					id="quantiteAcheter" class="inputformbouteille w-input"
					value="<c:out value="${bouteilleLC.nbrListCourses}"/>">



				<div class="divhcenterelement">
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

	<c:if test="${!empty form.successMajLC}">
		<script>
			var timer = setTimeout(function() {
				window.location = 'listeCourses'
			}, 3000);
		</script>
	</c:if>


	<div class="resultat" id="resultat"
		style="<c:if test="${empty form.successMajLC}">display: none</c:if>">
		<div class="formmain">
			<div class="divhrightelementsmall">
				<a title="<fmt:message key="button.title.sortir"></fmt:message>"
					href="<c:url value="/listeCourses"></c:url>" class="sortirformimg">
					<img src="images/sortir.png" width="30" height="50"
					style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
					alt="" class="sortirformimg">
				</a>
			</div>
			<div class="divhcenterelement">

				<span class="maj"><fmt:message key="listcourses.success.maj"></fmt:message>
					${form.successMajLC}</span>


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