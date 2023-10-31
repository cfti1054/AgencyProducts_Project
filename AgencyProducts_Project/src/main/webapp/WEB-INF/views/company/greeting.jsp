<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>greeting</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/greeting.css" type="text/css">

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
                        <a href="${pageContext.request.contextPath}/company/notice.do">공고</a>
                    </li>	        
                </ul>
            </div>
            <div id="artist" class="artist">
                <div class="about">
                    <h2>대표인사말</h2>
                    <span></span>
                    <h4>GREETING</h4>
                </div>
                <div class="introduce1">
                    <h3>곽수혁</h3>
                    <h5>대표이사</h5>
                </div>
                <div class="greeting1">
                    <h3>AP.4 엔터테인먼트는 항상 진화합니다.</h3>
                    <p>
                    AP.4 엔터테인먼트는 창의적인 마인드와 끊임없는 열정을 바탕으로<br>
                    엔터테인먼트 사업의 선진화와 가치 확보를 위해 노력하고 있습니다.<br>
                    현실에 안주하지 않고 끊임없이 전진하는 전문가 아티스트가 스타쉽을<br>
                    더욱 더 빛나게 하는 요소가 된다고 생각합니다.<br>
                    컨텐츠가 가지는 본질적인 가치와 감동,<br>
                    아티스트 발굴 및 육성 그에 맞는 아이템 상품, 매니지먼트 등<br>
                    다양한 비즈니스 모델로 엔터테인먼트의 미래를 선도해 나가겠습니다.
                    </p>
                </div>
                <div class="introduce2">
                    <h3>임희정</h3>
                    <h5>대표이사</h5>
                </div>
                <div class="greeting2">
                    <h3>AP.4 엔터테인먼트 항상 도전합니다.</h3>
                    <div class="wrap">
                    <p>
                        저희는 소속 아티스트들의 매니지먼트와 에이전트,<br>
                        기본적인 엔터테인먼트 비즈니스 모델에 기초해<br>
                        각종 스타 콘텐츠 사업을 비롯한 해외 매니지먼트 사업,<br>
                        드라마-영화 투자 및 공동 제작 등 제반 사업 영역을 확대하며<br>
                        프로페셔널한 종합 엔터테인먼트사로 지속적인 발전을 이뤄오고 있습니다.<br>
                        젊고 진취적인 기업 문화를 바탕으로 '트렌디한 문화 창조'라는 기업 비전을 갖고 있으며,<br>
                        이와 더불어 아티스트들과의 상호 신뢰가 곧 경쟁력 있는 콘텐츠의 창출이라는 신념 아래<br>
                        소통과 화합을 토대로 한 엔터테인먼트사-아티스트 상생구조를 통해 대중에게 즐거움을 주는 기업,<br>
                        한발 앞선 문화 콘텐츠 창출로 차세대 문화 산업의 선도자로 꼽히는<br>
                        기업이 되기 위해 끊임없는 노력을 기울일 것을 약속하겠습니다.
                    </p>
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