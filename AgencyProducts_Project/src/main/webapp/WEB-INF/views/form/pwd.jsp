<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script type="text/javascript">
function sendOk() {
	const f = document.pwdForm;

	let str = f.user_pwd.value;
	if(!str) {
		alert("패스워드를 입력하세요. ");
		f.user_pwd.focus();
		return;
	}

	f.action = "${pageContext.request.contextPath}/form/pwd_ok.do";
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
			<div id="aside" class="aside">
				<h2>MYPAGE</h2>
				<ul class="list">
					<li class="title"><a
						href="${pageContext.request.contextPath}/">정보수정</a>
					</li>
					<li class="title"><a
						href="${pageContext.request.contextPath}/">장바구니</a>
					</li>
					<li class="title"><a
						href="${pageContext.request.contextPath}/">주문내역</a>
					</li>
				</ul>
			</div>
			<div class="inner-page">
			<div class="members-form">
				<div class="members-title">
					<h3><i class="fa-solid fa-lock"></i> 패스워드 재확인</h3>
				</div>
				<div class="info-box">
					<form name="pwdForm" method="post">
						<div class="row text-center">
							정보보호를 위해 패스워드를 다시 한 번 입력해주세요.
						</div>
						<div class="row">
							<input name="userId" type="text" class="form-control"
								readonly
								value="${sessionScope.member.userId}">
						</div>
						<div class="row">
							<input name="user_pwd" type="password" class="form-control" autocomplete="off" placeholder="패스워드">
						</div>
						<div>
							<button type="button" class="btnConfirm" onclick="sendOk();">확인</button>
							<input type="hidden" name="mode" value="${mode}">
						</div>
					</form>
				</div>
			</div>
			<div class="members-message">
				<p class="text-center">${message}</p>
			</div>
	    </div>
	</div>

</main>

<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>
</body>
</html>