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
<body>
	<!-- Navigation 맨위 로고-->
	<%@ include file="/WEB-INF/views/menu.jsp"%>
	<br>
	<br>
	<br>
	<!-- 주문/결제 헤드부분 -->
	<header class="bg-white text-white">
		<form action="CashOk" method="POST" name="form">
			<div class="container">
				<!-- 주문/결제 문구 및 밑줄표시-->
				<h2 class="page-section-heading text-uppercase text-secondary mb-0">주문/결제</h2>
				<!-- 밑줄 -->
				<div class="divider-custom" style="display: block;">
					<hr style="background-color: black;">
				</div>

				<!-- 주문자정보 필드셋 -->
				<fieldset style="background-color: #e3f2fd;">
					<c:if test="${member != null }">
						<input type="hidden" id="jId" name="jId" value="${member.mId }">
					</c:if>
					<c:if test="${member == null }">
						<input type="hidden" id="jId" name="jId" value="비회원주문">
					</c:if>
					<legend style="color: black;">주문자 정보</legend>
					<label style="color: black;">이름</label> 
					<input type="text"id="jCustomer" name="jCustomer" value="${member.mName }"style="position: relative; left: 35px; width: 500px;"><br>
					<label style="color: black;">휴대전화</label> <input type="tel"
						id="" name="" value="${member.mPhone }"
						style="width: 500px;"><br> <small
						style="color: red; position: relative; left: 80px;">' - '
						빼고 입력해주세요.</small><br> <label style="color: black;">이메일</label> <input
						type="email" id="jEmail" name="jEmail" value="${member.mEmail }"
						style="position: relative; left: 20px; width: 500px;">
				</fieldset>

				<!-- 밑줄 -->
				<div class="divider-custom" style="display: block;">
					<hr style="background-color: black;">
				</div>

				<!-- 배송지 정보 필드셋 -->
				<fieldset style="background-color: #e3f2fd;">
					<legend style="color: black;">배송지 정보</legend>
					<label style="color: black;">받는분</label> 
					<input type="text" id="jCatchName" name="jCatchName" style="position: relative; left: 25px; width: 500px;"><br>
					<label style="color: black;">주소</label><br> 
					<input class="text" id="jAddr" name="jAddr" value="${member.mAddr }" style="position: relative; left: 75px; top: -30px; width: 500px;">
					<br> <label style="color: black;">우편번호</label> 
					<input type="text" id="jMailNum" name="jMailNum" style="position: relative; left: 5px; width: 500px;"><br>
					<label style="color: black;">휴대전화</label> 
					<input type="tel" id="jPhone" name="jPhone" placeholder="01011223344" style="position: relative; left: 5px; width: 500px;"><br>
					<small style="color: red; position: relative; left: 80px;">'
						- ' 빼고 입력해주세요.</small><br>
				</fieldset>

				<!-- 밑줄 -->
				<div class="divider-custom" style="display: block;">
					<hr style="background-color: black;">
				</div>

				<!-- 주문상품 보기 -->
				<div class="container" style="background-color: #bbdefb;">
					<div class="row">
						<div class="col-md-5">
							<h2 style="color: black;">주문상품</h2>
							<img src="resources/assets/img${product.getpImg() }"
								style="width: 50%; height: 60%;">
						</div>
						<div class="col-md-6">
									<br>
									<h2 style="color: black;">${product.getpName() }</h2>
									<input type="hidden" id="jName" name="jName" value="${product.getpName() }" >
									<input type="hidden" id="pNum" name="pNum" value="${product.getpNum() }" >
									<input type="hidden" id="jCate" name="jCate" value="${product.getpCate() }" >
									<input type="hidden" id="jUrl" name="jUrl" value="${product.getpImg() }" >
									<hr>
									<p>
										<b style="font-size: 20px; color: black;">주문수량 : </b>
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
										<b style="font-size: 20px; color: black;">${pCountsSell } 개</b>
										<input type="hidden" id="jCount" name="jCount" value="${pCountsSell }" >
										<input type="hidden" id="pCount" name="pCount" value="${pCountsSell }" >
									</p>
									<hr>
									<p>
										<b style="font-size: 20px; color: black;">상품금액 : </b>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<!-- db연동 -->
										<b style="font-size: 20px; color: black;">${product.getpPrice() } 원</b>
									</p>
									<hr>
									<p>
										<b style="font-size: 20px; color: black;">마일리지 : </b>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<!-- db연동 -->
									<c:if test="${member != null }">
										<input type="text" placeholder="0" name="jMile" id="jMile"
											style="position: relative; width: 70px; height: 30px;"></input><b
											style="font-size: 20px; color: black;">/ ${member.mMile } M</b>
									</c:if>
									<c:if test="${member == null }">
										<b style="font-size: 15px; color: black;">비회원은 사용할 수 없습니다</b>
									</c:if>
									</p>
									<hr>
									<p>
										<b style="font-size: 20px; color: black;">배송비 : </b>
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
										<c:if test="${product.getpShip() eq '무료배송' }">
											<b style="font-size: 20px; color: black;">무료배송</b>
											<input type="hidden" id="jShipPrice" name="jShipPrice" value= 0 >
										</c:if>
										<c:if test="${product.getpShip() eq '일반배송' }">
											<b style="font-size: 20px; color: black;">3000 원</b>
											<input type="hidden" id="jShipPrice" name="jShipPrice" value=3000 >
										</c:if>
									</p>
									<hr>
									<!-- db연동 -->
									<h4 style="text-align: right; color: black;">
										<c:if test="${product.getpShip() eq '무료배송' }">
											총 결제금액 : ${sum }
											<input type="hidden" id="jPrice" name="jPrice" value="${sum}" >
										</c:if>
										<c:if test="${product.getpShip() eq '일반배송' }">
											총 결제금액 : ${sum + 3000}
											<input type="hidden" id="jPrice" name="jPrice" value="${sum }" >
										</c:if>
									</h4>
									
									<hr>
						</div>
					</div>
				</div>

				<!-- 배송 요청사항 필드셋 -->
				<fieldset style="background-color: #bbdefb;">
					<p style="font-size: 20px; color: black; text-align: center;">
						배송 요청사항 <select name = "jMemo" id="jMemo">
							<option selected>문앞에 놔주세요.</option>
							<option>부재시 경비실에 맡겨주세요.</option>
							<option>도착전 연락주세요.</option>
						</select>
					</p>
				</fieldset>

				<!-- 밑줄 -->
				<div class="divider-custom" style="display: block;">
					<hr style="background-color: black;">
				</div>

				<!-- 결제방법 문구 -->
				<h3 style="color: black;">결제방법</h3>
				<hr>

			</div>

			<!-- 결제방법 (신용카드, 휴대폰결제, Toss) -->
			<div class="container">
				<table style="width: 100%">
					<tr style="color: black;">
						<th style="font-size: 20px;"><a href="#"
							style="color: black; text-decoration: none;">신용카드</a></th>
						<th style="font-size: 20px;"><a href="#"
							style="color: black; text-decoration: none;">휴대폰결제</a></th>
						<th style="font-size: 20px;"><a href="#"
							style="color: black; text-decoration: none;">Toss</a></th>
					</tr>
				</table>
				<hr>
				<br>

				<!-- 카드및 할부선택 -->
				<div class="container" style="background-color: #e3f2fd;">
					<div class="row">
						<div class="col-md-5">
							<br>
							<h4 style="color: black;">신용카드 결제</h4>
						</div>
						<div class="col-md-6">
							<br>
							<p>
								<b style="font-size: 20px; color: black;">카드선택</b>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<!-- db연동 -->
								<select style="width: 220px; height: 30px;">
									<option value="">[필수] 카드사를 선택하세요.</option>
									<option value="KB">KB국민</option>
									<option value="IBK">IBK기업</option>
									<option value="SH">신한</option>
									<option value="SA">삼성</option>
									<option value="BC">BC</option>
									<option value="NH">농협</option>
								</select>
							</p>
							<hr>
							<p>
								<b style="font-size: 20px; color: black;">할부선택</b>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<!-- db연동 -->
								<select style="width: 220px; height: 30px;">
									<option value="">일시불</option>
									<option value="">1개월 할부</option>
									<option value="">3개월 할부</option>
									<option value="">6개월 할부</option>
									<option value="">12개월 할부</option>
								</select>
							</p>
							<hr>
							<!-- db연동 -->
							<p class="check" style="color: black; text-align: right; font-size: 15px;">
								<div class="checkT">
									<input type="checkbox" id="chk"> <span style="color:black;">구매조건 및 이용약관에 동의하며,<br>결제를 진행합니다. </span>
								</div>
							</p>
							<hr>
							<!-- 결제하기 버튼 -->
							<div class="btnArea">
								<button type="submit" class="btn" disabled="disabled" style="margin-bottom: 20px; margin-left: -50px; width: 250px; height: 50px; background-color: #757575; color: white;">결제하기</button> <br>
							</div>
						</div>
					</div>
				</div>
				<br> <br>

			</div>
		</form>
	</header>

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
</body>
</html>