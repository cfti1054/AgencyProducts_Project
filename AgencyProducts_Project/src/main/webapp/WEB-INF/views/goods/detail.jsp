<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/goods_detail.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>

<script type="text/javascript">
	function update_goods(goods_id) {
	    if(confirm("게시글을 수정 하시겠습니까 ? ")) {
	        let query = "goods_id="+goods_id;
	        let url = "${pageContext.request.contextPath}/goods/update.do?" + query;
	        location.href = url;
	    }
	}
	
	function delete_goods(goods_id) {
	    if(confirm("게시글을 삭제 하시겠습니까 ? ")) {
	        let query = "goods_id="+goods_id;
	        let url = "${pageContext.request.contextPath}/goods/delete.do?" + query;
	        location.href = url;
	    }
	}
</script>

<body>
	
	<header>
    	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	</header>
	
	<div class="detail_container" style="padding-top: 240px">
        <div class="detail_layout">
            <div class="detail_wrap">
                <div class="detail_img">
                    <div class="img_cover">
                        <img src="${pageContext.request.contextPath}/uploads/photo/${listFile[1].img_name}" alt="detail_img">
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
                                                <input name="quantity" type="text" class="quantity_num" readonly value="0">
                                                <button type="button" class="add" onclick="plus();"><i class="fa-solid fa-plus"></i></button>
                                                <button type="button" class="minus" onclick="minus();"><i class="fa-solid fa-minus"></i></button>
                                                <input name="unit_price" type="hidden" value="${ dto.goods_price }">
                                                <input name="act_id" type="hidden" value="${ act_id }">
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="total_price">
                                    <div>
                                        <span>총 상품금액</span>
                                        <strong id="tot_price">총 가격</strong>
                                        
                                    </div>
                                </div>
                                <c:if test="${sessionScope.member.userId=='admin'}">
	                                <div class="admin_btn">
	                                	<button type="button" class="update_btn" onclick="update_goods(${dto.goods_id})">수정</button>
	                                	<button type="button" class="delete_btn" onclick="delete_goods(${dto.goods_id})">삭제</button>
	                                </div>
                                </c:if>
                                
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
                <div class="img_list">
	                <c:forEach var="vo" items="${ listFile }" varStatus="status">
		                <div class="photo photo${ status.index }">
		                    <img src="${pageContext.request.contextPath}/uploads/photo/${vo.img_name}" alt="photo" width="120">
		                </div>
	                </c:forEach>                	
                </div>
            </div>
        </div>
    </div>
    
    <footer>
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
	</footer>
    
    <script type="text/javascript">
    /*
    	var photo = document.querySelectorAll(".photo");
    	var scale = document.querySelectorAll(".scale");
    	
    	for(var i = 0; i < photo.length; i++) {
	    	photo[i].addEventListener('mouseenter', sizeUp);
    	}
    	
    	function sizeUp() {
    		
    		for(let i = 0; photo.length; i++) {
    			document.querySelector(".detail_photo+i").style.display = 'block';
    		}
    	}
    	
    	for(var i = 0; i < photo.length; i++) {
	    	photo[i].addEventListener('mouseleave', hide);
    	}
    	
    	function hide() {
    		for(let i = 0; photo.length; i++) {
    			document.querySelector(".detail_photo+i").style.display = 'none';
    		}
		}
    	*/
    	
    	const f = document.form1;
    	const unit_price = Number(f.unit_price.value);
    	let count = Number(f.quantity.value);
    	
    	let plus = () => {
    		count++;
    		f.quantity.value = count;
    		let total = unit_price * count;
    		console.log(total);
    		document.getElementById("tot_price").innerHTML=total + '원';
    	}
    	
    	let minus = () => {
    		count--;
    		if(count < 0) {
    			count = 0;
    		}
    		f.quantity.value = count;
    		let total = unit_price * count;
    		console.log(total);
    		document.getElementById("tot_price").innerHTML = total.toString() + '원';
    	}
    	
    	
    	
    	
    </script>
    
</body>
</html>