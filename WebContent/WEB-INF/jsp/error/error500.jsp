<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
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
<title><fmt:message key="error500.title"></fmt:message></title>
<!--   <meta content="About 1" property="og:title"> -->
<jsp:include page="/WEB-INF/jsp/head/head.jsp"></jsp:include>
</head>

<body class="body">
	<jsp:include page="/WEB-INF/jsp/left/left.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/jsp/nav/nav.jsp"></jsp:include>

<div class="divbvdanscave descriptnom">
					<h1 class="heading bvheading">
						 <fmt:message key="error500.title"></fmt:message><br>
				<fmt:message key="error500.text"></fmt:message> <%= exception.getMessage() %></h1>
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




		