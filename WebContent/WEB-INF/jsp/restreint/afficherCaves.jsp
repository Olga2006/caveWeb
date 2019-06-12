<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="messages" />
<!DOCTYPE html>
<html data-wf-page="5c87c9153f656c8f0ad43c3c"
	data-wf-site="5bf300026add22d3cd0f2499">
<head>
<meta charset="utf-8">
<title><fmt:message key="caves.title"></fmt:message></title>
<jsp:include page="/WEB-INF/jsp/head/head.jsp"></jsp:include>
</head>
<body class="body">
<div id="coverforformulaire" style="<c:if test="${empty form.erreurs && empty cave && empty isCreation}">display: none</c:if>"></div>
	<jsp:include page="/WEB-INF/jsp/left/left.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/jsp/nav/nav.jsp"></jsp:include>

	<div class="coremembre">
		<div class="bvcellar"></div>

		<c:choose>
			<c:when test="${ empty sessionUtilisateur.caves }">

				<div class="divbvdanscave">
					<h1 class="heading bvheading">${sessionUtilisateur.nom },</h1>
					<h1 class="heading bvheading">
						<fmt:message key="caves.bvmessagesanscaves"></fmt:message>
					</h1>
				</div>

			</c:when>
			<c:otherwise>
				<div class="divbvdanscave">
					<h1 class="heading bvheading">${sessionUtilisateur.nom },</h1>
					<h1 class="heading bvheading">
						<fmt:message key="caves.bvmessage"></fmt:message>
					</h1>
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
													class="imgajouterinfocavedel"
													title="<fmt:message key="title.supprimer"></fmt:message>"
													id="${ mapCaves.id} ${ mapCaves.nom}"> <a
													title="<fmt:message key="title.changernom"></fmt:message>"
													href="<c:url value="/creationCave">
											<c:param name="idCave" value="${ mapCaves.id }" /></c:url>">
													<img src="images/corriger.png" alt=""
													class="imgajouterinfobouteilleupdate">
												</a>


											</div>

											<div class="divhcenterelement">
												<a
													title="<fmt:message key="title.ouvrircave"></fmt:message>"
													href="<c:url value="/redigerCave"><c:param name="idCaveR" value="${ mapCaves.id }" /></c:url>">
													<img
													src="<fmt:message key="caves.imgsrc.entreecave"></fmt:message>"
													alt="" class="imgentreesortircave">
												</a>
											</div>

										</div>

										<a title="<fmt:message key="title.ouvrircave"></fmt:message>"
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
														<fmt:message key="caves.compartiments"></fmt:message>
														<c:out value="${ mapCaves.nbrRow }" />
														<fmt:message key="caves.rangees"></fmt:message>
													</div>
												</div>
												<div class="divdescrp2lh w-clearfix">
													<div class="descriptrest">
														<c:out value="${ mapCaves.nbrTotal }" />
														<fmt:message key="caves.bouteillesstockees"></fmt:message>
													</div>
												</div>
												<div class="divdescrp2lh w-clearfix">
													<div class="descriptrest">
														<fmt:message key="caves.prixachat"></fmt:message>
														<c:out value="${ mapCaves.prixTotalAchat }" />
														, €
													</div>
													<div class="descripattention">
														<fmt:message key="caves.prixactuel"></fmt:message>
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
													<img width="70"
														src="<fmt:message key="caves.imgsrc.rouge"></fmt:message>"
														alt="" class="imgcouleur"
														title="<fmt:message key="caves.title.rouge"></fmt:message>">
												</div>
												<div class="divnombrechaquebdanscave w-clearfix">
													<div class="descripattention">
														<c:out value="${ mapCaves.nbrJaune }" />
													</div>
													<img width="70"
														src="<fmt:message key="caves.imgsrc.jaune"></fmt:message>"
														alt="" class="imgcouleur"
														title="<fmt:message key="caves.title.jaune"></fmt:message>">
												</div>
												<div class="divnombrechaquebdanscave w-clearfix">
													<div class="descripattention">
														<c:out value="${ mapCaves.nbrBlanc }" />
													</div>
													<img width="70"
														src="<fmt:message key="caves.imgsrc.blanc"></fmt:message>"
														alt="" class="imgcouleur"
														title="<fmt:message key="caves.title.blanc"></fmt:message>">
												</div>
												<div class="divnombrechaquebdanscave w-clearfix">
													<div class="descripattention">
														<c:out value="${ mapCaves.nbrEffervescent }" />
													</div>
													<img width="70"
														src="<fmt:message key="caves.imgsrc.effervescent"></fmt:message>"
														alt="" class="imgcouleur"
														title="<fmt:message key="caves.title.effervescent"></fmt:message>">
												</div>
												<div class="divnombrechaquebdanscave w-clearfix">
													<div class="descripattention">
														<c:out value="${ mapCaves.nbrRose }" />
													</div>
													<img width="70"
														src="<fmt:message key="caves.imgsrc.rose"></fmt:message>"
														alt="" class="imgcouleur"
														title="<fmt:message key="caves.title.rose"></fmt:message>">
												</div>

												<div class="divnombrechaquebdanscave w-clearfix">
													<div class="descripattention">
														<c:out value="${ mapCaves.nbrLiquoreux }" />
													</div>
													<img width="70"
														src="<fmt:message key="caves.imgsrc.liquoreux"></fmt:message>"
														alt="" class="imgcouleur"
														title="<fmt:message key="caves.title.liquoreux"></fmt:message>">
												</div>

												<div class="divnombrechaquebdanscave w-clearfix">
													<div class="descripattention">
														<c:out value="${ mapCaves.nbrAutreCol }" />
													</div>
													<img width="70"
														src="<fmt:message key="caves.imgsrc.autre"></fmt:message>"
														alt="" class="imgcouleur"
														title="<fmt:message key="caves.autre"></fmt:message>">
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
													Cru Classé
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
													<fmt:message key="caves.autre"></fmt:message>
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

		<a title="<fmt:message key="caves.title.creercave"></fmt:message>"
			id="linkajouterelement" href="#"> <img src="images/adddcave.png"
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
				<a title="<fmt:message key="button.title.sortir"></fmt:message>"
					 class="sortirformsansrechargement">
					<img src="images/sortir.png" width="30" height="50"
					style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
					alt="" class="sortirformimg">
				</a>
			</div>
			<c:choose>
				<c:when test="${!empty erreurs}">
					<c:if test="${!empty erreurs['echecDel']}">
						<span class="erreur"><fmt:message
								key="caves.resultat.delfirst"></fmt:message>
							${erreurs['echecDel']} <fmt:message
								key="caves.unsuccess.delsecond"></fmt:message></span>
					</c:if>

					<br>
					<c:if test="${!empty erreurs['erreurDao']}">
						<span class="erreur"><fmt:message key="erreur.dao"></fmt:message>
							${erreurs['erreurDao']}</span>
					</c:if>

					<div class="divhcenterelement">
						<a title="<fmt:message key="button.title.sortir"></fmt:message>"
							href="<c:url value="/listeCaves"></c:url>" class="buttonstandart">
							<fmt:message key="button.title.sortir"></fmt:message>
						</a>
					</div>
				</c:when>
				<c:otherwise>

					<form method="post" action="" class="forminside" id="formDel">

						<label class="warningdel"><fmt:message
								key="caves.del.warningdel"></fmt:message></label>

						<div class="divhcenterelement">
							<input type="submit"
								value="<fmt:message key="button.valider"></fmt:message>"
								data-wait="<fmt:message key="button.wait"></fmt:message>"
								class="buttonstandart"> 
								<a class="buttonstandart sortirformsansrechargement"
								title="<fmt:message key="button.title.sortir"></fmt:message>"> <fmt:message
									key="button.title.sortir"></fmt:message>
							</a>
						</div>
					</form>
				</c:otherwise>

			</c:choose>
		</div>
	</div>
	<!-- **********************************************Form Update/Creation Cave***************************************************** -->

	<div class="divdisapppourtriggerupdate" id="divdisapppourtriggerupdate<c:if test="${empty cave}">sansrecharger</c:if><c:if test="${!empty cave}">cave</c:if>"
		style="<c:if test="${empty form.erreurs && empty cave && empty isCreation}">display: none</c:if>">
		<div class="formmain">

			<div class="divhrightelementsmall">
				<a title="<fmt:message key="button.title.sortir"></fmt:message>"
					<c:if test="${!empty cave}"> href="<c:url value="/listeCaves"></c:url>"</c:if> class="sortirformsansrechargement" >
					<img src="images/sortir.png" width="30" height="50"
					style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); 
					-moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); 
					-ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); 
					transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
					alt="" class="sortirformimg">
				</a>
			</div>
			<form id="formCreation" class="forminside" method="post"
				action="<c:url value="/creationCave"><c:if test="${ !empty cave}"><c:param name="idCave" value="${ cave.id }" /> </c:if> </c:url>">

				<c:if test="${!empty form.unsuccessCreation}">
					<span class="erreur"><fmt:message
							key="caves.unsuccess.creation"></fmt:message>
						${form.unsuccessCreation}</span>
				</c:if>
				<c:if test="${!empty form.unsuccessMaj}">
					<span class="erreur"><fmt:message key="caves.unsuccess.maj"></fmt:message>
						${form.unsuccessMaj}</span>
				</c:if>

				<c:if test="${!empty form.erreurs['erreurDaoCave']}">
					<span class="erreur"> <fmt:message key="erreur.dao"></fmt:message>
						${form.erreurs['erreurDaoCave']}
					</span>
				</c:if>

				<label for="nom" class="labelformbouteille"><fmt:message
						key="caves.label.nomcave"></fmt:message><span class="requis">*</span></label>
				<span class="erreur"> <c:if
						test="${!empty form.erreurs['nom']}">
						<fmt:message key="caves.erreur.nomexistantefirst"></fmt:message>
						<c:out value="${form.erreurs['nom']}" />, <fmt:message
							key="caves.erreur.nomexistantesecond"></fmt:message>
					</c:if>
				</span> <input type="text" class="inputformbouteille w-input"
					maxlength="30" name="nom" id="nom"
					value="<c:out value="${cave.nom}"/>" required="required">


				<c:if test="${empty cave.id}">
					<label for="nbrCompartiment" class="labelformbouteille"><fmt:message
							key="caves.label.nombrecompartiments"></fmt:message><span
						class="requis">*</span> <span class="infobulle"> <img
							src="images/info.png" width="15" height="15"> <span
							id="example" class="requis" style="display: none;"><img
								src="images/caveex.png" width="30" height="50"> <fmt:message
									key="caves.label.example"></fmt:message></span>
					</span> </label>
					<%-- <span class="erreur">${form.erreurs['nbrCompartiment']}</span> --%>
					<input type="number" maxlength="30" min="1" name="nbrCompartiment"
						id="nbrCompartiment" required="required"
						class="inputformbouteille w-input"
						value="<c:choose><c:when test="${!empty cave.nbrCompartiment}"><c:out value="${cave.nbrCompartiment}"/></c:when><c:otherwise>1</c:otherwise></c:choose>"
						min="1" />


					<label for="nbrRow" class="labelformbouteille"><fmt:message
							key="caves.label.nombrerangee"></fmt:message><span class="requis">*</span>
					</label>
					<%-- <span class="erreur">${form.erreurs['nbrRow']}</span> --%>
					<select name="nbrRow" id="nbrRow"
						class="inputformbouteille w-input" required="required">
						<option value="1" selected="selected"><fmt:message
								key="caves.option.rangeesimple"></fmt:message></option>
						<option value="2"><fmt:message
								key="caves.option.rangeedouble"></fmt:message></option>
					</select>

				</c:if>

				<label class="labelformbouteille"> <span class="requis">*<fmt:message
							key="title.champsobligatoires"></fmt:message></span></label> <label
					class="labelformbouteille"> <span class="requis">*<fmt:message
							key="caves.impossiblemodifiercompartimentsetrangees"></fmt:message></span></label>

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
					window.location = 'listeCaves'
				}, 3000);
			</script>
		</c:otherwise>
	</c:choose>

	<div class="resultat" id="resultat"
		style="<c:if test="${empty form.successCreation && empty form.successMaj && empty successDel}">display: none</c:if>">

		<div class="formmain">
			<div class="divhrightelementsmall">
				<a title="<fmt:message key="button.title.sortir"></fmt:message>"
					href="<c:url value="/listeCaves"></c:url>" class="sortirformimg">
					<img src="images/sortir.png" width="30" height="50"
					style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
					alt="" class="sortirformimg">
				</a>
			</div>
			<div class="divhcenterelement">
				<c:if test="${!empty form.successCreation}">
					<span class="maj"><fmt:message key="caves.success.creation"></fmt:message>
						${form.successCreation}</span>
				</c:if>
				<c:if test="${!empty form.successMaj}">
					<span class="maj"><fmt:message key="caves.success.maj"></fmt:message>
						${form.successMaj}</span>
				</c:if>
				<c:if test="${!empty successDel}">
					<span class="maj"><fmt:message key="caves.resultat.delfirst"></fmt:message>
						${successDel} <fmt:message key="caves.success.delsecond"></fmt:message></span>
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