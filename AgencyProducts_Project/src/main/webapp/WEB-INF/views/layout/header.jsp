<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/style.css?v=1" type="text/css">
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
                        <li><a href="#">COMPANY</a></li>
                        <li><a href="#">GOODS</a></li>
                        <li><a href="#">CATEGORY</a></li>
                        <li><a href="#">NOTICE</a></li>
                        <li><a href="#">CUSTOMER</a></li>
                    </ul>
                </li>
            </ul>

            <div class="right_header">
                <ul class="icons">
                    <li><a href="#"><i class="fa-solid fa-arrow-right-to-bracket" style="color: #ffffff;"></i></a></li>
                    <li><a href="#"><i class="fa-solid fa-user" style="color: #ffffff;"></i></a></li>
                </ul>
            </div>
        </div>
    </header>
</body>
</html>