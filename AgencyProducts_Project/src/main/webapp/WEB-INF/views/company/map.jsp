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
                
                <div class="address">
                  <div id="map">
                  </div>
                  <div class="detail">
                    <p>서울 성동구 뚝섬로 273</p>
                  </div>
                </div>
              </div>
          </div>
      </div>
    </div>
</main>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.5452496, 127.040848), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

// 지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('서울 성동구 뚝섬로 273', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">모임장소:서울 성동구 뚝섬로 273}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});

/*
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};

var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
 */
</script>

</body>
<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>
</html>