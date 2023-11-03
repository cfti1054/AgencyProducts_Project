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
                      <a href="#">회사소개</a>
                  </li>	        
                  <li class="title">
                      <a href="#">대표인사말</a>
                  </li>
                  <li class="title">
                      <a href="#">연혁</a>
                  </li>
                  <li class="title">
                      <a href="#">사업현황</a>
                  </li>
                  <li class="title">
                      <a href="#">오시는길</a>
                  </li>
                  <li class="title">
                      <a href="#">공고</a>
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
                  <div id="map">
                  </div>
                </div>
              </div>
          </div>
      </div>
    </div>
</main>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3b8406835c2cf7876709f0a5404df440"></script>
<script type="text/javascript">
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};

var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
</script>

</body>
<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>
</html>