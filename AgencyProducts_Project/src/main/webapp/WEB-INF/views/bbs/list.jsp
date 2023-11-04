<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/bbs_list.css" type="text/css">

<title>bbs</title>




<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
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

						<table class="table">
							<tr>
								<td width="100">
									<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/bbs/list.do';" title="새로고침"><i class="fa-solid fa-arrow-rotate-right"></i></button>
								</td>
								<td align="center">
									<form name="searchForm" action="${pageContext.request.contextPath}/bbs/list.do" method="post">
										<select name="schType" class="form-select">
											<option value="all"      ${schType=="all"?"selected":"" }>제목+내용</option>
											<option value="userName" ${schType=="userName"?"selected":"" }>작성자</option>
											<option value="reg_date"  ${schType=="reg_date"?"selected":"" }>등록일</option>
											<option value="subject"  ${schType=="subject"?"selected":"" }>제목</option>
											<option value="content"  ${schType=="content"?"selected":"" }>내용</option>
										</select>
										<input type="text" name="kwd" value="${kwd}" class="form-control">
										<button type="button" class="btn" onclick="searchList();">검색</button>
									</form>
								</td>
								<td align="right" width="100">
									<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/bbs/write.do';">글올리기</button>
								</td>
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
									<th class="subject">제목</th>
									<th class="name">작성자</th>
									<th class="date">작성일</th>
									<th class="hit">조회수</th>
								</tr>
							</thead>
							
							<tbody>
								<c:forEach var="dto" items="${list}" varStatus="status">
									<tr>
										<td>${dataCount - (page-1) * size - status.index}</td>
										<td class="left">
											<a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
											<c:if test="${dto.replyCount!=0}">(${dto.replyCount})</c:if>
										</td>
										<td>${dto.userName}</td>
										<td>${dto.reg_date}</td>
										<td>${dto.hitCount}</td>
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

	</div>
</div>
</main>

<footer>
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</footer>


</body>
</html>