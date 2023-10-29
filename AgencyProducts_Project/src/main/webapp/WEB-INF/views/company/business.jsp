<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>business</title>
<style type="text/css">
.img { margin: 50px auto; text-align:center; }

</style>

</head>

<body>

<header>
	<!-- login -->
    <jsp:include page="/WEB-INF/views/layout/header.jsp"/>
</header>
	
<main>
<br><br><br><br><br><br><br><br><br><br><br>

	<div class="img">
		<img src="${pageContext.request.contextPath}/resource/img/business.png">
	</div>
	
	
	<br><br><br>
</main>
</body>
<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>
</html>