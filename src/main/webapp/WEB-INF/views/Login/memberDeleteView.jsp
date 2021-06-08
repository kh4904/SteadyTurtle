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
<!-- 회원정보수정 마이페이지 -->
<body id="page-top">
	<!-- Navigation 맨위 로고-->
	<%@ include file="/WEB-INF/views/menu.jsp"%>

     <c:if test ="${member.mId == null }">
		<script>
			alert("로그인후 사용가능")
			location.href="main";
		</script>
	</c:if>
	
	<!-- 주문 -->
	<!-- 마이페이지 -->
	
	<section class="page-section portfolio" style="height:600px;">
		<div class="container">
			<div class="col-lg-12">
				<h2>회원탈퇴</h2>
				<table style="width: 100%;">
					<div class="divider-custom" style="display: block;">
						<hr style="background-color: black;">
					</div>
					<!-- 회원탈퇴 버튼 -->
					<form action="memberdelete" id="memberDelete" method="post">
						<div>
							<label class="control-Label" for="mId">ID</label> <input
								class="form-control" type="text" id="mId" name="mId"
								value="${member.mId }" redonly="redonly" />
						</div>
						<div>
							<label class="control-Label" for="mPw">PW</label> <input
								class="form-control" type="password" id="mPw" name="mPw" />
						</div>

						<div class="row" style="text-align: right;">
							<input type="button" onclick="location.href='MyPage'"
								class="btn btn-primary form-control" value="취소"
								style="width: 150px; height: 40px; position: relative; top: 10px; left: 750px; background: #F15F5F">

							<input type="button" class="btn btn-primary form-control"
								value="회원탈퇴" onclick="memberDelete()"
								style="width: 150px; height: 40px; position: relative; top: 10px; left: 768px; background: #F15F5F">
								<script>
									function memberDelete() {
										if (confirm("정말 탈퇴 하시겠습니까??") == true) { //확인

											document.memberDelete.submit();

										} else { //취소

											return false;

										}
									}
								</script>
						</div>
					</form>


				</table>
				<div class="divider-custom" style="display: block;">
					<hr style="background-color: black;">
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