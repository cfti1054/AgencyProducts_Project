<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>map</title>
<style type="text/css">

.main {margin-left: 50px;}
.img { margin: 50px auto; text-align:center; }
.fifle {magin: 10px auto; padding-left:40px;}

</style>

</head>

<body>

<header>
	<!-- login -->
    <jsp:include page="/WEB-INF/views/layout/header.jsp"/>
</header>
	
<main>
<br><br><br><br><br><br><br><br><br><br><br>

	<div class="main">
	<div class="fifle">
		<h2>
		 회사소개 |
		<span>MAP</span>		
		</h2>
		</div>	
		<br><hr><br><br><br>
		
		<div class="img">
		<table>
			<tr>
			  <td>
				<img src="${pageContext.request.contextPath}/resource/img/AgencyProducts_black.png">
		     </td>
		     <td>
		     <p style="text-align: center; margin-left: 300px ;">| 서울특별시 성동구 성수동 1가 685번지 |</p>
		     </td>
			</tr>
		</table>
	 </div>
  </div>
		
	<br><br><br>
</main>
</body>
<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>
</html>