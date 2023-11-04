<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/bbs_write.css" type="text/css">
<title>bbs_write</title>

<script type="text/javascript">
function sendOk() {
    const f = document.boardForm;
	let str;
	
    str = f.subject.value.trim();
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

    str = f.content.value.trim();
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/bbs/${mode}_ok.do";
    f.submit();
}
</script>
</head>
<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</header>
	
<main>
<div class="wrap">

	<div class="item_container" style="margin-top: 120px;">

		<div class="container body-container">

			<div class="body-title">
				<h2><i> 연예인 소식 </i></h2>
				<span></span>
				<h4>Entertainer Board</h4>
			</div>

		    
		    <div class="body-main mx-auto">
				<form name="boardForm" method="post">
					<table class="table table-border table-form">
						<tr class="tr-size"> 
							<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
							<td> 
								<input type="text" class="subject" name="subject" maxlength="100" class="form-control" value="${dto.subject}">
							</td>
						</tr>
						
						<tr> 
							<td>작성자</td>
							<td> 
								<p>${sessionScope.member.userName}</p>
							</td>
						</tr>
						
						<tr class="tr-size"> 
							<td valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
							<td> 
								<textarea name="content" class="form-control">${dto.content}</textarea>
							</td>
						</tr>
					</table>
						
					<table class="table table-button">
						<tr> 
							<td align="center">
								<button type="button" class="btn" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
								<button type="reset" class="btn">다시입력</button>
								<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/bbs/list.do';">${mode=='update'?'수정취소':'등록취소'}</button>
								<c:if test="${mode=='update'}">
									<input type="hidden" name="num" value="${dto.num}">
									<input type="hidden" name="page" value="${page}">
								</c:if>
							</td>
						</tr>
					</table>
			
				</form>
	
		    </div>
		</div>
	
	</div>
    
	
</div>
</main>

<footer>
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</footer>


</body>
</html>