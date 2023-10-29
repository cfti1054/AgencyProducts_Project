<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
.main {margin: 10px auto;}
.fifle {magin: 10px auto; padding-left:40px;}

.box1 {font-weight: bold; font-size: 36px; padding-left: 70px;}
.box2 { margin: 50px auto; text-align:  center; }

.effect {width: 300px; padding-left: 150px;}
 

 span {font-size: 16px; color: gray;}
 p {line-height: 36px;}

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
		<span>ABOUT AP.4</span>		
		</h2>
		</div>	
		<br><hr><br>
		
		<div>	
			<div>
		 	<p class="box1">AP.4<br>ENTERTAINMENT<br></p>
		 	<br>
		 	</div>
		 	
		 	<div class="box2">
		 		<img src="${pageContext.request.contextPath}/resource/img/stone.png">
		 	</div>
		 	
		 	<div class="box2">
		 		<p> 
		 			| 원석은 저마다의 색의과 개성이 존재하며 그것을 발견하고 |<br>
		 			| 가치있는 보석으로 만들기 위해 이곳은 존재한다. |
		 		 </p>
		 	</div>
		 	
		 	<div>
		 	<table class="box2">
		 		<thead>
		 		<tr>
		 			<td>
		   			<p style="text-align: left; font-weight: bold;">
		 	 		 (주)AP.4는 대중문화계에 새로운 방향을 제시하고 재능 있는 대중 예술인을 발굴, <br>
		 	 		 육성한다는 미션 아래 설립이후 재능 있고, 스타성을 갖춘 아티스트를 배출, <br>
		 	 		 이후 다양한 시도와 마케팅으로 주목을 받고있습니다.<br>
  			  		(주)AP.4는 가수 매니지먼트와 연기자 매니지먼트를 두축으로 하여 <br>
  			 		 다양한 엔터테인먼트 사업을 펼치고 있습니다.<br>
			 		</p>
			 	</td>
			 	<td>
			 <img src="${pageContext.request.contextPath}/resource/img/about2.png" class="effect">
				</td>
				</tr>
				<thead>
			</table>
		 </div>	
		
	   </div>
	</div>
	<br><br><br>
</main>
</body>
<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>
</html>