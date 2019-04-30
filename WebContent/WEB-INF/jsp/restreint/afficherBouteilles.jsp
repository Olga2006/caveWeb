<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html data-wf-page="5c87c9153f656c8f0ad43c3c"
	data-wf-site="5bf300026add22d3cd0f2499">

<link href="css/dependent-dropdown.min.css" media="all" rel="stylesheet"
	type="text/css" />

<head>
<meta charset="utf-8">
<title>Carnet Vins</title>
<!--   <meta content="About 1" property="og:title"> -->
<jsp:include page="/WEB-INF/jsp/head/head.jsp"></jsp:include>
</head>

<body class="body">
	<jsp:include page="/WEB-INF/jsp/left/left.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/jsp/nav/nav.jsp"></jsp:include>



	<div class="coremembre">
		<div class="bvcellar"></div>

		<c:choose>
			<c:when test="${ empty sessionUtilisateur.bouteilles }">

				<div class="divbvdanscave descriptnom">
					<h1 class="heading bvheading">${sessionUtilisateur.nom }, 
					votre carnet des vins est vide. Veuillez enregistrer votre
						première bouteille!</h1>
				</div>



			</c:when>
			<c:otherwise>
				<div class="divbvdanscave">
					<h1 class="heading bvheading">Carnet Vins</h1>
				</div>
				<div class="collectionscroll">
					<input id="filterBouteille" type="text" placeholder="Search.."
						class="inputformbouteille">
					<!-- *********************************************************Collection Bouteilles************************************************************ -->
					<c:forEach items="${sessionUtilisateur.bouteilles }"
						var="mapBouteilles" varStatus="boucle">
						<div class="ciblebouteille">
							<div class="blockoneitem">
								<div class="sousblockoneitem">
									<div class="collectionmain w-row">
										<div class="column-3 w-col w-col-2 w-col-small-2 w-col-tiny-2">

											<!-- *********************************************************Rating/Supprimer/Update************************************************************ -->
											<img
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
													title="Supprimer"> <a title="Mettre à jour"
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

												<div class="descriptrestlc"><c:out value="${ mapBouteilles.nbrListCourses }"/></div>


												<!-- *********************************************************Shopping List/ Commentaire************************************************************ -->
												<img src="images/addboutshoppinglist.png"
													id="${ mapBouteilles.id} ${ mapBouteilles.nom}" alt=""
													class="imgajouterinfobouteilleshoplist"
													title="Changer quantité dans la liste de courses"> 
													
													<img
													src="images/addcomment.png"
													id="${ mapBouteilles.id} ${ mapBouteilles.nom}" alt=""
													class="imgajouterinfobouteilleaddcomment"
													title="Changer Commentaire">
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
													Achetée
													<c:out value="${ mapBouteilles.prixAchat }" />
													, €
												</div>
												<div class="descripattention">
													Valeur actuelle
													<c:out value="${ mapBouteilles.prixActuelle }" />
													, €
												</div>
											</div>

											<div class="divdescrp2lh w-clearfix">
												<div class="descriptrest">
													<c:if test="${(!empty mapBouteilles.commentaire)}">
											Vos commentaire:
													</c:if>

												</div>
												<div class="descriptrestcommentaire"><c:out value="${ mapBouteilles.commentaire }"/></div>
											</div>
										</div>
										<div class="column-2 w-col w-col-3 w-col-small-3 w-col-tiny-3">
											<c:if test="${ !empty mapBouteilles.positions}">
												<div class="divdescrp2ch">
													<div class="descripattention">Se trouve dans</div>
												</div>
												<div class="divdescrp2ch">
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

										</div>
									</div>
								</div>
								<div class="divimgexpand">
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

		<a title="Cree une Bouteille" id="linkajouterelement" href="#"> <img
			src="images/addBouteille.png"
			data-w-id="2268c7f2-5bc3-7d72-53f7-e00c170ae7a0"
			style="-webkit-transform: translate3d(0, -143PX, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, -143PX, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, -143PX, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, -143PX, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
			alt="" class="ajouteelemimg">

		</a>






	</div>
	<!-- *********************************************************Form Confirm Del************************************************************ -->
	<div class="divdisapppourtriggerdel" id="divdisapppourtriggerdel"
		style="<c:if test="${empty erreurs}">display: none</c:if>">
		<div class="formmain">
			<div class="divhrightelementsmall">
				<a title="Sortir" href="<c:url value="/listeBouteilles"></c:url>"
					class="sortirformimg"> <img src="images/sortir.png" width="30"
					height="50"
					style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
					alt="" class="sortirformimg">
				</a>
			</div>

			<c:choose>
				<c:when test="${!empty erreurs}">
					<span class="erreur">${echec}</span>
					<br>
					<span class="erreur">${erreurs['erreurDel']}</span>
					<div class="divhcenterelement">
						<a title="Sortir" href="<c:url value="/listeBouteilles"></c:url>"
							class="tabformul w-button"> Sortir </a>
					</div>
				</c:when>

				<c:otherwise>
					<form method="post" action="" class="forminside" id="formDel">
						<label for="nom-5" class="warningdel">Suppression la
							bouteille de votre carnet vas provoquer de la suppression cette
							bouteille  dans touts les caves. </label>
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

	<!-- *********************************************************Form Ajoute commentaire************************************************************ -->

	<div class="divdisapppourtriggeraddcomment"
		id="divdisapppourtriggeraddcomment"
		style="<c:if test="${empty formComment && empty bouteilleComment}">display: none</c:if>">
		<div class="formmain">
			<div class="divhrightelementsmall">
				<a title="Sortir" href="<c:url value="/listeBouteilles"></c:url>"
					class="linksortirform"> <img src="images/sortir.png" width="30"
					height="50"
					style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
					alt="" class="sortirformimg">
				</a>
			</div>

			<form method="post" id="formLCamment" action="" class="forminside">
				<span class="erreur">${formComment.resultat}</span> <span
					class="erreur">${formComment.erreurs['erreurDaoBouteille']}</span>
				<label for="commentaire" class="warningdel">Modifier la
					commentaire</label> <span class="erreur">${formLC.erreurs['commentaire']}</span>
				<textarea id="commentaire" name="commentaire"
					placeholder="Vos commentaires" maxlength="5000"
					class="inputformtext w-input" value="<c:out value="${bouteilleComment.commentaire}"/>"></textarea>


				<div class="divhcenterelement">
					<input type="submit" value="Valider"
						data-wait="Merci de patienter ..." class="tabformul w-button">
					<input type="reset" value="Remettre à initiale"
						data-wait="Merci de patienter ..." class="tabformul w-button" />
				</div>
			</form>

		</div>
	</div>

	<!-- *********************************************************Form Ajoute bouteille dans la liste des courses************************************************************ -->
	<div class="divdisapppourtriggeraddshoplist"
		id="divdisapppourtriggeraddshoplist"
		style="<c:if test="${empty formLC && empty bouteilleLC}">display: none</c:if>">
		<div class="formmain">
			<div class="divhrightelementsmall">
				<a title="Sortir" href="<c:url value="/listeBouteilles"></c:url>"
					class="linksortirform"> <img src="images/sortir.png" width="30"
					height="50"
					style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
					alt="" class="sortirformimg">
				</a>
			</div>

			<form method="post" id="formLC" action="" class="forminside">
				<span class="erreur">${formLC.resultat}</span> <span class="erreur">${formLC.erreurs['erreurDaoBouteille']}</span>
				<label for="quantiteAcheter" class="warningdel">Combien
					bouteilles Vous voulez avoir dans la list des courses?</label> <span
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


	<!-- *********************************************************Form Ajoute evaluation bouteille************************************************************ -->
	<div class="divdisapppourtriggerevaluation"
		id="divdisapppourtriggerevaluation"
		style="<c:if test="${empty formEvaluation && empty bouteilleEvaluation}">display: none</c:if>">
		<div class="formmain">
			<div class="divhrightelementsmall">
				<a title="Sortir" href="<c:url value="/listeBouteilles"></c:url>"
					class="linksortirform"> <img src="images/sortir.png" width="30"
					height="50"
					style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
					alt="" class="sortirformimg">
				</a>
			</div>

			<form method="post" id="formEvaluation" action="" class="forminside">
				<span class="erreur">${formEvaluation.resultat}</span> <span
					class="erreur">${formEvaluation.erreurs['erreurDaoBouteille']}</span>
				<div class="divhcenterelement">
					<label for="evaluation" class="warningdel">Votre note sur 5
						pour <c:out value="${ bouteilleEvaluation.nom }" />
					</label> <span class="erreur">${formEvaluation.erreurs['evaluation']}</span>
					<input type="number" name="evaluation" data-name="evaluation"
						id="evaluation" class="tabevaluation"
						value="<c:out  value="${ bouteilleEvaluation.evaluation }"/>"
						min="0" max="5" step="1" title="1">
				</div>


				<div class="divhcenterelement">
					<input type="submit" value="Valider"
						data-wait="Merci de patienter ..." class="tabformul w-button">
					<input type="reset" value="Remettre à initiale"
						data-wait="Merci de patienter ..." class="tabformul w-button" />

				</div>
			</form>
		</div>
	</div>
	<!-- *********************************************************Creation Bouteille************************************************************ -->

	<div class="divdisapppourtriggerupdate" id="divdisapppourtriggerupdate"
		style="<c:if test="${empty form && empty bouteille }">display: none</c:if>">
		<div class="formmain">

			<div class="divhrightelement">
				<a title="Sortir" href="<c:url value="/listeBouteilles"></c:url>"
					class="linksortirform"> <img src="images/sortir.png" width="30"
					height="50"
					style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
					alt="" class="sortirformimg">
				</a>
			</div>










			<form id="prechargerimgform" method="post" data-name="${ bouteille.id }"
				enctype="multipart/form-data" class="forminside"
				action="">


					<span class="erreur">${erreurImage}</span> <img
						src="fichiers/<c:choose><c:when test="${!empty imagePrechargee}"><c:out value="${imagePrechargee}"/></c:when><c:when test="${!empty bouteille.image}"><c:out value="${bouteille.image}"/></c:when><c:otherwise>defaultetiquette.jpg</c:otherwise></c:choose>"
						alt="" class="imgetiquette" id="imgetiquette">
				<c:if test="${ !empty imagePrechargee}"><span class="labelformbouteille">Vous allez charger l'image</span>
				<span class="erreur"><c:out value="${imagePrechargee}" /></span></c:if>
				
				
				
				<a id="butchargerimg"  class="tabformul">Changer l'image</a>
				
				<div id="ciblechargerimg" style="display: none;">
				 <label
					for="image" class="labelformbouteille">Charger une image<span class="requis"><br>(Formats autorisés PNG/JPEG Max 2 Mo)</span>
				</label> 
								
				<input type="file" id="image" name="image"
					class="inputformbouteille"
					value="<c:out value="${imagePrechargee}"/>" />
				</div>	
					
			</form>



			<form id="formCreation" name="email-form" data-name="Email Form"
				class="forminside" method="post"
				action="<c:url value="/creationBouteille"><c:if test="${ !empty bouteille}"><c:param name="idBouteille" value="${ bouteille.id }"/></c:if><c:if test="${ !empty imagePrechargee}"><c:param name="image" value="${imagePrechargee}" /> </c:if> </c:url>"
				class="forminside">

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

	<!-- **********************************************resultat succes***************************************************** -->

	<c:if test="${!empty succes}">
		<script>
			var timer = setTimeout(function() {
				window.location = 'listeBouteilles'
			}, 3000);
		</script>
	</c:if>

	<div class="resultat" id="resultat"
		style="<c:if test="${empty succes}">display: none</c:if>">
		<div class="formmain">
			<div class="divhrightelementsmall">
				<a title="Sortir" href="<c:url value="/listeBouteilles"></c:url>"
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