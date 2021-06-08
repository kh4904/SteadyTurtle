<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cencle").on("click", function() {
			location.href = "/";
		})

		$("#submit").on("click", function() {
			if ($("#mId2").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#mId2").focus();
				return false;
			}
			if ($("#mPw2").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#mPw2").focus();
				return false;
			}
			if ($("#mPwOk").val() == "") {
				alert("비밀번호 확인을 입력해주세요.");
				$("#mPwOk").focus();
				return false;
			}
			if ($("#mName2").val() == "") {
				alert("성명을 입력해주세요.");
				$("#mName2").focus();
				return false;
			}
			if ($("#mPhone2").val() == "") {
				alert("전화번호를 입력해주세요.");
				$("#mPhone2").focus();
				return false;
			}
			if ($("#mEmail2").val() == "") {
				alert("이메일을 입력해주세요.");
				$("#mEmail2").focus();
				return false;
			}
			if ($("#mAddr2").val() == "") {
				alert("주소를 입력해주세요.");
				$("#mAddr2").focus();
				return false;
			}
			if ($("#mBirth2").val() == "") {
				alert("생년월일을 입력해주세요.");
				$("#mBirth2").focus();
				return false;
			}
			var idChkVal = $("#idChk").val();
			if (idChkVal == "N") {
				alert("중복확인 버튼을 눌러주세요.");
				return false;
			} else if (idChkVal == "Y") {
				$("#regForm").submit();
			}
		});
	})
	//아이디 중복확인
	function fn_idChk() {
		$.ajax({
			url : "/ex/idChk",
			type : "post",
			dataType : "json",
			data : {
				"mId" : $("#mId2").val()
			},
			success : function(data) {
				if (data == 1) {
					alert("중복된 아이디입니다.");
				} else {
					$("#idChk").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
				}
			}
		})
	}
	//패스워드 확인란 입력값 검증.
	$(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var pwd1 = $("#mPw2").val();
			var pwd2 = $("#mPwOk").val();
			if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
				}
			}
		});
	});
</script>
<!-- 회원가입 -->
<body id="page-top">
	<!-- Navigation 맨위 로고-->
	<%@ include file="/WEB-INF/views/menu.jsp"%>

	<!-- 회원가입  -->
	<section class="page-section portfolio" id="portfolio">
		<div class="container"
			style="height: 500px; width: 100%; height: 100%; background-color: #e3f2fd;">
			<div class="col-lg-12">
				<form action="main" method="post" id="regForm">
					<h1 style="position: relative; top: -20px; left: 400px;">회원가입</h1>
					<!-- 아이디 입력 -->
					<div class="list-group"
						style="position: relative; top: 30px; left: 200px;">
						아이디 : <input type="text" class="form-control" placeholder="입력해주세요"
							id="mId2" name="mId" maxlength="20"
							style="width: 300px; height: 40px; position: relative; left: 130px; top: -30px;">
						<button class="idChk" type="button" id="idChk"
							onclick="fn_idChk();" value="N"
							style="width: 100px; height: 40px; position: relative; top: -70px; left: 480px;">중복확인</button>
						<p
							style="color: red; width: 300px; height: 20px; position: relative; top: -60px; left: 10px;">※
							4-16자 이상 영문 또는 숫자만 사용가능</p>
					</div>

					<!-- 비밀번호 입력 -->
					<div class="list-group"
						style="position: relative; top: -20px; left: 200px;">
						비밀번호 : <input type="password" class="form-control"
							placeholder="입력해주세요" id="mPw2" name="mPw" maxlength="20"
							style="width: 300px; height: 40px; position: relative; left: 130px; top: -30px;">
					</div>

					<!-- 비밀번호 확인 -->
					<div class="list-group"
						style="position: relative; top: -20px; left: 200px;">
						비밀번호 확인 : <input type="password" class="form-control"
							placeholder="입력해주세요" id="mPwOk" name="mPwOk" maxlength="20"
							style="width: 300px; height: 40px; position: relative; left: 130px; top: -30px;">
						<div class="alert alert-success" id="alert-success"
							style="width: 300px; height: 40px;">비밀번호가 일치합니다.</div>
						<div class="alert alert-danger" id="alert-danger"
							style="width: 300px; height: 40px;">비밀번호가 일치하지 않습니다.</div>
					</div>

					<!-- 이름 입력 -->
					<div class="list-group"
						style="position: relative; top: -20px; left: 200px;">
						이름 : <input type="text" class="form-control" placeholder="입력해주세요"
							id="mName2" name="mName" maxlength="20"
							style="width: 300px; height: 40px; position: relative; left: 130px; top: -30px;">
					</div>

					<!-- 전화번호 입력 -->
					<div class="list-group"
						style="position: relative; top: -20px; left: 200px;">
						전화번호 : <input type="text" class="form-control"
							placeholder="입력해주세요" id="mPhone2" name="mPhone" maxlength="20"
							style="width: 300px; height: 40px; position: relative; left: 130px; top: -30px;">
					</div>

					<!-- 이메일 입력 -->
					<div class="list-group"
						style="position: relative; top: -20px; left: 200px;">
						이메일 : <input type="email" class="form-control"
							placeholder="입력해주세요" id="mEmail2" name="mEmail" maxlength="30"
							style="width: 300px; height: 40px; position: relative; left: 130px; top: -30px;">
					</div>

					<!-- 주소 입력 -->
					<div class="list-group"
						style="position: relative; top: -20px; left: 200px;">
						주소
						<p>
							<input type="text" id="mAddr2_postcode" placeholder="우편번호">
							<input type="button" onclick="mAddr2_execDaumPostcode()"
								value="우편번호 찾기">
						</p>
						<p>
							<input type="text" name="userAddr1" id="mAddr2_address"
								placeholder="주소"> <input type="text" name="userAddr2"
								id="mAddr2_detailAddress" placeholder="상세주소"> <input
								type="text" name="userAddr3" id="mAddr2_extraAddress"
								placeholder="참고항목">
						</p>

						<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
						<div id="layer"
							style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
								id="btnCloseLayer"
								style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
								onclick="closeDaumPostcode()" alt="닫기 버튼">
						</div>

						<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
						<script>
							// 우편번호 찾기 화면을 넣을 element
							var element_layer = document
									.getElementById('layer');

							function closeDaumPostcode() {
								// iframe을 넣은 element를 안보이게 한다.
								element_layer.style.display = 'none';
							}

							function mAddr2_execDaumPostcode() {
								new daum.Postcode(
										{
											oncomplete : function(data) {
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
												if (data.userSelectedType === 'R') {
													// 법정동명이 있을 경우 추가한다. (법정리는 제외)
													// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
													if (data.bname !== ''
															&& /[동|로|가]$/g
																	.test(data.bname)) {
														extraAddr += data.bname;
													}
													// 건물명이 있고, 공동주택일 경우 추가한다.
													if (data.buildingName !== ''
															&& data.apartment === 'Y') {
														extraAddr += (extraAddr !== '' ? ', '
																+ data.buildingName
																: data.buildingName);
													}
													// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
													if (extraAddr !== '') {
														extraAddr = ' ('
																+ extraAddr
																+ ')';
													}
													// 조합된 참고항목을 해당 필드에 넣는다.
													document
															.getElementById("mAddr2_extraAddress").value = extraAddr;

												} else {
													document
															.getElementById("mAddr2_extraAddress").value = '';
												}

												// 우편번호와 주소 정보를 해당 필드에 넣는다.
												document
														.getElementById('mAddr2_postcode').value = data.zonecode;
												document
														.getElementById("mAddr2_address").value = addr;
												// 커서를 상세주소 필드로 이동한다.
												document.getElementById(
														"mAddr2_detailAddress")
														.focus();

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
							function initLayerPosition() {
								var width = 300; //우편번호서비스가 들어갈 element의 width
								var height = 400; //우편번호서비스가 들어갈 element의 height
								var borderWidth = 5; //샘플에서 사용하는 border의 두께

								// 위에서 선언한 값들을 실제 element에 넣는다.
								element_layer.style.width = width + 'px';
								element_layer.style.height = height + 'px';
								element_layer.style.border = borderWidth
										+ 'px solid';
								// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
								element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
										+ 'px';
								element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
										+ 'px';
							}
						</script>
					</div>

					<!-- 생년월일 입력 -->
					<div class="list-group"
						style="position: relative; top: -20px; left: 200px;">
						생년월일 : <input type="date" class="form-control"
							placeholder="입력해주세요" id="mBirth2" name="mBirth" maxlength="20"
							style="width: 200px; height: 40px; position: relative; left: 130px; top: -30px;">
					</div>

					<!-- 성별 -->
					<div class="list-group"
						style="position: relative; top: -20px; left: 200px;">
						성별 : <select class="form-control" id="mGender" name="mGender"
							style="width: 200px; height: 40px; position: relative; left: 130px; top: -30px;">
							<option>남성</option>
							<option>여성</option>
						</select>
					</div>
					<br>
					<!-- 회원가입하기 버튼 -->
					<div class="list-group" style="text-align: right;">
						<button type="submit" class="btn btn-primary form-control"
							id="submit"
							style="width: 150px; height: 40px; position: relative; top: -50px; left: 480px;">회원가입</button>
					</div>
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
	<!-- Contact form JS-->
	<script src="resources/assets/mail/jqBootstrapValidation.js"></script>
	<script src="resources/assets/mail/contact_me.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>
</body>
</html>