<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTIST</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/enter_style.css" type="text/css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">


</head>

<body>
	
	<header>
    	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	</header>
	
	
	
	<div class="enter_container" style="margin-top: 120px;">
			<div class="enter_title">
				<h2>ARTIST</h2>
				
				<a>ARTIST</a>
				<a> &gt; </a>
				<a href="${pageContext.request.contextPath}/"> HOME </a>
				
			</div>
			
			<div class="admin_edit">
				<button type="button" onclick="location.href='${pageContext.request.contextPath}/entertainer/group_write.do';">그룹 등록</button>
			</div>
				<!--<c:if test="${sessionScope.member.userId == 'admin'}">-->
				<!--</c:if>-->
			
	        <div class="layout_grid">
	            <ul class="item_list">
	            	
		            <c:forEach var="dto" items="${list}">
		                <li class="item">
		     				<a href="${pageContext.request.contextPath}/entertainer/article.do?act_id=${dto.act_id}">
		                        <img src="${pageContext.request.contextPath}/uploads/photo/${dto.img_name}" alt="${dto.group_name}" title="${dto.group_name}">
		                    </a>
		                    <ul class="item_detail">
		                        <li class="item_name">
		                            <a href="${pageContext.request.contextPath}/entertainer/article.do?act_id=${dto.act_id}">${dto.group_name}</a>
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