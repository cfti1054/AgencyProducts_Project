<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${mode=="update" ? "그룹 수정" : "그룹 등록 "} </title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/group_write.css" type="text/css">
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
.write_container {
    width: 1100px;
    padding: 80px 0;
}
.form-title {
	padding-bottom: 30px;
}

.table-form {
	width: 800px;
}
.table-form td { padding: 7px 0; }

.table-form tr td:first-child{ background: #f8f8f8; text-align: center; width: 120px; font-weight: 500; }
.table-form tr td:nth-child(2) { text-align: left; padding-left: 10px; border-bottom: 2px solid #eee}

.table-form input[type=text]:focus { border: 1px solid #222; }

.info {
	font-size: 12px;
	font: #888;
}
*/
</style>

<script type="text/javascript">
function sendOk() {
    const f = document.groupForm;
	
    /*
    if(! f.act_id.value.trim() ) {
        alert("활동ID를 입력하세요. ");
        f.act_id.focus();
        return;
    }
    */
	
    if(! f.group_name.value.trim() ) {
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
    
    f.action = "${pageContext.request.contextPath}/entertainer/group_${mode}_ok.do";
    f.submit();
}
</script>
</head>
<body>

<!-- 그룹 등록 및 수정 -->
	<header>
    	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	</header>

	<main>
	
		<div class="write_container">
	    <div class="form-title">
			<h2>${mode=="update" ? "그룹 수정" : "그룹 등록"}</h2>
	    
	    </div>
	    
	    <div class="write_enter">
			<form name="groupForm" method="post" enctype="multipart/form-data">
				<table class="table-form">
					<tr> 
						<td>활동ID</td>
						<td>
							<p> 
								<input type="text" name="act_id" maxlength="100" class="form-control" value="${dto.act_id}" ${mode=="update" ? "readonly ":""} placeholder="활동ID">
							</p>
							
						</td>
					</tr>
					<tr> 
						<td>그룹명</td>
						<td> 
							<input type="text" name="group_name" maxlength="100" class="form-control" value="${dto.group_name}" placeholder="그룹명">
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
								<p class="info">(새로운 이미지를 등록하면 기존 이미지는 삭제됩니다.)</p>
							</td>
						</tr>
					</c:if>
					
				</table>
					
				<table class="table">
					<tr> 
						<td align="center">
							<button type="button" class="btn" onclick="sendOk();">${mode=="update" ? "수정완료" : "등록완료"}</button>
							<button type="reset" class="btn">다시입력</button>
							<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/entertainer/actor.do';">${mode=="update" ? "수정취소" : "등록취소" }</button>
							
							<c:if test="${mode=='update'}">
								<input type="hidden" name="act_id" value="${dto.act_id}">
								<input type="hidden" name="imageFilename" value="${dto.img_name}">
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