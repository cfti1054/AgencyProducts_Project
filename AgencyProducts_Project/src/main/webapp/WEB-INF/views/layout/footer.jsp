<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>footer</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/style.css" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
    <footer>
        <div class="layout"> 
            <div class="inner">
                <div class="footer_top">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/company/about.do">회사소개</a></li>
                        <li><a href="location.href='${pageContext.request.contextPath}/goods/goods.do';">상품</a></li>
                        <li><a href="#">카테고리</a></li>
                        <li><a href="${pageContext.request.contextPath}/notice/list.do">공지사항</a></li>
                        <li><a href="location.href='${pageContext.request.contextPath}/qna/list.do';">고객센터</a></li>
                        <li><a href="#">FAMILY SITE&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-chevron-up" style="color: #ffffff;"></i></a></li>
                    </ul>
                </div>
                <div class="footer_bottom">
                    <ul>
                        <li class="fb_left"><img src="${pageContext.request.contextPath}/resource/img/AgencyProducts_white.png" alt="fb_left" title="fb_left"></li>
                        <li class="fb_right">
                        	<p>뉴욕시 맨하탄로 abbb ave</p>
                        	<p>AgencyProducts의 모든 컨텐츠는 저작권의 보호를 받고 있습니다.</p>
                        	<p>Copyright <i class="fa-regular fa-copyright" style="color: #ffffff;"></i> 2023. AgencyProducts.All rights reserved.</p>
                        	<p>Contact.</p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>