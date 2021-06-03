<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<!-- 아이디 비밀번호 찾기 -->
<body id="page-top">
	<!-- Navigation 맨위 로고-->
	<%@ include file="/WEB-INF/views/menu.jsp"%>
      
	<!-- 주문 -->
	<!-- 상품랭킹 -->
	<section class="page-section portfolio">
		<div class="container">
			<div class="col-lg-12">
				<table style="width: 100%;">
					<tr>
						<th colspan="6" style="text-align: center;">
							<h4>상세 정보</h4>
						</th>
					</tr>
					<tr>
						<th colspan="5">
							<h6 style="text-align: left;">${jumun.getjJumunDate() }</h6>
						</th>
						<th style="text-align: right;"><h6>주문번호 : ${jumun.getjNum() }</h6>
					</tr>
				</table>
				<div class="divider-custom" style="display: block;">
					<hr style="background-color: black;">
				</div>
				<!-- 상품금액 배송비 사용한마일리지 결제금액 DB들어가야함 -->
						<table style="width: 100%;">
							<tr>
								<th colspan="6" style="text-align: left;">
									<h5>결제 정보</h6>
								</th>
							</tr>
							<tr>
								<th colspan="5">
									<h6 style="text-align: left;">상품금액</h6>
								</th>
								<th style="text-align: right;"><h6><fmt:formatNumber pattern="###,###,###" value="${jumun.getjPrice()}" />원</h6>
							</tr>
							<tr>
								<th colspan="5">
									<h6 style="text-align: left;">배송비</h6>
								</th>
								<th style="text-align: right;"><h6><fmt:formatNumber pattern="###,###,###" value="${jumun.getjShipPrice()}" />원</h6>
							</tr>
							<tr>
								<th colspan="5">
									<h6 style="text-align: left;">사용한 마일리지</h6>
								</th>
								<th style="text-align: right;"><h6 style="color:red;"><fmt:formatNumber pattern="###,###,###" value="${jumun.getjMile()}" />원</h6>
							</tr>
							<tr>
								<th colspan="5">
									<h6 style="text-align: left;">결제금액</h6>
								</th>
								<th style="text-align: right;"><h3><fmt:formatNumber pattern="###,###,###" value="${jumun.getjPrice() + jumun.getjShipPrice() - jumun.getjMile() }" />원</h3>
							</tr>
						</table>
						<div class="divider-custom" style="display: block;">
							<hr style="background-color: black;">
						</div>
						<table>
						<tr style="width: 100%;">
						<tr>
							<th colspan="4">
								<h6 style="text-align: left;">상품 정보</h6>
							</th>
							<th><h6>배송완료일</h6></th>
						</tr>
						<tr>
							<th style="width: 200px;"><img
									class="img-fluid" src="resources/assets/img${jumun.getjUrl()}"
									style="width: 110px; height: 100px;" /></th>
							<th style="width: 300px;">${jumun.getjName() }</th>
							<th style="width: 250px;"><fmt:formatNumber pattern="###,###,###" value="${jumun.getjPrice()}" />원</th>
							<th style="width: 250px;">${jumun.getjCount() } 개</th>
							<th style="width: 150px;"><h style="color:orange;">${jumun.getjFinishDate() }</h></th>
						</tr>
					</table>
					<!-- 밑줄  -->
					<div class="divider-custom" style="display: block;">
						<hr style="background-color: black;">
					</div>


					<table style="width: 100%;">
						<tr>
							<th colspan="6" style="text-align: left;">
								<h5>배송지 정보</h4>
							</th>
						</tr>
						<tr>
							<th colspan="5"><h style="text-align: left;">수령자</h></th>
							<th style="text-align: right;"><h>${member.getmName() }</h>
						</tr>
						<tr>
							<th colspan="5"><h style="text-align: left;">배송지</h></th>
							<th style="text-align: right;"><h>${member.getmAddr() }</h>
						</tr>
						<tr>
							<th colspan="5"><h style="text-align: left;">연락처</h></th>
							<th style="text-align: right;"><h>${member.getmPhone() }</h>
						</tr>
						<tr>
							<th colspan="5"><h style="text-align: left;">배송메세지</h></th>
							<th style="text-align: right;"><h>${jumun.getjMemo() }</h>
						</tr>
					</table>
				</div>
			</div>
			<br />
			<br />
			<div style="text-align: center;">
				<a href="main" class="btn btn-info">홈으로</a>
				<a href="refund" class="btn btn-info">뒤로가기</a>
				<a href="RefundWrite" class="btn btn-info">환불요청</a>
			</div>
	</section>
					

						

	<!-- Copyright Section(맨밑 하단)-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small><a href="#" style="text-decoration: none;">회사소개</a>｜
				<a href="#" style="text-decoration: none;">이용약관</a> ｜ 
				<a href="#" style="text-decoration: none;">개인정보처리방침</a><br>
					(주)꾸준한거북이 ｜대표 : 김규헌 ｜ 개인정보보호책임자 : 원태연 ｜ 사업자등록번호: 111-22-34567
					사업자정보 확인> ｜ 02-159-8948<br> 경기도 의정부시 서부로 545 경민대학교 ｜ FAX.
					02-1234-5678 ｜ Email. steadyturtle@kyungmin.ac.kr
			</small>
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
	<script src="resources/js/scripts.js"></script>
</body>
</html>