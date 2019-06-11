<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="messages" />
<!DOCTYPE html>
<html data-wf-page="5bf300026add22b08f0f24a6"
	data-wf-site="5bf300026add22d3cd0f2499">
<head>
<meta charset="utf-8">
<title>Blog</title>
<jsp:include page="/WEB-INF/jsp/head/head.jsp"></jsp:include>
</head>
<body class="body">
	<c:if test="${ !empty sessionUtilisateur}"><jsp:include
			page="/WEB-INF/jsp/left/left.jsp"></jsp:include></c:if>

	<jsp:include page="/WEB-INF/jsp/nav/nav.jsp"></jsp:include>

	<div class="coremembre">
		<div class="bvcellar"></div>
		<div class="divbvdanscave descriptnom">
			<h1 class="heading bvheading">Blog</h1>
		</div>


		<c:choose>
			<c:when test="${ empty blogs }">

				<div class="divbvdanscave descriptnom">
					<h1 class="heading bvheading">Coming soon</h1>
				</div>

			</c:when>
			<c:otherwise>
				<div class="collectionscroll">
					<c:forEach items="${blogs }" var="mapBlog" varStatus="boucle">
						<div class="cibleblog">
							<div class="blockoneitem">

								<div class="divblog" style="height: 150px;">
									<div class="column-6 w-col w-col-6 w-col-small-6 w-col-tiny-6">

										<div class="divdescrp2lh">
											<img src="images/blogimg/blog1.jpg" alt="" class="imgblog">
										</div>
									</div>
									<div class="column-6 w-col w-col-6 w-col-small-6 w-col-tiny-6">

										<div class="divdescrp2lh">
											<div class="descriptmainnom">
												<c:out value="${ mapBlog.nomArticle }" />
											</div>
											<div class="descripattention">
												<c:out value="${ mapBlog.subtheme }" />
											</div>
										</div>
										<div class="divdescrp2lh">
											<div class="descripattention">
												<fmt:formatDate pattern="yyyy-MM-dd"
													value="${mapBlog.dateEdition}" />

											</div>
										</div>
										<div class="divdescrp2lh ">
											<div class="descriptrest">
												<c:out value="${ mapBlog.nomAuteur }" />
											</div>
										</div>
										<div class="descriptrest">
											<p>
												<c:out value="${ mapBlog.article1 }" />
											</p>
										</div>

									</div>



									<div class="divdescrp2lh ">

										<div class="descriptrest">
											<p>
												<c:out value="${ mapBlog.article2 }" />
											</p>
										</div>
										<div class="descriptrest">
											<p>
												<c:out value="${ mapBlog.article3 }" />
											</p>
										</div>


									</div>

								</div>



								<div class="divimgexpand" style="cursor: pointer;">
									<div class="divdescrrightbottom">
										<div style="cursor: pointer;">
											<fmt:message key="title.plusinformations"></fmt:message>
										</div>
									</div>
									<img src="images/expand.png" class="imgexpand"
										title="<fmt:message key="title.plusinformations"></fmt:message>">
								</div>


								<div class="divimgreduce"
									style="cursor: pointer; display: none;">
									<div class="divdescrrightbottom">
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