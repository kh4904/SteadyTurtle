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

<!-- 재고관리 -->

</head>
<body id="page-top">
	<!-- Navigation 맨위 로고-->
	<%@ include file="/WEB-INF/views/Master/Mastermenu.jsp"%>

	<!-- 재고관리 -->
	<section class="page-section portfolio">
		<div class="container">
			<div class="col-lg-12">
				<div class="row">
					<table style="width: 100%;" border="1">
						<tr>
							<td>
								<div style="height: 300px; width: 100%; overflow-y: scroll">
									<c:forEach items="${productList}" var="product">
										<div class="col-md-6 col-lg-11 mb-1 ">

											<table style="width: 100%;">
												<c:if test="${product.pCount <= 50 }">
													<form action="InventoryManage" method="POST">
														<input type="hidden" id="pName" name="pName"
															value="${product.pName}">
														<tr>
															<td style="font-size: 15px; text-align: center;">${product.getpName()}
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															</td>
															<td>
																<div class="list-group" style="position: relative;">
																	<input type="text" class="form-control" id="pCount"
																		name="pCount" maxlength="20" value="${product.pCount}"
																		style="width: 300px; height: 40px; position: relative;">
																</div>
															</td>
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

															<td>
																<div class="list-group" style="text-align: right;">
																	<input type="submit"
																		class="btn btn-primary form-control" value="상품추가하기"
																		style="width: 150px; height: 40px; position: relative;">
																</div>
															</td>
														</tr>
													</form>
												</c:if>
											</table>
										</div>

									</c:forEach>
								</div>
							</td>
						</tr>
					</table>
					<br />
					<!-- 밑줄 -->
					<div class="divider-custom" style="display: block;">
						<hr style="background-color: black;">
					</div>
					<br />
					<table style="width: 100%;">
						<tr>
							<td style="position: relative; left: 50px;">
								<h6>상품명</h6>
							</td>
							<td style="position: relative; left: 30px;">
								<h6>수량</h6>
							</td>
							<td style="position: relative; left: 50px;">
								<h6>상품명</h6>
							</td>
							<td style="position: relative; left: 30px;">
								<h6>수량</h6>
							</td>
							<td style="position: relative; left: 50px;">
								<h6>상품명</h6>
							</td>
							<td style="position: relative; left: 30px;">
								<h6>수량</h6>
							</td>
						</tr>
					</table>
					<br />
					<!-- 밑줄 -->
					<div class="divider-custom" style="display: block;">
						<hr style="background-color: black;">
					</div>
					<%
					int i = 0;
					%>
					<c:forEach items="${productList}" var="product">
						<div class="col-md-6 col-lg-4 mb-5">
							<table style="width: 100%">
							<form action="InventoryManage" method="POST">
														<input type="hidden" id="pName" name="pName"
															value="${product.pName}">
								<tr>
									<td><img class="img-fluid" src="resources/assets/img${product.getpImg() }"
										style="width: 110px; height: 100px;">
										<p style="font-size: 20px;">${product.getpName() }</p></td>
									<td>
										<div class="list-group" style="position: relative;">
											<input type="text" class="form-control" id="pCount"
												name="pCount" maxlength="20" value="${product.pCount}"
												style="width: 80px; height: 40px; position: relative;">
										</div>
										<div class="list-group" style="text-align: right;">
											<input type="submit" class="btn btn-primary form-control"
												value="변경"
												style="width:80px; height: 40px; position: relative;">
										</div>
								     </td>
								     </tr>
							</form>
								     
							</table>
						</div>
					</c:forEach>
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

	<!-- 여기서부터 관리자페이지 부트스트랩 추가 -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="resources/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>

</body>
</html>