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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/notice_article.css" type="text/css">


<c:if test="${sessionScope.member.userId=='admin'}">
	<script type="text/javascript">
	function deleteNotice() {
	    if(confirm("게시글을 삭제 하시 겠습니까 ? ")) {
	        let query = "num=${dto.num}&${query}";
	        let url = "${pageContext.request.contextPath}/notice/delete.do?" + query;
	    	location.href = url;
	    }
	}
	</script>
</c:if>
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
	
	
			    <div class="body-main mx-auto">
					<table class="table table-border table-article">
						<thead>
							<tr>
								<td colspan="2">
									${dto.subject}
								</td>
							</tr>
						</thead>
						
						<tbody>
							<tr>
								
								<td align="right">
									${dto.reg_date} | 조회 ${dto.hitCount}
								</td>
							</tr>
							
							
							<tr style="border-bottom:none;">
								<td colspan="2" valign="top" height="200">
									${dto.content}
								</td>
								
							</tr>
							
							<tr>
								<td colspan="2">
									<c:forEach var="vo" items="${listFile}" varStatus="status">
										<p class="file-item">
											<i class="fa-regular fa-folder-open"></i>
											<a href="${pageContext.request.contextPath}/notice/download.do?fileNum=${vo.fileNum}">${vo.originalFilename}</a>
										</p>
									</c:forEach>
								</td>
							</tr>
		
							<tr>
								<td colspan="2">
									이전글 :
									<c:if test="${not empty prevDto}">
										<a href="${pageContext.request.contextPath}/notice/article.do?${query}&num=${prevDto.num}">${prevDto.subject}</a>
									</c:if>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									다음글 :
									<c:if test="${not empty nextDto}">
										<a href="${pageContext.request.contextPath}/notice/article.do?${query}&num=${nextDto.num}">${nextDto.subject}</a>
									</c:if>
								</td>
							</tr>
						</tbody>
					</table>
					
					<table class="table table-button">
						<tr>
							<td width="50%">
								<c:choose>
									<c:when test="${sessionScope.member.userId=='admin'}">
										<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/notice/update.do?num=${dto.num}&page=${page}&size=${size}';">수정</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn" disabled>수정</button>
									</c:otherwise>
								</c:choose>
						    	
								<c:choose>
						    		<c:when test="${sessionScope.member.userId=='admin'}">
						    			<button type="button" class="btn" onclick="deleteNotice();">삭제</button>
						    		</c:when>
						    		<c:otherwise>
						    			<button type="button" class="btn" disabled>삭제</button>
						    		</c:otherwise>
						    	</c:choose>
							</td>
							<td align="right">
								<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/notice/list.do?${query}';">리스트</button>
							</td>
						</tr>
					</table>
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