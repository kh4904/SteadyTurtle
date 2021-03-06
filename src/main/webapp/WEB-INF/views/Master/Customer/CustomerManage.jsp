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
<!--  회원관리 페이지 -->
<body id="page-top">
	<!-- Navigation 맨위 로고-->
	<%@ include file="/WEB-INF/views/Master/Mastermenu.jsp"%>

	<!-- 회원정보 목록창 -->
	<section class="page-section portfolio" id="portfolio" style="min-height:700px;">
		<div class="container">
			<!-- 회원정보 검색창(이름,아이디 검색) -->
			
			<!-- 검색창 -->
			<div class="col-lg-5">
			<form method="POST" action="MemberSearch" id="search" name="search">
					<div class="list-group">
						<input type="text" class="form-control" placeholder="회원 검색창"
							id="key" name="key"
							style="width: 150px; height: 50px; position: relative; left: 850px; top:20px;">
					</div>
					<div class="list-group">
						<button type="submit" class="btn btn-default"
							style="position: relative; width: 30px; height: 30px; left: 1000px; top: -25px;">
							<i class="fas fa-search"
								style="width: 50px; height: 30px; color: #00000;"></i>
						</button>
					</div>
				</form>
			</div>
			
			
			
			
			
		
				<!-- 밑줄 -->
				<div class="divider-custom" style="display: block;">
					<hr style="background-color: black;">
				</div>

				<!-- 고정바(이름 , 아이디, 성별, 등급) 라벨  -->
				<table style="width: 100%">
					<tr>
						<th style="position: relative; left: 80px;"><h4
								style="text-align: center">이름</h4></th>
						<th style="position: relative; left: -30px;"><h4
								style="text-align: center">아이디</h4></th>
						<th style="position: relative; left: -140px;"><h4
								style="text-align: center">성별</h4></th>
						<th style="position: relative; left: -190px;"><h4
								style="text-align: center">등급</h4></th>
					</tr>
				</table>
				<!-- 밑줄 -->
				<div class="divider-custom" style="display: block;">
					<hr style="background-color: black;">
				</div>
                 
				<!-- 회원 정보 출력 -->
				 <table style="width: 100%;">
					<div class="row justify-content-center">
					<c:forEach items="${memberList}" var="member">
						<form action="DetailCustomerManage" method="post">
							<input type="hidden" id="mId" name="mId"
								value="${member.getmId()}">
							<tr>
								<th style="width: 100px; height: 23px;"><h5
										style="text-align: center"></h5></th>
								<th style="width: 200px; height: 23px;"><h5
										style="text-align: center">${member.getmName() }</h5></th>
								<th style="width: 170px; height: 23px;"><h5
										style="text-align: center">${member.getmId() }</h5></th>
								<th style="width: 200px; height: 23px;"><h5
										style="text-align: center">${member.getmGender() }</h5></th>
								<th style="width: 200px; height: 23px;"><h5
										style="text-align: center">${member.getmGrade() }</h5></th>
								<th style="width: 200px; height: 23px; text-align: center"><input
									type="submit" class="btn"
									style="background-color: #ffb74d; color: white;" value="상세보기"></th>
							</tr>

						</form>
					</c:forEach>
					</div>
				</table> 
				
				
			</div>
				
				
			
	</section>

	<!-- 밑줄 -->
	<div class="container">
		<div class="divider-custom" style="display: block;">
			<hr style="background-color: black;">
		</div>
	</div>

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
	<script src="resources/assets/demo/chart-area-demo.js"></script>
	<script src="resources/assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
	<script src="resources/assets/demo/datatables-demo.js"></script>

</body>
</html>