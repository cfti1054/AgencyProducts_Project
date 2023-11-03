<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Faq</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/faq_list.css" type="text/css">

</head>
<body>
	
	<header>
    	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	</header>
	
	<main>
    <div class="wrap">
      <div class="container">
          <div id="aside" class="aside">
              <h2>ARTIST</h2>
              <ul class="list">
                  <li class="title">
                      <a href="${pageContext.request.contextPath}/faq/list.do">FAQ</a>
                  </li>	        
                  <li class="title">
                      <a href="${pageContext.request.contextPath}/qna/list.do">1 : 1 문의</a>
                  </li>
              </ul>
          </div>
          <div id="artist" class="artist">
            <div class="about">
              <h2>FAQ</h2>
              <span></span>
              <h4> AP.4</h4>
            </div>
            <div class="acc_wrap">
            <c:forEach var="dto" items="${ list }">
            	<button type="button" class="collapsible" onclick="collapse(this);">Q.&nbsp;${ dto.faq_subject }</button>
             	<div class="content">
                 	<p>${ dto.faq_content }</p>
                 	<c:if test="${sessionScope.member.userId=='admin'}">
	                 	<div class="btn_wrap">
		            		<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/faq/write.do?faq_num=${dto.faq_num}';">수정</button>
		            		<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/faq/delete.do?faq_num=${dto.faq_num}';">삭제</button>
		                </div>
		                <input type="hidden" name="faq_num" value="${dto.faq_num}">
                 	</c:if>
             	</div>
            </c:forEach>
              
              <button type="button" class="collapsible" onclick="collapse(this);">Q.&nbsp;제목 2</button>
              <div class="content">
                  <p>내용 2 입니다.</p>
                  <div class="btn_wrap">
                    <button>수정</button>
                    <button>삭제</button>
                  </div>
              </div>
              <button type="button" class="collapsible" onclick="collapse(this);">Q.&nbsp;제목 3</button>
              <div class="content">
                  <p>내용 3 입니다.</p>
                  <div class="btn_wrap">
                    <button>수정</button>
                    <button>삭제</button>
                  </div>
              </div>
            </div>
          </div>
      </div>
  </div>
  </main>
  
  <footer>
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
	</footer>
  
  <script type="text/javascript">
  function collapse(element) {
      var before = document.getElementsByClassName("active")[0]               // 기존에 활성화된 버튼
      if (before && document.getElementsByClassName("active")[0] != element) {  // 자신 이외에 이미 활성화된 버튼이 있으면
          before.nextElementSibling.style.maxHeight = null;   // 기존에 펼쳐진 내용 접고
          before.classList.remove("active");                  // 버튼 비활성화
      }
      element.classList.toggle("active");         // 활성화 여부 toggle

      var content = element.nextElementSibling;
      if (content.style.maxHeight != 0) {         // 버튼 다음 요소가 펼쳐져 있으면
          content.style.maxHeight = null;         // 접기
      } else {
          content.style.maxHeight = content.scrollHeight + "px";  // 접혀있는 경우 펼치기
      }
  }
  </script>
  
</body>
</html>