<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html data-wf-page="5bf300026add225c390f24bd"
	data-wf-site="5bf300026add22d3cd0f2499">
<head>
<meta charset="utf-8">
<title>List Bouteilles à consomer</title>
<!--   <meta content="About 1" property="og:title"> -->
<jsp:include page="/WEB-INF/jsp/head/head.jsp"></jsp:include>
</head>

<body class="body">
	<jsp:include page="/WEB-INF/jsp/left/left.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/jsp/nav/nav.jsp"></jsp:include>



	<div class="coremembre">
		<div class="bvcellar"></div>

		<c:choose>
			<c:when test="${ empty bouteillesConsomer }">

				<div class="divbvdanscave descriptnom">
					<h1 class="heading bvheading">${sessionUtilisateur.nom }, vous
						n'avez pas les bouteilles à consommer pour 3 années prochaines.</h1>
				</div>

			</c:when>
			<c:otherwise>
				<div class="divbvdanscave">
					<h1 class="heading bvheading">List bouteille à consomer pour <input id="filterBouteilleConsomer" style="width: 35px" type="number" value="3"  min="0"
						max="3" step="1" class="inputaneeconsomation">
						années prochaines</h1>
				</div>
				<div class="collectionscroll">
					
					<!-- *********************************************************Collection Bouteilles************************************************************ -->
					
						<!-- *********************************************************Collection Bouteilles a consomer cette anee************************************************************ -->
						<c:forEach items="${bouteillesConsomer }" var="mapBouteilles" varStatus="boucle">
						<c:if
							test="${ mapBouteilles.nbrAneeABoir.toString().equals('0') }">
							<c:if test="${ !empty mapBouteilles.positions}">
							<div class="cible0" >
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
													alt="" class="imgraiting" style="cursor: text">
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
												class="column-4 w-col w-col-5 w-col-small-5 w-col-tiny-5">
												<div class="divdescrp2lh w-clearfix">
													<div class="descriptmainnom" style="cursor: text">
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
													<div class="descripattention">
														<c:out value="${ mapBouteilles.appelation}" />
													</div>

												</div>



												<div class="divdescrp2lh w-clearfix">
													<div class="descriptrest">
														<c:out value="${ mapBouteilles.cru }" />
													</div>

												</div>


												<div class="divdescrp2lh w-clearfix">
													<div class="descriptrest">
														Achetée
														<c:out value="${ mapBouteilles.prixAchat }" />, €
													</div>
												</div>
												<div class="divdescrp2lh w-clearfix">
													<div class="descripattention">
														Valeur actuelle
														<c:out value="${ mapBouteilles.prixActuelle }" />, €
													</div>
												</div>

											</div>
											<div
												class="column-2 w-col w-col-3 w-col-small-3 w-col-tiny-3">
												
													<div class="divdescrp2lh w-clearfix">
														<div class="descripattention">Se trouve dans</div>
													</div>
													<div class="divdescrp2lh w-clearfix">
														<c:forEach items="${mapBouteilles.positions}"
															var="mapPositions" varStatus="boucle">
															<div class="descriptrest">
																<a title="Montrer dans la cave"
																	href="<c:url value="/redigerCave"><c:param name="idCaveR" value="${ mapPositions.idCave }" /><c:param name="idPositionAficher" value="${ mapPositions.id }" /><c:param name="referenceC" value="${ mapPositions.referenceC }" /></c:url>#aficher">

																	<c:out value="${mapPositions }" />
																</a>
															</div>
														</c:forEach>
													</div>
											
											</div>
											<div
												class="column-11 w-col w-col-2 w-col-small-2 w-col-tiny-2">

												<div class="divdescrp2lh w-clearfix">
													<div class="descriptrest">
														<c:if test="${(!empty mapBouteilles.commentaire)}">
											Vos commentaire:
											<c:out value="${ mapBouteilles.commentaire }" />
														</c:if>

													</div>
												</div>
											</div>
										</div>

									</div>

								</div>

							</div>
							</c:if>
						</c:if>
					    </c:forEach>
						
						
						
						<!-- *********************************************************Collection Bouteilles a consomer dans 1 an************************************************************ -->
						<c:forEach items="${bouteillesConsomer }" var="mapBouteilles" varStatus="boucle">
						<c:if
							test="${ mapBouteilles.nbrAneeABoir.toString().equals('1') }"><c:if test="${ !empty mapBouteilles.positions}">
							<div class="cible1" >
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
													alt="" class="imgraiting" style="cursor: text">
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
												class="column-4 w-col w-col-5 w-col-small-5 w-col-tiny-5">
												<div class="divdescrp2lh w-clearfix">
													<div class="descriptmainnom" style="cursor: text">
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
													<div class="descripattention">
														<c:out value="${ mapBouteilles.appelation}" />
													</div>

												</div>



												<div class="divdescrp2lh w-clearfix">
													<div class="descriptrest">
														<c:out value="${ mapBouteilles.cru }" />
													</div>

												</div>


												<div class="divdescrp2lh w-clearfix">
													<div class="descriptrest">
														Achetée
														<c:out value="${ mapBouteilles.prixAchat }" />
														, €
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
												<c:if test="${ !empty mapBouteilles.positions}">
													<div class="divdescrp2lh w-clearfix">
														<div class="descripattention">Se trouve dans</div>
													</div>
													<div class="divdescrp2lh w-clearfix">
														<c:forEach items="${mapBouteilles.positions}"
															var="mapPositions" varStatus="boucle">
															<div class="descriptrest">
																<a title="Montrer dans la cave"
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

												<div class="divdescrp2lh w-clearfix">
													<div class="descriptrest">
														<c:if test="${(!empty mapBouteilles.commentaire)}">
											Vos commentaire:
											<c:out value="${ mapBouteilles.commentaire }" />
														</c:if>

													</div>
												</div>
											</div>
										</div>

									</div>

								</div>

							</div>
						</c:if></c:if>
						</c:forEach>
						<!-- *********************************************************Collection Bouteilles a consomer dans 2 ans************************************************************ -->
						<c:forEach items="${bouteillesConsomer }" var="mapBouteilles" varStatus="boucle">
						<c:if
							test="${ mapBouteilles.nbrAneeABoir.toString().equals('2') }"><c:if test="${ !empty mapBouteilles.positions}">
							<div class="cible2" >
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
													alt="" class="imgraiting" style="cursor: text">
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
												class="column-4 w-col w-col-5 w-col-small-5 w-col-tiny-5">
												<div class="divdescrp2lh w-clearfix">
													<div class="descriptmainnom" style="cursor: text">
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
													<div class="descripattention">
														<c:out value="${ mapBouteilles.appelation}" />
													</div>

												</div>



												<div class="divdescrp2lh w-clearfix">
													<div class="descriptrest">
														<c:out value="${ mapBouteilles.cru }" />
													</div>

												</div>


												<div class="divdescrp2lh w-clearfix">
													<div class="descriptrest">
														Achetée
														<c:out value="${ mapBouteilles.prixAchat }" />
														, €
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
												<c:if test="${ !empty mapBouteilles.positions}">
													<div class="divdescrp2lh w-clearfix">
														<div class="descripattention">Se trouve dans</div>
													</div>
													<div class="divdescrp2lh w-clearfix">
														<c:forEach items="${mapBouteilles.positions}"
															var="mapPositions" varStatus="boucle">
															<div class="descriptrest">
																<a title="Montrer dans la cave"
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

												<div class="divdescrp2lh w-clearfix">
													<div class="descriptrest">
														<c:if test="${(!empty mapBouteilles.commentaire)}">
											Vos commentaire:
											<c:out value="${ mapBouteilles.commentaire }" />
														</c:if>

													</div>
												</div>
											</div>
										</div>

									</div>

								</div>

							</div>
						</c:if></c:if>
                        </c:forEach>
						<!-- *********************************************************Collection Bouteilles a consomer dans 2 ans************************************************************ -->
						<c:forEach items="${bouteillesConsomer }" var="mapBouteilles" varStatus="boucle">
						<c:if
							test="${ mapBouteilles.nbrAneeABoir.toString().equals('3') }"><c:if test="${ !empty mapBouteilles.positions}">
							<div class="cible3" >
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
													alt="" class="imgraiting" style="cursor: text">
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
												class="column-4 w-col w-col-5 w-col-small-5 w-col-tiny-5">
												<div class="divdescrp2lh w-clearfix">
													<div class="descriptmainnom" style="cursor: text">
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
													<div class="descripattention">
														<c:out value="${ mapBouteilles.appelation}" />
													</div>

												</div>



												<div class="divdescrp2lh w-clearfix">
													<div class="descriptrest">
														<c:out value="${ mapBouteilles.cru }" />
													</div>

												</div>


												<div class="divdescrp2lh w-clearfix">
													<div class="descriptrest">
														Achetée
														<c:out value="${ mapBouteilles.prixAchat }" />
														, €
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
												<c:if test="${ !empty mapBouteilles.positions}">
													<div class="divdescrp2lh w-clearfix">
														<div class="descripattention">Se trouve dans</div>
													</div>
													<div class="divdescrp2lh w-clearfix">
														<c:forEach items="${mapBouteilles.positions}"
															var="mapPositions" varStatus="boucle">
															<div class="descriptrest">
																<a title="Montrer dans la cave"
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

												<div class="divdescrp2lh w-clearfix">
													<div class="descriptrest">
														<c:if test="${(!empty mapBouteilles.commentaire)}">
											Vos commentaire:
											<c:out value="${ mapBouteilles.commentaire }" />
														</c:if>

													</div>
												</div>
											</div>
										</div>

									</div>

								</div>

							</div>
						</c:if></c:if>
                        </c:forEach>
					
					<!-- *********************************************************Fin Collection Bouteilles************************************************************ -->
				</div>
			</c:otherwise>
		</c:choose>
	</div>

	<script
		src="https://d1tdp7z6w94jbb.cloudfront.net/js/jquery-3.3.1.min.js"
		type="text/javascript"></script>

	<script src="js/jqcave.js" type="text/javascript"></script>
	<script src="js/jscave.js" type="text/javascript"></script>
	<!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
</body>
</html>