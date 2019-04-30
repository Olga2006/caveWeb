<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html data-wf-page="5c87c9153f656c8f0ad43c3c"
	data-wf-site="5bf300026add22d3cd0f2499">
<head>
<meta charset="utf-8">
<title>Carnet Caves</title>
<jsp:include page="/WEB-INF/jsp/head/head.jsp"></jsp:include>
</head>
<body class="body">
	<jsp:include page="/WEB-INF/jsp/left/left.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/jsp/nav/nav.jsp"></jsp:include>

	<div class="coremembre">
		<div class="bvcellar"></div>

		<c:choose>
			<c:when test="${ empty sessionUtilisateur.caves }">

				<div class="divbvdanscave descriptnom">
					<h1 class="heading bvheading">${sessionUtilisateur.nom }, vous
						n'avez pas les caves. Veuillez créer votre première cave!</h1>
				</div>

			</c:when>
			<c:otherwise>
				<div class="divbvdanscave descriptnom">
					<h1 class="heading bvheading">${sessionUtilisateur.nom }, bien
						venu dans votre cave!</h1>
				</div>
				<div class="collectionscrollcaves">

					<!-- *********************************************************Collection Caves********************************** -->
					<c:forEach items="${sessionUtilisateur.caves}" var="mapCaves"
						varStatus="boucleCaves">
		
						<div class="cible">
							<div class="blockoneitem">
								<div class="sousblockoneitem">
									<div class="collectionmain w-row">
										<div class="column-3 w-col w-col-3 w-col-small-3 w-col-tiny-3">
											<div class="divhcenterelement">

												<img src="images/supprimer.png" alt=""
													class="imgajouterinfocavedel" title="Supprimer"
													id="${ mapCaves.id} ${ mapCaves.nom}">
													
													 <a
													title="Changer le nom"
													href="<c:url value="/creationCave">
											<c:param name="idCave" value="${ mapCaves.id }" /></c:url>">
													<img src="images/corriger.png" alt=""
													class="imgajouterinfobouteilleupdate">
												</a>


											</div>
											
											<div class="divhcenterelement">
												 <a 
													title="Ouvrir la cave"
													href="<c:url value="/redigerCave"><c:param name="idCaveR" value="${ mapCaves.id }" /></c:url>">
													 <img src="images/entreecave.png" alt=""
													class="imgentreesortircave">
												</a>
											</div>
											
										</div>

										<a title="Ouvrir la cave"
											href="<c:url value="/redigerCave"><c:param name="idCaveR" value="${ mapCaves.id }" /></c:url>">
											<div
												class="column-4 w-col w-col-3 w-col-small-3 w-col-tiny-3">

												<div class="divdescrp2lh w-clearfix">
													<div class="descriptmainnom">
														<c:out value="${ mapCaves.nom }" />
													</div>
												</div>
												<div class="divdescrp2lh w-clearfix">
													<div class="descripattention">
														<c:out value="${ mapCaves.nbrCompartiment }" />
														Compartiments
														<c:out value="${ mapCaves.nbrRow }" />
														Rangee
													</div>
												</div>
												<div class="divdescrp2lh w-clearfix">
													<div class="descriptrest">
														<c:out value="${ mapCaves.nbrTotal }" />
														Bouteilles Stockées
													</div>
												</div>
												<div class="divdescrp2lh w-clearfix">
													<div class="descriptrest">
														Prix Total d&#x27;achat
														<c:out value="${ mapCaves.prixTotalAchat }" />
														, €
													</div>
													<div class="descripattention">
														Prix Total actuelle
														<c:out value="${ mapCaves.prixTotalActuelle }" />
														, €
													</div>
												</div>
											</div>
										</a>




										<div class="column-2 w-col w-col-6 w-col-small-6 w-col-tiny-6">
											<div class="divdescrp2lh">
												<div class="divnombrechaquebdanscave w-clearfix">
													<div class="descripattention">
														<c:out value="${ mapCaves.nbrRouge }" />
													</div>
													<img width="70" src="images/butkr.png" alt=""
														class="imgcouleur" title="Rouge">
												</div>
												<div class="divnombrechaquebdanscave w-clearfix">
													<div class="descripattention">
														<c:out value="${ mapCaves.nbrJaune }" />
													</div>
													<img width="70" src="images/bute.png" alt=""
														class="imgcouleur" title="Jaune">
												</div>
												<div class="divnombrechaquebdanscave w-clearfix">
													<div class="descripattention">
														<c:out value="${ mapCaves.nbrBlanc }" />
													</div>
													<img width="70" src="images/butb.png" alt=""
														class="imgcouleur" title="Blanc">
												</div>
												<div class="divnombrechaquebdanscave w-clearfix">
													<div class="descripattention">
														<c:out value="${ mapCaves.nbrEffervescent }" />
													</div>
													<img width="70" src="images/butch.png" alt=""
														class="imgcouleur" title="Effervescent">
												</div>
												<div class="divnombrechaquebdanscave w-clearfix">
													<div class="descripattention">
														<c:out value="${ mapCaves.nbrRose }" />
													</div>
													<img width="70" src="images/butr.png" alt=""
														class="imgcouleur" title="Rosé">
												</div>

												<div class="divnombrechaquebdanscave w-clearfix">
													<div class="descripattention">
														<c:out value="${ mapCaves.nbrLiquoreux }" />
													</div>
													<img width="70" src="images/butl.png" alt=""
														class="imgcouleur" title="Liquoreux">
												</div>

												 <div class="divnombrechaquebdanscave w-clearfix">
													<div class="descripattention">
														<c:out value="${ mapCaves.nbrAutreCol }" />
													</div>
													<img width="70" src="images/butn.png" alt=""
														class="imgcouleur" title="Autre">
												</div> 

											</div>
											<div class="divdescrp2lh w-clearfix">
												<div class="descripattention">
													<c:out value="${ mapCaves.nbrPC }" />
													Premiere Cru       
												</div>
												<div class="descriptrest">
													<c:out value="${ mapCaves.nbrV }" />
													Village
												</div>
											</div>
											
											<div class="divdescrp2lh w-clearfix">
									<div class="descripattention">
										<c:out value="${ mapCaves.nbrGC }" />
										Grand Cru            
									</div>
									<div class="descriptrest">
										<c:out value="${ mapCaves.nbrCC }" />
										Cru classé
									</div>
								
								</div>
											
											
											
											
										<div class="divdescrp2lh w-clearfix">
									<div class="descripattention">
										<c:out value="${ mapCaves.nbrCB }" />
										Cru Bourgeois           
									</div>
									<div class="descriptrest">
										<c:out value="${ mapCaves.nbrNC }" />
										Non Classé
									</div>
						
									 <div class="descriptrest">
										<c:out value="${ mapCaves.nbrAutreCru }" />
										Autre Cru
									</div> 
								</div>
										</div>
									</div>
								</div>


							</div>


						</div>
						
					</c:forEach>

					<!-- *********************************************************Fin Collection Caves********************************** -->
				</div>
			
			</c:otherwise>

		</c:choose>
		
		<a title="Creer Cave" id="linkajouterelement" href="#">					
					<img
					src="images/adddcave.png"
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
				<a title="Sortir" href="<c:url value="/listeCaves"></c:url>"
					class="linksortirform"> <img src="images/sortir.png" width="30"
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
						<a title="Sortir" href="<c:url value="/listeCaves"></c:url>"
							class="tabformul w-button"> Sortir </a>
					</div>
				</c:when>
				<c:otherwise>

					<form method="post" action="" class="forminside" id="formDel">

						<label for="nom-5" class="warningdel">Suppression une cave
							de votre carnet vas provoquer des changements dans le carnet de
							vin en niveau des quantité stockée</label>
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
	<!-- **********************************************Form Update/Creation Cave***************************************************** -->

	<div class="divdisapppourtriggerupdate" id="divdisapppourtriggerupdate"
		style="<c:if test="${empty form && empty cave && empty isCreation}">display: none</c:if>">
		<div class="formmain">

			<div class="divhrightelementsmall">
				<a title="Sortir" href="<c:url value="/listeCaves"></c:url>"
					class="linksortirform"> <img src="images/sortir.png" width="30"
					height="50"
					style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
					alt="" class="sortirformimg">
				</a>
			</div>
			<form id="formCreation" name="email-form" data-name="Email Form"
				class="forminside" method="post"
				action="<c:url value="/creationCave"><c:if test="${ !empty cave}"><c:param name="idCave" value="${ cave.id }" /> </c:if> </c:url>">

				<span class="erreur">${form.resultat}</span> <span class="erreur">${form.erreurs['erreurDaoCave']}</span>

				<label for="nom" class="labelformbouteille">Nom de la cave<span
					class="requis">*</span></label> <span class="erreur">${form.erreurs['nom']}</span>
				<input type="text" class="inputformbouteille w-input" maxlength="30"
					name="nom" id="nom" value="<c:out value="${cave.nom}"/>">





				<c:if test="${empty cave.id}">
					<label for="nbrCompartiment" class="labelformbouteille">Nombre
						Compartiments<span class="requis">*</span> <span class="infobulle">
							<img src="images/info.png" width="15" height="15"> <span
							id="example" class="divdescrp2lh w-clearfix"
							style="display: none;"><img src="images/caveex.png"
								width="30" height="50">example cave 4compartiments</span>
					</span>
					</label>
					<span class="erreur">${form.erreurs['nbrCompartiment']}</span>
					<input type="number" maxlength="30" min="1" name="nbrCompartiment"
						data-name="Prix Achat 2" id="nbrCompartiment"
						class="inputformbouteille w-input"
						value="<c:out value="${cave.nbrCompartiment}"/>" min="1" />


					<label for="nbrRow" class="labelformbouteille">Nombre des
						rangee (min 1 max2)<span class="requis">*</span>
					</label>
					<span class="erreur">${form.erreurs['nbrRow']}</span>
					<select name="nbrRow" id="nbrRow"
						class="inputformbouteille w-input">
						<option selected="selected" value="0">-Select-</option>
						<option value="1">Rangée simple</option>
						<option value="2">Rangée double (devant et derrière)</option>
					</select>

				</c:if>


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
				window.location = 'listeCaves'
			}, 3000);
		</script>
	</c:if>

	<div class="resultat" id="resultat"
		style="<c:if test="${empty succes}">display: none</c:if>">
		<div class="formmain">
			<div class="divhrightelementsmall">
				<a title="Sortir" href="<c:url value="/listeCaves"></c:url>"
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