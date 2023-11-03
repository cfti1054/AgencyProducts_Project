<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>about</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/about.css" type="text/css">

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
                            <a href="${pageContext.request.contextPath}/notice/list.do">공고</a>
                        </li>	        
                    </ul>
                </div>
                <div id="artist" class="artist">
                    <div class="about">
                        <h2>회사소개</h2>
                        <span></span>
                        <h4>ABOUT AP.4</h4>
                    </div>
                    <div class="content">
                        <h1>AP.4</h1>
                        <h1>ENTERTAINMENT</h1>
                    </div>
                    <div class="img">
                        <img src="${pageContext.request.contextPath}/image/stone.png" alt="stone" width="820px">
                    </div>
                    <div class="write">
                        <p>| 원석은 저마다의 색의과 개성이 존재하며 그것을 발견하고 |</p>
                        <p>| 가치있는 보석으로 만들기 위해 이곳은 존재한다. |</p>
                    </div>
                    <div class="introduce">
                        <p>
                            (주)AP.4는 대중문화계에 새로운 방향을 제시하고 <br>재능 있는 대중 예술인을 발굴, 
                            육성한다는 미션 아래<br> 설립이후 재능 있고, 스타성을 갖춘 아티스트를 실력향상과<br> 그에 맞는 아이템 배출, <br>
                            이후 다양한 시도와 마케팅으로 주목을 받고있습니다.<br>
                            (주)AP.4는 가수 매니지먼트와 연기자 매니지먼트를 두축으로 하여<br> 
                            다양한 엔터테인먼트 사업을 펼치고 있습니다.<br>
                        </p>
                        <img src="${pageContext.request.contextPath}/image/about2.png" alt="about2" width="300px">
                    </div>
                </div>
            </div>
        </div>
    </main>	
	
<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>
</html>