<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/goods_write.css" type="text/css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<script type="text/javascript">
	function sendOk() {
		const f = document.goodsForm;
		let str;
		
		str = f.goods_id.value.trim();
		if(!str) {
			alert("굿즈아이디를 입력하세요");
			f.goods_id.focus();
			return;
		}
		
		str = f.goods_name.value.trim();
		if(!str) {
			alert("굿즈명을 입력하세요");
			f.goods_name.focus();
			return;
		}
		
		str = f.price.value.trim();
		if(!str) {
			alert("가격을 입력하세요");
			f.price.focus();
			return;
		}
		
		
		str = f.act_id.value.trim();
		if(!str) {
			alert("활동명을 선택해주세요");
			f.act_id.focus();
			return;
		}
		
		
		str = f.quantity.value.trim();
		if(!str) {
			alert("총 수량을 입력하세요");
			f.quantity.focus();
			return;
		}
		
		str = f.content.value.trim();
		if(!str) {
			alert("상세 설명란을 입력하세요");
			f.content.focus();
			return;
		}
		
		let mode = "${mode}";
		if(mode === "write" && (! f.selectFile.value)) {
			alert("굿즈 이미지를 등록해주세요");
			f.selectFile.focus();
			return;
		}
		
		f.action = "${pageContext.request.contextPath}/goods/${mode}_ok.do";
	    f.submit();
		
	}
</script>

</head>
<body>
	<header>
    	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	</header>
	
	<div class="container">
    <form name="goodsForm" method="post" enctype="multipart/form-data">
      <table class="table_form">
      	<c:if test="${ mode == 'write' }">
	      	<tr>
	          <td>굿즈 아이디</td>
	          <td>
	            <input type="text" name="goods_id" maxlength="100" class="form_value" value="${ dto.goods_id }">
	          </td>
	        </tr>
      	</c:if>
      	
        <tr>
          <td>굿즈명</td>
          <td>
            <input type="text" name="goods_name" maxlength="100" class="form_value" value="${ dto.goods_name }">
          </td>
        </tr>

        <tr>
          <td>가격</td>
          <td>
            <input type="text" name="price" maxlength="100" class="form_value" value="${ dto.goods_price }">
          </td>
        </tr>

        <tr>
          <td>활동아이디</td>
          <td>
            <select name="act_id" class="form_value">
              <c:forEach var="vo" items="${listEntertainer}">
              	<option value="${vo.act_id}">${vo.group_name}</option>
              </c:forEach>
            </select>
          </td>
        </tr>

        <tr>
          <td>총 개수</td>
          <td>
            <input type="text" name="quantity" maxlength="100" class="form_value" value="${ dto.goods_count }">
          </td>
        </tr>

        <tr>
          <td>굿즈 상세 설명</td>
          <td>
            <textarea name="content" id="content" cols="50" rows="10">${ dto.goods_acc }</textarea>
          </td>
        </tr>

        <tr>
          <td>굿즈 이미지</td>
          <td>
            <input type="file" name="selectFile" accept="image/*" class="form-control" multiple="multiple">
          </td>
        </tr>
        
        <c:if test="${ mode == 'update' }">
			<tr>
				<td>등록이미지</td>
				<td>
					<img src="<c:url value='/uploads/photo/${ dto.img_name }'/>" class="img">
					<span class="info">(새로운 이미지를 등록하면 기존 이미지는 삭제됩니다.)</span>
				</td>
			</tr>
		</c:if>

      </table>

      <table class="table">
        <tr> 
          <td align="center">
            <button type="button" class="btn" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
            <button type="reset" class="btn">다시입력</button>
            <button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/goods/goods.do';">${mode=='update'?'수정취소':'등록취소'}</button>
            
            <c:if test="${ mode=='update' }">
				<input type="hidden" name="photo_num" value="${ dto.photo_num }">
				<input type="hidden" name="imageFilename" value="${ dto.img_name }">
			</c:if>
            
          </td>
        </tr>
      </table>
    </form>
  </div>
	
	<footer>
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
	</footer>
</body>
</html>