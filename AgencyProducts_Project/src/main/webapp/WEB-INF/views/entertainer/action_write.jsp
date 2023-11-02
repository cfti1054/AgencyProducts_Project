<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${mode=="update" ? "활동 수정" : "활동 등록" }</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/enter_style.css" type="text/css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style type="text/css">

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
    width: 1300px;
    padding: 80px 0;
}


.form-title {
	padding-bottom: 30px;
}
.table-form {
    width: 1300px;
	padding-bottom: 20px;
}


.table-form td { padding: 7px 0; }

.table-form tr td:first-child{ background: #f8f8f8; text-align: center; width: 120px; font-weight: 500; }
.table-form tr td:nth-child(2) { text-align: left; padding-left: 10px; border-bottom: 2px solid #eee}

.table-form input[type=text]:focus { border: 1px solid #222; }
.table-form textarea {
	width: 96%;
	height: 300px;
}


</style>
<script type="text/javascript">
function sendOk() {
    const f = document.actionForm;
	let str;

    str = f.action_content.value.trim();
    if(!str) {
        alert("활동내역을 입력하세요. ");
        f.action_content.focus();
        return;
    }
    
    if(!f.start_date.value) {
        alert("시작날짜를 입력하세요.");
        f.start_date.focus();
        return;
    }
    if(!f.end_date.value) {
        alert("종료 날짜를 입력하세요.");
        f.end_date.focus();
        return;
    }
    
    
    f.action = "${pageContext.request.contextPath}/entertainer/action_${mode}_ok.do";
    f.submit();
}


</script>
</head>

<body>
	
	<header>
    	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	</header>
	
	<main>
		<div class="write_container" style="margin-top: 120px;">
			<div class="form-title">
				<h2><i class="far fa-image"></i>&nbsp;${mode=="update" ? "활동 수정" : "활동 등록"}</h2>
			</div>
			<div class="write_action">
				<form name="actionForm" method="post">
					<table class="table-form">
					<thead>
					<tr>
						<td>
							그룹명
						</td>
						<td>
							<input type="text" name="group_name" value="${sessionScope.enter.group_name}" readonly>
						</td>
						</tr>
					</thead>
					
					<tbody>
					<tr>
						<td>
							활동 분류
						</td>
						<td>
							<input type="radio" name="action_num" class="form-control" value="1" checked>음악
	                     	<input type="radio" name="action_num" class="form-control" value="2">드라마
	                     	<input type="radio" name="action_num" class="form-control" value="3">영화
	                     	<input type="radio" name="action_num" class="form-control" value="4">예능
	                     	<input type="radio" name="action_num" class="form-control" value="5">광고
						</td>
					</tr>
					<tr>
						<td>
							활동내역
						</td>
						<td>
							<p> 
								<textarea name="action_content" class="form-control">${dto.action_content}</textarea>
							</p>
						</td>
					</tr>
					<tr>
						<td>
							시작날짜
						</td>
						<td>
							<p> 
								<input type="date" name="start_date" class="form-control" value="${dto.start_date}">
							</p>
						</td>
					</tr>
					<tr>
						<td>
							종료날짜
						</td>
						<td>
							<p> 
								<input type="date" name="end_date" class="form-control" value="${dto.end_date}">
							</p>
						</td>
					</tr>
					</tbody>
					</table>
					
					<table class="submit-table">
						<tr>
							<td>  <button type="button" class="btn" onclick="sendOk();">${mode=="update" ? "수정완료" : "등록완료"}</button> </td>
								
							<td> <button type="reset" class="btn">다시입력</button> </td>
							<td> <button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/entertainer/article.do?act_id=${sessionScope.enter.act_id }';">취소</button> </td>
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