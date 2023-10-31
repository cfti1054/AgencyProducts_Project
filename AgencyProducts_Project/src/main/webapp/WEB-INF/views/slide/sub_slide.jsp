<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/sub_slide.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
</head>
<body>
	<!-- Swiper -->

    <div class="swiper-container">
        <div #swiperRef="" class="swiper mySwiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                	<img alt="sub_slide01" src="${pageContext.request.contextPath}/resource/img/sub_slide01.jpg">
                </div>
                <div class="swiper-slide">
                	<img alt="sub_slide02" src="${pageContext.request.contextPath}/resource/img/sub_slide02.jpg">
                </div>
                <div class="swiper-slide">
                	<img alt="sub_slide03" src="${pageContext.request.contextPath}/resource/img/sub_slide03.jpg">
                </div>
                <div class="swiper-slide">
                	<img alt="sub_slide04" src="${pageContext.request.contextPath}/resource/img/sub_slide04.jpg">
                </div>
                <div class="swiper-slide">
                	<img alt="sub_slide05" src="${pageContext.request.contextPath}/resource/img/sub_slide05.jpg">
                </div>
                <div class="swiper-slide">
                	<img alt="sub_slide06" src="${pageContext.request.contextPath}/resource/img/sub_slide06.jpg">
                </div>
                <div class="swiper-slide">
                	<img alt="sub_slide07" src="${pageContext.request.contextPath}/resource/img/sub_slide07.jpg">
                </div>
                <div class="swiper-slide">
                	<img alt="sub_slide08" src="${pageContext.request.contextPath}/resource/img/sub_slide08.jpg">
                </div>
                <div class="swiper-slide">
                	<img alt="sub_slide09" src="${pageContext.request.contextPath}/resource/img/sub_slide09.jpg">
                </div>
                <div class="swiper-slide">
                	<img alt="sub_slide10" src="${pageContext.request.contextPath}/resource/img/sub_slide10.jpg">
                </div>
                
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <!-- <div class="swiper-pagination"></div> -->
        </div>
    
        <p class="append-buttons">
            <button class="prepend-2-slides">Prepend 2 Slides</button>
            <button class="prepend-slide">Prepend Slide</button>
            <button class="append-slide">Append Slide</button>
            <button class="append-2-slides">Append 2 Slides</button>
        </p>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
        var swiper = new Swiper(".mySwiper", {
            slidesPerView: 6,
            centeredSlides: false,
            loop: true,
            spaceBetween: 30,
            autoplay: {
                delay: 2500,
                disableOnInteraction: false
            },
            pagination: {
                el: ".swiper-pagination",
                type: "fraction"
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev"
            }
        });

        var appendNumber = 4;
        var prependNumber = 1;
        document.querySelector(".prepend-2-slides").addEventListener("click", function (e) {
            e.preventDefault();
            swiper.prependSlide([
                '<div class="swiper-slide">Slide ' + --prependNumber + "</div>",
                '<div class="swiper-slide">Slide ' + --prependNumber + "</div>"
            ]);
        });
        document.querySelector(".prepend-slide").addEventListener("click", function (e) {
            e.preventDefault();
            swiper.prependSlide(
                '<div class="swiper-slide">Slide ' + --prependNumber + "</div>"
            );
        });
        document.querySelector(".append-slide").addEventListener("click", function (e) {
            e.preventDefault();
            swiper.appendSlide(
                '<div class="swiper-slide">Slide ' + ++appendNumber + "</div>"
            );
        });
        document.querySelector(".append-2-slides").addEventListener("click", function (e) {
            e.preventDefault();
            swiper.appendSlide([
                '<div class="swiper-slide">Slide ' + ++appendNumber + "</div>",
                '<div class="swiper-slide">Slide ' + ++appendNumber + "</div>"
            ]);
        });
    </script>
</body>
</html>