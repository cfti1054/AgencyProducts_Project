<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/pwd.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

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
	<div class="wrap">
		<div class="container">
			<div id="aside" class="aside">
				<h2>MYPAGE</h2>
				<ul class="list">
					<li class="title"><a
						href="${pageContext.request.contextPath}/form/userinfo.do">회원정보</a>
					</li>
					<li class="title"><a
						href="${pageContext.request.contextPath}/form/pwd.do">정보수정</a>
					</li>
					<li class="title"><a
						href="${pageContext.request.contextPath}/form/shopping.do">장바구니</a>
					</li>
					<li class="title"><a
						href="${pageContext.request.contextPath}/">주문내역</a>
					</li>
				</ul>
			</div>
	
			<div class="inner-page">
				<div class="members-form" id="pwd-confirm">
					<div class="members-title">
						<h2>패스워드 재확인</h2>
						<span></span>
						<h4>Confirm Your Password</h4>
					</div>
	
	
					<div class="info-box body-container">
						<form name="pwdForm" method="post">
							<div class="text-center text-margin">
								<h4><i>정보보호를 위해 패스워드를 다시 한 번 입력해주세요.</i></h4>
								<hr>
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
	
							<div class="members-message" >
								<p class="text-center">${message}</p>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</main>

<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>
</body>
</html>