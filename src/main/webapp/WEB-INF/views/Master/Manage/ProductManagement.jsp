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
<!-- 상품관리 상품보기 페이지 -->
<body id="page-top">
	<!-- Navigation 맨위 로고-->
	<%@ include file="/WEB-INF/views/Master/Mastermenu.jsp"%>

	<!-- 상품목록 -->
	<section class="page-section portfolio">
		<div class="container">
			<div class="col-lg-12">
				<div class="row">
					<c:forEach items="${productList}" var="productList">
						<div class="col-lg-6 mb-5">
							<form action="mREproduct" method="post">
								<input type="hidden" id="pName" name="pName"
									value="${productList.getpName() }">
								<table style="width: 100%;">
									<tr>
										<td rowspan="6" style="width: 200px;"><img
											class="img-fluid"
											src="resources/assets/img${productList.getpUrl() }"
											style="width: 150px; height: 150px;" /></td>
										<th><a style="text-align: center;">상품명:
												${productList.getpName() }</th>
										<td rowspan="6"><input type="submit" value="수정하기"
											class="btn btn-primary"
											style="width: 100px; height: 40px; background-color: #ffdb4d; color: #004d99;">
										</td>
									</tr>
									<tr>
										<th><a style="text-align: center;">가격:<fmt:formatNumber
													pattern="###,###,###" value="${productList.getpPrice()}" />원
										</a></th>
									</tr>
									<tr>
										<th><a style="text-align: center;">${productList.getpShip() }</a></th>
									<tr>
										<th><a style="text-align: center;">${productList.getpMile() }%적립</a></th>
									</tr>
									<tr>
										<th><a style="text-align: center;">${productList.getpCate() }</a></th>
									</tr>
									<tr>
										<th><a style="text-align: center;">판매량 :
												${productList.getpCountSell() } 개</a></th>
									</tr>
								</table>
							</form>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<!-- 게시글 페이징 처리(기준 10개) -->
		<nav aria-label="Page navigation">
			<ul class="pagination justify-content-center">

				<!-- 첫 페이지면 Disabled 아니라면 Enabled -->
				<c:choose>
					<c:when test="${Paging.pageNo eq Paging.firstPageNo }">
						<li class="page-item disabled"><a class="page-link"
							href="ProductManagement?page=${Paging.prevPageNo}">Previus</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="ProductManagement?page=${Paging.prevPageNo}">Previus</a></li>
					</c:otherwise>
				</c:choose>
				<!-- 페이지 갯수만큼 버튼 생성 -->
				<c:forEach var="i" begin="${Paging.startPageNo }"
					end="${Paging.endPageNo }" step="1">
					<c:choose>
						<c:when test="${i eq Paging.pageNo }">
							<li class="page-item disabled"><a class="page-link"
								href="ProductManagement?page=${i}"><c:out value="${i}" /></a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="ProductManagement?page=${i}"><c:out value="${i}" /></a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<!-- 마지막 페이지면 Disabled 아니라면 Enabled -->
				<c:choose>
					<c:when test="${Paging.pageNo eq Paging.finalPageNo }">
						<li class="page-item disabled"><a class="page-link"
							href="ProductManagement?page=${Paging.nextPageNo}">Next</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="ProductManagement?page=${Paging.nextPageNo}">Next</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>


		<!-- 밑줄  -->
		<div class="container">
			<div class="divider-custom" style="display: block;">
				<hr style="background-color: black;">
			</div>
		</div>
		<a href="Addproduct" class="btn btn-primary"
			style="position: relative; left: 1400px; width: 100px; height: 40px; background-color: #ffdb4d; color: #004d99;">추가하기</a>
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

	<c:if test="${member.mMaster != 1 }">
		<script>
			alert("관리자권한이 없습니다.")
			location.href = "main";
		</script>
	</c:if>


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
	<script src="resources/assets/demo/chart-area-demo.js"></script>
	<script src="resources/assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
	<script src="resources/assets/demo/datatables-demo.js"></script>
	<script src="resources/assets/demo/chart-bar-demo1.js"></script>
	<script src="resources/assets/demo/chart-bar-demo2.js"></script>
	<script src="resources/assets/demo/chart-bar-demo3.js"></script>

</body>
</html>