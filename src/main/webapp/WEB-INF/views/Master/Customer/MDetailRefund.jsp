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
<!-- 환불요청 상세내용 보기 페이지 -->
<body id="page-top">
	<!-- Navigation 맨위 로고-->
	<%@ include file="/WEB-INF/views/Master/Mastermenu.jsp"%>

	<!-- 환불신청 -->
	<section class="page-section portfolio">
		<div class="container">
			<div class="col-lg-12">
				<table>
					<tr>
						<td>
							<img style="width: 250px; height: 200px;" class="img-fluid" src="resources/assets/img${refund.getrUrl() }" />
						</td>
						<td rowspan="2" style="width: 650px; height: 250px; text-align: center; background-color: #e0e0e0;">
							${refund.getrNote() }
						</td>
						<td>
							<img style="width: 250px; height: 200px;" class="img-fluid" src="resources/assets/img${refund.getrImg() }" />
						</td>
					</tr>
					<tr>
						<td style="text-align: center; font-size: 20px; background-color: white;">
							${refund.getrProduct() }
						</td>
						<td style="text-align: center; font-size: 20px; background-color: white;">
							첨부사진
						</td>
					</tr>
				</table>
				<br><br>
				<table style="width: 700px;">
					<tr>
						<td>
							<h6 style="text-align: left;">이름 :</h6>
						</td>
						<td>
							<h6 style="text-align: left;">${refund.getrName() }</h6>
						</td>
						<td>
							<h6 style="text-align: left;">상품구매일 :</h6>
						</td>
						<td>
							<h6 style="text-align: left;">${refund.getrJumunDate() }</h6>
						</td>
					</tr>
					<tr>
						<td>
							<h6 style="text-align: left;">아이디 :</h6>
						</td>
						<td>
							<h6 style="text-align: left;">${refund.getrId() }</h6>
						</td>
						<td>
							<h6 style="text-align: left;">배송완료일 :</h6>
						</td>
						<td>
							<h6 style="text-align: left;">${refund.getrFinishDate() }</h6>
						</td>
					</tr>
					<tr>
						<td>
							<h6 style="text-align: left;">이메일 :</h6>
						</td>
						<td>
							<h6 style="text-align: left;">${refund.getrEmail() }</h6>
						</td>
						<td>
							<h6 style="text-align: left;">등급 :</h6>
						</td>
						<td>
							<h6 style="text-align: left;">${refund.getrGrade() }</h6>
						</td>
					</tr>
					<tr>
						<td>
							<h6 style="text-align: left;">전화번호 :</h6>
						</td>
						<td>
							<h6 style="text-align: left;">${refund.getrPhone() }</h6>
						</td>
					</tr>
				</table>
				<div>
					<form action="RefundUpdate" method="POST">
						<input type="hidden" id="rNum" name="rNum"
							value="${refund.getrNum()}"> <input type="hidden"
							id="jNum" name="jNum" value="${refund.getrNumber()}"> <a
							href="MRefund" class="btn btn-primary">뒤로가기</a>
						<c:choose>
							<c:when test="${refund.getrCheck() eq '1'}">
								<td></td>
							</c:when>
							<c:when test="${refund.getrCheck() ne '1'}">
								<td><input type="submit" class="btn btn-primary"
									value="환불처리" style="position: relative; left: 750px;"></td>
							</c:when>
						</c:choose>
					</form>
				</div>
			</div>
		</div>
	</section>

	<c:if test="${member.mMaster != 1 }">
		<script>
			alert("관리자권한이 없습니다.")
			location.href = "main";
		</script>
	</c:if>

	<!-- Copyright Section(맨밑 하단)-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small><a href="#" style="text-decoration: none;">회사소개</a>｜ <a
				href="#" style="text-decoration: none;">이용약관</a> ｜ <a href="#"
				style="text-decoration: none;">개인정보처리방침</a><br> (주)꾸준한거북이 ｜대표 :
				김규헌 ｜ 개인정보보호책임자 : 원태연 ｜ 사업자등록번호: 111-22-34567 사업자정보 확인> ｜
				02-159-8948<br> 경기도 의정부시 서부로 545 경민대학교 ｜ FAX. 02-1234-5678 ｜
				Email. steadyturtle@kyungmin.ac.kr </small>
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