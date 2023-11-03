<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
    
    
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/style.css" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
    <header>
        <div class="header">
            <ul class="left_header">
                <li class="logo">
                    <a href="${pageContext.request.contextPath}/index.jsp">
                        <img src="${pageContext.request.contextPath}/resource/img/AgencyProducts_white.png" alt="logo" title="home" width="100px">
                    </a>
                </li>
                <li id="navi">
                    <ul id="navie" class="navi">
                        <li><a href="${pageContext.request.contextPath}/company/about.do">COMPANY</a>
                            <ul class="sub_menu">
                                <li><a href="${pageContext.request.contextPath}/company/about.do">회사소개</a></li>
                                <li><a href="${pageContext.request.contextPath}/company/greeting.do">대표인사말</a></li>
                                <li><a href="${pageContext.request.contextPath}/company/business.do">사업현황</a></li>
                                <li><a href="${pageContext.request.contextPath}/company/map.do">오시는길</a></li>
                                <li><a href="${pageContext.request.contextPath}/notice/list.do">공고</a></li>
                            </ul>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/goods/goods.do">GOODS</a>
                            <ul class="sub_menu">
                                <li><a href="${pageContext.request.contextPath}/goods/goods.do">굿즈</a></li>
                                <li></li>
                                <li></li>
                                <li></li>
                                <li></li>
                            </ul>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/entertainer/artist.do">ARTIST</a>
                            <ul class="sub_menu">
                                <li><a href="${pageContext.request.contextPath}/entertainer/actor.do">배우</a></li>
                                <li><a href="${pageContext.request.contextPath}/entertainer/singer.do">가수</a></li>
                                <li></li>
                                <li></li>
                                <li></li>
                            </ul>
                        </li>
                        <li><a href="#">NOTICE</a>
                            <ul class="sub_menu">
                                <li><a href="#">소식</a></li>
                                <li></li>
                                <li></li>
                                <li></li>
                                <li></li>
                            </ul>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/faq/list.do">CUSTOMER</a>
                            <ul class="sub_menu">
                                <li><a href="${pageContext.request.contextPath}/faq/list.do">FAQ</a></li>
                                <li><a href="${pageContext.request.contextPath}/qna/list.do">1:1문의</a></li>
                                <li></li>
                                <li></li>
                                <li></li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>

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
		                    <li><a href="#"><i class="fa-solid fa-user" style="color: #ffffff;"></i></a></li>
						</c:otherwise>
					</c:choose>
                </ul>
            </div>
        </div>
    </header>
    
    <script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
        let navi = document.querySelector('#navie');
        let subMenus = document.querySelectorAll('.sub_menu');

        navi.addEventListener('mouseenter', function() {
            subMenus.forEach(function(subMenu) {
                subMenu.style.display = 'block';
            });
        });

        navi.addEventListener('mouseleave', function() {
            subMenus.forEach(function(subMenu) {
                subMenu.style.display = 'none';
            });
        });
    });
</script>

    
</body>
</html>