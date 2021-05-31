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
<!--  -->

<script src="resources/jquery/jquery-3.3.1.min.js"></script>
<style>
.inputArea { margin:10px 0; }
select { width:100px; }
label { display:inline-block; width:70px; padding:5px; }
label[for='gdsDes'] { display:block; }
input { width:150px; }
textarea#gdsDes { width:400px; height:180px; }
.select_img img { margin:20px 0; }
</style>
</head>
<!-- 상품관리 추가하기 페이지 -->
<body id="page-top">
	<!-- Navigation 맨위 로고-->
	<%@ include file="/WEB-INF/views/Master/Mastermenu.jsp"%>

	<!-- 몸통 -->
	<!-- 상품추가 -->
	<section class="page-section portfolio">
		<div class="container" style="background-color: #bbdefb;">
		<form action="addproduct" method="POST" enctype="multipart/form-data">
			<div class="row">
				
					<div class="inputArea">
						<div class="col-md-5">
							<input type="file" id="pImg" name="file" />
							<div class="select_img"><img src="" /></div>
								<script>
									$("#pImg").change(function(){
										if(this.files && this.files[0]) {
											var reader = new FileReader;
											reader.onload = function(data) {
												$(".select_img img").attr("src", data.target.result).width(500);        
											}
											reader.readAsDataURL(this.files[0]);
										}
									});
								</script>
						</div>
					</div>
					<div class="col-md-6">
						
							<br>
							<table style="width: 100%">
								<tr>
									<td style="text-align: center;">
										<h2>
											<input type="text" id="pName" name="pName" style="margin-left: 40px; text-align: center;" placeholder="상품명" />
										</h2>
									</td>
								</tr>
							</table>
							<hr>
							<table style="width: 100%">
								<tr>
									<td style="text-align: left ;">
										<b style="font-size: 20px;">판매가 : </b>
									</td>
									<td style="text-align: right ;">
										<b style="font-size: 20px;">
										<input type="text" id="pPrice" name="pPrice" style="width: 150px;" /> 원</b>
									</td>
								</tr>
							</table>
							<hr>
							<table style="width: 100%">
								<tr>
									<td style="text-align: left ;">
										<b style="font-size: 20px;">수량 : </b>
									</td>
									<td style="text-align: right ;">
										<b style="font-size: 20px;">
										<input type="text" id="pCount" name="pCount" style="width: 150px;" /> 개</b>
									</td>
								</tr>
							</table>
							<hr>
							<table style="width: 100%">
								<tr>
									<td style="text-align: left ;">
										<b style="font-size: 20px;">배송방법 : </b>
									</td>
									<td style="text-align: right ;">
										<select class="form-control" name="pShip" id="pShip" style="width: 120px; margin-right: -95px">
											<option>무료배송</option>
											<option>일반배송</option>
										</select>
									</td>
								</tr>
							</table>
							<hr>
							<table style="width: 100%">
								<tr>
									<td style="text-align: left ;">
										<b style="font-size: 20px;">추가혜택 : </b>
									</td>
									<td style="text-align: right ;">
										<b style="font-size: 20px; color: blue;">
										<input type="text" id="pMile" name="pMile" style="width: 50px;" /> % 적립</b>
									</td>
								</tr>
							</table>
							<hr>
							<table style="width: 100%">
								<tr>
									<td style="text-align: left ;">
										<b style="font-size: 20px;">카테고리 : </b>
									</td>
									<td style="text-align: right ;">
										<b style="font-size: 20px;"> 
										<select class="form-control "name="pCate" id="pCate" style="width: 120px; margin-right: -95px ">
											<option>헬스기구</option>
											<option>요가상품</option>
											<option>운동식품</option>
										</select>
										</b>
									</td>
								</tr>
							</table>
							<hr>
							<!-- 뒤로가기 버튼클릭시 -->
							<p style="text-align: right;">
								<a href="ProductManagement" class="btn btn-info">뒤로가기</a>
								<!-- 추가하기 버튼클릭시 -->
								<input type="submit" class="btn btn-info" value="추가하기">
							</p>
					</div>
				
			</div>
			</form>
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