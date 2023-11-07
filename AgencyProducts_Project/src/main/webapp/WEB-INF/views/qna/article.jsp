<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/qna_article.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<title>1:1 문의</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">


<c:if test="${sessionScope.member.userId==dto.user_id || sessionScope.member.userId=='admin'}">
	<script type="text/javascript">
		function deleteOk(mode) {
			let s = mode === "question" ? "질문" : "답변";
			
			if(confirm(s + "을 삭제 하시 겠습니까 ? ")) {
				let query = "question_num=${dto.question_num}&${query}&mode="+mode;
				let url = "${pageContext.request.contextPath}/qna/delete.do?" + query;
				location.href = url;
			}
		}
	</script>
</c:if>


<c:if test="${sessionScope.member.userId=='admin'}">
	<script type="text/javascript">
		$(function(){
			let answer = "${dto.ans_content}";
			
			let aaa = "안녕 "
				 + "<br> dsf";
				
			if(! answer) {
				$(".reply").show();
			}
		});
		
		$(function(){
			$(".btnSendAnswer").click(function(){
				const f = document.answerForm;
				if(! f.ans_content.value.trim()) {
					f.ans_content.focus();
					return false;
				}
				
				f.action = "${pageContext.request.contextPath}/qna/answer.do";
				f.submit();
			});
		});
		
		$(function(){
			$(".btnUpdateAnswer").click(function(){
				let mode = $(this).attr("data-mode");
				if(mode === "update") {
					$(".reply").show();
					$(this).text("답변 수정 취소")
					$(this).attr("data-mode", "cancel");
				} else {
					$(".reply").hide();
					$(this).attr("data-mode", "update");
					$(this).text("답변 수정")
				}
			});
		});
	</script>
</c:if>
</head>
<body>
<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
</header>

<main>
	<div class="wrap">

	<div class="container item_container"  style="margin-top: 120px;">
	    <div class="body-title">
			<h2><i> 1 : 1 문의 </i></h2>
			<span></span>
			<h4>One-on-one inquiry</h4>
		</div>
	    
	    <div class="body-main mx-auto">
			<table class="table table-border table-article">
				<tbody>
					<tr style="border: none;">
						<td colspan="2" style="padding: 10px 0 0 0;">
							<div class="row-flex">
								<div class="left-item left-question">QUESTION</div>
								<div class="right-item right-question">[${dto.category_name}] ${dto.q_subject}</div>
							</div>
						</td>						
					</tr>				
					<tr>
						<td width="50%">
							ID : ${dto.user_id}
						</td>
						<td align="right">
							문의일자 : ${dto.q_reg_date}
						</td>
					</tr>
					
					<tr>
						<td colspan="2" valign="top" height="200">
							${dto.q_content}
						</td>
					</tr>
					
				</tbody>
			</table>
				
			<c:if test="${not empty dto.ans_content}">
				<table class="table table-border table-article">
					<tbody>
						<tr style="border: none;">
							<td colspan="2" style="padding: 0 0 0 0;">
								<div class="row-flex">
									<div class="left-item left-answer">ANSWER</div>
									<div class="right-item right-answer">${dto.q_subject}</div>
								</div>
							</td>							
						</tr>
					
						<tr>
							<td colspan="2">
								답변일자 :  ${dto.ans_date}
							</td>
						</tr>
						
						<tr>
							<td colspan="2" valign="top" height="150">
								${dto.ans_content}
							</td>
						</tr>
					</tbody>
				</table>
			</c:if>
				
			<table class="table table-border table-article">
				<tr>
					<td class="td-text" colspan="2">
						이전글 :
						<c:if test="${not empty prevDto}">
							
									<c:if test="${sessionScope.member.userId==prevDto.user_id || sessionScope.member.userId=='admin'}">
										<a href="${pageContext.request.contextPath}/qna/article.do?question_num=${prevDto.question_num}&${query}">${prevDto.q_subject}</a>
									</c:if>
									<c:if test="${sessionScope.member.userId!=prevDto.user_id && sessionScope.member.userId!='admin'}">
										비밀글 입니다.
									<i class="bi bi-file-lock2"></i>
									</c:if>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						다음글 :
						<c:if test="${not empty nextDto}">
							
									<c:if test="${sessionScope.member.userId==nextDto.user_id || sessionScope.member.userId=='admin'}">
										<a href="${pageContext.request.contextPath}/qna/article.do?question_num=${nextDto.question_num}&${query}">${nextDto.q_subject}</a>
									</c:if>
									<c:if test="${sessionScope.member.userId!=nextDto.user_id && sessionScope.member.userId!='admin'}">
										비밀글 입니다.
									<i class="icofont-lock"></i>
									</c:if>
						</c:if>
					</td>
				</tr>
			</table>
			
			<table class="table-bottom">
				<tr>
					<td width="50%">
						<c:if test="${sessionScope.member.userId==dto.user_id && empty dto.ans_content}">
							<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/qna/update.do?question_num=${dto.question_num}&page=${page}';">질문수정</button>
						</c:if>
						<c:if test="${sessionScope.member.userId==dto.user_id || sessionScope.member.userId=='admin'}">
							<button type="button" class="btn" onclick="deleteOk('question');">질문삭제</button>
						</c:if>
						<c:if test="${not empty dto.ans_content and sessionScope.member.userId== 'admin'}">
							<button type="button" class="btn btnUpdateAnswer" data-mode="update">답변수정</button>
						</c:if>
						<c:if test="${not empty dto.ans_content && (sessionScope.member.userId=='admin')}">
							<button type="button" class="btn" onclick="deleteOk('answer');">답변삭제</button>
						</c:if>
					</td>
					<td align="right">
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/qna/list.do?${query}';">리스트</button>
					</td>
				</tr>
			</table>

			<div class="reply" style="display: none;">
				<form name="answerForm" method="post">
					<div class='form-header'>
						<span class="bold">질문에 대한 답변</span>
					</div>
					
					<table class="table reply-form">
						<tr>
							<td>
								<textarea class='form-control' name="ans_content">${dto.ans_content}</textarea>
							</td>
						</tr>
						<tr>
						   <td align='right'>
						   		<input type="hidden" name="question_num" value="${dto.question_num}">	
						   		<input type="hidden" name="page" value="${page}">					   
						        <button type='button' class='btn btnSendAnswer'>답변 등록</button>
						    </td>
						 </tr>
					</table>
				</form>
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