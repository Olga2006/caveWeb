<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="messages" />
<div data-w-id="15e24f80-2097-7852-a818-41394943df11" class="menucover">
    <div class="txtmenucover">
      <h2 data-w-id="15e24f80-2097-7852-a818-41394943df13" class="headingfonct">FONCTIONNALITÉ</h2>
      <h2 data-w-id="15e24f80-2097-7852-a818-41394943df15" class="headingsupp">SUPPORT</h2>
      	<c:choose>
			<c:when test="${!empty sessionUtilisateur}">
				<h2 data-w-id="15e24f80-2097-7852-a818-41394943df17"
					class="headingconnection">DÉCONNECTION</h2>
			</c:when>
			<c:otherwise>
				<h2 data-w-id="15e24f80-2097-7852-a818-41394943df17"
					class="headingconnection">CONNECTION</h2>
			</c:otherwise>
		</c:choose>
      <h2 data-w-id="15e24f80-2097-7852-a818-41394943df19" class="headingblog">BLOG</h2>
    </div>
  </div>
  <div data-collapse="medium" data-animation="over-right" data-duration="400" data-no-scroll="1" data-w-id="9d98a81f-fd7b-9565-cfa5-dcdf1b74456c" class="navbar w-nav">
    <div class="container-2 w-container"><a href="index.jsp" class="logo-block w-nav-brand"><img src="images/icon.png" alt="" class="logo"></a>
      <nav role="navigation" data-w-id="f61502f3-6f13-575b-364b-f923089a7d17" class="nav-menu w-clearfix w-nav-menu">
      <a data-w-id="d009d85f-acb5-4282-5574-f3c6fbf96838" href="#" class="link linkmenu">FONCTIONNALITÉ</a>
      <a data-w-id="7a48ede6-ccd3-f736-7abe-10cc18a72b31" href="support" class="link linkmenu">SUPPORT</a>
      
      <c:choose>
				<c:when test="${!empty sessionUtilisateur}">
					<a class="link linkmenu"
						data-w-id="29993d89-a3f4-1b5f-6b8a-5a31da8df4bb"
						href="disconnection" title="me déconnecter">DECONNECTION</a>
				</c:when>
				<c:otherwise>
					<a class="link linkmenu"
						data-w-id="29993d89-a3f4-1b5f-6b8a-5a31da8df4bb" href="connection"
						title="me connecter">CONNECTION</a>
				</c:otherwise>
			</c:choose>
      
      <a data-w-id="3bb446f6-7034-b720-3450-fd662dae29e8" href="blog" class="link linkmenu">BLOG</a></nav>
      <div class="transparant-menu-button w-nav-button">
        <div class="w-icon-nav-menu"></div>
      </div>
    </div>
  </div>



















