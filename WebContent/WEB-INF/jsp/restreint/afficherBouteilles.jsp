<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="messages" />
<!DOCTYPE html>
<html data-wf-page="5c87c9153f656c8f0ad43c3c"
	data-wf-site="5bf300026add22d3cd0f2499">

<link href="css/dependent-dropdown.min.css" media="all" rel="stylesheet"
	type="text/css" />

<head>
<meta charset="utf-8">
<title><fmt:message key="bouteilles.title"></fmt:message></title>
<!--   <meta content="About 1" property="og:title"> -->
<jsp:include page="/WEB-INF/jsp/head/head.jsp"></jsp:include>
</head>

<body class="body">
<div id="coverforformulaire" style="<c:if test="${empty form.erreurs && empty bouteille }">display: none</c:if>"></div>
	<jsp:include page="/WEB-INF/jsp/left/left.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/jsp/nav/nav.jsp"></jsp:include>



	<div class="coremembre">
		<div class="bvcellar"></div>

		<c:choose>
			<c:when test="${ empty bouteilles }">

				<div class="divbvdanscave descriptnom">
					<h1 class="heading bvheading">${sessionUtilisateur.nom },
						<fmt:message key="bouteilles.messagelistbouteillesvide"></fmt:message>
					</h1>
				</div>



			</c:when>
			<c:otherwise>
				<div class="divbvdanscave">
					<h1 class="heading bvheading">
						<fmt:message key="bouteilles.title"></fmt:message>
					</h1>
				</div>
				<div>
					<input id="filterBouteille" type="text"
						placeholder="<fmt:message key="filter.placeholder"></fmt:message>"
						class="descriptrest inputformbouteille"
						style="float: right; margin-bottom: 5px; margin-right: 5px;">
					<select id="etibouteille" name="tri"
						class="descriptrest inputformbouteille"
						style="float: right; margin-right: 5px; margin-bottom: 5px; width: auto; padding-right: 0px">

						<option value="">
							<c:if test="${empty tri}">
								<fmt:message key="tri.placeholder"></fmt:message>
							</c:if>
							<c:choose>
								<c:when test="${tri.equals('parNom')}">
									<fmt:message key="bouteilles.nom"></fmt:message>
								</c:when>
								<c:when test="${tri.equals('parPays')}">
									<fmt:message key="bouteilles.pays"></fmt:message>
								</c:when>
								<c:when test="${tri.equals('parRegion')}">
									<fmt:message key="bouteilles.region"></fmt:message>
								</c:when>
								<c:when test="${tri.equals('parAppelation')}">
									<fmt:message key="bouteilles.appelation"></fmt:message>
								</c:when>
								<c:when test="${tri.equals('parCru')}">
									<fmt:message key="bouteilles.classement"></fmt:message>
								</c:when>
								<c:when test="${tri.equals('parCouleur')}">
									<fmt:message key="bouteilles.couleur"></fmt:message>
								</c:when>
								<c:when test="${tri.equals('parTaille')}">
									<fmt:message key="bouteilles.taille"></fmt:message>
								</c:when>
								<c:when test="${tri.equals('parPrixAchat')}">
									<fmt:message key="bouteilles.prixAchat"></fmt:message>
								</c:when>
								<c:when test="${tri.equals('parPrixActuelle')}">
									<fmt:message key="bouteilles.prixActuelle"></fmt:message>
								</c:when>
								<c:when test="${tri.equals('parDateDeProduction')}">
									<fmt:message key="bouteilles.dateDeProduction"></fmt:message>
								</c:when>
								<c:when test="${tri.equals('parDateGarder')}">
									<fmt:message key="bouteilles.dateGarder"></fmt:message>
								</c:when>
								<c:when test="${tri.equals('triNbrTotal')}">
									<fmt:message key="bouteilles.nombrestockees"></fmt:message>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
						</option>

						<option value="parNom"><fmt:message key="bouteilles.nom"></fmt:message></option>
						<option value="parPays"><fmt:message
								key="bouteilles.pays"></fmt:message></option>
						<option value="parRegion"><fmt:message
								key="bouteilles.region"></fmt:message></option>
						<option value="parAppelation"><fmt:message
								key="bouteilles.appelation"></fmt:message></option>
						<option value="parCru"><fmt:message
								key="bouteilles.classement"></fmt:message></option>
						<option value="parCouleur"><fmt:message
								key="bouteilles.couleur"></fmt:message></option>
						<option value="parTaille"><fmt:message
								key="bouteilles.taille"></fmt:message></option>
						<option value="parPrixAchat"><fmt:message
								key="bouteilles.prixAchat"></fmt:message></option>
						<option value="parPrixActuelle"><fmt:message
								key="bouteilles.prixActuelle"></fmt:message></option>
						<option value="parDateDeProduction"><fmt:message
								key="bouteilles.dateDeProduction"></fmt:message></option>
						<option value="parDateGarder"><fmt:message
								key="bouteilles.dateGarder"></fmt:message></option>
						<option value="triNbrTotal"><fmt:message
								key="bouteilles.nombrestockees"></fmt:message></option>
					</select>
					<c:if test="${!empty erreurDaoTri}">
						<span class="erreur"> <fmt:message key="erreur.dao"></fmt:message>
							${erreurDaoTri}
						</span>
					</c:if>
				</div>
				<div class="collectionscroll">


					<!-- *********************************************************Collection Bouteilles************************************************************ -->
					<c:forEach items="${bouteilles}" var="mapBouteilles"
						varStatus="boucle">
						<div class="ciblebouteille">
							<div class="blockoneitem">
								<div class="sousblockoneitem">
									<div class="collectionmain w-row">
										<div class="column-3 w-col w-col-2 w-col-small-2 w-col-tiny-2">

											<!-- *********************************************************Rating/Supprimer/Update************************************************************ -->
											<img
												title="<fmt:message key="bouteilles.title.evaluation"></fmt:message>"
												src=" <c:choose>
												<c:when test="${ mapBouteilles.evaluation.toString().equals('5') }">images/rating5.png</c:when>
                                                <c:when test="${ mapBouteilles.evaluation.toString().equals('4') }">images/rating4.png</c:when>
                                                <c:when test="${ mapBouteilles.evaluation.toString().equals('3') }">images/rating3.png</c:when>
                                                <c:when test="${ mapBouteilles.evaluation.toString().equals('2') }">images/rating2.png</c:when>
                                                <c:when test="${ mapBouteilles.evaluation.toString().equals('1') }">images/rating1.png</c:when>
												<c:otherwise>images/rating0.png</c:otherwise>
											</c:choose>"
												alt="<c:out value="${ mapBouteilles.evaluation }" />"
												class="imgraiting"
												id="${ mapBouteilles.id} ${ mapBouteilles.nom}">

											<div class="divhcenterelement">

												<img src="images/supprimer.png" alt=""
													class="imgajouterinfobouteilledel"
													id="${ mapBouteilles.id} ${ mapBouteilles.nom}"
													title="<fmt:message key="title.supprimer"></fmt:message>">

												<a title="<fmt:message key="title.maj"></fmt:message>"
													href="<c:url value="/creationBouteille">
											<c:param name="idBouteille" value="${ mapBouteilles.id }" /></c:url>">
													<img src="images/corriger.png" alt=""
													class="imgajouterinfobouteilleupdate">
												</a>

											</div>
										</div>
										<div class="column-4 w-col w-col-5 w-col-small-5 w-col-tiny-5">
											<div class="divdescrp2lh w-clearfix">
												<div class="descriptmainnom">
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
											
											<c:when test="${ mapBouteilles.pays.equals('Algérie')}">images/flag/flagalgerie.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Autriche')}">images/flag/flagautriche.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Belgique')}">images/flag/flagbelgique.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Bulgarie')}">images/flag/flagbulgarie.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Canada')}">images/flag/flagcanada.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Croatie')}">images/flag/flagcroatie.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Géorgie')}">images/flag/flaggeorgie.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Hongrie')}">images/flag/flaghongrie.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Inde')}">images/flag/flaginde.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Indonésie')}">images/flag/flagindonesie.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Israël')}">images/flag/flagisrael.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Japon')}">images/flag/flagjapon.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Jordanie')}">images/flag/flagjordanie.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Liban')}">images/flag/flagliban.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Luxembourg')}">images/flag/flagluxembourg.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Malte')}">images/flag/flagmalte.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Maroc')}">images/flag/flagmaroc.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Mexique')}">images/flag/flagmexique.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Moldavie')}">images/flag/flagmoldavie.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Montenegro')}">images/flag/flagmontenegro.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('République Tchèque')}">images/flag/flagrepubliquetcheque.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Royaume Uni')}">images/flag/flagroyaumeuni.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Slovaquie')}">images/flag/flagslovaquie.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Suisse')}">images/flag/flagsuisse.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Syrie')}">images/flag/flagsyrie.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Tanzanie')}">images/flag/flagtanzanie.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Tunisie')}">images/flag/flagtunisie.jpg</c:when>
											<c:when test="${ mapBouteilles.pays.equals('Uruguay')}">images/flag/flaguruguay.jpg</c:when>
											
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
										</div>
										<div class="column-2 w-col w-col-3 w-col-small-3 w-col-tiny-3">
											<div class="divdescrp2ch">
												<div class="descripattention">

													<%-- <c:forEach items="${mapBouteilles.positions}"
														var="mapPositions" varStatus="bouclePositions">
														<c:set var="countPositions"
															value="${ bouclePositions.count }" />
													</c:forEach> --%>
													<c:out value="${mapBouteilles.nbrTotal}" />

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

												<div class="descriptrestlc">
													<c:out value="${ mapBouteilles.nbrListCourses }" />
												</div>


												<!-- *********************************************************Shopping List/ Commentaire************************************************************ -->
												<img src="images/addboutshoppinglist.png"
													id="${ mapBouteilles.id} ${ mapBouteilles.nom}"
													data-nbr="<c:out value="${ mapBouteilles.nbrListCourses }" />"
													alt="" class="imgajouterinfobouteilleshoplist"
													title="<fmt:message key="bouteilles.title.changerquantite"></fmt:message>">

												<img src="images/addcomment.png"
													id="${ mapBouteilles.id} ${ mapBouteilles.nom}"
													data-comment="<c:out value="${ mapBouteilles.commentaire }" />"
													alt="" class="imgajouterinfobouteilleaddcomment"
													title="<fmt:message key="bouteilles.title.changercommentaires"></fmt:message>">
											</div>
										</div>
									</div>

								</div>



								<div class="sousblockoneitemclosed" style="display: none">
									<div class="collectionmain w-row">
										<div class="column-3 w-col w-col-2 w-col-small-2 w-col-tiny-2">
											<img src="fichiers/<c:out value="${ mapBouteilles.image }"/>"
												alt="" class="imgetiquette">
										</div>
										<div class="column-4 w-col w-col-5 w-col-small-5 w-col-tiny-5">
											<div class="divdescrp2lh w-clearfix">
												<div class="descriptrest">
													<fmt:message key="bouteilles.prixachat"></fmt:message>
													<c:out value="${ mapBouteilles.prixAchat }" />
													, €
												</div>
												<div class="descripattention">
													<fmt:message key="bouteilles.prixactuel"></fmt:message>
													<c:out value="${ mapBouteilles.prixActuelle }" />
													, €
												</div>
											</div>

											<div class="divdescrp2lh w-clearfix">
												<div class="descriptrest">
													<c:if test="${(!empty mapBouteilles.commentaire)}">
														<fmt:message key="bouteilles.commentaire"></fmt:message>:
													</c:if>

												</div>
												<div class="descriptrestcommentaire">
													<c:out value="${ mapBouteilles.commentaire }" />
												</div>
											</div>
										</div>
										<div class="column-2 w-col w-col-3 w-col-small-3 w-col-tiny-3">
											<c:if test="${ !empty mapBouteilles.positions}">
												<div class="divdescrp2ch">
													<div class="descripattention">
														<fmt:message key="bouteilles.emplacements"></fmt:message>
													</div>
												</div>
												<div class="divdescrp2ch">
													<c:forEach items="${mapBouteilles.positions}"
														var="mapPositions" varStatus="boucle">
														<div class="descriptrest">

															<a
																title="<fmt:message key="bouteilles.title.ouvriremplacement"></fmt:message>"
																href="<c:url value="/redigerCave"><c:param name="idCaveR" value="${ mapPositions.idCave }" /><c:param name="idPositionAficher" value="${ mapPositions.id }" /><c:param name="referenceC" value="${ mapPositions.referenceC }" /></c:url>#aficher">

																<c:out value="${mapPositions }" />
															</a>

														</div>
													</c:forEach>
												</div>
											</c:if>
										</div>
										<div
											class="column-11 w-col w-col-2 w-col-small-2 w-col-tiny-2">

										</div>
									</div>
								</div>


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

							</div>


						</div>
					</c:forEach>
					<!-- *********************************************************Fin Collection Bouteilles************************************************************ -->
				</div>




			</c:otherwise>
		</c:choose>

		<a title="<fmt:message key="title.creerbouteille"></fmt:message>"
			id="linkajouterelement" href="#"> <img
			src="images/addBouteille.png"
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
					style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
					alt="" class="sortirformimg">
				</a>
			</div>

			<c:choose>
				<c:when test="${!empty erreurs}">

					<c:if test="${!empty erreurs['echecDel']}">
						<span class="erreur"><fmt:message
								key="bouteilles.resultat.delfirst"></fmt:message>
							${erreurs['echecDel']} <fmt:message
								key="bouteilles.unsuccess.delsecond"></fmt:message></span>
					</c:if>

					<br>
					<c:if test="${!empty erreurs['erreurDao']}">
						<span class="erreur"><fmt:message key="erreur.dao"></fmt:message>
							${erreurs['erreurDao']}</span>
					</c:if>



					<div class="divhcenterelement">
						<a title="<fmt:message key="button.title.sortir"></fmt:message>"
							href="<c:url value="/listeBouteilles"></c:url>"
							class="tabformul w-button"> <fmt:message
								key="button.title.sortir"></fmt:message>
						</a>
					</div>
				</c:when>

				<c:otherwise>
					<form method="post" action="" class="forminside" id="formDel">
						<label for="nom-5" class="warningdel"><fmt:message
								key="bouteillesdel.warningdel"></fmt:message></label>
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

	<!-- *********************************************************Form Ajoute commentaire************************************************************ -->

	<div class="divdisapppourtriggeraddcomment"
		id="divdisapppourtriggeraddcomment"
		style="<c:if test="${empty form.unsuccessMajCommentaire && empty bouteilleComment}">display: none</c:if>">
		<div class="formmain">
			<div class="divhrightelementsmall">
				<a title="<fmt:message key="button.title.sortir"></fmt:message>"
					class="sortirformsansrechargement"> 
					
					<img src="images/sortir.png" width="30"
					height="50"
					style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
					alt="" class="sortirformimg">
				</a>
			</div>

			<form method="post" id="formLCamment" action="" class="forminside">

				<c:if test="${!empty form.unsuccessMajCommentaire}">
					<span class="erreur"><fmt:message
							key="commentaire.unsuccess.maj"></fmt:message>
						${form.unsuccessMajCommentaire}</span>
				</c:if>

				<c:if test="${!empty form.erreurs['erreurDaoBouteille']}">
					<span class="erreur"> <fmt:message key="erreur.dao"></fmt:message>
						${form.erreurs['erreurDaoBouteille']}
					</span>
				</c:if>
				<div class="warningdel">
					<div id="nombouteillepourcomment"></div>
					<fmt:message key="bouteilles.maj.commentaire"></fmt:message>
				</div>

				<textarea id="commentaire" name="commentaire" maxlength="5000"
					class="inputformtext"></textarea>


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

	<!-- *********************************************************Form Ajoute bouteille dans la liste des courses************************************************************ -->
	<div class="divdisapppourtriggeraddshoplist"
		id="divdisapppourtriggeraddshoplist"
		style="<c:if test="${empty form.unsuccessMajLC && empty bouteilleLC}">display: none</c:if>">
		<div class="formmain">
			<div class="divhrightelementsmall">
				<a title="<fmt:message key="button.title.sortir"></fmt:message>"
					class="sortirformsansrechargement">
					 <img src="images/sortir.png" width="30"
					height="50"
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

				<div class="warningdel">
					<div id="nombouteillepourquantiteacheter"></div>
					<fmt:message key="bouteilles.maj.ccombienbouteillesdanslc"></fmt:message>
				</div>

				<input type="number" min="0" maxlength="4" name="quantiteAcheter"
					id="quantiteAcheter" class="inputformbouteille"
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


	<!-- *********************************************************Form Ajoute evaluation bouteille************************************************************ -->
	<div class="divdisapppourtriggerevaluation"
		id="divdisapppourtriggerevaluation"
		style="<c:if test="${empty form.unsuccessMajEvaluation && empty bouteilleEvaluation}">display: none</c:if>">
		<div class="formmain">
			<div class="divhrightelementsmall">
				<a title="<fmt:message key="button.title.sortir"></fmt:message>"
					class="sortirformsansrechargement"> 
					
					<img src="images/sortir.png" width="30"
					height="50"
					style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
					alt="" class="sortirformimg">
				</a>
			</div>

			<form method="post" id="formEvaluation" action="" class="forminside">

				<c:if test="${!empty form.unsuccessMajEvaluation}">
					<span class="erreur"><fmt:message
							key="evaluation.unsuccess.maj"></fmt:message>
						${form.unsuccessMajEvaluation}</span>
				</c:if>

				<c:if test="${!empty form.erreurs['erreurDaoBouteille']}">
					<span class="erreur"> <fmt:message key="erreur.dao"></fmt:message>
						${form.erreurs['erreurDaoBouteille']}
					</span>
				</c:if>

				<div class="divhcenterelement">

					<div class="warningdel">
						<fmt:message key="bouteilles.maj.evaluation"></fmt:message>
						<div id="nombouteillepourevaluation"></div>
					</div>

					<input type="number" name="evaluation" data-name="evaluation"
						id="evaluation" class="tabevaluation"
						value="<c:out  value="${ bouteilleEvaluation.evaluation }"/>"
						min="0" max="5" step="1" title="1">
				</div>


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
	<!-- *********************************************************Creation Bouteille************************************************************ -->

	<div class="divdisapppourtriggerupdate" id="divdisapppourtriggerupdate<c:if test="${empty bouteille}">sansrecharger</c:if><c:if test="${!empty bouteille}">bouteille</c:if>"
		style="<c:if test="${empty form.erreurs && empty bouteille }">display: none</c:if>">
		<div class="formmain">

			<div class="divhrightelement">
				<a title="<fmt:message key="button.title.sortir"></fmt:message>"					
					<c:if test="${!empty bouteille}"> href="<c:url value="/listeBouteilles"></c:url>"</c:if> class="sortirformsansrechargement"> 
					
					
					<img src="images/sortir.png" width="30"
					height="50"
					style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
					alt="" class="sortirformimg">
				</a>
			</div>

			<form id="prechargerimgform" method="post"
				data-name="${ bouteille.id }" enctype="multipart/form-data"
				class="forminside" action="">




				<c:if test="${ !empty erreurImage}">
					<span class="erreur"> <fmt:message key="bouteilles.erreurImage"></fmt:message>  ${erreurImage}</span>
				</c:if>




				<img
					src="fichiers/<c:choose><c:when test="${!empty imagePrechargee}"><c:out value="${imagePrechargee}"/></c:when>
					<c:when test="${!empty bouteille.image}"><c:out value="${bouteille.image}"/></c:when>
					<c:otherwise>defaultetiquette.jpg</c:otherwise></c:choose>"
					alt="" class="imgetiquette" id="imgetiquette">
				<c:if test="${ !empty imagePrechargee}">
					<span class="labelformbouteille"><fmt:message
							key="bouteilles.image.vousallezcharger"></fmt:message></span>
					<span class="erreur"><c:out value="${imagePrechargee}" /></span>
				</c:if>



				<a id="butchargerimg" class="tabformul"><fmt:message
						key="bouteilles.image.changer"></fmt:message></a>

				<div id="ciblechargerimg" style="display: none;">
					<label for="image" class="labelformbouteille"><fmt:message
							key="bouteilles.image.charger"></fmt:message> <span
						class="requis"><br>(<fmt:message
								key="bouteilles.image.formats"></fmt:message>)</span> </label> <input
						type="file" id="image" name="image" class="inputformbouteille"
						value="<c:out value="${imagePrechargee}"/>" />
				</div>

			</form>



			<form id="formCreation" class="forminside" method="post"
				action="<c:url value="/creationBouteille"><c:if test="${ !empty bouteille}">
				<c:param name="idBouteille" value="${ bouteille.id }"/></c:if>
				<c:if test="${ !empty imagePrechargee}"><c:param name="image" value="${imagePrechargee}" /> </c:if> </c:url>">

				<jsp:include page="formBouteille.jsp"></jsp:include>

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
			test="${empty form.successCreationB && empty form.successMajB && 
			empty form.successMajCommentaire && empty form.successMajEvaluation && empty form.successMajLC && empty successDel}"></c:when>
		<c:otherwise>
			<script>
				var timer = setTimeout(function() {
					window.location = 'listeBouteilles'
				}, 3000);
			</script>
		</c:otherwise>
	</c:choose>

	<div class="resultat" id="resultat"
		style="<c:if test="${empty form.successCreationB && empty form.successMajB && 
			empty form.successMajCommentaire && empty form.successMajEvaluation && empty form.successMajLC && empty successDel}">display: none</c:if>">
		<div class="formmain">
			<div class="divhrightelementsmall">
				<a title="<fmt:message key="button.title.sortir"></fmt:message>"
					href="<c:url value="/listeBouteilles"></c:url>"
					class="sortirformimg"> <img src="images/sortir.png" width="30"
					height="50"
					style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
					alt="" class="sortirformimg">
				</a>
			</div>
			<div class="divhcenterelement">
				<c:if test="${!empty form.successCreationB}">
					<span class="maj"><fmt:message
							key="bouteilles.success.creation"></fmt:message>
						${form.successCreationB}</span>
				</c:if>
				<c:if test="${!empty form.successCreation}">
					<span class="maj"><fmt:message
							key="producteurs.success.creation"></fmt:message>
						${form.successCreation}</span>
				</c:if>
				<c:if test="${!empty form.successMajB}">
					<span class="maj"><fmt:message key="bouteilles.success.maj"></fmt:message>
						${form.successMajB}</span>
				</c:if>
				<c:if test="${!empty form.successMajCommentaire}">
					<span class="maj"><fmt:message key="commentaire.success.maj"></fmt:message>
						${form.successMajCommentaire}</span>
				</c:if>
				<c:if test="${!empty form.successMajEvaluation}">
					<span class="maj"><fmt:message key="evaluation.success.maj"></fmt:message>
						${form.successMajEvaluation}</span>
				</c:if>
				<c:if test="${!empty form.successMajLC}">
					<span class="maj"><fmt:message key="listcourses.success.maj"></fmt:message>
						${form.successMajLC}</span>
				</c:if>
				<c:if test="${!empty successDel}">
					<span class="maj"><fmt:message
							key="bouteilles.resultat.delfirst"></fmt:message> ${successDel} <fmt:message
							key="bouteilles.success.delsecond"></fmt:message></span>
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