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
<!-- 회원관리 상세보기 페이지 -->
<body id="page-top">
	<!-- Navigation 맨위 로고-->
	<%@ include file="/WEB-INF/views/Master/Mastermenu.jsp"%>

	<!-- 회원정보 상세보기 -->
	<section class="page-section portfolio" id="portfolio">
		<div class="container">
			<div class="row">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3"
								style="background-color: #81d4fa; text-align: center;">
								회원정보 상세보기</th>
						</tr>
					</thead>
					<tbody>
						<tr style="background-color: #e1f5fe;">
							<td style="width: 20%;"><b>이름</b></td>
							<td colspan="2">${member2.getmName() }</td>
						</tr>
						<tr style="background-color: #e1f5fe;">
							<td><b>아이디</b></td>
							<td colspan="2">${member2.getmId() }</td>
						</tr>
						<tr style="background-color: #e1f5fe;">
							<td><b>비밀번호</b></td>
							<td colspan="2">${member2.getmPw() }</td>
						</tr>
						<tr style="background-color: #e1f5fe;">
							<td><b>전화번호</b></td>
							<td colspan="2">${member2.getmPhone() }</td>
						</tr>
						<tr style="background-color: #e1f5fe;">
							<td><b>성별</b></td>
							<td colspan="2">${member2.getmGender() }</td>
						</tr>
						<tr style="background-color: #e1f5fe;">
							<td><b>주소</b></td>
							<td colspan="2">${member2.getmAddr() }</td>
						</tr>
						<tr style="background-color: #e1f5fe;">
							<td><b>등급</b></td>
							<td colspan="2">${member2.getmGrade() }</td>
						</tr>
						<tr style="background-color: #e1f5fe;">
							<td><b>생년월일</b></td>
							<td colspan="2">${member2.getmBirth() }</td>
						</tr>
						<tr style="background-color: #e1f5fe;">
							<td><b>이메일</b></td>
							<td colspan="2">${member2.getmEmail() }</td>
						</tr>
						<tr style="background-color: #e1f5fe;">
							<td><b>마일리지</b></td>
							<td colspan="2">${member2.getmMile() }/
								${member.getmCumulmile() } P</td>
						</tr>
					</tbody>
				</table>

				<div class="container">
					<div class="row">
						<table class="table table-striped"
							style="text-align: center; border: 1px solid #dddddd">
							<!-- 글제목,카테고리,작성일,작성자 라벨 -->
							<thead>
								<tr>
									<th colspan="7"
										style="background-color: #81d4fa; text-align: center;">
										구매리스트</th>
								</tr>
								<tr>
									<th style="background-color: #b2dfdb;">상품명</th>
									<th style="background-color: #b2dfdb;">구매일</th>
									<th style="background-color: #b2dfdb;">수량</th>
									<th style="background-color: #b2dfdb;">마일리지</th>
									<th style="background-color: #b2dfdb;">결제금액</th>
									<th style="background-color: #b2dfdb;">배송완료일</th>
									<th style="background-color: #b2dfdb;">배송여부</th>
								</tr>
							</thead>

							<!-- 고객문의 내용 -->
							<tbody>
							<c:forEach items="${jumunList}" var="jumun">
                  				<c:if test="${jumun.getjId() eq sessionScope.member2.getmId()}">
								<tr>
									<th style="background-color: #eeeeee;">${jumun.getjName() }</th>
									<th style="background-color: #eeeeee;">${jumun.getjJumunDate() }</th>
									<th style="background-color: #eeeeee;">${jumun.getjCount() }</th>
									<th style="background-color: #eeeeee;">${jumun.getjMile() }</th>
									<th style="background-color: #eeeeee;">${jumun.getjPrice() }</th>
									<th style="background-color: #eeeeee;">${jumun.getjFinishDate() }</th>
									<c:choose>
										<c:when test="${jumun.getjShip() eq '배송준비'}">
       										 <th style="background-color: #eeeeee; color: orange;">배송준비</th>
    									</c:when>
    									<c:when test="${jumun.getjShip() eq '배송중'}">
        						 			<th style="background-color: #eeeeee; color: orange;">배송중</th>
    									</c:when>
    									<c:when test="${jumun.getjShip() eq '배송완료'}">
        						 			<th style="background-color: #eeeeee; color: blue;">배송완료</th>
    									</c:when>
    									<c:when test="${jumun.getjShip() eq '환불완료'}">
        						 			<th style="background-color: #eeeeee; color: red;">환불처리</th>
    									</c:when>
    									<c:when test="${jumun.getjShip() eq '환불요청'}">
        						 			<th style="background-color: #eeeeee; color: orange;">환불요청</th>
    									</c:when>
									</c:choose>
								</tr>
								</c:if>
						     </c:forEach>
							</tbody>
						</table>


						<!-- 밑줄  -->
						<div class="divider-custom" style="display: block;">
							<hr style="background-color: black;">
						</div>
						<!-- 회원삭제 버튼 -->
						<form action="CustomerDelete" method="post">
						<input type="hidden" id="mId" name="mId" value="${member2.getmId()}">
						<input type="hidden" id="mPw" name="mPw" value="${member2.getmPw()}">
						<div class="contanier"
							style="position: relative; top: -20px; left: 980px;">
							<a href="CustomerManage" class="btn btn-primary">목록</a> 
							<input type="submit" class="btn btn-primary" value="회원삭제">
						</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</section>
	
	<c:if test ="${member.mMaster != 1 }">
		<script>
			alert("관리자권한이 없습니다.")
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