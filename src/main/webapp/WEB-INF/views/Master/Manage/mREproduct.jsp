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
<!-- 상품관리 수정하기 페이지 -->
<body id="page-top">
	<!-- Navigation 맨위 로고-->
	<%@ include file="/WEB-INF/views/Master/Mastermenu.jsp"%>

	<!-- 상품수정 -->
	<section class="page-section portfolio" style="height: 600px;">
		<div class="container">
			<div class="col-lg-12">
				<form action="productUpdate" , method="post">
				<input type="hidden" id="pUrl" name="pUrl" value="${product.getpUrl()}">
					<div class="row">

						<div class="col-lg-6">


							<table style="width: 100%;">

								<tr>
									<td rowspan="6"><img class="img-fluid"
										src="${product.getpUrl() }"
										style="width: 180px; height: 200px;" /></td>
									<td><b style="margin-left: 9px;">상품명</b></td>
									<td><input type="text" id="pName" name="pName"
										style="margin-left: 6px; text-align: center;"
										value="${product.getpName() }" /></td>

								</tr>
								<tr>
									<td><b style="margin-left: 8px;">판매가</b></td>
									<td><input type="text" id="pPrice" name="pPrice"
										style="margin-left: 6px; text-align: right;"
										value="${product.getpPrice() }" /></td>
									<th><b style="margin-left: 2px;">원</b></th>
								</tr>
								<tr>
									<th><b style="margin-left: 8px;">잔여량</b></th>
									<td><input type="text" id="pCount" name="pCount"
										style="margin-left: 6px; text-align: right;"
										value="${product.getpCount() }" /></td>
									<th><b style="margin-left: 2px;">개</b></th>
								</tr>
								<tr>
									<th><b style="margin-left: 8px;">배송방법</b></th>
									<th>
										<div class="list-group" style="margin-left: 8px;">
											<select class="form-control" name="pShip" id="pShip">
												<option selected hidden>${product.getpShip() }</option>
												<option>무료배송</option>
												<option>일반배송</option>
											</select>
										</div>
									</th>
								</tr>
								<tr>
									<th><b style="margin-left: 8px;">추가혜택</b></th>
									<th><input type="text" name="pMile" id="pMile"
										style="margin-left: 6px; width: 50px; height: 35px; position: relative; left: 120px; text-align: center;"
										value="${product.getpMile() }" /></th>
									<th><b style="margin-left: 2px;">% 적립</b></th>
								</tr>
								<tr>
									<th><b style="margin-left: 8px;">카테고리</b></th>
									<th><div class="list-group" style="margin-left: 8px;">
											<select class="form-control" name="pCate" id="pCate">
												<option selected hidden>${product.getpCate() }</option>
												<option>헬스기구</option>
												<option>요가상품</option>
												<option>운동식품</option>
											</select>
										</div></th>
								</tr>
							</table>
						</div>

						<div class="col-lg-6">
							<div style="width: 100%; height: 200px; overflow: auto">
								<table width="100%" border="1">
									<tr>
										<th style="text-align: center;">최근 구매자</th>
										<th style="text-align: center;">수량</th>
									</tr>
								<c:forEach items="${sellList}" var="sell">
                 					<c:if test="${sell.getsProduct() eq sessionScope.product.getpName()}">
									<tr>
										<td style="text-align: center;">${sell.getsCustomer() }(${sell.getsId() })</td>
										<td style="text-align: center;">${sell.getsCount() }</td>
									</tr>
									</c:if>
							    </c:forEach>
								</table>

							</div>
							<br /> <br /> <br />

							<div>
								<!-- 수정하기 버튼클릭시 -->
								<input type="submit" class="btn btn-info" value="수정하기" style="position:relative; left:400px;">
							</div>

						</div>
					</div>
				</form>
				<!-- 삭제하기 버튼클릭시 -->
				<form action="productDelete" , method="post">
				<input type="hidden" id="pNum" name="pNum" value="${product.getpNum()}">
				     <!-- 뒤로가기 버튼클릭시 -->
					 <a href="ProductManagement" class="btn btn-info" style="position:relative; top:-40px; left:750px;">뒤로가기</a>
					 <input type="submit" class="btn btn-info" value="삭제하기" style="position:relative; top:-40px; left:750px;">
				</form>
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