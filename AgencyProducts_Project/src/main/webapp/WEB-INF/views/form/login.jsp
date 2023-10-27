<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

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
<br><br><br><br><br><br><br><br><br><br><br>
	<div class="container body-container">
		<div class="body-title">
			<h2><i class="fa-solid fa-lock"></i> Members Login </h2>
		</div>
		
		<div class="body-main">
			<div style="margin: 0 -15px 50px -15px"></div>
			<form name="loginForm" method="post">
				<div class="members-form">
					<div class="row text-center">
						<i class="fa-solid fa-lock" style="font-size: 37px; color: #023b6d;"></i>
					</div>
					<div class="row">
						<label for="login-userId">Your ID</label>
						<input name="user_id" type="text" class="form-control" id="login-userId" placeholder="아이디">
					</div>
					<div class="row">
						<label for="login-password">Your Password</label>
						<input name="user_pwd" type="password" class="form-control" id="login-password" autocomplete="off"
							placeholder="패스워드">
					</div>
					<div class="row text-center">
						<button type="button" class="btn btn-primary" onclick="sendLogin();">Login</button>
					</div>
					<p class="text-center">
						<a href="${pageContext.request.contextPath}/">회원가입</a> <span>|</span>
						<a href="${pageContext.request.contextPath}/">아이디 찾기</a> <span>|</span>
						<a href="${pageContext.request.contextPath}/">패스워드 찾기</a>
					</p>
				</div>
			</form>
			<div class="members-message">
				<p class="text-center">
					${message}
				</p>
			</div>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br>
</main>
</body>
<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>
</html>