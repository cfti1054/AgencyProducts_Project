<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/detail_update.css" type="text/css">
<style type="text/css">
/*
	*{
	    margin: 0;
	    padding: 0;
	    text-decoration: none;
	    color: #333;
	    box-sizing: border-box;
	}
	
	body {
	  display: flex;
	  flex-direction: column;
	  justify-content: center;
	  align-items: center;
	}
*/
</style>

<script type="text/javascript">
function sendOk() {
	const f = document.updateForm;
	
    if(! f.enter_id.value.trim()) {
        alert("연예인 ID를 입력하세요. ");
        f.enter_id.focus();
        return;
    }

    if(! f.enter_name.value.trim()) {
        alert("연예인 이름을 입력하세요. ");
        f.enter_name.focus();
        return;
    }
    
    if(! f.enter_birth.value) {
        alert("생년월일을 입력하세요. ");
        f.enter_birth.focus();
        return;
    }
    
    if(! f.debut_date.value) {
        alert("데뷔일을 입력하세요. ");
        f.debut_date.focus();
        return;
    }
    
   if(! f.job_num.value) {
		alert('직업코드 입력 하세요.');
		f.job_num.focus();
		return;
	} 
    
    
    if(! f.act_id.value.trim() ) {
        alert("활동ID을 입력하세요. ");
        f.act_id.focus();
        return;
    } 
	
    f.action = "${pageContext.request.contextPath}/entertainer/enter_${mode}_ok.do";
    f.submit();
}

</script>

</head>
<body>
	
	<header>
    	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	</header>

	<main>
		<div class="write_container">
			<form name="updateForm" method="post" enctype="multipart/form-data">
				<div class="row">
					<p> 연예인 ID
					</p>	
					<input name="enter_id" type="text" class="form-control"
						value="${dto.enter_id }">
				</div>
				<div class="row">
					<p> 연예인 이름
					</p>	
					<input name="enter_name" type="text" value="${dto.enter_name}">
				</div>
				<div class="row">
					<p> 생년월일
					</p>	
						<input type="text" name=enter_birth value="${dto.enter_birth}">
				</div>
				<div class="row">
					<p> 데뷔일
					</p>	
					   <input name="debut_date" type="text" value="${dto.debut_date}">
				</div>
				<div class="row">
					<p> 직업코드
					</p>	
					<input name="job_num" type="text" value="${dto.job_num}">
				</div>
				<div class="row">
					<p> 활동 ID
					</p>	
					<input name="act_id" type="text" value="${dto.act_id}">
				</div>
				<div class="row">
					<p> 예명
					</p>	
					<input name="stage_name" type="text"value="${dto.stage_name}">
				</div>
				<div class="btn">
					<button type="button" class="btn" onclick="sendOk();">수정완료</button>
					<button type="reset" class="btn">다시입력</button>
					<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/entertainer/actor.do';">수정취소</button>
					
					<c:if test="${mode=='update'}">
						<input type="hidden" name="num" value="${dto.enter_id}">
					</c:if>
				</div>
			
			</form>
		</div>
	</main>
	
	<footer>
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
	</footer>


</body>
</html>