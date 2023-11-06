<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/login.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">


<script type="text/javascript">
function sendLogin() {
    const f = document.loginForm;

	let str = f.user_id.value;
    if(!str) {
        alert("아이디를 입력하세요. ");
        f.user_id.focus();
        return;
    }

    str = f.user_pwd.value;
    if(!str) {
        alert("패스워드를 입력하세요. ");
        f.user_pwd.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/form/login_ok.do";
    f.submit();
}
</script>

</head>

<body>

<header>
	<!-- login -->
    <jsp:include page="/WEB-INF/views/layout/header.jsp"/>
</header>
	
<main>
	<div class="container body-container">
		<div class="body-title">
			<h3><i> Members Login </i></h3>
		</div>

		<div class="body-main">
			<div style="margin: 0 -15px 50px -15px"></div>
			<form name="loginForm" method="post" class="members-form">
				<div class="row text-center">
                    <img class="login-img" src="${pageContext.request.contextPath}/resource/img/AgencyProducts_white.png">
				</div>
				<div class="row">
					<label for="login-userId">Your ID</label>
					<input name="user_id" type="text" class="form-control" id="login-userId" placeholder="아이디">
				</div>
				<div class="row">
					<label for="login-password">Your Password</label>
					<input name="user_pwd" type="password" class="form-control" id="login-password" autocomplete="off" placeholder="패스워드">
				</div>
				<div class="row text-center login-btn">
					<button type="submit" class="button" value="Sign In" onclick="sendLogin();">Sign In</button>
				</div>
				<p class="text-center">
					<a href="${pageContext.request.contextPath}//form/member.do">Sign Up</a> <span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>
					<a href="${pageContext.request.contextPath}/">Find a ID</a> <span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>
					<a href="${pageContext.request.contextPath}/">Find a Password</a>
				</p>
				
                <div class="login-png">
                	<a href="#"><img src="${pageContext.request.contextPath}/image/google.png"></a>
                    <a href="#"><img src="${pageContext.request.contextPath}/image/kakao.png"></a>
                    <a href="#"><img src="${pageContext.request.contextPath}/image/naver.png"></a>
                </div>
               
			</form>
			<div class="members-message">
				<p class="text-center">
				</p>
			</div>
		</div>
	</div>
</main>
</body>
<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>
</html>