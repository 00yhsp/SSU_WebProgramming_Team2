<%@ page language = "java" contentType="text/html; charset=utf-8"%>

<%@ page import="java.util.Date" %>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
	
	
	<title>Welcome</title>

<style>
    section {
        padding: 50px 0;
    }

    .bg-light {
        background-color: #f8f9fa; /* 연한 회색 */
    }

    .bg-info {
        background-color: #d1ecf1; /* 연한 청록색 */
    }

    .bg-warning {
        background-color: #fff3cd; /* 연한 노란색 */
    }

    .bg-success {
        background-color: #d4edda; /* 연한 녹색 */
    }

    .text-end {
        text-align: right;
    }
    
    .hidden {
    opacity: 0;
    transform: translateY(20px); /* 약간 아래에서부터 올라오는 효과 */
    transition: opacity 1s ease, transform 1s ease;
}

	.visible {
	    opacity: 1;
	    transform: translateY(0);
	}
</style>



</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="container-fluid">
	    <section id="intro" class="row justify-content-center text-center bg-light bg-opacity-75">
	        <div class="col-lg-6 py-5">
	            <img src="./resources/images/logo.png" class="img-fluid mb-3 w-25" alt="중고거래 사이트 소개 이미지">
	            <h1 class="fw-bold">중고거래 사이트, 당근 나라!</h1>
	            <p>지역 기반의 안전한 중고거래를 경험하세요.</p>
	        </div>
	    </section>
	
	       <section id="feature1" class="row justify-content-center bg-dark bg-opacity-75 text-white hidden">
	        <div class="col-lg-6 py-5 d-flex flex-row-reverse">
	            <div class="w-50 mx-5">
	                <img src="./resources/images/commerce.png" class="img-fluid mb-3 w-75" alt="간편한 거래 이미지">
	            </div>
	            <div class="w-50 px-3"> <!-- 여기에 패딩 추가 -->
	                <h2 class="fw-bold">간편한 거래</h2>
	                <p>몇 번의 클릭으로 물품을 등록하고, 손쉽게 거래하세요.</p>
	            </div>
	        </div>
	    </section>
	
	    <section id="feature2" class="row justify-content-center hidden">
	        <div class="col-lg-6 py-5 d-flex">
	            <div class="w-50 mx-3">
	                <img src="./resources/images/map.png" class="img-fluid mb-3 w-75" alt="지역 기반 검색 이미지">
	            </div>
	            <div class="w-50 px-3 text-end"> <!-- 여기에 패딩 추가 -->
	                <h2 class="fw-bold">지역 기반 검색</h2>
	                <p>내 주변의 다양한 상품을 발견하고, 빠르게 거래하세요.</p>
	            </div>
	        </div>
	    </section>
	
	    <section id="feature3" class="row justify-content-center bg-secondary-subtle bg-opacity-75 hidden">
	        <div class="col-lg-6 py-5 d-flex flex-row-reverse">
	            <div class="w-50 mx-3">
	                <img src="./resources/images/sec.png" class="img-fluid mb-3 w-75" alt="안전한 거래 이미지">
	            </div>
	            <div class="w-50 px-3"> <!-- 여기에 패딩 추가 -->
	                <h2 class="fw-bold">안전한 거래</h2>
	                <p>검증된 사용자들과 안전하게 거래할 수 있는 환경을 제공합니다.</p>
	            </div>
	        </div>
	    </section>
	    <section id="contact" class="row justify-content-center bg-light bg-opacity-75 hidden">
	        <div class="col-lg-6 py-5 text-center">
	            <a href="products.jsp"><button type="button" class="btn btn-primary">거래 하러 가기</button>
	</a>
	            <!-- 폼 내용 -->
	        </div>
	    </section>
	</div>
			<hr class="mt-0">
			<%@ include file = "footer.jsp" %>	
		<script>
			window.addEventListener('scroll', revealElements);
			
			function revealElements() {
			    var elements = document.querySelectorAll('.hidden');
			
			    for (var i = 0; i < elements.length; i++) {
			        var windowHeight = window.innerHeight;
			        var elementTop = elements[i].getBoundingClientRect().top;
			        var elementVisible = 150;
			
			        if (elementTop < windowHeight - elementVisible) {
			            elements[i].classList.add('visible');
			        }
			    }
			}
			

		</script>
		
		<script src="./resources/js/bootstrap.bundle.min.js"></script>
		<jsp:include page="./color_mode.jsp"/>
		
</body>
</html>