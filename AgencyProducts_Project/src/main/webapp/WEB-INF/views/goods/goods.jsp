<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goods</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/goods_style.css"
	type="text/css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<header>
		<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	</header>

	<main>
		<div class="item_container">
			<div class="layout_grid">
			
				<div class="goods-write">
					<c:if test="${sessionScope.member.userId == 'admin'}">
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/goods/write.do';">글올리기</button>
					</c:if>  
				</div>
			
				<ul class="item_list" style="border-radius: 8px;">
					<c:forEach var="dto" items="${ list }" varStatus="status">
						<li class="item"><a
							href="${detailUrl}&goods_id=${dto.goods_id}"> <img
								src="${ pageContext.request.contextPath }/resource/uploads/photo/${ dto.img_name }"
								alt="item${ status.index }" title="item${ status.index }">
						</a>
							<ul class="item_detail">
								<li class="item_name"><a
									href="${detailUrl}&goods_id=${dto.goods_id}&act_id=${dto.act_id}">${ dto.goods_name }</a>
								</li>
								<li class="item_price"><span>${ dto.goods_price2 }원</span></li>
							</ul></li>
					</c:forEach>
				</ul>

				<div class="page-navigation">${ dataCount == 0 ? "등록된 게시물이 없습니다." : paging }
				</div>

			</div>
		</div>
	</main>

	<footer>
		<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	</footer>

</body>
</html>