<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
.main {margin: 10px auto;}
.fifle {magin: 10px auto; padding-left:40px;}

.box{font-size: 16px; padding-left: 70px;
	 margin: 50px auto; text-align: center;}


.effect {width: 300px; padding-left: 150px;}
 

 span {font-size: 16px; color: gray;}
 p {line-height: 36px;}

</style>

</head>

<body>

<header>
	<!-- login -->
    <jsp:include page="/WEB-INF/views/layout/header.jsp"/>
</header>
	
<main>
<br><br><br><br><br><br><br><br><br><br><br>

	<div class="main">
		<div class="fifle">
		<h2>
		 대표 인사말 |
		<span>GREETING</span>		
		</h2>
		</div>	
		<br><hr><br><br><br>
		
		<div style="text-align: center;">
		<table>
			<tr >
				<th class="box" style="text-align: left; font-weight: bold;">대표 곽수혁</th>
			</tr>
			<tr >	
				<td class="box" style="text-align: left;">
					<br>AP.4 엔터테인먼트는 항상 진화합니다. <br><br>
					스타쉽 엔터테인먼트는 창의적인 마인드와 끊임없는 열정을 바탕으로 엔터테인먼트 사업의 선진화와 가치 확보를 위해 노력하고 있습니다.<br>
					현실에 안주하지 않고 끊임없이 전진하는 전문가 아티스트가 스타쉽을 더욱 더 빛나게 하는 요소가 된다고 생각합니다.<br><br>
					컨텐츠가 가지는 본질적인 가치와 감동, 아티스트 발굴 및 육성, 매니지먼트 등 다양한 비즈니스 모델로 엔터테인먼트의 미래를 선도해 나가겠습니다.
				</td>
			</tr>
		</table>
		<br><br><br><br><br><br>
		
		<table>
			<tr >
				<th class="box" style="text-align: left; font-weight: bold;">대표 임희정</th>
			</tr>
			<tr >	
				<td class="box" style="text-align: left;">
					<br>저희는 소속 아티스트들의 매니지먼트와 에이전트, 신인 발굴 및 육성이라는 기본적인 엔터테인먼트 비즈니스 모델에 기초해<br>
						각종 스타 콘텐츠 사업을 비롯한 해외 매니지먼트 사업, 드라마-영화 투자 및 공동 제작 등 제반 사업 영역을 확대하며<br>
						프로페셔널한 종합 엔터테인먼트사로 지속적인 발전을 이뤄오고 있습니다.<br><br>
						젊고 진취적인 기업 문화를 바탕으로 '트렌디한 문화 창조'라는 기업 비전을 갖고 있으며, 이와 더불어 아티스트들과의 상호 신뢰가 곧 <br>
						경쟁력 있는 콘텐츠의 창출이라는 신념 아래 소통과 화합을 토대로 한 엔터테인먼트사-아티스트 상생구조를 통해 대중에게 즐거움을 주는 기업,<br>
						한발 앞선 문화 콘텐츠 창출로 차세대 문화 산업의 선도자로 꼽히는 기업이 되기 위해 끊임없는 노력을 기울일 것을 약속하겠습니다.
				</td>
			</tr>
		</table>
		</div>
	</div>
	
	<br><br><br><br><br><br>
</main>
</body>
<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>
</html>