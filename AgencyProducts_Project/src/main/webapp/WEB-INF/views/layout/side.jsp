<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="{pageContext.request.contextPath}/resource/css/side.css">
</head>
<body>
	<div class="wrap">
	    <div class="container">
	      <div id="aside" class="aside">
	        <h2>ARTIST</h2>
	        <ul class="list">
	        <c:forEach var="item" begin="1" end="10" varStatus="status">
	          <li class="title">
	            <a href="#">가수이름${ status.index }</a>
	          </li>	        
	        </c:forEach>
	        <!-- 
	          <li class="title">
	            <a href="#">가수이름2</a>
	          </li>
	          <li class="title">
	            <a href="#">가수이름3</a>
	          </li>
	          <li class="title">
	            <a href="#">가수이름4</a>
	          </li>
	          <li class="title">
	            <a href="#">가수이름5</a>
	          </li>
	          <li class="title">
	            <a href="#">가수이름6</a>
	          </li>	        
	        -->
	        </ul>
	      </div>
	      <div id="artist" class="artist">
	        <!-- 여기에 작성하면됨
	        
	        
	          
	        -->
	      </div>
	  </div>
  </div>
</body>
</html>