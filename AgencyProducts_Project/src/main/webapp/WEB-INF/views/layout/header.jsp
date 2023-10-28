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
                    <a href="#">
                        <img src="https://via.placeholder.com/200x35" alt="logo" title="home">
                    </a>
                </li>
                <li>
                    <ul class="navi">
                        <li><a href="#">COMPANY</a>
                            <ul class="sub_menu">
                                <li><a href="${pageContext.request.contextPath}/company/about.do">회사소개</a></li>
                                <li><a href="${pageContext.request.contextPath}/company/greeting.do">대표인사말</a></li>
                                <li><a href="${pageContext.request.contextPath}/company/business.do">사업현황</a></li>
                                <li><a href="${pageContext.request.contextPath}/company/map.do">오시는길</a></li>
                                <li><a href="${pageContext.request.contextPath}/company/notice.do">공고</a></li>
                            </ul>
                        </li>
                        <li><a href="#">GOODS</a>
                            <ul class="sub_menu">
                                <li><a href="#">굿즈</a></li>
                            </ul>
                        </li>
                        <li><a href="#">CATEGORY</a>
                            <ul class="sub_menu">
                                <li><a href="#">배우</a></li>
                                <li><a href="#">가수</a></li>
                                <li><a href="#">모델</a></li>
                                <li><a href="#">엔터테이너</a></li>
                            </ul>
                        </li>
                        <li><a href="#">NOTICE</a>
                            <ul class="sub_menu">
                                <li><a href="#">소식</a></li>
                            </ul>
                        </li>
                        <li><a href="#">CUSTOMER</a>
                            <ul class="sub_menu">
                                <li><a href="#">FAQ</a></li>
                                <li><a href="#">1:1문의</a></li>
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
</body>
</html>