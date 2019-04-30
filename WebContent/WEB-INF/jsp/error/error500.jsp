<%@ page pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html data-wf-page="5bf300026add225c390f24bd"
	data-wf-site="5bf300026add22d3cd0f2499">

<link href="css/dependent-dropdown.min.css" media="all" rel="stylesheet"
	type="text/css" />

<head>
<meta charset="utf-8">
<title>Erreur 500</title>
<!--   <meta content="About 1" property="og:title"> -->
<jsp:include page="/WEB-INF/jsp/head/head.jsp"></jsp:include>
</head>

<body class="body">
	<jsp:include page="/WEB-INF/jsp/left/left.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/jsp/nav/nav.jsp"></jsp:include>


				<div class="divbvdanscave descriptnom">
					<h1 class="heading bvheading">
						 Erreur 500<br>
				erreur technique : <%= exception.getMessage() %></h1>
</div>


	<script
		src="https://d1tdp7z6w94jbb.cloudfront.net/js/jquery-3.3.1.min.js"
		type="text/javascript"></script>

	<script src="js/jscave.js" type="text/javascript"></script>

	<!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
</body>
</html>

