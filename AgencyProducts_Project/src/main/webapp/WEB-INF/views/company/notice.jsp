<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>notice</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/notice.css" type="text/css">
</head>

<body>

<header>
	<!-- login -->
    <jsp:include page="/WEB-INF/views/layout/header.jsp"/>
</header>
	
<main>
	<div class="wrap">
            <div class="container">
                <div id="aside" class="aside">
                    <h2>ARTIST</h2>
                    <ul class="list">
                        <li class="title">
                            <a href="${pageContext.request.contextPath}/company/about.do">회사소개</a>
                        </li>	        
                        <li class="title">
                            <a href="${pageContext.request.contextPath}/company/greeting.do">대표인사말</a>
                        </li>
                        <li class="title">
                            <a href="${pageContext.request.contextPath}/company/business.do">사업현황</a>
                        </li>
                        <li class="title">
                            <a href="${pageContext.request.contextPath}/company/map.do">오시는길</a>
                        </li>
                        <li class="title">
                            <a href="${pageContext.request.contextPath}/company/notice.do">공고</a>
                        </li>	        
                    </ul>
                </div>
                <div id="artist" class="artist">
                    <div class="about">
                        <h2>공고</h2>
                        <span></span>
                        <h4>NOTICE</h4>
                    </div>
                    <div class="notice">
                        <h1>공지사항</h1>
                        <p>공지내용</p>
                    </div>
                </div>
            </div>
        </div>
</main>
</body>
<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>
</html>