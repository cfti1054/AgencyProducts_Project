<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>entertainer</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/actor_article.css" type="text/css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<script type="text/javascript">
function deleteGroup(){
	if(confirm('그룹을 삭제하시겠습니까 ? ')) {
		location.href = '${pageContext.request.contextPath}/entertainer/group_delete.do?act_id=${dto.act_id}';
	}
}

function deleteAction(ac_list_num){
	if(confirm('활동을 삭제하시겠습니까 ? ')) {
		location.href = '${pageContext.request.contextPath}/entertainer/action_delete.do?ac_list_num=' + ac_list_num + "&act_id=${dto.act_id}" ;
	}
}

function deleteEnter(enter_id){
	if(confirm('연예인을 삭제하시겠습니까 ? ')) {
		location.href = '${pageContext.request.contextPath}/entertainer/enter_delete.do?enter_id=' + enter_id + "&act_id=${dto.act_id}" ;
	}
}
</script>
</head>

<body>
	
	<header>
    	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	</header>
	
	<div class="item_container" style="margin-top: 120px;">
	
	
	<div class="enter-container">
	
	
	    <div class="form-title">
			<h2>${dto.group_name}</h2>
	    </div>
	    
	    <div class = "info">
		    <div class="article_img">
		    	<img style="border-radius: 20px;" src="<c:url value='/resource/uploads/photo/${dto.img_name}'/>">
		    	<div class="perform">
           <c:forEach var="dto" items="${list2}" varStatus="status">
        	<table>
        	<tr>
        		<td>${dto.start_date} - ${dto.end_date}</td>
        		<td>${dto.action_content}</td>
        		<c:if test="${sessionScope.member.userId == 'admin'}">
         	<td>
         		<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/entertainer/action_update.do?ac_list_num=${dto.ac_list_num}';">수정</button>
         		<button type="button" class="btn" onclick="deleteAction('${dto.ac_list_num}');">삭제</button>
         	</td>
         	</c:if>
        	</tr>
        	</table>
		</c:forEach>
		<c:if test="${sessionScope.member.userId == 'admin'}">
			<table class="submit-table">
				<tr>
					<td width="50%">
		         		<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/entertainer/enter_write.do?act_id=${dto.act_id }';">연예인 등록</button>
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/entertainer/group_update.do?act_id=${dto.act_id}';">그룹 수정</button>
						<button type="button" class="btn" onclick="deleteGroup();">그룹 삭제</button>
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/entertainer/action_write.do?act_id=${dto.act_id}';">활동 등록</button>
					</td>
					<td align="right">
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/entertainer/artist.do';">리스트</button>
					</td>
				</tr>
			</table>
		</c:if>
          </div>
			</div>
			
		    <div class="article_content">
				
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
	               <c:if test="${sessionScope.member.userId == 'admin'}">
	               <tr>
	               <td colspan="2">
	         	     <button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/entertainer/enter_update.do?enter_id=${dto.enter_id}';">연예인 수정</button>
	           		   <button type="button" class="btn" onclick="deleteEnter('${dto.enter_id}');">연예인 삭제</button>
	               </td>
	               </tr>
	               </c:if>
	         </table>
	            </c:forEach>
	
			</div>
	    </div>
          
	</div>
</div>
    <footer>
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
	</footer>
    
</body>
</html>