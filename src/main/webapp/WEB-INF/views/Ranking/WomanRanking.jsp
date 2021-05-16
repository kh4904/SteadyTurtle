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
</head>
<!-- 여성회원 순위페이지 -->
<body id="page-top">
	<%@ include file="/WEB-INF/views/menu.jsp" %>

	<!-- 상품랭킹 헤드부분 -->
	<header class="bg-white text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<!-- 상품랭킹 라벨 -->
			<div class="divider-custom divider-light"
				style="width: 1092px; height: 66px;">
				<br> <br> <br> <br>
				<h1 style="color: black;">상품랭킹</h1>
			</div>
			<!-- 판매랭킹,남여랭킹 선택부분 -->
			<div class="btn-group" role="group" aria-label="...">
				<a type="button" class="btn btn-default" href="HealthRanking"
					style="text-decoration: none; color: black; background-color: #b9f6ca;">판매랭킹</a>
				<a type="button" class="btn btn-default" href="ManRanking"
					style="background-color: #00e676; text-decoration: none; color: black;">남여랭킹</a>
			</div>
			<!-- 남성회원 여성회원 이미지 및 클릭시 이동  -->
			<div class="btn-group" role="group" aria-label="...">
				<a href="ManRanking"><img
					src="resources/assets/RankingImg/man.png"
					style="width: 70px; height: 50px;"></a> <a href="WomanRanking"><img
					src="resources/assets/RankingImg/woman.png"
					style="width: 70px; height: 50px;"></a>
			</div>
			<p style="color: black; font-size: 12px;">남성회원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;여성회원</p>
		</div>
	</header>
	<!-- 여성회원순위 라벨 -->
	<br>
	<br>
	<h1 style="text-align: center">여성회원순위</h1>

	<!-- 상품랭킹 -->
	<section class="page-section portfolio">
		<div class="container">
			<!-- 고정바(순위,상품명,가격,마일리지,배송) 라벨-->
			<table style="width: 100%">
				<tr>
					<th style="width: 200px; height: 43px;"><h3
							style="text-align: center">순위</h3></th>
					<th style="width: 170px; height: 43px;"></th>
					<th style="width: 200px; height: 43px;"><h3
							style="text-align: center">상품명</h3></th>
					<th style="width: 200px; height: 43px;"><h3
							style="text-align: center">가격</h3></th>
					<th style="width: 200px; height: 43px;"><h3
							style="text-align: center">마일리지</h3></th>
					<th style="width: 250px; height: 43px;"><h3
							style="text-align: center">배송</h3></th>
				</tr>
			</table>
			<!-- 밑줄 -->
			<div class="divider-custom" style="display: block;">
				<hr style="background-color: black;">
			</div>


			<!-- 상품 랭킹 1~5위 -->
			<!-- 상품랭킹1위-->
			<table style="width: 100%">
				<tr style="height: 100px;">
					<th style="width: 150px; height: 43px;"><img class="img-fluid"
						src="resources/assets/RankingImg/first.png"
						style="width: 70px; height: 50px; text-align: center" alt="" /></th>
					<th style="width: 150px; height: 43px;"><a href="#"><img
							class="img-fluid" src="resources/assets/FoodImg/f2.jpg"
							style="width: 120px; height: 100px; text-align: center" alt="" /></a>
					<th style="width: 200px; height: 43px;"><h3
							style="text-align: center">상품명</h3>
					<th style="width: 150px; height: 43px;"><h3
							style="text-align: center">가격</h3>
					<th style="width: 200px; height: 43px;"><h3
							style="text-align: center">1%</h3>
					<th style="width: 200px; height: 43px;"><h3
							style="text-align: center">무료배송</h3></th>
				</tr>
			</table>
			<!-- 밑줄  -->
			<div class="divider-custom" style="display: block;">
				<hr style="background-color: black;">
			</div>

			<!-- 상품랭킹2위 -->
			<table style="width: 100%">
				<tr style="height: 100px;">
					<th style="width: 150px; height: 43px;"><img class="img-fluid"
						src="resources/assets/RankingImg/second.png"
						style="width: 70px; height: 50px; text-align: center" alt="" /></th>
					<th style="width: 150px; height: 43px;"><a href="#"><img
							class="img-fluid" src="resources/assets/YogaImg/y1.jpg"
							style="width: 120px; height: 100px; text-align: center" alt="" /></a>
					<th style="width: 200px; height: 43px;"><h3
							style="text-align: center">상품명</h3>
					<th style="width: 150px; height: 43px;"><h3
							style="text-align: center">가격</h3>
					<th style="width: 200px; height: 43px;"><h3
							style="text-align: center">1%</h3>
					<th style="width: 200px; height: 43px;"><h3
							style="text-align: center">무료배송</h3></th>
				</tr>
			</table>
			<!-- 밑줄 -->
			<div class="divider-custom" style="display: block;">
				<hr style="background-color: black;">
			</div>

			<!-- 상품랭킹3위 -->
			<table style="width: 100%">
				<tr style="height: 100px;">
					<th style="width: 150px; height: 43px;"><img class="img-fluid"
						src="resources/assets/RankingImg/third.png"
						style="width: 70px; height: 50px; text-align: center" alt="" /></th>
					<th style="width: 150px; height: 43px;"><a href="#"><img
							class="img-fluid" src="resources/assets/YogaImg/y2.jpg"
							style="width: 120px; height: 100px; text-align: center" alt="" /></a>
					<th style="width: 200px; height: 43px;"><h3
							style="text-align: center">상품명</h3>
					<th style="width: 150px; height: 43px;"><h3
							style="text-align: center">가격</h3>
					<th style="width: 200px; height: 43px;"><h3
							style="text-align: center">1%</h3>
					<th style="width: 200px; height: 43px;"><h3
							style="text-align: center">무료배송</h3></th>
				</tr>
			</table>
			<!-- 밑줄 -->
			<div class="divider-custom" style="display: block;">
				<hr style="background-color: black;">
			</div>

			<!-- 상품랭킹4위 -->
			<table style="width: 100%">
				<tr style="height: 100px;">
					<th style="width: 150px; height: 43px;"><img class="img-fluid"
						src="resources/assets/RankingImg/forth.png"
						style="width: 70px; height: 50px; text-align: center" alt="" /></th>
					<th style="width: 150px; height: 43px;"><a href="#"><img
							class="img-fluid" src="resources/assets/FoodImg/f1.jpg"
							style="width: 120px; height: 100px; text-align: center" alt="" /></a>
					<th style="width: 200px; height: 43px;">
						<h3 style="text-align: center">상품명</h3>
					<th style="width: 150px; height: 43px;">
						<h3 style="text-align: center">가격</h3>
					<th style="width: 200px; height: 43px;">
						<h3 style="text-align: center">1%</h3>
					<th style="width: 200px; height: 43px;">
						<h3 style="text-align: center">무료배송</h3>
					</th>
				</tr>
			</table>
			<!-- 밑줄 -->
			<div class="divider-custom" style="display: block;">
				<hr style="background-color: black;">
			</div>

			<!-- 상품랭킹5위 -->
			<table style="width: 100%">
				<tr style="height: 100px;">
					<th style="width: 150px; height: 43px;"><img class="img-fluid"
						src="resources/assets/RankingImg/fifth.png"
						style="width: 70px; height: 50px; text-align: center" alt="" /></th>
					<th style="width: 150px; height: 43px;"><a href="#"><img
							class="img-fluid" src="resources/assets/FoodImg/f3.jpg"
							style="width: 120px; height: 100px; text-align: center" alt="" /></a>
					<th style="width: 200px; height: 43px;">
						<h3 style="text-align: center">상품명</h3>
					<th style="width: 150px; height: 43px;">
						<h3 style="text-align: center">가격</h3>
					<th style="width: 200px; height: 43px;">
						<h3 style="text-align: center">1%</h3>
					<th style="width: 200px; height: 43px;">
						<h3 style="text-align: center">무료배송</h3>
					</th>
				</tr>
			</table>
			<!-- 밑줄 -->
			<div class="divider-custom" style="display: block;">
				<hr style="background-color: black;">
			</div>
		</div>
	</section>

	<!-- Copyright Section(맨밑 하단)-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small><a href="#" style="text-decoration: none;">회사소개</a>｜ <a
				href="#" style="text-decoration: none;">이용약관</a> ｜ <a href="#"
				style="text-decoration: none;">개인정보처리방침</a><br> (주)꾸준한거북이 ｜대표 :
				김규헌 ｜ 개인정보보호책임자 : 원태연 ｜ 사업자등록번호: 111-22-34567 사업자정보 확인> ｜
				02-159-8948<br> 경기도 의정부시 서부로 545 경민대학교 ｜ FAX. 02-1234-5678 ｜
				Email. steadyturtle@kyungmin.ac.kr</small>
		</div>
	</div>

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
