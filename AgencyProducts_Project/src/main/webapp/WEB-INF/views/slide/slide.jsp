<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/slide.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
</head>
<body>
	<!-- Swiper -->
    <div class="swiper mySwiper">
    <div class="swiper-wrapper">
    
    <div class="swiper-slide">
    	<img alt="slide01" src="${pageContext.request.contextPath}/resource/main_img/main01.jpg">
    </div>
   	<div class="swiper-slide">
    	<img alt="slide02" src="${pageContext.request.contextPath}/resource/main_img/main02.jpg">
    </div>
   	<div class="swiper-slide">
    	<img alt="slide03" src="${pageContext.request.contextPath}/resource/main_img/main03.jpg">
    </div>
   	<div class="swiper-slide">
    	<img alt="slide04" src="${pageContext.request.contextPath}/resource/main_img/main04.jpg">
    </div>
   	<div class="swiper-slide">
    	<img alt="slide05" src="${pageContext.request.contextPath}/resource/main_img/main05.jpg">
    </div>
   	<div class="swiper-slide">
    	<img alt="slide06" src="${pageContext.request.contextPath}/resource/main_img/main06.jpg">
    </div>
   	<div class="swiper-slide">
    	<img alt="slide07" src="${pageContext.request.contextPath}/resource/main_img/main07.jpg">
    </div>
   	
    </div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
    <div class="swiper-pagination"></div>
    </div>

    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
        var swiper = new Swiper(".mySwiper", {
            spaceBetween: 0,
            centeredSlides: true,
            loop: true,
            autoplay: {
            delay: 2500,
            disableOnInteraction: false,
        },
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        });
    </script>
</body>
</html>