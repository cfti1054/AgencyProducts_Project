<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>notice</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/notice.css" type="text/css">

<script type="text/javascript">
function changeList() {
    const f = document.listForm;
    f.page.value="1";
    f.action="${pageContext.request.contextPath}/notice/list.do";
    f.submit();
}

function searchList() {
	const f = document.searchForm;
	f.submit();
}

$(document).ready(function(){
    $("#chkAll").click(function(){
        $('input:checkbox[name=nums]').not(this).prop('checked', this.checked);
    });

    $("#btnDeleteList").click(function(){
        let cnt = $("input[name=nums]:checked").length;
        if(cnt === 0) {
            alert("삭제할 게시물을 먼저 선택하세요.");
            return false;
        }

        if(confirm("선택한 게시물을 삭제 하시겠습니까 ?")) {
            const f = document.listForm;
            f.action="${pageContext.request.contextPath}/notice/deleteList.do";
            f.submit();
        }
    });
});
</script>


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
			
			
				<div class="container body-container">
	    
	    
			    <div class="content">
			    
				    <table class="table">
							<tr>
								<td width="100">
									<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/notice/list.do';" title="새로고침"><i class="fa-solid fa-arrow-rotate-right"></i></button>
								</td>
								<td align="center">
									<form name="searchForm" action="${pageContext.request.contextPath}/notice/list.do" method="post">
										<select name="schType" class="form-select">
											<option value="all"      ${schType=="all"?"selected":"" }>제목+내용</option>
											
											<option value="reg_date"  ${schType=="reg_date"?"selected":"" }>등록일</option>
											<option value="subject"  ${schType=="subject"?"selected":"" }>제목</option>
											<option value="content"  ${schType=="content"?"selected":"" }>내용</option>
										</select>
										<input type="text" name="kwd" value="${kwd}" class="form-control">
										<input type="hidden" name="size" value="${size}">
										<button type="button" class="btn" onclick="searchList();">검색</button>
									</form>
								</td>
								<td align="right" width="100">
									<c:if test="${sessionScope.member.userId=='admin'}">
										<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/notice/write.do?size=${size}';">글올리기</button>
									</c:if>
								</td>
							</tr>
						</table>
						
						
				        <form name="listForm" method="post">
							<table class="table">
								<tr>
									<td width="50%">
										<c:if test="${sessionScope.member.userId=='admin'}">
											<span class="item-delete" id="btnDeleteList" title="삭제"><i class="fa-regular fa-trash-can"></i></span>
										</c:if>
										
									</td>
									
								</tr>
							</table>
							
							<table class="table table-border table-list">
								<thead>
									<tr>
										<c:if test="${sessionScope.member.userId=='admin'}">
											<th class="chk">
												<input type="checkbox" name="chkAll" id="chkAll">        
											</th>
										</c:if>
										<th class="num">번호</th>
										<th class="subject">제목</th>
										
										<th class="date">작성일</th>
										<th class="hit">조회수</th>
									</tr>
								</thead>
								
								<tbody>
									
									
									<c:forEach var="dto" items="${list}" varStatus="status">
										<tr>
											<c:if test="${sessionScope.member.userId=='admin'}">
												<td>
													<input type="checkbox" name="nums" value="${dto.num}">
												</td>
											</c:if>
											<td>${dataCount - (page-1) * size - status.index}</td>
											<td class="left">
												<a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
												<c:if test="${dto.gap<1}"></c:if>
											</td>
											
											<td>${dto.reg_date}</td>
											<td>${dto.hitCount}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form>
						
						<div class="page-navigation">
							${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
						</div>
						
				    </div>
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