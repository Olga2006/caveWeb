<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="messages" />


<!DOCTYPE html>
<html data-wf-page="5c87c9153f656c8f0ad43c3c"
	data-wf-site="5bf300026add22d3cd0f2499">
<head>
<meta charset="utf-8">
<title><fmt:message key="redacteurcave.title"></fmt:message></title>
<jsp:include page="/WEB-INF/jsp/head/head.jsp"></jsp:include>
</head>
<body class="body" id="bodyredacteurcave">
	<div id="coverforformulaire" style="display: none"></div>

	<jsp:include page="/WEB-INF/jsp/left/left.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/jsp/nav/nav.jsp"></jsp:include>
	<div class="coremembre">

		<div class="bvcellar"></div>
		<div class="divbvdanscave">
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
										title="<fmt:message key="title.supprimer"></fmt:message> <c:out value="${ caveR.nom }" />">

								</div>
								<div class="divhcenterelement">
									<a
										title="<fmt:message key="redacteurcave.title.sortir"></fmt:message>"
										href="<c:url value="/listeCaves"></c:url>"> <img
										src="<fmt:message key="redacteurcave.imgsrc.sortircave"></fmt:message>"
										alt="" class="imgentreesortircave">
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
										<fmt:message key="caves.compartiments"></fmt:message>
										<c:out value="${ caveR.nbrRow }" />
										<fmt:message key="caves.rangees"></fmt:message>
									</div>
								</div>
								<div class="divdescrp2lh w-clearfix">
									<div class="descriptrest">
										<c:out value="${ caveR.nbrTotal }" />
										<fmt:message key="caves.bouteillesstockees"></fmt:message>
									</div>
								</div>
								<div class="divdescrp2lh w-clearfix">
									<div class="descriptrest">
										<fmt:message key="caves.prixachat"></fmt:message>
										<c:out value="${ caveR.prixTotalAchat }" />
										, €
									</div>
									<div class="descripattention">
										<fmt:message key="caves.prixactuel"></fmt:message>
										<c:out value="${ caveR.prixTotalActuelle }" />
										, €
									</div>
								</div>
							</div>
							<div class="column-2 w-col w-col-6 w-col-small-6 w-col-tiny-6">
								<div class="divdescrp2lh">
									<div class="divnombrechaquebdanscave w-clearfix">
										<div class="descripattention">
											<c:out value="${ caveR.nbrRouge }" />
										</div>
										<img width="70"
											src="<fmt:message key="caves.imgsrc.rouge"></fmt:message>"
											alt="" class="imgcouleur"
											title="<fmt:message key="caves.title.rouge"></fmt:message>">
									</div>
									<div class="divnombrechaquebdanscave w-clearfix">
										<div class="descripattention">
											<c:out value="${ caveR.nbrJaune }" />
										</div>
										<img width="70"
											src="<fmt:message key="caves.imgsrc.jaune"></fmt:message>"
											alt="" class="imgcouleur"
											title="<fmt:message key="caves.title.jaune"></fmt:message>">
									</div>
									<div class="divnombrechaquebdanscave w-clearfix">
										<div class="descripattention">
											<c:out value="${ caveR.nbrBlanc }" />
										</div>
										<img width="70"
											src="<fmt:message key="caves.imgsrc.blanc"></fmt:message>"
											alt="" class="imgcouleur"
											title="<fmt:message key="caves.title.blanc"></fmt:message>">
									</div>
									<div class="divnombrechaquebdanscave w-clearfix">
										<div class="descripattention">
											<c:out value="${ caveR.nbrEffervescent }" />
										</div>
										<img width="70"
											src="<fmt:message key="caves.imgsrc.effervescent"></fmt:message>"
											alt="" class="imgcouleur"
											title="<fmt:message key="caves.title.effervescent"></fmt:message>">
									</div>
									<div class="divnombrechaquebdanscave w-clearfix">
										<div class="descripattention">
											<c:out value="${ caveR.nbrRose }" />
										</div>
										<img width="70"
											src="<fmt:message key="caves.imgsrc.rose"></fmt:message>"
											alt="" class="imgcouleur"
											title="<fmt:message key="caves.title.rose"></fmt:message>">
									</div>

									<div class="divnombrechaquebdanscave w-clearfix">
										<div class="descripattention">
											<c:out value="${ caveR.nbrLiquoreux }" />
										</div>
										<img width="70"
											src="<fmt:message key="caves.imgsrc.liquoreux"></fmt:message>"
											alt="" class="imgcouleur"
											title="<fmt:message key="caves.title.liquoreux"></fmt:message>">
									</div>

									<div class="divnombrechaquebdanscave w-clearfix">
										<div class="descripattention">
											<c:out value="${ caveR.nbrAutreCol }" />
										</div>
										<img width="70"
											src="<fmt:message key="caves.imgsrc.autre"></fmt:message>"
											alt="" class="imgcouleur"
											title="<fmt:message key="caves.title.autre"></fmt:message>">
									</div>

								</div>
								<div class="divdescrp2lh w-clearfix">
									<div class="descripattention">
										<c:out value="${ caveR.nbrPC }" />
										Premier cru       
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
										Cru Classé
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
										<fmt:message key="caves.autre"></fmt:message>
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


								<span class="descripttabrangee"><fmt:message
										key="redacteurcave.rangeedevant"></fmt:message></span>
							</a>

							<a data-name="tabB" ondragover="openTabB()" id="mainTabB"
								class="<c:choose>
													<c:when test="${tab.toString().equals('tabB')}">tabactive</c:when>
													<c:otherwise>tabpassive</c:otherwise>
													</c:choose>">
								<span class="descripttabrangee"><fmt:message
										key="redacteurcave.rangeederiere"></fmt:message></span>
							</a>
						</c:if>


					</div>
					<div class="sousblockoneitem">
						<div class="collectionmain w-row">

							<div class="column-4 w-col w-col-10 w-col-small-10 w-col-tiny-10">
								<div class="divcavemaxscroll">
									<div class="divcavemax">
										<div data-duration-in="300" data-duration-out="100"
											class="w-tabs">


											<!-- 	*******************************************************TAB CONTENT************************************************************************* -->
											<div class="tabs-content w-tab-content">
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
																	class="addrangee"
																	title="<fmt:message key="redacteurcave.title.ajouterrangee"></fmt:message>">
																	<fmt:message key="redacteurcave.button.ajouterrangee"></fmt:message>
																</a> <a
																	id="<c:if test="${mapCompartiments.id.toString().equals( idCompartimentAficher.toString() )}">aficherCompartiment</c:if>"
																	href="<c:url value="/suppressionRangee"><c:param name="idCompartiment" value="${mapCompartiments.id}" /><c:param name="tab" value="tabA" /></c:url>"
																	class="addrangee"
																	title="<fmt:message key="redacteurcave.title.supprimerrangee"></fmt:message>">
																	<fmt:message key="redacteurcave.button.supprimer"></fmt:message>
																</a>

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
																								class="<c:choose>
											<c:when test="${ mapPositions.getCouleurBouteille().equals('Rouge') or mapPositions.getCouleurBouteille().equals('Red') or mapPositions.getCouleurBouteille().equals('Czerwone') or mapPositions.getCouleurBouteille().equals('Красное')}">bouteillerouge</c:when>											
											<c:when test="${ mapPositions.getCouleurBouteille().equals('Blanc') or mapPositions.getCouleurBouteille().equals('White') or mapPositions.getCouleurBouteille().equals('Białe') or mapPositions.getCouleurBouteille().equals('Белое') }">bouteilleblanc</c:when>
											<c:when test="${ mapPositions.getCouleurBouteille().equals('Jaune') or mapPositions.getCouleurBouteille().equals('Yellow') or mapPositions.getCouleurBouteille().equals('Żółte') or mapPositions.getCouleurBouteille().equals('Желтое') }">bouteillejaune</c:when>
											<c:when test="${ mapPositions.getCouleurBouteille().equals('Rosé') or mapPositions.getCouleurBouteille().equals('Pink') or mapPositions.getCouleurBouteille().equals('Różowe') or mapPositions.getCouleurBouteille().equals('Розовое') }">bouteillerose</c:when>
											<c:when test="${ mapPositions.getCouleurBouteille().equals('Effervescent') or mapPositions.getCouleurBouteille().equals('Sparkling') or mapPositions.getCouleurBouteille().equals('Musujące') or mapPositions.getCouleurBouteille().equals('Шипучее') }">bouteilleeffervescent</c:when>
											<c:when test="${ mapPositions.getCouleurBouteille().equals('Liquoreux') or mapPositions.getCouleurBouteille().equals('Liquor') or mapPositions.getCouleurBouteille().equals('Likierowe') or mapPositions.getCouleurBouteille().equals('Ликер') }">bouteilleliquoreux</c:when>
											<c:otherwise>bouteilleetrange</c:otherwise>
												</c:choose>	">
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
																		class="addposition"
																		title="<fmt:message key="redacteurcave.title.ajouterposition"></fmt:message>"<%-- <c:out value="${countPositions}" />
																		<c:if test="${countPositions > 19}">style="display: none "</c:if> --%>>+</a>
																	<a
																		id="<c:if test="${mapRangees.id.toString().equals( idRangeeAficher.toString() )}">aficherRangee</c:if>"
																		href="<c:url value="/suppressionPosition"><c:param name="idRangee" value="${ mapRangees.id }" /><c:param name="tab" value="tabA" /></c:url>"
																		class="addposition"
																		title="<fmt:message key="redacteurcave.title.supprimerposition"></fmt:message>">-</a>

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
																	class="addrangee"
																	title="<fmt:message key="redacteurcave.title.ajouterrangee"></fmt:message>">
																	<fmt:message key="redacteurcave.button.ajouterrangee"></fmt:message>
																</a> <a
																	id="<c:if test="${mapCompartiments.id.toString().equals( idCompartimentAficher.toString() )}">aficherCompartiment</c:if>"
																	href="<c:url value="/suppressionRangee"><c:param name="idCompartiment" value="${mapCompartiments.id}" /><c:param name="tab" value="tabB" /></c:url>"
																	class="addrangee"
																	title="<fmt:message key="redacteurcave.title.supprimerrangee"></fmt:message>">
																	<fmt:message key="redacteurcave.button.supprimer"></fmt:message>
																</a>

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
																								class="<c:choose>
											<c:when test="${ mapPositions.getCouleurBouteille().equals('Rouge') or mapPositions.getCouleurBouteille().equals('Red') or mapPositions.getCouleurBouteille().equals('Czerwone') or mapPositions.getCouleurBouteille().equals('Красное')}">bouteillerouge</c:when>											
											<c:when test="${ mapPositions.getCouleurBouteille().equals('Blanc') or mapPositions.getCouleurBouteille().equals('White') or mapPositions.getCouleurBouteille().equals('Białe') or mapPositions.getCouleurBouteille().equals('Белое') }">bouteilleblanc</c:when>
											<c:when test="${ mapPositions.getCouleurBouteille().equals('Jaune') or mapPositions.getCouleurBouteille().equals('Yellow') or mapPositions.getCouleurBouteille().equals('Żółte') or mapPositions.getCouleurBouteille().equals('Желтое') }">bouteillejaune</c:when>
											<c:when test="${ mapPositions.getCouleurBouteille().equals('Rosé') or mapPositions.getCouleurBouteille().equals('Pink') or mapPositions.getCouleurBouteille().equals('Różowe') or mapPositions.getCouleurBouteille().equals('Розовое') }">bouteillerose</c:when>
											<c:when test="${ mapPositions.getCouleurBouteille().equals('Effervescent') or mapPositions.getCouleurBouteille().equals('Sparkling') or mapPositions.getCouleurBouteille().equals('Musujące') or mapPositions.getCouleurBouteille().equals('Шипучее') }">bouteilleeffervescent</c:when>
											<c:when test="${ mapPositions.getCouleurBouteille().equals('Liquoreux') or mapPositions.getCouleurBouteille().equals('Liquor') or mapPositions.getCouleurBouteille().equals('Likierowe') or mapPositions.getCouleurBouteille().equals('Ликер') }">bouteilleliquoreux</c:when>
											<c:otherwise>bouteilleetrange</c:otherwise>
												</c:choose>	">






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
																		class="addposition"
																		title="<fmt:message key="redacteurcave.title.ajouterposition"></fmt:message>"<%-- <c:out value="${countPositions}" />
																		<c:if test="${countPositions > 19}">style="display: none "</c:if> --%>>+</a>
																	<a
																		id="<c:if test="${mapRangees.id.toString().equals( idRangeeAficher.toString() )}">aficherRangee</c:if>"
																		href="<c:url value="/suppressionPosition"><c:param name="idRangee" value="${ mapRangees.id }" /><c:param name="tab" value="tabB" /></c:url>"
																		class="addposition"
																		title="<fmt:message key="redacteurcave.title.supprimerposition"></fmt:message>">-</a>

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
			</div>
		</div>

	</div>

	<!-- **********************************************Form Mettre Bouteille dans la place***************************************************** -->

	<div class="divdisapppourtrigger" id="divmettrebouteilleform"
		style="display: none;">
		<div class="formmain">

			<div
				class="${ (empty sessionUtilisateur.bouteilles) ? 'divhrightelementsmall' : 'divhrightelement'}">

				<a title="<fmt:message key="button.title.sortir"></fmt:message>"
					href="#" id="sortirformsansrechargementmettrebouteille"> <img
					src="images/sortir.png" width="30" height="50"
					style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
					alt="" class="sortirformimg">
				</a>
			</div>
			<div class="forminside" style="max-width: 450px;">

				<span class="erreur">${erreurAjout}</span>
				<c:choose>
					<c:when test="${ empty sessionUtilisateur.bouteilles }">

						<div class="erreur">${sessionUtilisateur.nom },
							<fmt:message key="redacteurcave.messagecarnetdesvinvide"></fmt:message>
						</div>
						<a title="<fmt:message key="title.creerbouteille"></fmt:message>"
							id="linkajouterelementred" href="#"> <img
							data-w-id="a6207b9e-8d69-5d74-21cf-257a614694e6"
							src="images/addBouteille.png"
							style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
							alt="" class="ajouteelemimg">
						</a>


					</c:when>

					<c:otherwise>

						<!-- *********************************************************Collection Bouteilles************************************************************ -->
						<div class="descripattention">
							<fmt:message key="redacteurcave.veuillezchoisiroptionpour"></fmt:message>
						</div>
						<div class="descripattention" id="afichageRefPoz"></div>

						<div class="divdescrp2lh">
							<a title="<fmt:message key="title.creerbouteille"></fmt:message>"
								id="linkajouterelementred" href="#"> <img
								data-w-id="a6207b9e-8d69-5d74-21cf-257a614694e6"
								src="images/addBouteille.png"
								style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
								alt="" class="ajouteelemimg">
							</a> <a id="sortirBouteille" style="display: none;" href=""
								title="<fmt:message key="title.sortirbouteille"></fmt:message>">
								<img
								src="<fmt:message key="redacteurcave.imgsrc.sortirbouteille"></fmt:message>"
								alt="" class="imgsortirbouteille ">
							</a>



						</div>

						<input id="filterBouteille" type="text"
							placeholder="<fmt:message key="filter.placeholder"></fmt:message>"
							class="inputformbouteille" style="margin-bottom: 7px">

						<c:forEach items="${sessionUtilisateur.bouteilles }"
							var="mapBouteilles" varStatus="boucle">



							<div class="ciblebouteille" id="ancre${mapBouteilles.id }">
								<div class="blockoneitem">
									<a class="txtrefbouteillPourMettreDansCave"
										id="${mapBouteilles.id }" href=""
										title="<fmt:message key="redacteurcave.title.mettrebouteille"></fmt:message>">
										<div class="collectionmain w-row">
											<div
												class="column-2 w-col w-col-2 w-col-small-2 w-col-tiny-2">

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
												class="column-5 w-col w-col-5 w-col-small-5 w-col-tiny-5">
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
														<c:out value="${ mapBouteilles.cru }" />
													</div>
												</div>
											</div>
											<div
												class="column-3 w-col w-col-3 w-col-small-3 w-col-tiny-3">
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
											</div>
											<div
												class="column-2 w-col w-col-2 w-col-small-2 w-col-tiny-2">
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

	<div class="divopencreerbouteille"
		id="divdisapppourtriggerupdatesansrecharger"
		style="z-index: 3; opacity: 1;  <c:if test="${empty form && empty bouteille}">display: none</c:if>">
		<div class="formmain">

			<div class="divhrightelement">
				<a title="<fmt:message key="button.title.sortir"></fmt:message>"
					class="sortirformsansrechargement"> <img
					src="images/sortir.png" width="30" height="50"
					style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
					alt="" class="sortirformimg">
				</a>
			</div>
			<form id="formCreationBouteille" class="forminside" method="post"
				enctype="multipart/form-data" action="">



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

	<!-- *********************************************************Fin Form Creation Bouteille************************************************************ -->

	<a
		title="<fmt:message key="redacteurcave.title.ajoutercave"></fmt:message>"
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
				class="imgaboire">
			<fmt:message key="redacteurcave.attentiontermeconsomation"></fmt:message>
		</div>



		<!-- *********************************************************Form Confirm Del************************************************************ -->
		<div class="divdisapppourtriggerdel" id="divdisapppourtriggerdel"
			style="display: none;">
			<div class="formmain">
				<div class="divhrightelementsmall">
					<a title="<fmt:message key="button.title.sortir"></fmt:message>"
						href="#" id="sortirformsansrechargement"
						class="sortirformsansrechargement"> <img
						src="images/sortir.png" width="30" height="50"
						style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
						alt="" class="sortirformimg">
					</a>
				</div>


				<form method="post" action="" class="forminside" id="formDel">

					<label for="nom-5" class="warningdel"><fmt:message
							key="caves.del.warningdel"></fmt:message></label>
					<div class="divhcenterelement">
						<input type="submit"
							value="<fmt:message key="button.valider"></fmt:message>"
							data-wait="<fmt:message key="button.wait"></fmt:message>"
							class="buttonstandart"> <a
							title="<fmt:message key="button.title.sortir"></fmt:message>"
							href="#" class="buttonstandart sortirformsansrechargement"><fmt:message
								key="button.title.sortir"></fmt:message></a>
					</div>
				</form>

			</div>
		</div>

		<!-- **********************************************resultat succes***************************************************** -->

		<c:if test="${!empty form.successCreationB}">
			<script>
				var timer = setTimeout(function() {
					window.location = 'redigerCave'
				}, 3000);
			</script>
		</c:if>

		<div class="resultat" id="resultat"
			style="<c:if test="${empty successCreationB}">display: none</c:if>">
			<div class="formmain">
				<div class="divhrightelementsmall">
					<a title="<fmt:message key="button.title.sortir"></fmt:message>"
						href="<c:url value="/redigerCave"></c:url>" class="sortirformimg">
						<img src="images/sortir.png" width="30" height="50"
						style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
						alt="" class="sortirformimg">
					</a>
				</div>
				<div class="divhcenterelement">
					<span class="maj"><fmt:message
							key="bouteilles.success.creation"></fmt:message>
						${form.successCreationB}</span>
				</div>

			</div>
		</div>

		<script
			src="https://d1tdp7z6w94jbb.cloudfront.net/js/jquery-3.3.1.min.js"
			type="text/javascript"
			integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
			crossorigin="anonymous"></script>

		<script src="jquery.ui.touch-punch.min.js"></script>
		<script src="js/jqcave.js" type="text/javascript"></script>
		<script src="js/jscave.js" type="text/javascript"></script>
		<!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
</body>
</html>