<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/pwd.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<style type="text/css">
 .table {
    width: 100%;
    border-collapse: collapse;
  }
  
  .table th, .table td {
    padding-bottom: 8px;
    text-align: left;
  }
  
  .table th {
    background-color: #f2f2f2;
     padding: 8px;
    text-align: center;
    border-collapse: collapse;
  }
  
    .table-list {
    width: 100%;
    border-collapse: collapse;
  }
  
  .table-list th, .table-list td {
    border-bottom: 1px solid #ddd;
    padding: 8px;
    text-align: center;
  }
  
  .num {
    width: 15%;
  }
  
  .subject {
    width: 30%;
  }
  
    .table-list th, .table-list td {
    border-bottom: 1px solid #ddd;
    padding: 8px;
    text-align: center;
  }
  
  .table2 {
  	margin-top: 30px;
  	float: right;
  }
  

</style>

<title>장바구니</title>
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
						href="${pageContext.request.contextPath}/">주문내역</a>
					</li>
				</ul>
			</div>
	
				<div class="members-form" id="pwd-confirm">
					<div class="members-title">
						<h2>회원정보</h2>
						<span></span>
						<h4>INFORMATION</h4>
			       </div>	
				</div>
				</div>
				
				<div>
					<table>
						<tr>
							<th>
								이름
							</th>
							<td>${dto.user_name}</td>
						</tr>
						<tr>
							<th>
								생년월일
							</th>
							<td>${dto.birth}</td>
						</tr>
						<tr>
							<th>
								전화번호
							</th>
							<td>${dto.tel}</td>
						</tr>
						<tr>
							<th>
								이메일
							</th>
							<td>${dto.email}</td>
						</tr>
						<tr>
							<th>
								우편번호
							</th>
							<td>${dto.zip}</td>
						</tr>
						<tr>
							<th>
								기본주소
							</th>
							<td>${dto.addr1}</td>
						</tr>
						<tr>
							<th>
								상세주소
							</th>
							<td>${dto.addr2}</td>
						</tr>
						<tr>
							<th>
								가입일
							</th>
							<td>${dto.reg_date}</td>
						</tr>
					</table>
				</div>
						
				
			</div>

</main>

<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>
</body>
</html>