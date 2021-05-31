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
<!-- 아이디 비밀번호 찾기 -->
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
	<%@ include file="/WEB-INF/views/menu.jsp"%>

	<!-- 상품보기 -->
	<section class="page-section portfolio">
		<div class="container" style="background-color: #bbdefb; height:600px;">
			<div class="row">
				<div class="col-md-5">
					<br> <br> <img src="${product.getpUrl() }"style="width: 80%; height: 50%;">
					<br>
					
				</div>
				<div class="col-md-6">
					<form role="form" method="post">
						<input type="hidden" name="pNum" value="${product.getpNum() }" />
					</form>
					<form name="form" method="post" action="basket">
						<input type="hidden" name="pUrl" id="pUrl" value="${product.getpUrl() }">
						<br>
						<h2 style="text-align: center"> ${product.getpName() }</h2>
						<input type="hidden" id="mId" name="mId" value="${member.getmId() }"> 
						<input type="hidden" name="pName" value="${product.getpName() }" id="pName">
						<hr>
						<p>
							<b style="font-size: 20px;">판매가 : </b>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<!-- db연동 -->
							<b style="font-size: 20px;">${product.getpPrice() } 원</b> 
							<input type="hidden" name="pPrice" value="${product.getpPrice() }" id="pPrice">
						</p>
						<hr>
						<p>
							<b style="font-size: 20px;">판매량 : </b>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<!-- db연동 -->
							<b style="font-size: 20px;">${product.getpCountSell() } 개</b>
						</p>
						<hr>
						<p>
							<b style="font-size: 20px;">배송방법 : </b>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<!-- db연동 -->
							<b style="font-size: 20px; color: red;">${product.getpShip() }</b>
							<c:if test="${product.getpShip() eq '일반배송'}">
								<input type="hidden" value="3000" id="pShip" name="pShip">
							</c:if>
							<c:if test="${product.getpShip() eq '무료배송'}">
								<input type="hidden" value="0" id="pShip" name="pShip">
							</c:if>
						</p>
						<hr>
						<p>
							<b style="font-size: 20px;">추가혜택 : </b>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<!-- db연동 -->
							<b style="font-size: 20px; color: blue;">${product.getpMile() }
								% 적립</b>
						</p>
						<hr>
						<p>
							<b style="font-size: 20px;">구매갯수 : </b>
							
							
							<!-- db연동 -->
							<b style="font-size: 20px;">
							<p class="cartStock" style="position:relative; top:-50px; left:380px;">
							
								<input type="button" value=" + " onclick="add();">
								<input type="number" class="numBox" min="1" onchange="change();" id="pCountsSell" name="pCountsSell" size="3" style="width: 50px; height: 40px;" value="1" readonly="readonly">
								<input type="button" value=" - " onclick="del();"> 개</b>
													
							</p>
						</p>
						<hr>
						<!-- db연동 -->
						<h4 style="text-align: right;">총 결제금액 :
							<input type="text" name="sum" size="11"> 원</h4>
						<hr>
						<!-- 뒤로가기 버튼클릭시 -->
						<p>
							<a href="main" class="btn btn-secondary" style="position:relative; ">홈으로</a>
							<!-- 장바구니 버튼클릭시 -->
							<p class="addToCart">
								<button type="button" class="btn addCart_btn btn-info" style="position:relative; left:350px; top:-50px;">장바구니</button>
 
								<script>
								$(".addCart_btn").click(function(){
									var pNum = $("#pNum").val();
									var cartStock = $(".numBox").val();
									
									console.log("pNum : " + pNum);
									console.log("cartStock : " + cartStock);
      
									var data = {
											pNum : pNum,
										cartStock : cartStock
									};
   
									$.ajax({
										url : "/ex/addCart",
										type : "post",
										data : data,
										success : function(result){
											 if(result == 1) {
											     alert("장바구니 담기 성공");
											     $(".numBox").val("1");
											    } else {
											     alert("회원만 사용할 수 있습니다.")
											     $(".numBox").val("1");
											    }
											   },
										error : function(){
											alert("카트 담기 실패");
										}
									});
								});
								</script>
							</p>
							<input type="submit" class="btn btn-info" name="Cash" value="결제하기" onclick="javascript: form.action='Cash';" style="position:relative; left:450px; top:-107px;" >
						</p>

					</form>
					
				</div>
				
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
	<script src="resources/js/scripts.js"></script>
	<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
</body>
</html>