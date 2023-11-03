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
	
    if(! f.enter_id.value.trim()) {
        alert("연예인 ID를 입력하세요. ");
        f.enter_id.focus();
        return;
    }
    
    if(! f.enter_name.value.trim() ) {
        alert("연예인 이름을 입력하세요. ");
        f.enter_name.focus();
        return;
    }
    
    if(! f.enter_birth.value.trim() ) {
        alert("생년월일을 입력하세요. ");
        f.enter_birth.focus();
        return;
    }
    
    
    if(! f.debut_date.value.trim() ) {
        alert("데뷔일을 입력하세요. ");
        f.debut_date.focus();
        return;
    }
    
    f.action = "${pageContext.request.contextPath}/entertainer/enter_${mode}_ok.do";
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
	
		<div class="write_container" style="margin-top: 120px;">
	    <div class="form-title">
			<h2><i class="far fa-image"></i>&nbsp;${mode=="update" ? "그룹 수정" : "그룹 등록"} </h2>
	    
	    </div>
	    
	    <div class="write_enter">
			<form name="enterForm" method="post" enctype="multipart/form-data">
				<table class="table table-border table-form">
					<tr> 
						<td>연예인 ID</td>
						<td> 
							<input type="text" name="enter_id " maxlength="100" class="form-control" value="${dto.enter_id }">
						</td>
					</tr>
					<tr> 
						<td>연예인 이름</td>
						<td> 
							<input type="text" name="enter_name" maxlength="100" class="form-control" value="${dto.enter_name }">
						</td>
					</tr>
					<tr> 
						<td>생년월일</td>
						<td> 
							<input type="date" name="enter_birth" maxlength="100" class="form-control" value="${dto.enter_birth }">
						</td>
					</tr>
					<tr> 
						<td>데뷔일</td>
						<td> 
							<input type="date" name="debut_date" maxlength="100" class="form-control" value="${dto.debut_date }">
						</td>
					</tr>
					<tr> 
						<td>직업코드</td>
						<td> 
							<input type="radio" name="job_num " maxlength="100" class="form-control" value="1" checked>가수
							<input type="radio" name="job_num " maxlength="100" class="form-control" value="2">배우
							<input type="radio" name="job_num " maxlength="100" class="form-control" value="3">모델
						</td>
					</tr>
					</table>
					<div class="row">
							<p>활동ID
							<input name="act_id" type="text" value="${act_id}" readonly>
							</p>		
				</div>
					<table>
					<tr> 
						<td>예명</td>
						<td> 
							<input type="text" name="stage_name " maxlength="100" class="form-control" value="${dto.stage_name }">
						</td>
					</tr>
				</table>
				
				<table class="table">
					<tr> 
						<td align="center">
							<button type="button" class="btn" onclick="sendOk();">${mode=="update" ? "수정완료" : "등록완료"}</button>
							<button type="reset" class="btn">다시입력</button>
							<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/entertainer/actor.do';">${mode=="update" ? "수정취소" : "등록취소" }</button>
							
							<c:if test="${mode=='update'}">
								<input type="hidden" name="num" value="${dto.enter_id}">
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