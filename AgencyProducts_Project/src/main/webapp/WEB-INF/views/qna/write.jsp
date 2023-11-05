<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/qna_write.css" type="text/css">

<script type="text/javascript">
function sendOk() {
    const f = document.questionForm;
	let str;
	
    str = f.q_subject.value.trim();
    if(!str) {
        alert("제목을 입력하세요. ");
        f.q_subject.focus();
        return;
    }

    str = f.q_content.value.trim();
    if(!str) {
        alert("내용을 입력하세요. ");
        f.q_content.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/qna/${mode}_ok.do";
    f.submit();
}
</script>
</head>
<body>
<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
</header>

<main>

<div class="wrap">

	<div class="container item_container" style="margin-top: 120px;">
		<div class="body-title">
			<h2><i> 1 : 1 문의 </i></h2>
			<span></span>
			<h4>One-on-one inquiry</h4>
		</div>
		
		<div class="body-main mx-auto">
			<form name="questionForm" method="post">
				<table class="table table-border table-form">
					<tr> 
						<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
						<td> 
							<input type="text" name="q_subject" maxlength="100" class="form-control subject" value="${dto.q_subject}">
						</td>
					</tr>
					
					<tr> 
						<td>작성자</td>
						<td> 
							<p>${sessionScope.member.userId}</p>
						</td>
					</tr>
					
					<tr>
						<td>문의 유형</td>
						<td>
							<select name="category_name">
								<option value="배송" selected="selected">배송관련</option>
								<option value="상품">상품관련</option>
								<option value="주문결제">주문결제관련</option>
								<option value="교환반품">교환반품관련</option>
								<option value="기타">기타</option>
							</select>
						</td>
					</tr>
									
					<tr> 
						<td valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
						<td> 
							<textarea name="q_content" class="form-control ">${dto.q_content}</textarea>
						</td>
					</tr>
				</table>
					
				<table class="table">
					<tr> 
						<td align="center">
							<button type="button" class="btn" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
							<button type="reset" class="btn">다시입력</button>
							<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/qna/list.do';">${mode=='update'?'수정취소':'등록취소'}</button>
							<input type="hidden" name="question_num" value="${dto.question_num}">
							<c:if test="${mode=='update'}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
						</td>
					</tr>
				</table>
		
			</form>

		</div>
	</div>
    
	
</div>
</main>

<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>
</body>
</html>