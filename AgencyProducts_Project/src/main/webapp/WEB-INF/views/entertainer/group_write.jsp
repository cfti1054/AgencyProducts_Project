<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그룹 등록</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script type="text/javascript">
function sendOk() {
    const f = document.enterForm;
	let str;
	
    str = f.act_id.value.trim();
    if(!str) {
        alert("활동ID를 입력하세요. ");
        f.act_id.focus();
        return;
    }

    str = f..group_name.trim();
    if(!str) {
        alert("그룹명을 입력하세요. ");
        f.group_name.focus();
        return;
    }
    
    let mode = "${mode}";
    if(mode==="write" && (! f.selectFile.value)) {
    	alert("이미지파일을 추가하세요");
    	f.selectFile.focus();
    	return;
    }

    f.action = "${pageContext.request.contextPath}/entertainer/${mode}_ok.do";
    f.submit();
}
</script>
</head>
<body>

<!-- 솔로 및 그룹원 등록 -->
	<header>
    	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	</header>

	<main>
		<div class="container body-container">
	    <div class="body-title">
			<h2><i class="far fa-image"></i> 연예인 등록 </h2>
	    </div>
	    
	    <div class="body-main mx-auto">
			<form name="enterForm" method="post" enctype="multipart/form-data">
				<table class="table table-border table-form">
					<tr> 
						<td>연예인 ID</td>
						<td> 
							<input type="text" name="act_id" maxlength="100" class="form-control" value="${dto.act_id}">
						</td>
					</tr>
					<tr> 
						<td>그룹명</td>
						<td> 
							<input type="text" name="group_name" maxlength="100" class="form-control" value="${dto.group_name}">
						</td>
					</tr>
			
					<tr>
						<td>이미지 등록</td>
						<td> 
							<input type="file" name="selectFile" accept="image/*" class="form-control">
						</td>
					</tr>
					
					<c:if test="${mode=='update'}">
						<tr>
							<td>이미지 수정</td>
							<td>
								<img src="<c:url value='/uploads/photo/${dto.img_name}'/>" class="img">
								<span class="info">(새로운 이미지를 등록하면 기존 이미지는 삭제됩니다.)</span>
							</td>
						</tr>
					</c:if>
					
				</table>
					
				<table class="table">
					<tr> 
						<td align="center">
							<button type="button" class="btn" onclick="sendOk();">${mode=="update" ? "수정완료" : "등록완료"}</button>
							<button type="reset" class="btn">다시입력</button>
							<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/photo/list.do';">${mode=="update" ? "수정취소" : "등록취소" }</button>
							
							<c:if test="${mode=='update'}">
								<input type="hidden" name="num" value="${dto.num}">
								<input type="hidden" name="imageFilename" value="${dto.imageFilename}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
							
						</td>
					</tr>
				</table>
		
			</form>

	    </div>
	</div>
	</main>

	<footer>
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
	</footer>

</body>
</html>