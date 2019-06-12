function openTabA() {
	$("#mainTabA").attr("class", "tabactive");
	$("#mainTabB").attr("class", "tabpassive");
	$("div#tabA").show();
	$("div#tabB").hide();
}

function openTabB() {
	$("#mainTabB").attr("class", "tabactive");
	$("#mainTabA").attr("class", "tabpassive");
	$("div#tabB").show();
	$("div#tabA").hide();
}

function allowDrop(ev) {
	ev.preventDefault();
}

function drag(ev) {
	ev.dataTransfer.setData("text", ev.target.id);
	$(".descrcotenubouteille").hide();
}

function drop(ev) {
	ev.preventDefault();
	var dataNewPositionFull = ev.target.id;
	var dataNewPosition = dataNewPositionFull.split(" "); /*
															 * trouver
															 * idNewPosition et
															 * tab
															 */
	var dataId = dataNewPosition[0];
	var dataRow = dataNewPosition[1];

	var data = ev.dataTransfer.getData("text");

	var dataLastPosition = data.split(" "); /*
											 * trouver idBouteille
											 * idLastPosition
											 */
	var dataBouteille = dataLastPosition[0];
	var dataIdLastPosition = dataLastPosition[1];
	ev.target.appendChild(document.getElementById(data));
	/* alert("enregistrer changement"); */
	location.replace("ajouterBouteille?idPosition=" + dataId
			+ "&idLastPosition=" + dataIdLastPosition + "&idBouteille="
			+ dataBouteille + "&tab=" + dataRow);

}
$(document)
		.ready(
				function() {
					
					
					/*
					 * -------------------CHANGER LANGUE !!!!! Ne Marche pas----------------------------------
					 */			
					var locationhref = window.location.href;					
					$(".imglanguage").click(
							function() {
								var language = $(this).attr("data-language");							
								$("#languagechoise").text( language);								
								location.replace("changerLanguage?language=" + language + "&locationhref=" + locationhref);							
							});

					/*
					 * -------------------REDACTEUR
					 * CAVE----------------------------------
					 */

					$(".tabpassive")
							.click(
									function() {

										var tabpassivevalue = $(this).attr(
												"data-name");
										var tabactivevalue = $(this).siblings(
												".tabactive").attr("data-name");
										$(this).attr("class", "tabactive");
										$(this).siblings(".tabactive").attr(
												"class", "tabpassive");
										$("div#" + tabpassivevalue).show();
										$("div#" + tabactivevalue).hide();
									});

					$(".tabactive").click(
							function() {
								var tabactivevalue = $(this).attr("data-name");
								var tabpassivevalue = $(this).siblings().attr(
										"data-name");
								$(this).attr("class", "tabactive");
								$(this).siblings().attr("class", "tabpassive");
								$("div#" + tabactivevalue).show();
								$("div#" + tabpassivevalue).hide();
							});

					/*
					 * transmition data bouteilleid et placeid pour les
					 * formulaires et animation place dans la cave pendant le
					 * chois de bouteille
					 */

					$(".afichecontenu")
							.click(
									function() {
										$(this).css({
											"border-width" : "5"
										});
										$("#divmettrebouteilleform").show();
										$("#coverforformulaire").show();
										/*$("#pagecover").show();*/
										var data = $(this).attr("id")
												.split(" ");
										var dataId = data[0];
										var dataRow = data[1];
										var dataCaveRef = data[2];
										var dataPozRef = data[3];
										var dataIdBouteille = data[4];
										if (dataIdBouteille != 0) {
											$("#sortirBouteille").show();
										} else if (dataIdBouteille == 0) {
											$("#sortirBouteille").hide();
										}

										var idBouteilleDansList = $("#ancre"
												+ dataIdBouteille);
										var idPrevBouteilleDansList = idBouteilleDansList
												.prev().attr("id");
										if (idPrevBouteilleDansList != 'filterBouteille') {
											self.location.href = "#"
													+ idPrevBouteilleDansList;
										}

										$("#ancre" + dataIdBouteille).css({
											"border-width" : "5"
										});
										$("#afichageRefPoz").text(
												" " + dataCaveRef + dataPozRef);
										$("#sortirBouteille").attr(
												"href",
												"ajouterBouteille?idPosition="
														+ dataId + "&tab="
														+ dataRow);

										$(".txtrefbouteillPourMettreDansCave")
												.click(
														function() {
															var dataBouteille = $(
																	this).attr(
																	"id");
															$(this)
																	.attr(
																			"href",
																			"ajouterBouteille?idPosition="
																					+ dataId
																					+ "&tab="
																					+ dataRow
																					+ "&idBouteille="
																					+ dataBouteille);
														});
										/*
										 * *************************creation
										 * bouteille depuis
										 * redacteur**************
										 */
										$("#linkajouterelementred")
												.click(
														function() {
															$(
																	"#divdisapppourtriggerupdatesansrecharger")
																	.show();
															if ($(
																	'#divdisapppourtriggerupdatesansrecharger')
																	.is(
																			':visible')) {
																$("input#nomP")
																		.attr(
																				'required',
																				false);
															}
															$(
																	"#formCreationBouteille")
																	.attr(
																			"action",
																			"creationBouteille?idPosition="
																					+ dataId
																					+ "&tab="
																					+ dataRow);
														});

									});

					var aficherRangee = $("#aficherRangee").attr("id");
					if (aficherRangee != null) {
						$("#aficherRangee").parent(".rangee").prev().attr("id",
								"ancreRangee");
						self.location.href = "#ancreRangee";
					}

					/*
					 * function distanger_bouteille(animationContenu) {
					 * animationContenu.css({"border-color": "#c9f7b7",
					 * "border-width": "5px", " border-style": "double"}); }
					 */
					/*
					 * function animate_loop(animationContenu) {
					 * animationContenu.animate({ opacity : 0.4 }, 1000,
					 * function() { animationContenu.animate({ opacity : 1 },
					 * 1000) animate_loop(animationContenu); }); }
					 */

					/* animate_sortir_form($("#linksortirformmettrebouteille")); */
					/* animate_loop($("#aficher")); */

					/*
					 * -------------------------------description bouteille dans
					 * le redacteur cave----------------------------------------
					 */
					$(".detect").mouseenter(function() {
						$(this).find(".descrcotenubouteille").show();
					});
					$(".detect").mouseleave(function() {
						$(this).find(".descrcotenubouteille").hide();
					});

					/*
					 * -------------------------------example
					 * compartiment----------------------------------------
					 */

					$(".infobulle").mouseenter(function() {
						$(this).find("#example").show();
					});

					$(".infobulle").mouseleave(function() {
						$(this).find("#example").hide();
					});

					/*
					 * -------------------------------FORMULAIRE
					 * COMMUNE----------------------------------------
					 */
					/*
					 * -------------------------------disapp
					 * resultat----------------------------------------
					 */

					/*
					 * -------------------------------show plus
					 * info----------------------------------------
					 */
					$(".divimgexpand").click(
							function() {
								$(this).siblings(".sousblockoneitemclosed")
										.slideDown();
								$(this).siblings(".divblog").css({
									"height" : "auto"
								});
								$(this).hide();
								$(this).siblings(".divimgreduce").show();
							});
					
					$(".divimgexpandsansgradient").click(
							function() {
								$(this).siblings(".sousblockoneitemclosed")
										.slideDown();
								$(this).siblings(".divblog").css({
									"height" : "auto"
								});
								$(this).hide();
								$(this).siblings(".divimgreduce").show();
							});
					
					
					$(".divimgreduce").click(function() {
						$(this).siblings(".sousblockoneitemclosed").slideUp();
						$(this).siblings(".divblog").css({
							"height" : "150px"
						});
						$(this).hide();
						$(this).siblings(".divimgexpand").show();
						$(this).siblings(".divimgexpandsansgradient").show();
					});

					$(".descriptmainnom").click(
							function() {
								$(this).parentsUntil("blockoneitem").siblings(
										".sousblockoneitemclosed").slideToggle(
										"slow");
							});
					
					/* -------------------------------Delete---------------------------------------- */

					$(".imgajouterinfoproducteurdel").click(
							function() {
								$("#divdisapppourtriggerdel").show();
								var data = $(this).attr("id").split(" ");
								var dataIdProd = data[0];
								var dataNomProd = data[1];
								$("#formDel").attr(
										"action",
										"suppressionProducteur?idProducteur="
												+ dataIdProd
												+ "&nomProducteur="
												+ dataNomProd);								
									$("#coverforformulaire").show();
							});

					$(".imgajouterinfocavedel").click(
							function() {
								$("#divdisapppourtriggerdel").show();
								var data = $(this).attr("id").split(" ");
								var dataIdCave = data[0];
								var dataNomCave = data[1];
								$("#formDel").attr(
										"action",
										"suppressionCave?idCave=" + dataIdCave
												+ "&nomCave=" + dataNomCave);
								$("#coverforformulaire").show();
							});

					$(".imgajouterinfobouteilledel").click(
							function() {
								$("#divdisapppourtriggerdel").show();
								var data = $(this).attr("id").split(" ");
								var dataIdBouteille = data[0];
								var dataNomBouteille = data[1];
								$("#formDel").attr(
										"action",
										"suppressionBouteille?idBouteille="
												+ dataIdBouteille
												+ "&nomBouteille="
												+ dataNomBouteille);
								$("#coverforformulaire").show();
							});

					/*
					 * -------------------------------Changer quantité dans la
					 * liste de courses----------------------------------------
					 */

					$(".imgajouterinfobouteilleshoplist").click(
							function() {
								$("#divdisapppourtriggeraddshoplist").show();
								var data = $(this).attr("id").split(" ");
								var dataIdBouteille = data[0];
								var dataNomBouteille = data[1];
								var nbrlc = $(this).attr('data-nbr');
								$("#quantiteAcheter").val(nbrlc);
								$("#nombouteillepourquantiteacheter").text(
										dataNomBouteille);
								$("#formLC").attr(
										"action",
										"ajouterDansLC?idBouteille="
												+ dataIdBouteille
												+ "&nomBouteille="
												+ dataNomBouteille);
								$("#coverforformulaire").show();
							});

					$(".imgajouterinfobouteilleshoplistfromlc").click(
							function() {
								$("#divdisapppourtriggeraddshoplist").show();
								var data = $(this).attr("id").split(" ");
								var dataIdBouteille = data[0];
								var dataNomBouteille = data[1];
								var nbrlc = $(this).attr('data-nbr');
								$("#quantiteAcheter").val(nbrlc);
								$("#nombouteillepourquantiteacheter").text(
										dataNomBouteille);
								$("#formLC").attr(
										"action",
										"ajouterDansLC?idBouteille="
												+ dataIdBouteille
												+ "&nomBouteille="
												+ dataNomBouteille
												+ "&isShopList=isShopList");
								$("#coverforformulaire").show();
							});

					/*
					 * -------------------------------Changer raiting
					 * ----------------------------------------
					 */

					$(".imgraiting").click(
							function() {
								$("#divdisapppourtriggerevaluation").show();
								var data = $(this).attr("id").split(" ");
								var dataIdBouteille = data[0];
								var dataNomBouteille = data[1];
								var eval = $(this).attr("alt");
								$("#evaluation").val(eval);
								$("#nombouteillepourevaluation").text(
										dataNomBouteille);
								$("#formEvaluation").attr(
										"action",
										"ajouterEvaluation?idBouteille="
												+ dataIdBouteille
												+ "&nomBouteille="
												+ dataNomBouteille);
								$("#coverforformulaire").show();
							});
					/*
					 * -------------------------------Changer
					 * Commentaire----------------------------------------
					 */

					$(".imgajouterinfobouteilleaddcomment").click(
							function() {
								$("#divdisapppourtriggeraddcomment").show();
								var data = $(this).attr("id").split(" ");
								var dataIdBouteille = data[0];
								var dataNomBouteille = data[1];
								$("#nombouteillepourcomment").text(
										dataNomBouteille);
								var commentaire = $(this).attr('data-comment');
								$("#commentaire").text(commentaire);
								$("#formLCamment").attr(
										"action",
										"ajouterCommentaire?idBouteille="
												+ dataIdBouteille
												+ "&nomBouteille="
												+ dataNomBouteille);
								$("#coverforformulaire").show();
							});

					/* -------------------------------Creation---------------------------------------- */
					$("#linkajouterelement").click(function() {
						$("#divdisapppourtriggerupdatesansrecharger").show();
						$("#coverforformulaire").show();
						if ($('#divdisapppourtriggerupdatesansrecharger').is(':visible')) {
							$("input#nomP").attr('required', false);
						}
					});
					if ($('#divdisapppourtriggerupdatesansrecharger').is(':visible')) {
						$("input#nomP").attr('required', false);
					}

					/*
					 * -------------------------------Creation
					 * producteur----------------------------------------
					 */
					$("#linkajouterelementprod").click(
							function() {
								$("#divdisapppourtriggerupdatesansrecharger").show();
								$("#coverforformulaire").show();
									$("input#nomP").attr('required', true);								
							});
					if ($('#divdisapppourtriggerupdateprod').is(':visible')) {
						$("input#nomP").attr('required', true);
					}

					if ($('#divdisapppourtriggerupdatebouteille').is(':visible')) {
						$("input#nomP").attr('required', false);
					}
					/*
					 * -------------------------------sortir form sans
					 * rechargement----------------------------------------
					 */
			/*		if ($('#divdisapppourtriggerdel').is(':visible')) {
						 var fornulairecover = "<div class='coverforformulaire'></div>";
						$("body").append(fornulairecover);
					}*/
					
					
					$(".sortirformsansrechargement").click(
							function() {
								$("#divdisapppourtriggerdel").hide();
								$("#divdisapppourtriggeraddcomment").hide();
								$("#divdisapppourtriggeraddshoplist").hide();
								$("#divdisapppourtriggerevaluation").hide();															
								$("#divdisapppourtriggerupdatesansrecharger").hide();	
								$("#coverforformulaire").hide();
								if ($('#divmettrebouteilleform').is(':visible')) {
									$("#coverforformulaire").show();
								}
							});
					
					$("#sortirformsansrechargementmettrebouteille").click(
							function() {
								$("#divmettrebouteilleform").hide();
								$("#coverforformulaire").hide();
								$(".afichecontenu").css({
									"border-width" : "0"
								});
								$(".ciblebouteille").css({
									"border-width" : "0"
								});	
							});
					


					
					
					
					


					var modalprodavecrechargement = document.getElementById("divdisapppourtriggerupdateprod");
					var modalcaveavecrechargement = document.getElementById("divdisapppourtriggerupdatecave");
					var modalbouteilleavecrechargement = document.getElementById("divdisapppourtriggerupdatebouteille");
					
					var modal = document.getElementById("divdisapppourtriggerupdatesansrecharger");
					var modalmettrebouteille = document.getElementById("divmettrebouteilleform");
					var modaldel = document.getElementById("divdisapppourtriggerdel");					
					var modalcomment = document.getElementById("divdisapppourtriggeraddcomment");
					var modalsl = document.getElementById("divdisapppourtriggeraddshoplist");
					var modalevaluation = document.getElementById("divdisapppourtriggerevaluation");
					
					window.onclick = function(event) {

					  if (event.target == modal) {
						  modal.style.display = "none";
					
								$("#coverforformulaire").hide();
							
					  }
					  if (event.target == modalcomment) {
						  modalcomment.style.display = "none";
						  $("#coverforformulaire").hide();						  
						  }
					  if ($('#divmettrebouteilleform').is(':visible')) {
							$("#coverforformulaire").show();
						}
					  if (event.target == modalevaluation) {
						  modalevaluation.style.display = "none";
						  $("#coverforformulaire").hide();
						  }
					  if (event.target == modalsl) {
						  modalsl.style.display = "none";
						  $("#coverforformulaire").hide();
						  }
					  if (event.target == modaldel) {
						  modaldel.style.display = "none";
						  $("#coverforformulaire").hide();
						  }
					  if (event.target == modalmettrebouteille) {
						  modalmettrebouteille.style.display = "none";
						  $("#coverforformulaire").hide();
						  $(".afichecontenu").css("border-width","0");	
						  $(".ciblebouteille").css({
								"border-width" : "0"
							});	
						  }
					  
					  if (event.target == modalprodavecrechargement) {
						  location.replace("listeProducteurs");
						  }
					  if (event.target == modalcaveavecrechargement) {
						  location.replace("listeCaves");
						  }
					  if (event.target == modalbouteilleavecrechargement) {
						  location.replace("listeBouteilles");
						  }
					}			
					
					
					
					
					
					
					
					

					

					/*
					 * ****************************Mote de passe
					 * oublié**********************************
					 */
					$(".tabmdpoblie").click(function() {
						$(".divdisapppourtriggerevaluation").show();
					});

					/*
					 * **********************filter de list des
					 * bouteilles************************************************
					 */

					$("#filterBouteille")
							.keyup(
									function() {
										var value = $(this).val().toLowerCase();
										$(".ciblebouteille")
												.filter(
														function() {
															$(this)
																	.toggle(
																			$(
																					this)
																					.text()
																					.toLowerCase()
																					.indexOf(
																							value) > -1)
														});
									});

				});
/*
 * **********************filter bouteille pour afichage combien anee de la
 * consomation ************************************************
 */

$('#filterBouteilleConsomer').change(function() {
	var value = $(this).val();
	window.location = "listeBouteillesAConsomer?maxAnee=" + value;

});

$('#etibouteille').change(function() {
	var value = $(this).val();

	window.location = "listeBouteilles?tri=" + value;

});

/* ---------------FORMULAIRE CREATION BOUTEILLE----------------- */
/*
 * **********************Listjson*****************************************
 */

ajaxGet(
		"js/provenance.json",
		function(reponse) {
			// Transforme la réponse en un tableau
			// d'articles
			var obj, i, j, k, listItems = "", listItemsRegions = "", listItemsAppelation = "";
			obj = JSON.parse(reponse);

			/*
			 * listItems = '<option value="">-Select-</option>';
			 * listItemsRegions = '<option value="" >-Select-</option>';
			 * listItemsAppelation = '<option value="">-Select-</option>';
			 */
			for (i in obj.pays) {
				listItems += "<div  class='divchoice'>" + obj.pays[i].label
						+ "</div>";
				for (j in obj.pays[i].region) {
					listItemsRegions += "<div  class='divchoice' data-name='"
							+ obj.pays[i].label + "'>"
							+ obj.pays[i].region[j].label + "</div>";

					for (k in obj.pays[i].region[j].appelation) {
						listItemsAppelation += "<div  class='divchoice' data-name='"
								+ obj.pays[i].region[j].label
								+ "'>"
								+ obj.pays[i].region[j].appelation[k].label
								+ "</div>";

					}
				}
			}
			$("#payschoice").html(listItems);
			$("#regionchoice").html(listItemsRegions);
			$("#appelationchoice").html(listItemsAppelation);

			$(".divchoice")
					.click(
							function() {
								var value = $(this).text().toLowerCase();
								var valueinput = $(this).text();
								$(this).parent(".divinputchoice").prev(
										".inputformbouteille").val(valueinput);
								$(this).parent(".divinputchoice").hide();

								if ($(this).parent(".divinputchoice")
										.attr("id").toLowerCase().indexOf(
												"payschoice") > -1) {

									$("#regionchoice")
											.children(".divchoice")
											.filter(
													function() {
														var choisevalue = $(
																this).attr(
																"data-name")
																.toLowerCase();
														$(this)
																.toggle(
																		choisevalue
																				.indexOf(value) > -1)
													});

								} else if ($(this).parent(".divinputchoice")
										.attr("id").toLowerCase().indexOf(
												"regionchoice") > -1) {

									$("#appelationchoice")
											.children(".divchoice")
											.filter(
													function() {
														var choisevalue = $(
																this).attr(
																"data-name")
																.toLowerCase();
														$(this)
																.toggle(
																		choisevalue
																				.indexOf(value) > -1)
													});
								}

							});

		});

$('input[name=choixNouveauProducteur]:radio').click(function() {
	$("div#nouveauProducteur").hide();
	$("div#ancienProducteur").hide();
	var divId = jQuery(this).val();
	$("div#" + divId).show();

	if (divId == 'ancienProducteur') {
		$("input#nomP").attr('required', false);
	} else {
		$("input#nomP").attr("required", "required");
	}
});
/* idem avec choix ajouter producteur */
$('input[name=choixAjouterProducteur]:radio').click(function() {
	$("div#ajouterProducteur").hide();
	var divIdA = jQuery(this).val();
	$("div#" + divIdA).show();
	if (divIdA == 'nonAjouterProducteur') {
		$("input#nomP").attr('required', false);
	} else {
		$("input#nomP").attr("required", "required");
	}

});

$("#image").change(
		function() {

			var idBouteille = $("#prechargerimgform").attr("data-name");

			var ajouterProducteurTemp = $(
					'input[name=choixAjouterProducteur]:checked').val();
			var nouveauProducteurTemp = $(
					'input[name=choixNouveauProducteur]:checked').val();

			var idPTemp = $("#listeProducteurs").val();

			var nomTemp = $("#nom").val();
			var paysTemp = $("#pays").val();
			var regionTemp = $("#region").val();
			var appelationTemp = $("#appelation").val();
			var cruTemp = $("#cru").val();
			var couleurTemp = $("#couleur").val();
			var tailleTemp = $("#taille").val();
			var quantiteAcheterTemp = $("#quantiteAchetert").val();
			var prixAchatTemp = $("#prixAchat").val();
			var prixActuelleTemp = $("#prixActuelle").val();
			var dateDeProductionTemp = $("#dateDeProduction").val();
			var dateGarderTemp = $("#dateGarder").val();
			var evaluationTemp = $("#evaluationt").val();
			var commentaireTemp = $("#commentairet").val();
			var nomPTemp = $("#nomP").val();
			var adresseTemp = $("#adresse").val();
			var contactTemp = $("#contact").val();

			$("#prechargerimgform")
					.attr(
							"action",
							"prechargerImg?idBouteille=" + idBouteille
									+ "&nomTemp=" + nomTemp + "&paysTemp="
									+ paysTemp + "&regionTemp=" + regionTemp
									+ "&appelationTemp=" + appelationTemp
									+ "&cruTemp=" + cruTemp + "&couleurTemp="
									+ couleurTemp + "&tailleTemp=" + tailleTemp
									+ "&quantiteAcheterTemp="
									+ quantiteAcheterTemp + "&prixAchatTemp="
									+ prixAchatTemp + "&prixActuelleTemp="
									+ prixActuelleTemp
									+ "&dateDeProductionTemp="
									+ dateDeProductionTemp + "&dateGarderTemp="
									+ dateGarderTemp + "&evaluationTemp="
									+ evaluationTemp + "&commentaireTemp="
									+ commentaireTemp + "&nomPTemp=" + nomPTemp
									+ "&idPTemp=" + idPTemp + "&adresseTemp="
									+ adresseTemp + "&contactTemp="
									+ contactTemp + "&ajouterProducteurTemp="
									+ ajouterProducteurTemp
									+ "&nouveauProducteurTemp="
									+ nouveauProducteurTemp);
			document.getElementById("prechargerimgform").submit();
		});

$("#butchargerimg").click(function() {
	$("#ciblechargerimg").show();
});

$(".inputformbouteille").focus(function() {
	$(this).next(".divinputchoice").show();
});

$(".inputformbouteille").blur(function() {
	$(this).next(".divinputchoice").animate({
		height : 'toggle'
	});
});

$(".inputformbouteille").on("keyup", function() {
	var value = $(this).val().toLowerCase();
	$(this).next(".divinputchoice").children().filter(function() {
		$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	});
});

/*
 * 1 - Au lancement de la page, on cache le bloc d'éléments du formulaire
 * correspondant aux producteurs existants
 */
/* $("div#ancienProducteur").hide(); */
/*
 * 2 - Au clic sur un des deux boutons radio "choixNouveauProducteur", on
 * affiche le bloc d'éléments correspondant (nouveau ou ancien PRODUCTEUR)
 */

// Exécute un appel AJAX GET
// Prend en paramètres l'URL cible et la fonction callback appelée en cas de
// succès
function ajaxGet(url, callback) {
	var req = new XMLHttpRequest();
	req.open("GET", url);
	req.addEventListener("load", function() {
		if (req.status >= 200 && req.status < 400) {
			// Appelle la fonction callback en lui passant la réponse de la
			// requête
			callback(req.responseText);
		} else {
			console.error(req.status + " " + req.statusText + " " + url);
		}
	});
	req.addEventListener("error", function() {
		console.error("Erreur réseau avec l'URL " + url);
	});
	req.send(null);
}
