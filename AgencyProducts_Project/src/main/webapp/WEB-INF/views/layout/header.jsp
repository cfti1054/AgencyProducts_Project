<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/style.css" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>

	<header>
    <div class="header">
      <div class="header_wrap">
        <div class="left_header">
          <div class="logo">
            <a href="${pageContext.request.contextPath}/index.jsp">
              <img src="${pageContext.request.contextPath}/resource/img/AgencyProducts_white.png" alt="logo" title="home" width="120px">
            </a>
          </div>
          <nav>
            <ul class="navi">
              <li class="main_menu1" onclick="location.href='${pageContext.request.contextPath}/company/about.do';">COMPANY</li>
              <li class="main_menu2" onclick="location.href='${pageContext.request.contextPath}/goods/goods.do';">GOODS</li>
              <li class="main_menu3" onclick="location.href='${pageContext.request.contextPath}/entertainer/artist.do';">ARTIST</li>
              <li class="main_menu4" onclick="location.href='${pageContext.request.contextPath}/bbs/list.do';">BOARD</li>
              <li class="main_menu5" onclick="location.href='${pageContext.request.contextPath}/faq/list.do';">CUSTOMER</li>
            </ul>
          </nav>


        </div>

        <div class="right_header">
          <ul class="icons">
          <c:choose>
			<c:when test="${empty sessionScope.member}">
				<!--로그인 전-->
                   <li><a href="${pageContext.request.contextPath}/form/login.do" title="로그인"><i class="fa-solid fa-arrow-right-to-bracket" style="color: #ffffff;"></i></a></li>
                   <li><a href="${pageContext.request.contextPath}/form/member.do" title="회원가입"><i class="fa-solid fa-user-plus" style="color: #ffffff;"></i></a></li>
			</c:when>
			<c:when test="${sessionScope.member.userId == 'admin'}">
				<!--관리자 모드-->
                   <li><a href="${pageContext.request.contextPath}/form/logout.do" title="로그아웃"><i class="fa-solid fa-right-from-bracket" style="color: #ffffff;"></i></a></li>
                   <li><a href="#"><i class="fa-solid fa-gear" style="color: #ffffff;"></i></a></li>
		
			</c:when>
			
			<c:otherwise>
				<!--로그인 후-->
                   <li><a href="${pageContext.request.contextPath}/form/logout.do" title="로그아웃"><i class="fa-solid fa-right-from-bracket" style="color: #ffffff;"></i></a></li>
                   <li><a href="${pageContext.request.contextPath}/form/userinfo.do"><i class="fa-solid fa-user" style="color: #ffffff;"></i></a></li>
			</c:otherwise>
		</c:choose>
          </ul>
        </div>
      </div>

    </div>
    <div class="sub_menu_wrap">
      <ul class="sub_menu_list">
        <li>
          <ul id="sub_menu1">
            <li class="sub_menu" onclick="location.href='${pageContext.request.contextPath}/company/about.do';">회사소개</li>
            <li class="sub_menu" onclick="location.href='${pageContext.request.contextPath}/company/greeting.do';">대표인사말</li>
            <li class="sub_menu" onclick="location.href='${pageContext.request.contextPath}/company/business.do';">사업현황</li>
            <li class="sub_menu" onclick="location.href='${pageContext.request.contextPath}/company/map.do';">오시는길</li>
            <li class="sub_menu" onclick="location.href='${pageContext.request.contextPath}/notice/list.do';">공고</li>
          </ul>
          <ul id="sub_menu2">
            <li class="sub_menu" onclick="location.href='${pageContext.request.contextPath}/goods/goods.do';">굿즈</li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
          </ul>
          <ul id="sub_menu3">
            <li class="sub_menu" onclick="location.href='${pageContext.request.contextPath}/entertainer/actor.do';">배우</li>
            <li class="sub_menu" onclick="location.href='${pageContext.request.contextPath}/entertainer/singer.do';">가수</li>
            <li></li>
            <li></li>
            <li></li>
          </ul>
          <ul id="sub_menu4">
            <li class="sub_menu" onclick="location.href='${pageContext.request.contextPath}/bbs/list.do';">소식</li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
          </ul>
          <ul id="sub_menu5">
            <li class="sub_menu" onclick="location.href='${pageContext.request.contextPath}/faq/list.do';">FAQ</li>
            <li class="sub_menu" onclick="location.href='${pageContext.request.contextPath}/qna/list.do';">1 : 1 문의</li>
            <li></li>
            <li></li>
            <li></li>
          </ul>
        </li>
      </ul>
    </div>
  </header>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script>
    $(function () {
      var $firstmenu = $('.navi'),
        $header = $('header'),
        $sub_header = $('.header'),
        $sub_menu = $('.sub_menu_wrap');
      $firstmenu.mouseenter(function () {
        $sub_menu.stop().animate({
          height: '400px'
        }, 200);
        $sub_header.css("background-color", "rgb(31, 31, 52)");
      });
      $header.mouseleave(function () {
        $sub_menu.stop().animate({
          height: '0'
        }, 200);
        $sub_header.css("background-color", "transparent");
      });

    });

    $(".main_menu1").mouseenter(function () {
      $("#sub_menu1").css("display", "block");
      $("#sub_menu2").css("display", "none");
      $("#sub_menu3").css("display", "none");
      $("#sub_menu4").css("display", "none");
      $("#sub_menu5").css("display", "none");
    });


    $(".main_menu2").mouseenter(function () {
      $("#sub_menu1").css("display", "none");
      $("#sub_menu2").css("display", "block");
      $("#sub_menu3").css("display", "none");
      $("#sub_menu4").css("display", "none");
      $("#sub_menu5").css("display", "none");
    });


    $(".main_menu3").mouseenter(function () {
      $("#sub_menu1").css("display", "none");
      $("#sub_menu2").css("display", "none");
      $("#sub_menu3").css("display", "block");
      $("#sub_menu4").css("display", "none");
      $("#sub_menu5").css("display", "none");
    });


    $(".main_menu4").mouseenter(function () {
      $("#sub_menu1").css("display", "none");
      $("#sub_menu2").css("display", "none");
      $("#sub_menu3").css("display", "none");
      $("#sub_menu4").css("display", "block");
      $("#sub_menu5").css("display", "none");
    });


    $(".main_menu5").mouseenter(function () {
      $("#sub_menu1").css("display", "none");
      $("#sub_menu2").css("display", "none");
      $("#sub_menu3").css("display", "none");
      $("#sub_menu4").css("display", "none");
      $("#sub_menu5").css("display", "block");
    });
  </script>
</body>
</html>