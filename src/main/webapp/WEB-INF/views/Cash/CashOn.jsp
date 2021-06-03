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
					<label style="color: black;">주소</label>
					
						<p>
							<input type="text" id="sample2_postcode" placeholder="우편번호">
							<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기">
						</p>
						<p>
							<input type="text" name="userAddr1" id="sample2_address" placeholder="주소" >
							<input type="text" name="userAddr2" id="sample2_detailAddress" placeholder="상세주소">
							<input type="text" name="userAddr3" id="sample2_extraAddress" placeholder="참고항목">
						</p>
						
						<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
						<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
						</div>
						
						<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
						<script>
						    // 우편번호 찾기 화면을 넣을 element
						    var element_layer = document.getElementById('layer');
						
						    function closeDaumPostcode() {
						        // iframe을 넣은 element를 안보이게 한다.
						        element_layer.style.display = 'none';
						    }
						
						    function sample2_execDaumPostcode() {
						        new daum.Postcode({
						            oncomplete: function(data) {
						                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						
						                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
						                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						                var addr = ''; // 주소 변수
						                var extraAddr = ''; // 참고항목 변수
						
						                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						                    addr = data.roadAddress;
						                } else { // 사용자가 지번 주소를 선택했을 경우(J)
						                    addr = data.jibunAddress;
						                }
						
						                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						                if(data.userSelectedType === 'R'){
						                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
						                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						                        extraAddr += data.bname;
						                    }
						                    // 건물명이 있고, 공동주택일 경우 추가한다.
						                    if(data.buildingName !== '' && data.apartment === 'Y'){
						                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						                    }
						                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						                    if(extraAddr !== ''){
						                        extraAddr = ' (' + extraAddr + ')';
						                    }
						                    // 조합된 참고항목을 해당 필드에 넣는다.
						                    document.getElementById("sample2_extraAddress").value = extraAddr;
						                
						                } else {
						                    document.getElementById("sample2_extraAddress").value = '';
						                }
						
						                // 우편번호와 주소 정보를 해당 필드에 넣는다.
						                document.getElementById('sample2_postcode').value = data.zonecode;
						                document.getElementById("sample2_address").value = addr;
						                // 커서를 상세주소 필드로 이동한다.
						                document.getElementById("sample2_detailAddress").focus();
						
						                // iframe을 넣은 element를 안보이게 한다.
						                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
						                element_layer.style.display = 'none';
						            },
						            width : '100%',
						            height : '100%',
						            maxSuggestItems : 5
						        }).embed(element_layer);
						
						        // iframe을 넣은 element를 보이게 한다.
						        element_layer.style.display = 'block';
						
						        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
						        initLayerPosition();
						    }
						
						    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
						    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
						    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
						    function initLayerPosition(){
						        var width = 300; //우편번호서비스가 들어갈 element의 width
						        var height = 400; //우편번호서비스가 들어갈 element의 height
						        var borderWidth = 5; //샘플에서 사용하는 border의 두께
						
						        // 위에서 선언한 값들을 실제 element에 넣는다.
						        element_layer.style.width = width + 'px';
						        element_layer.style.height = height + 'px';
						        element_layer.style.border = borderWidth + 'px solid';
						        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
						        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
						        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
						    }
						</script>
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
										<input type="text" value="0"
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
											<input type="hidden" id="jPrice" name="jPrice" value="${sum }" >
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
						배송 요청사항 <select>
							<option value="" selected>문앞에 놔주세요.</option>
							<option value="">부재시 경비실에 맡겨주세요.</option>
							<option value="">도착전 연락주세요.</option>
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
									<input type="checkbox" id="chk"> <span>구매조건 및 이용약관에 동의하며,<br>결제를 진행합니다. </span>
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