<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/goods_detail.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
	
	<header>
    	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	</header>
	
	<div class="detail_container" style="padding-top: 240px">
        <div class="detail_layout">
            <div class="detail_wrap">
                <div class="detail_img">
                    <div class="img_cover">
                        <img src="https://via.placeholder.com/500x500" alt="detail_img">
                    </div>
                </div>
                <div class="detail_info_wrap">
                    <form name="form1" action="" method="post" id="form1">
                        <div class="detail_info">
                            <div class="info_title">
                                <h2>${ dto.goods_name }</h2>
                            </div>
                            <div class="info_list">
                                <div class="info_price">
                                    <span class="price">${ dto.goods_price }원</span>
                                </div>
                                <div class="info_option">
                                    <div class="option_list_wrap">
                                        <div class="option_list">
                                            <h4>적립금</h4>
                                            <p>1%</p>
                                        </div>
                                    </div>
                                    <div class="option_list_wrap">
                                        <div class="option_list">
                                            <h4>배송비</h4>
                                            <p>5만원 이상 구매시 무료</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="total_wrap">
                                    <ul class="option_list">
                                        <li class="goods_title">
                                            <h4>상품명</h4>
                                        </li>
                                        <li class="goods_option">
                                            <p class="option_price">${ dto.goods_price } </p>
                                            <div class="quantity">
                                                <input name="quantity" type="number" class="quantity_num">
                                                <button type="button" class="add" onclick="plus();"><i class="fa-solid fa-plus"></i></button>
                                                <button type="button" class="minus" onclick="minus();"><i class="fa-solid fa-minus"></i></button>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="total_price">
                                    <div>
                                        <span>총 상품금액</span>
                                        <strong>총 가격</strong>
                                    </div>
                                </div>
                                <div class="deter" style="padding-top: 47px">
                                    <div class="sell">
                                        <a href="#">바로 구매하기</a>
                                    </div>
                                    <div class="cart">
                                        <a href="#">카트에 담기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            
            <div class="goods_content">
                <div class="content">
                    <p class="detail">${ dto.goods_acc }</p>
                </div>
                <div class="photo">
                    <img src="<c:url value='/uploads/photo/${ dto.img_name }'/>" alt="photo">
                </div>
            </div>
        </div>
    </div>
    
    <footer>
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
	</footer>
    
</body>
</html>