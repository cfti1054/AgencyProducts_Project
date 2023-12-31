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
  
 .deter {
    text-align: right;
}

.deter .sell {
    margin-bottom: 10px;
}

.deter .sell a {
    display: inline-block;
    padding: 10px 100px;
    background: #444;
    color: #fff;
    text-align: center;
}

.container {
  display: flex;
  justify-content: space-between;
  padding-top: 120px;
  padding-bottom: 20px;
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
						href="${pageContext.request.contextPath}/payment/payment.do">주문내역</a>
					</li>
				</ul>
			</div>
	
				<div class="members-form" id="pwd-confirm">
					<div class="members-title">
						<h2>장바구니</h2>
						<span></span>
						<h4>SHOPPING BASKET</h4>
			       </div>	
						
			  			
				<table class="table table-list">
					<thead> 
						<tr>
							<th class="subject">
						 	  상품명
							</th>
							<th class="num">
							   상품금액
							</th>
							<th class="num">
							   갯수
							</th>
							<th class="num">
								총금액
							</th>
							<th class="num">
								배송비
							</th>
						</tr>
					</thead>
				<c:forEach var="dto" items="${list }">		
					<tbody>
						<tr>
							<td class="subject">${dto.goods_name }</td>
							<td class="num">${dto.goods_price }원</td>
							<td class="num">${dto.order_count }</td>
							<td class="num">${dto.total_price }원</td>
							<td class="num">2,500원</td>
						</tr>
					</tbody>
			</c:forEach>	
				</table>
				
					<div>
					<table class="table2" style="width: 20%; border-collapse: collapse; height: 100px;">
						<tr style="background-color: #f2f2f2; border-top: 1px solid #111; border-bottom: 1px solid #ddd;">
							<td></td>
							<th>총 금액</th>
						</tr>
						<tr>
							<td style="text-align: right;">배송비 : </td>
							<td style="text-align: right;">2,500원</td>
						</tr>
						<tr style="border-bottom: 1px solid #111;">
							<td></td>
							<th style="text-align: right;">
							${dto2.total}원
							</th>
						</tr>
					</table>
				</div>
			 </div>
		 </div>
		 
			<div class="deter" style="padding-top: 25px">
            	 <div class="sell">
            		  <a href="#">주문하기</a>
            	 </div>
		    </div>
		    
		    <div style="padding-bottom: 300px">
		    	
		    </div>
		  </div>  

</main>

<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>
</body>
</html>