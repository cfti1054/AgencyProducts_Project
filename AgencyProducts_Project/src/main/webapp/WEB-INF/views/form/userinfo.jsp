<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/userinfo.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<style type="text/css">

  

</style>

<title>회원정보</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

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
						href="${pageContext.request.contextPath}/payment/payment.do">주문내역</a>
					</li>
				</ul>
			</div>
	
			<div class="members-form" id="pwd-confirm">
				<div class="members-title">
					<h2>회원정보</h2>
					<span></span>
					<h4>INFORMATION</h4>
			    </div>
			    
			    <div class="body-container">
					<table class="main-table">
						<tr class="table-tr">
							<th>
								이름
							</th>
							<td class="table-td">${dto.user_name}</td>
						</tr>
						<tr class="table-tr">
							<th class="table-th">
								생년월일
							</th>
							<td class="table-td">${dto.birth}</td>
						</tr>
						<tr class="table-tr">
							<th class="table-th">
								전화번호
							</th>
							<td class="table-td">${dto.tel}</td>
						</tr>
						<tr class="table-tr">
							<th class="table-th">
								이메일
							</th>
							<td class="table-td">${dto.email}</td>
						</tr>
						<tr class="table-tr">
							<th class="table-th">
								우편번호
							</th>
							<td class="table-td">${dto.zip}</td>
						</tr>
						<tr class="table-tr">
							<th class="table-th">
								기본주소
							</th>
							<td class="table-td">${dto.addr1}</td>
						</tr>
						<tr class="table-tr">
							<th class="table-th">
								상세주소
							</th>
							<td class="table-td">${dto.addr2}</td>
						</tr>
						<tr class="table-tr">
							<th class="table-th">
								가입일
							</th>
							<td class="table-td">${dto.reg_date}</td>
						</tr>
					</table>
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