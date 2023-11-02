<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>map</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/map.css" type="text/css">

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
                  <h2>오시는길</h2>
                  <span></span>
                  <h4>MAP</h4>
              </div>
              <div class="content">
                <div class="img">
                  <img src="${pageContext.request.contextPath}/resource/img/AgencyProducts_black.png" alt="agency_logo" width="280px">
                </div>
                <div class="address">
                  <div class="detail">
                    <p>| 서울특별시 성동구 성수동 1가 685번지 |</p>
                  </div>
                  <div class="map">
                    <!-- kakao map -->
                  </div>
                </div>
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