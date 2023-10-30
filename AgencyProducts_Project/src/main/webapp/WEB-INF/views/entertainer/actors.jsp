<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>actor</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/enter_style.css" type="text/css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">


</head>

<body>
	
	<header>
    	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	</header>
	
	<div class="enter_container" style="margin-top: 120px;">
		<div class="enter_title">
			<h2>ACTOR</h2>
			
			<a> ACTOR </a>
			<a> &gt; </a>
			<a href="${pageContext.request.contextPath}/"> HOME </a>
			
		</div>
		
		
        <div class="layout_grid">
            <ul class="item_list">
            	
	            <c:forEach var="i" begin="1" end="25" varStatus="x">
	                <li class="item">
	                    <a href="#">
	                        <img src="https://via.placeholder.com/240x240" alt="${dto.enter_name}" title="item${dto.enter_name}">
	                    </a>
	                    <ul class="item_detail">
	                        <li class="item_name">
	                            <a href="#">item${dto.enter_name}</a>
	                        </li>
	                    </ul>
	                </li>
	            </c:forEach>                
            </ul>
        </div>
    </div>
    
    <footer>
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
	</footer>
    
</body>
</html>