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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<!-- 장바구니 -->
<body onload="init();">
<script language="JavaScript">
var pPrice;
var pCountsSell;
function init () {
	pPrice = document.form.pPrice.value;
	pCountsSell = document.form.pCountsSell.value;
	document.form.sum.value = pPrice;
	change();
}
function add () {
	hm = document.form.pCountsSell;
	sum = document.form.sum;
	hm.value ++ ;
	sum.value = parseInt(hm.value) * pPrice;
}
function del () {
	hm = document.form.pCountsSell;
	sum = document.form.sum;
		if (hm.value > 1) {
			hm.value -- ;
			sum.value = parseInt(hm.value) * pPrice;
		}
}
function change () {
	hm = document.form.pCountsSell;
	sum = document.form.sum;
		if (hm.value < 0) {
			hm.value = 0;
		}
	sum.value = parseInt(hm.value) * pPrice;
}  
</script>
	<!-- Navigation 맨위 로고-->
	<%@ include file="/WEB-INF/views/menu.jsp" %>

	<!-- 장바구니-->
	<section class="page-section portfolio">
		<div class="container" style="width: 1431px; min-height: 650px; max-height:100%;">
		<div class="checkbox_group">
		<!-- 장바구니 문구 및 밑줄표시-->
			<h2 class="page-section-heading text-uppercase text-secondary mb-0">장바구니</h2>
			<!-- 밑줄 -->
			<div class="divider-custom" style="display: block;">
				<hr style="background-color: black;">
			</div>
			
			<table style="width: 100%">
					<tr>
						<th style="width: 200px; height: 43px; text-align: center"><h4>사진</h4></th>
						<th style="width: 300px; height: 43px; text-align: center"><h4>상품명</h4></th>
						<th style="width: 250px; height: 43px; text-align: center"><h4>수량</h4></th>
						<th style="width: 250px; height: 43px; text-align: center"><h4>상품 개별 가격</h4></th>
						<th style="width: 250px; height: 43px; text-align: center"><h4>상품 총 가격</h4></th>
						<th style="width: 150px; height: 43px; text-align: center">
							<h5>전체선택<input type="checkbox" id="check_all" style="width: 25px; height: 25px;"></h5>
						</th></tr>
				</table>
			<div class="divider-custom" style="display: block;">
				<hr style="background-color: black;">
			</div>
			<c:if test="${member.mId != null }">

			<!-- 장바구니에 담긴 상품 -->
			<div class="row">
			
			<c:forEach items="${basketList}" var="basket">
                  <c:if test="${basket.getmId() eq sessionScope.member.getmId()}">
                  <form name="form" action="Cash" method="post">
					<table style="width: 100%">
					<tr style="height: 100px;">
						<td style="width: 200px; height: 43px; text-align: center">
							<a href="#">
								<img class="img-fluid" src="${basket.getpUrl()} " style="width: 120px; height: 100px;" alt="" />
							</a>
						</td>
						<td style="width: 300px; height: 43px; text-align: center">
							<h3>${basket.getpName() }</h3>
							<input type="hidden" name="pName" value="${basket.getpName() }" id="pName">
						</td>
						<td style="width: 250px; height: 43px; text-align: center">
							<input type="text" onchange="change();" id="pCountsSell" name="pCountsSell" size="3" style="width: 60px; height: 30px;" value="1"> 개</b>
							<input type="button" value=" + " onclick="add();">
							<input type="button" value=" - " onclick="del();">
							<br>
							<br>
						</td>
						<td style="width: 250px; height: 43px; text-align: center">
							<h3>${basket.getpPrice() }원</h3>
							<input type="hidden" name="pPrice" value="${basket.getpPrice() }" id="pPrice">
						</td>
						<td style="width: 250px; height: 43px; text-align: center">
							<h3><input type="text" name="sum" size="11"> 원</h3>
							<input type="hidden" value="3000" id="pShip" name="pShip">
						</td>
						<td style="width: 150px; height: 43px; text-align: center">
							<input type="checkbox" id="chkbox" style="width: 25px; height: 25px;" class="normal"></input>
						</td>
					</tr>
				</table>
				<input type="submit" value="결제하기">
				</form>
				</c:if>
			</c:forEach>
			</div>
			</c:if>
		</div>
		</div>
	</section>
	<div class="container">
		<!-- 밑줄 -->
		<div class="divider-custom" style="display: block;">
			<hr style="background-color: black;">
		</div>
		<p style="text-align: right;">
			<!-- 전체선택 -->
			<label class="btn btn-primary pull-right"
				style="position: relative; top: 4px;" for="check_all">전체선택</label>
			<!-- 선택삭제 -->
			<a href="#" class="btn btn-primary pull-right">선택삭제</a>
			<!-- 결제하기 -->
			<a href="CashOn" class="btn btn-primary pull-right">결제하기</a>
		</p>
	</div>
	<c:if test ="${member.mId == null }">
		<script>
			alert("로그인후 사용가능")
			location.href="main";
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