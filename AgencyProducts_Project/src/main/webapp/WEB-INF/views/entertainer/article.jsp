<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>article</title>
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

.enter_container {
    width: 1300px;
    padding: 80px 0;
}
.form-title {
	padding-bottom: 30px;
}

.table-form td {
 	width: 1300px;
    padding: 80px 0;
}
.table-form td { padding: 7px 0; }

.table-form tr td:first-child{ background: #f8f8f8; text-align: center; width: 120px; font-weight: 500; }
.table-form tr td:nth-child(2) { text-align: left; padding-left: 10px; border-bottom: 2px solid #eee}

.table-form input[type=text]:focus { border: 1px solid #222; }


</style>
<script type="text/javascript">
function deleteGroup(){
	if(confirm('그룹을 삭제하시겠습니까 ? ')) {
		location.href = '${pageContext.request.contextPath}/entertainer/group_delete.do?act_id=${dto.act_id}';
	}
}

function deleteAction(){
	if(confirm('활동을 삭제하시겠습니까 ? ')) {
		location.href = '${pageContext.request.contextPath}/entertainer/action_delete.do?ac_list_num=${dto.ac_list_num}';
	}
}
</script>
</head>

<body>
	
	<header>
    	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	</header>
	
	<div class="enter-container" style="margin-top: 120px;">
	    <div class="form-title">
			<h2><i class="far fa-image"></i> ${dto.group_name} </h2>
	    </div>
	    <div>
	    	<img src="<c:url value='/uploads/photo/${dto.img_name}'/>" class="img">
		</div>
		
	    <div>
			<table class="table-form">
            <thead>
               <tr>
                  <td>
                     그룹명
                  </td>
                  <td>
                     ${dto2.group_name }
                  </td>
               </tr>
            </thead>
            </table>
            
            <c:forEach var="dto" items="${list}" varStatus="status">
            <table>
               <tr>
                  <td>
                     이름
                  </td>
                  <td>
                     ${dto.enter_name }
                  </td>
               </tr>
               <tr>
                  <td>
                     생년월일
                  </td>
                  <td>
                     ${dto.enter_birth}
                  </td>
               </tr>
               <tr>
                  <td>
                     데뷔일
                  </td>
                  <td>
                     ${dto.debut_date}
                  </td>
               </tr>
               <tr>
                  <td>
                     예명
                  </td>
                  <td>
                     ${dto.stage_name}
                  </td>
               </tr>
               <tr>
               <td colspan="2">
         	     <button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/entertainer/enter_update.do?enter_id=${dto.enter_id}';">연예인 수정</button>
           		   <button type="button" class="btn" onclick="deleteEnter('${dto.enter_id}');">연예인 삭제</button>
               </td>
               </tr>
         </table>
            </c:forEach>
			
			<c:if test="${sessionScope.member.userId == 'admin'}">
				<table class="submit-table">
					<tr>
						<td width="50%">
							<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/entertainer/group_update.do?act_id=${dto.act_id}';">그룹 수정</button>
							<button type="button" class="btn" onclick="deleteGroup();">그룹 삭제</button>
							<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/entertainer/action_write.do?act_id=${dto.act_id}';">활동 추가</button>
							<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/entertainer/action_update.do?act_id=${dto.act_id}';">활동 수정</button>
							<button type="button" class="btn" onclick="deleteAction();">활동 삭제</button>
					
						</td>
						<td align="right">
							<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/entertainer/actor.do';">리스트</button>
						</td>
					</tr>
				</table>
			</c:if>

		</div>
	</div>
    <footer>
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
	</footer>
    
</body>
</html>