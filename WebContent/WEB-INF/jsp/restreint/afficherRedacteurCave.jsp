<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html data-wf-page="5c87c9153f656c8f0ad43c3c"
	data-wf-site="5bf300026add22d3cd0f2499">
<head>
<meta charset="utf-8">
<title>Redacteur cave</title>
<jsp:include page="/WEB-INF/jsp/head/head.jsp"></jsp:include>
</head>
<body class="body" id="bodyredacteurcave">
	<jsp:include page="/WEB-INF/jsp/left/left.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/jsp/nav/nav.jsp"></jsp:include>
	<div class="coremembre">

		<div class="bvcellar"></div>
		<div class="divbvdanscave descriptnom">
			<h1 class="heading bvheading">
				<c:if test="${!empty caveR}">
					<legend> ${caveR.nom } </legend>
				</c:if>
			</h1>
		</div>
		<div class="collectionscrollcaves">


			<div class="cible">
				<div class="blockoneitem">
					<div class="sousblockoneitem">
						<div class="collectionmain w-row">
							<div class="column-3 w-col w-col-3 w-col-small-3 w-col-tiny-3">
								<div class="divhcenterelement">

									<img src="images/supprimer.png" alt=""
										class="imgajouterinfocavedel" id="${ caveR.id} ${ caveR.nom}"
										title="Supprimer la cave <c:out value="${ caveR.nom }" />">

								</div>
								<div class="divhcenterelement">
									<a title="Sortir la cave"
										href="<c:url value="/listeCaves"></c:url>"> <img
										src="images/sortircave.png" alt="" class="imgentreesortircave">
									</a>
								</div>
							</div>
							<div class="column-4 w-col w-col-3 w-col-small-3 w-col-tiny-3">
								<div class="divdescrp2lh w-clearfix">
									<div class="descriptmainnom">
										<c:out value="${ caveR.nom }" />
									</div>
								</div>
								<div class="divdescrp2lh w-clearfix">
									<div class="descripattention">
										<c:out value="${ caveR.nbrCompartiment }" />
										Compartiments
										<c:out value="${ caveR.nbrRow }" />
										Rangee
									</div>
								</div>
								<div class="divdescrp2lh w-clearfix">
									<div class="descriptrest">
										<c:out value="${ caveR.nbrTotal }" />
										Bouteilles Stockées
									</div>
								</div>
								<div class="divdescrp2lh w-clearfix">
									<div class="descriptrest">
										Prix Total d&#x27;achat
										<c:out value="${ caveR.prixTotalAchat }" />, €
									</div>
									<div class="descripattention">
										Prix Total actuelle
										<c:out value="${ caveR.prixTotalActuelle }" />, €
									</div>
								</div>
							</div>
							<div class="column-2 w-col w-col-6 w-col-small-6 w-col-tiny-6">
								<div class="divdescrp2lh">
									<div class="divnombrechaquebdanscave w-clearfix">
										<div class="descripattention">
											<c:out value="${ caveR.nbrRouge }" />
										</div>
										<img width="70" src="images/butkr.png" alt=""
											class="imgcouleur" title="Rouge">
									</div>
									<div class="divnombrechaquebdanscave w-clearfix">
										<div class="descripattention">
											<c:out value="${ caveR.nbrJaune }" />
										</div>
										<img width="70" src="images/bute.png" alt=""
											class="imgcouleur" title="Jaune">
									</div>
									<div class="divnombrechaquebdanscave w-clearfix">
										<div class="descripattention">
											<c:out value="${ caveR.nbrBlanc }" />
										</div>
										<img width="70" src="images/butb.png" alt=""
											class="imgcouleur" title="Blanc">
									</div>
									<div class="divnombrechaquebdanscave w-clearfix">
										<div class="descripattention">
											<c:out value="${ caveR.nbrEffervescent }" />
										</div>
										<img width="70" src="images/butch.png" alt=""
											class="imgcouleur" title="Effervescent">
									</div>
									<div class="divnombrechaquebdanscave w-clearfix">
										<div class="descripattention">
											<c:out value="${ caveR.nbrRose }" />
										</div>
										<img width="70" src="images/butr.png" alt=""
											class="imgcouleur" title="Rosé">
									</div>

									<div class="divnombrechaquebdanscave w-clearfix">
										<div class="descripattention">
											<c:out value="${ caveR.nbrLiquoreux }" />
										</div>
										<img width="70" src="images/butl.png" alt=""
											class="imgcouleur" title="Liquoreux">
									</div>

									<div class="divnombrechaquebdanscave w-clearfix">
										<div class="descripattention">
											<c:out value="${ caveR.nbrAutreCol }" />
										</div>
										<img width="70" src="images/butn.png" alt=""
											class="imgcouleur" title="Autre">
									</div>

								</div>
								<div class="divdescrp2lh w-clearfix">
									<div class="descripattention">
										<c:out value="${ caveR.nbrPC }" />
										Premiere Cru       
									</div>
									<div class="descriptrest">
										<c:out value="${ caveR.nbrV }" />
										Village
									</div>

								</div>



								<div class="divdescrp2lh w-clearfix">
									<div class="descripattention">
										<c:out value="${ caveR.nbrGC }" />
										Grand Cru            
									</div>
									<div class="descriptrest">
										<c:out value="${ caveR.nbrCC }" />
										Cru classé
									</div>

								</div>



								<div class="divdescrp2lh w-clearfix">
									<div class="descripattention">
										<c:out value="${ caveR.nbrCB }" />
										Cru Bourgeois           
									</div>
									<div class="descriptrest">
										<c:out value="${ caveR.nbrNC }" />
										Non Classé
									</div>

									-
									<div class="descriptrest">
										<c:out value="${ caveR.nbrAutreCru }" />
										Autre Cru
									</div>
								</div>


							</div>
						</div>
					</div>
						<div class="tabs-menu w-tab-menu">
												<!-- opacity: 1; transition: opacity 300ms ease 0s; -->
												<c:if test="${!empty caveR.compartimentsB}">
													<a data-name="tabA" ondragover="openTabA()" id="mainTabA"
														class="<c:choose>
													<c:when test="${tab.toString().equals('tabB')}">tabpassive</c:when>
													<c:otherwise>tabactive</c:otherwise>
													</c:choose> ">


														<span class="descripttabrangee">Rangée Devant</span>
													</a>

													<a data-name="tabB" ondragover="openTabB()" id="mainTabB"
														class="<c:choose>
													<c:when test="${tab.toString().equals('tabB')}">tabactive</c:when>
													<c:otherwise>tabpassive</c:otherwise>
													</c:choose>">
														<span class="descripttabrangee">Rangée Derrière</span>
													</a>
												</c:if>


											</div>
					<div class="sousblockoneitemclosed" >
						<div class="collectionmain w-row" >

							<div class="column-4 w-col w-col-10 w-col-small-10 w-col-tiny-10">
								<div class="divcavemaxscroll">
									<div class="divcavemax">
										<div data-duration-in="300" data-duration-out="100"
											class="w-tabs">
										

											<!-- 	*******************************************************TAB CONTENT************************************************************************* -->
											<div class="tabs-content w-tab-content" >
												<!-- 	******************************************************* 1-ere tab************************************************** -->


												<div id="tabA"
													<c:if test="${tab.toString().equals('tabB')}">style="display: none;"</c:if>>



													<c:forEach items="${caveR.compartiments}"
														var="mapCompartiments" varStatus="boucle">
														<div class="compartiment w-clearfix">
															<div class="descriptmainnom">
																<c:out value="${ mapCompartiments.referenceC }" />
															</div>
															<div class="rangee">

																<a
																	id="<c:if test="${mapCompartiments.id.toString().equals( idCompartimentAficher.toString() )}">aficherCompartiment</c:if>"
																	href="<c:url value="/creationRangee"><c:param name="idCompartiment" value="${mapCompartiments.id }" /><c:param name="tab" value="tabA" /></c:url>"
																	class="addrangee" title="Ajouter une Rangee">
																	Ajouter Rangée </a> <a
																	id="<c:if test="${mapCompartiments.id.toString().equals( idCompartimentAficher.toString() )}">aficherCompartiment</c:if>"
																	href="<c:url value="/suppressionRangee"><c:param name="idCompartiment" value="${mapCompartiments.id}" /><c:param name="tab" value="tabA" /></c:url>"
																	class="addrangee" title="Supprimer la derniere Rangee">
																	Supprimer </a>

															</div>

															<c:forEach items="${mapCompartiments.rangees}"
																var="mapRangees" varStatus="boucle">
																<div class="rangee">
																	<div class="txtrefrangee">
																		<c:out value="${ mapRangees.referenceR}" />
																	</div>

																	<c:forEach items="${mapRangees.positions}"
																		var="mapPositions" varStatus="bouclePositions">

																		<c:set var="countPositions"
																			value="${ bouclePositions.count }" />

																		<c:choose>
																			<c:when test="${!empty mapPositions.nomBouteille }">
																				<div class="detect"
																					id="<c:if test="${mapPositions.id.toString().equals( idPositionAficher.toString() )}">aficher</c:if>">
																					<div class="refbouteill">
																						<div class="txtrefbouteill">
																							<c:out value="${ mapPositions.referenceP}" />
																						</div>
																					</div>
																					<div class="afichecontenu"
																						id="<c:out value="${ mapPositions.id}"/> tabA <c:out value="${ mapPositions}"/> <c:out value="${ mapPositions.idBouteille}"/> ">
																						<div class="divbouteilledropable"
																							id="<c:out value="${ mapPositions.idBouteille} ${ mapPositions.id}"/>"
																							draggable="true" ondragstart="drag(event)">

																							<div class="descrcotenubouteille"
																								style="display: none;">
																								<div class="divdescrp2lh">
																									<div class="descriptmainsmall">
																										<c:out value="${ mapPositions.nomBouteille}" />
																									</div>
																								</div>
																								<div class="divdescrp2lh">
																									<div class="descriptrestsmall">
																										<c:out value="${ mapPositions.volumBouteille}" />
																										cl
																									</div>
																								</div>
																								<div class="divdescrp2lh">
																									<div class="descriptrestsmall">
																										<c:out
																											value="${ mapPositions.regionBouteille}" />
																									</div>
																								</div>
																							</div>


																							<div
																								class="${ mapPositions.getCouleurBouteille().equals( 'Rouge' ) ? 'bouteillerouge' : 
																mapPositions.getCouleurBouteille().equals( 'Blanc' ) ? 'bouteilleblanc' : mapPositions.getCouleurBouteille().equals( 'Jaune' ) ? 'bouteillejaune' : 
																mapPositions.getCouleurBouteille().equals( 'Rosé' ) ? 'bouteillerose' : mapPositions.getCouleurBouteille().equals( 'Effervescent' ) ? 'bouteilleeffervescent' : 
																mapPositions.getCouleurBouteille().equals( 'Liquoreux' ) ? 'bouteilleliquoreux' : 'bouteilleetrange' }	">
																								<!-- <div class="alertestock">
																									<div class="descriptnbrsmall">3</div>
																								</div> -->
																								<div class="alerteboire">
																									
																									<c:choose>
																										<c:when
																											test="${ mapPositions.nbrAneeABoirBouteille<1}">
																											<img draggable="false"
																												src="images/aConsomer.png" alt=""
																												class="imgaboire">
																										</c:when>
																										<c:otherwise>
																											<div class="bouteilleinside"></div>
																										</c:otherwise>
																									</c:choose>

																								</div>
																							</div>




																						</div>
																					</div>
																				</div>

																			</c:when>



																			<c:otherwise>

																				<div class="detect"
																					id="<c:if test="${mapPositions.id.toString().equals( idPositionAficher.toString() )}">aficher</c:if>">
																					<div class="refbouteill">
																						<div class="txtrefbouteill">
																							<c:out value="${ mapPositions.referenceP}" />
																						</div>
																					</div>
																					<div class="afichecontenu" ondrop="drop(event)"
																						ondragover="allowDrop(event)"
																						id="<c:out value="${ mapPositions.id}"/> tabA <c:out value="${ mapPositions}"/> <c:out value="${ mapPositions.idBouteille}"/> ">

																					</div>
																				</div>

																			</c:otherwise>
																		</c:choose>

																	</c:forEach>
																	<!-- <script>
																		
																	</script> -->

																	<a
																		id="<c:if test="${mapRangees.id.toString().equals( idRangeeAficher.toString() )}">aficherRangee</c:if>"
																		href="<c:url value="/creationPosition"><c:param name="idRangee" value="${ mapRangees.id }" /><c:param name="tab" value="tabA" /></c:url>"
																		class="addposition" title="Ajouter une Position"
																		<%-- <c:out value="${countPositions}" />
																		<c:if test="${countPositions > 19}">style="display: none "</c:if> --%>>+</a>
																	<a
																		id="<c:if test="${mapRangees.id.toString().equals( idRangeeAficher.toString() )}">aficherRangee</c:if>"
																		href="<c:url value="/suppressionPosition"><c:param name="idRangee" value="${ mapRangees.id }" /><c:param name="tab" value="tabA" /></c:url>"
																		class="addposition"
																		title="Supprimer la derniere Position">-</a>

																</div>
															</c:forEach>
														</div>
													</c:forEach>
												</div>
												<!-- 	*******************************************************Fin 1-ere tab************************************************** -->
												<!-- 	******************************************************* 2-eme tab************************************************** -->


												<div id="tabB"
													<c:if test="${tab.toString().equals('tabA')}">style="display: none;"</c:if>>




													<c:forEach items="${caveR.compartimentsB}"
														var="mapCompartiments" varStatus="boucle">
														<div class="compartiment w-clearfix">
															<div class="descriptmainnom">
																<c:out value="${ mapCompartiments.referenceC }" />
															</div>
															<div class="rangee">

																<a
																	id="<c:if test="${mapCompartiments.id.toString().equals( idCompartimentAficher.toString() )}">aficherCompartiment</c:if>"
																	href="<c:url value="/creationRangee"><c:param name="idCompartiment" value="${mapCompartiments.id }" /><c:param name="tab" value="tabB" /></c:url>"
																	class="addrangee" title="Ajouter une Rangee">
																	Ajouter Rangée </a> <a
																	id="<c:if test="${mapCompartiments.id.toString().equals( idCompartimentAficher.toString() )}">aficherCompartiment</c:if>"
																	href="<c:url value="/suppressionRangee"><c:param name="idCompartiment" value="${mapCompartiments.id}" /><c:param name="tab" value="tabB" /></c:url>"
																	class="addrangee" title="Supprimer la derniere Rangee">
																	Supprimer </a>

															</div>

															<c:forEach items="${mapCompartiments.rangees}"
																var="mapRangees" varStatus="boucle">
																<div class="rangee">
																	<div class="txtrefrangee">
																		<c:out value="${ mapRangees.referenceR}" />
																	</div>

																	<c:forEach items="${mapRangees.positions}"
																		var="mapPositions" varStatus="bouclePositions">

																		<c:set var="countPositions"
																			value="${ bouclePositions.count }" />

																		<c:choose>
																			<c:when test="${!empty mapPositions.nomBouteille }">
																				<div class="detect"
																					id="<c:if test="${mapPositions.id.toString().equals( idPositionAficher.toString() )}">aficher</c:if>">
																					<div class="refbouteill">
																						<div class="txtrefbouteill">
																							<c:out value="${ mapPositions.referenceP}" />
																						</div>
																					</div>
																					<div class="afichecontenu"
																						id="<c:out value="${ mapPositions.id}"/> tabB <c:out value="${ mapPositions}"/> <c:out value="${ mapPositions.idBouteille}"/> ">
																						<div class="divbouteilledropable"
																							id="<c:out value="${ mapPositions.idBouteille} ${ mapPositions.id}"/>"
																							draggable="true" ondragstart="drag(event)">

																							<div class="descrcotenubouteille"
																								style="display: none;">
																								<div class="divdescrp2lh">
																									<div class="descriptmainsmall">
																										<c:out value="${ mapPositions.nomBouteille}" />
																									</div>
																								</div>
																								<div class="divdescrp2lh">
																									<div class="descriptrestsmall">
																										<c:out value="${ mapPositions.volumBouteille}" />
																										cl
																									</div>
																								</div>
																								<div class="divdescrp2lh">
																									<div class="descriptrestsmall">
																										<c:out
																											value="${ mapPositions.regionBouteille}" />
																									</div>
																								</div>
																							</div>


																							<div
																								class="${ mapPositions.getCouleurBouteille().equals( 'Rouge' ) ? 'bouteillerouge' : 
																mapPositions.getCouleurBouteille().equals( 'Blanc' ) ? 'bouteilleblanc' : mapPositions.getCouleurBouteille().equals( 'Jaune' ) ? 'bouteillejaune' : 
																mapPositions.getCouleurBouteille().equals( 'Rosé' ) ? 'bouteillerose' : mapPositions.getCouleurBouteille().equals( 'Effervescent' ) ? 'bouteilleeffervescent' : 
																mapPositions.getCouleurBouteille().equals( 'Liquoreux' ) ? 'bouteilleliquoreux' : 'bouteilleetrange' }	">
																								<div class="alerteboire">
																									
																									<c:choose>
																										<c:when
																											test="${ mapPositions.nbrAneeABoirBouteille<1}">
																											<img draggable="false"
																												src="images/aConsomer.png" alt=""
																												class="imgaboire">
																										</c:when>
																										<c:otherwise>
																											<div class="bouteilleinside"></div>
																										</c:otherwise>
																									</c:choose>

																								</div>
																							</div>

																						</div>
																					</div>
																				</div>

																			</c:when>



																			<c:otherwise>

																				<div class="detect"
																					id="<c:if test="${mapPositions.id.toString().equals( idPositionAficher.toString() )}">aficher</c:if>">
																					<div class="refbouteill">
																						<div class="txtrefbouteill">
																							<c:out value="${ mapPositions.referenceP}" />
																						</div>
																					</div>
																					<div class="afichecontenu" ondrop="drop(event)"
																						ondragover="allowDrop(event)"
																						id="<c:out value="${ mapPositions.id}"/> tabB <c:out value="${ mapPositions}"/> <c:out value="${ mapPositions.idBouteille}"/> ">

																					</div>
																				</div>

																			</c:otherwise>
																		</c:choose>

																	</c:forEach>
																	<!-- <script>
																		
																	</script> -->

																	<a
																		id="<c:if test="${mapRangees.id.toString().equals( idRangeeAficher.toString() )}">aficherRangee</c:if>"
																		href="<c:url value="/creationPosition"><c:param name="idRangee" value="${ mapRangees.id }" /><c:param name="tab" value="tabB" /></c:url>"
																		class="addposition" title="Ajouter une Position"
																		<%-- <c:out value="${countPositions}" />
																		<c:if test="${countPositions > 19}">style="display: none "</c:if> --%>>+</a>
																	<a
																		id="<c:if test="${mapRangees.id.toString().equals( idRangeeAficher.toString() )}">aficherRangee</c:if>"
																		href="<c:url value="/suppressionPosition"><c:param name="idRangee" value="${ mapRangees.id }" /><c:param name="tab" value="tabB" /></c:url>"
																		class="addposition"
																		title="Supprimer la derniere Position">-</a>

																</div>
															</c:forEach>
														</div>
													</c:forEach>







												</div>
												<!-- 	*******************************************************Fin 2-eme tab************************************************** -->
											</div>
											<!-- 	*******************************************************Fin TAB CONTENT************************************************************************* -->
										</div>
									</div>
									<div class="divpourextcavescroll">
										<div class="divpourextcavescroll"></div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>


				<!-- **********************************************Form Mettre Bouteille dans la place***************************************************** -->

				<div class="divdisapppourtrigger" id="divmettrebouteilleform"
					style="display: none">
					<div class="formmain">

						<div
							class="${ (empty sessionUtilisateur.bouteilles) ? 'divhrightelementsmall' : 'divhrightelement'}">

							<a title="Sortir" href="#" class="sortirformimg"
								id="sortirformsansrechargement"> <img
								src="images/sortir.png" width="30" height="50"
								style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
								alt="" class="sortirformimg">
							</a>
						</div>
						<div class="forminside" style="max-width: 450px;">

							<span class="erreur">${erreurAjout}</span>
							<c:choose>
								<c:when test="${ empty sessionUtilisateur.bouteilles }">

									<div class="erreur">${sessionUtilisateur.nom }, votre carnet des vins est vide. Veuillez enregistrer votre première bouteille!</div>
									<a title="Cree une Bouteille" id="linkajouterelement" href="#">
										<img data-w-id="a6207b9e-8d69-5d74-21cf-257a614694e6"
										src="images/addBouteille.png"
										style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
										alt="" class="ajouteelemimg">
									</a>


								</c:when>

								<c:otherwise>

									<!-- *********************************************************Collection Bouteilles************************************************************ -->
									<div class="descripattention" id="afichageRefPoz"></div>

									<div class="divdescrp2lh">
										<a title="Cree une Bouteille" id="linkajouterelement" href="#">
											<img data-w-id="a6207b9e-8d69-5d74-21cf-257a614694e6"
											src="images/addBouteille.png"
											style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
											alt="" class="ajouteelemimg">
										</a> <a id="sortirBouteille" style="display: none;" href=""
											title="Sortir la Bouteille"> <img
											src="images/sortirbouteille.png" alt=""
											class="imgsortirbouteille ">
										</a>



									</div>

									<input id="filterBouteille" type="text" placeholder="Search.."
										class="inputformbouteille" style="margin-bottom: 7px">

									<c:forEach items="${sessionUtilisateur.bouteilles }"
										var="mapBouteilles" varStatus="boucle">



										<div class="ciblebouteille" id="ancre${mapBouteilles.id }">
											<div class="blockoneitem">
												<a class="txtrefbouteillPourMettreDansCave"
													id="${mapBouteilles.id }" href="" title="Mettre Bouteille">
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
																alt="" class="imgraiting">
														</div>
														<div
															class="column-4 w-col w-col-5 w-col-small-5 w-col-tiny-5">
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
																	<c:out value="${ mapBouteilles.cru }" />
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
														</div>
														<div
															class="column-11 w-col w-col-2 w-col-small-2 w-col-tiny-2">
															<div class="divhcenterelement">
																<img src="images/addboutcave.png"
																	data-w-id="b06583ac-2649-ae79-205a-271560a9fbf1" alt=""
																	class="imgajouterinfobouteillecave ">

															</div>
														</div>
													</div>

												</a>
											</div>
										</div>




									</c:forEach>
								</c:otherwise>
							</c:choose>
							<!-- *********************************************************Fin Collection Bouteilles************************************************************ -->

						</div>
					</div>
				</div>
				<!-- **********************************************Fin Form Mettre Bouteille dans la place***************************************************** -->

				<!-- *********************************************************Form Creation Bouteille************************************************************ -->

				<div class="divopencreerbouteille" id="divdisapppourtriggerupdate"
					style="z-index: 2; opacity: 1; <c:if test="${empty form && empty bouteille}">display: none</c:if>">
					<div class="formmain">

						<div class="divhrightelement">
							<a title="Sortir" href="#" class="sortirformimg"
								id="sortirformsansrechargementcreerbouteille"> <img
								src="images/sortir.png" width="30" height="50"
								style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
								alt="" class="sortirformimg">
							</a>
						</div>
						<form id="formCreationBouteille" name="email-form"
							data-name="Email Form" class="forminside" method="post"
							enctype="multipart/form-data" action="">

							<span class="erreur">${form.resultat}</span> <span class="erreur">${form.erreurs['erreurDaoBouteille']}</span>

							<jsp:include page="formBouteille.jsp"></jsp:include>



							<div class="divbutform">
								<input type="submit" value="Valider"
									data-wait="Merci de patienter ..." class="tabformul"> <input
									type="reset" value="Remettre à initiale"
									data-wait="Merci de patienter ..." class="tabformul w-button" />
							</div>
						</form>
					</div>
				</div>

				<!-- *********************************************************Fin Form Creation Bouteille************************************************************ -->
			</div>
			<a title="Ajouter Cave"
				href="<c:url value="/creationCave"><c:param name="isCreation" value="isCreation" /></c:url>"
				class="linkajoutercave w-inline-block"> <img
				src="images/adddcave.png"
				data-w-id="2268c7f2-5bc3-7d72-53f7-e00c170ae7a0"
				style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
				alt="" class="ajouteelemimg"></a>

		</div>


		<div class="divdescrp2ch w-clearfix">
			<div class="descripattention">
				<img draggable="false" src="images/signeboire.jpg" alt=""
					class="imgaboire"> *Signe de rapprochement de la terme de la
				consommation.
			</div>

		</div>

	</div>

	<!-- *********************************************************Form Confirm Del************************************************************ -->
	<div class="divdisapppourtriggerdel" id="divdisapppourtriggerdel"
		style="display: none">
		<div class="formmain">
			<div class="divhrightelementsmall">
				<a title="Sortir" href="#" id="sortirformsansrechargement"
					class="linksortirform"> <img src="images/sortir.png" width="30"
					height="50"
					style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
					alt="" class="sortirformimg">
				</a>
			</div>


			<form method="post" action="" class="forminside" id="formDel">

				<label for="nom-5" class="warningdel">Suppression une cave
					de votre carnet vas provoquer des changements dans le carnet de vin
					en niveau des quantité stockée</label>
				<div class="divhcenterelement">
					<input type="submit" value="Valider"
						data-wait="Merci de patienter ..." class="tabformul w-button">
					<a title="Sortir" href="#" class="tabformul w-button"> Sortir </a>
				</div>
			</form>

		</div>
	</div>

	<!-- **********************************************resultat succes***************************************************** -->

	<c:if test="${!empty succes}">
		<script>
			var timer = setTimeout(function() {
				window.location = 'redigerCave'
			}, 3000);
		</script>
	</c:if>

	<div class="resultat" id="resultat"
		style="<c:if test="${empty succes}">display: none</c:if>">
		<div class="formmain">
			<div class="divhrightelementsmall">
				<a title="Sortir" href="<c:url value="/redigerCave"></c:url>"
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
		type="text/javascript"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script src="js/jqcave.js" type="text/javascript"></script>
	<script src="js/jscave.js" type="text/javascript"></script>
	<!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
</body>
</html>