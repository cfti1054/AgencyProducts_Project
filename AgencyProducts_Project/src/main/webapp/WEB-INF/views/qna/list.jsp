<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/qna_list.css" type="text/css">

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>
</head>
<body>
<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
</header>

<main>
<div class="wrap">

	<div class="container item_container" style="margin-top: 120px;">
	    <div class="body-title">
			<h2><i> 1 : 1 문의 </i></h2>
			<span></span>
			<h4>One-on-one inquiry</h4>
		</div>
	    
	    <div class="body-main mx-auto">

			<table class="table">
				<tr>
					<td width="100">
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/qna/list.do';" title="새로고침"><i class="fa-solid fa-arrow-rotate-right"></i></button>
					</td>
					<td align="center">
						<form name="searchForm" action="${pageContext.request.contextPath}/qna/list.do" method="post">
							<input type="text" name="kwd" value="${kwd}" class="form-control"
									style="width: 200px;" 
									placeholder="검색 키워드를 입력하세요">
							<button type="button" class="btn" onclick="searchList();">검색</button>
						</form>
					</td>

					<c:if test="${not empty sessionScope.member.userId && sessionScope.member.userId != 'admin' }">
					<td align="right" width="100">
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/qna/write.do';">질문등록</button>
					</td>
					</c:if>
				</tr>
			</table>



			<table class="table">
				<tr>
					<td width="50%">
						${dataCount}개(${page}/${total_page} 페이지)
					</td>
					<td align="right">&nbsp;</td>
				</tr>
			</table>
			
			<table class="table table-border table-list">
				<thead>
					<tr>
						<th class="num">번호</th>
						<th class="category_name">문의유형</th>
						<th class="subject">제목</th>
						<th class="date">질문일자</th>
						<th class="hit">처리결과</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr>
							<td>${dataCount - (page-1) * size - status.index}</td>
							<td>[ ${dto.category_name} ]</td>
							<td class="left">
								<c:if test="${sessionScope.member.userId==dto.user_id || sessionScope.member.userId=='admin'}">
											<a href="${articleUrl}&question_num=${dto.question_num}">${dto.q_subject}</a>
								</c:if>
								<c:if test="${sessionScope.member.userId!=dto.user_id && sessionScope.member.userId!='admin'}">
											비밀글 입니다.
									<i class="fa-solid fa-key"></i>
								</c:if>
															
								
							</td>
							<td>${dto.q_reg_date}</td>
							<td>${not empty dto.ans_content ? "답변 완료" : "답변 대기" }</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
			
			<div class="page-navigation">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>
			
			

	    </div>
	</div>
    
	
</div>
</main>

<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>
</body>
</html>