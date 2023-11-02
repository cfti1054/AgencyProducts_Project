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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/notice_write.css" type="text/css">



<script type="text/javascript">
function sendOk() {
    const f = document.noticeForm;
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

    f.action = "${pageContext.request.contextPath}/notice/${mode}_ok.do";
    f.submit();
}

<c:if test="${mode=='update'}">
	function deleteFile(fileNum) {
		if(! confirm("파일을 삭제 하시겠습니까 ?")) {
			return;
		}
		
		let query = "num=${dto.num}&fileNum=" + fileNum + "&page=${page}&size=${size}";
		let url = "${pageContext.request.contextPath}/notice/deleteFile.do?" + query;
		location.href = url;
	}
</c:if>
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
						<a href="${pageContext.request.contextPath}/company/about.do">회사소개</a>
					</li>	        
					<li class="title">
						<a href="${pageContext.request.contextPath}/company/greeting.do">대표인사말</a>
					</li>
					<li class="title">
						<a href="${pageContext.request.contextPath}/company/business.do">사업현황</a>
					</li>
					<li class="title">
						<a href="${pageContext.request.contextPath}/company/map.do">오시는길</a>
					</li>
					<li class="title">
						<a href="${pageContext.request.contextPath}/notice/list.do">공고</a>
					</li>	        
				</ul>
			</div>
			<div id="artist" class="artist">
				<div class="about">
					<h2>공고</h2>
					<span></span>
					<h4>NOTICE</h4>
				</div>
			<div class=" body-container">
			    
			    
				    <div class="body-main mx-auto">
						<form name="noticeForm" method="post" enctype="multipart/form-data">
							<table class="table table-border table-form">
								<tr>
									<td class="td_css">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
									<td class="td_text"> 
										<input type="text" name="subject" maxlength="200" class="form-control subject_input" value="${dto.subject}">
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
									<td class="td_css">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
									<td class="td_text"> 
										<textarea name="content" class="form-control content_input">${dto.content}</textarea>
									</td>
								</tr>
								
								<tr>
									<td class="td_css">첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
									<td class="td_text"> 
										<i class="fa-solid fa-paperclip"></i>
										<input type="file" name="selectFile" class="form-control" multiple>
									</td>
								</tr>
				
								<c:if test="${mode=='update'}">
									<c:forEach var="vo" items="${listFile}">
										<tr>
											<td>첨부된파일</td>
											<td> 
												<p>
													<a href="javascript:deleteFile('${vo.fileNum}');"><i class="far fa-trash-alt"></i></a>
													${vo.originalFilename}
												</p>
											</td>
										</tr>
									</c:forEach> 
								</c:if>
							</table>
								
							<table class="table table-button">
								<tr> 
									<td align="center">
										<button type="button" class="btn" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
										<button type="reset" class="btn">다시입력</button>
										<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/notice/list.do?size=${size}';">${mode=='update'?'수정취소':'등록취소'}</button>
										<input type="hidden" name="size" value="${size}">
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
	</div>
</main>

</body>
<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>
</html>