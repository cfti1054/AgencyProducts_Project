<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>notice</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/faq_write.css" type="text/css">



<script type="text/javascript">
function sendOk() {
    const f = document.faqForm;
	let str;
	
    str = f.faq_subject.value.trim();
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

    str = f.faq_content.value.trim();
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/faq/${mode}_ok.do";
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
				<h2>ARTIST</h2>
				<ul class="list">
					<li class="title">
						<a href="${pageContext.request.contextPath}/faq/list.do">FAQ</a>
					</li>	        
					<li class="title">
						<a href="${pageContext.request.contextPath}/qna/list.do">1 : 1 문의</a>
					</li>
				</ul>
			</div>
			<div id="artist" class="artist">
				<div class="about">
					<h2>자주 묻는 질문</h2>
					<span></span>
					<h4>FAQ</h4>
				</div>
			<div class=" body-container">
			    
			    
				    <div class="body-main mx-auto">
						<form name="faqForm" method="post">
							<table class="table table-border table-form">
								<tr>
									<td class="td_css">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
									<td class="td_text"> 
										<input type="text" name="faq_subject" maxlength="200" class="form-control subject_input" value="${dto.faq_subject}">
									</td>
								</tr>
								<hr>
								
				
								<tr> 
									<td class="td_css">작성자</td>
									<td> 
										<p class="name">${sessionScope.member.userName}</p>
									</td>
								</tr>
								
								<tr>
									<td class="td_css">분&nbsp;&nbsp;&nbsp;&nbsp;류</td>
									<td class="td_text">
										<label>
											콘서트 <input type="radio" name="faq_case" value="1" checked>&nbsp;&nbsp;&nbsp;
										</label>
										<label>
											앨범 <input type="radio" name="faq_case" value="2">&nbsp;&nbsp;&nbsp;
										</label>
										<label>
											구매 <input type="radio" name="faq_case" value="3">&nbsp;&nbsp;&nbsp;
										</label>
									</td>
								</tr>
								
								<tr> 
									<td class="td_css">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
									<td class="td_text"> 
										<textarea name="faq_content" class="form-control content_input">${dto.faq_content}</textarea>
									</td>
								</tr>
								
							</table>
								
							<table class="table table-button">
								<tr> 
									<td align="center">
										<button type="button" class="btn" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
										<button type="reset" class="btn">다시입력</button>
										<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/qna/list.do';">${mode=='update'?'수정취소':'등록취소'}</button>
										<c:if test="${mode=='update'}">
											<input type="hidden" name="num" value="${dto.faq_num}">
										</c:if>
									</td>
								</tr>
							</table>
						</form>
				    </div>
				
				
			</div>
		</div>
	</div>
	</div>
</main>

</body>
<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>
</html>