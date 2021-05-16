<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>꾸준한거북이 - 헬스기구쇼핑몰</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="resources/assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />

<!-- 슬라이드 효과 css -->
<style type="text/css">
/* 캐러셀 영역 설정 */
#recipeCarousel {
	margin: 10px;
	padding: 10px;
}
/* 이미지 캐러셀 크기 설정 */
.img-fluid {
	max-height: 1800px;
	max-width: 1800px;
}
/* 캐러셀 이미지 내부 캡션 영역 */
.innerCarouselCaption {
	float: left;
	background-color: rgba(0, 0, 0, 0.8);
}

.item_section {
	float: left;
	position: relative;
	width: 100px;
	height: 310px;
	margin-left: 27px;
	background: #fff;
	-webkit-box-shadow: 3px 4px 5px 0 rgba(2, 2, 2, .2);
	box-shadow: 3px 4px 5px 0 rgba(2, 2, 2, .2);
	text-align: center;
}
</style>
</head>
<!-- 메인페이지 -->
<body id="page-top">
	<!-- Navigation 맨위 로고-->
	<%@ include file="/WEB-INF/views/menu.jsp" %>

	<!-- 슬라이드 이미지  -->
	<header class="bg-white text-white text-center" style="height: 500px;">
		<div class="container-fluid text-center my-3"
			style="position: relative; height: 600px;">
			<div id="recipeCarousel" class="carousel slide w-100"
				data-ride="carousel">
				<div class="carousel-inner" role="listbox">

					<div class="carousel-item row no-gutters active">
						<div class="col-6 float-left">
							<img class="img-fluid" src="resources/assets/img/f1.png"
								style="width: 2000px; height: 500px;">
						</div>
					</div>
					<div class="carousel-item row no-gutters">
						<div class="col-6 float-left">
							<img class="img-fluid" src="resources/assets/img/h1.png"
								style="width: 2000px; height: 500px;">
						</div>
					</div>
					<div class="carousel-item row no-gutters">
						<div class="col-6 float-left">
							<img class="img-fluid" src="resources/assets/img/y1.png"
								style="width: 2000px; height: 500px;">
						</div>
					</div>
				</div>
				<a class="carousel-control-prev" href="#recipeCarousel"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#recipeCarousel"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</header>

	<!-- 추천상품-->
	<section class="page-section portfolio" id="portfolio">
		<div class="container">
			<!-- 이번달 추천상품 문구 및 밑줄표시-->
			<h2 class="page-section-heading text-uppercase text-secondary mb-0">이번달
				추천상품</h2>
			<!-- Icon Divider-->
			<div class="divider-custom" style="display: block;">
				<hr style="background-color: black;">
			</div>

			<!-- Portfolio Grid Items-->
			<div class="row justify-content-center">
				<%
					int i = 0;
				%>
				<c:forEach items="${productList}" var="product">
					<%
						if (i < 6) {
					%>
					<div class="col-md-6 col-lg-4 mb-5">
						<a href="#"> <img class="img-fluid"
							src="${product.getpUrl() }" style="width: 270px; height: 200px;" />
						</a> <br> <br>
						<h4>상품명 : ${product.getpName() }</h4>
						<h5>가격 : ${product.getpPrice() } 원</h5>
					</div>
					<%
						}
					i++;
					%>
				</c:forEach>
			</div>
		</div>
	</section>

	<%@ include file="/WEB-INF/views/footer.jsp" %>

	<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes)-->
	<div class="scroll-to-top d-lg-none position-fixed">
		<a class="js-scroll-trigger d-block text-center text-white rounded"
			href="#page-top"><i class="fa fa-chevron-up"></i></a>
	</div>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Third party plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<!-- Contact form JS-->
	<script src="resources/assets/mail/jqBootstrapValidation.js"></script>
	<script src="resources/assets/mail/contact_me.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
