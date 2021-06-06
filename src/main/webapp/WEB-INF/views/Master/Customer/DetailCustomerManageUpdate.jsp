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
			<form action="ManageUpdate" method="post">
						<input type="hidden" id="mId" name="mId" value="${member2.getmId()}">
				
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
							<td colspan="2"><input type="text" id="mName" name="mName"
										style="margin-left: 6px; text-align: center;"
										value="${member2.getmName() }" /></td>
						</tr>
						<tr style="background-color: #e1f5fe;">
							<td><b>아이디</b></td>
							<td colspan="2">${member2.getmId() }</td>
						</tr>
						<tr style="background-color: #e1f5fe;">
							<td><b>비밀번호</b></td>
							<td colspan="2"><input type="text" id="mPw" name="mPw"
										style="margin-left: 6px; text-align: center;"
										value="${member2.getmPw() }" /></td>
						</tr>
						<tr style="background-color: #e1f5fe;">
							<td><b>전화번호</b></td>
							<td colspan="2"><input type="text" id="mPhone" name="mPhone"
										style="margin-left: 6px; text-align: center;"
										value="${member2.getmPhone() }" /></td>
						</tr>
						<tr style="background-color: #e1f5fe;">
							<td><b>성별</b></td>
							<td colspan="2"><select class="" name="mGender" id="mGender" style="width:60px; height:30px;">
												<option selected hidden>${member2.getmGender() }</option>
												<option>남성</option>
												<option>여성</option></select></td>
						</tr>
						<tr style="background-color: #e1f5fe;">
							<td><b>주소</b></td>
							<td colspan="2"><input type="text" id="mAddr" name="mAddr"
										style="margin-left: 6px; text-align: center;"
										value="${member2.getmAddr() }" /></td>
						</tr>
						<tr style="background-color: #e1f5fe;">
							<td><b>등급</b></td>
							<td colspan="2">
											<select class="" name="mGrade" id="mGrade" style="width:120px; height:30px;">
												<option selected hidden>${member2.getmGrade() }</option>
												<option>브론즈</option>
												<option>실버</option>
												<option>골드</option>
												<option>플래티넘</option>
											</select></td>
						</tr>
						<tr style="background-color: #e1f5fe;">
							<td><b>생년월일</b></td>
							<td colspan="2"><input type="text" id="mBirth" name="mBirth"
										style="margin-left: 6px; text-align: center;"
										value="${member2.getmBirth() }" /></td>
						</tr>
						<tr style="background-color: #e1f5fe;">
							<td><b>이메일</b></td>
							<td colspan="2"><input type="text" id="mEmail" name="mEmail"
										style="margin-left: 6px; text-align: center;"
										value="${member2.getmEmail() }" /></td>
						</tr>
						<tr style="background-color: #e1f5fe;">
							<td><b>마일리지</b></td>
							<td colspan="2"><fmt:formatNumber pattern="###,###,###" value="${member2.getmMile()}" />/
								<fmt:formatNumber pattern="###,###,###" value="${member2.getmCumulmile()}" /> P</td>
						</tr>
						<tr style="background-color: #e1f5fe;">
							<td><b>관리자권한</b></td>
							<td colspan="2"><select class="" name="mMaster" id="mMaster" style="width:120px; height:30px;">
												<option value = "0">일반</option>
												<option value = "1">관리자</option>
											</select></td>
						</tr>
						<tr style="background-color: #e1f5fe;">
							<td><b>특이사항</b></td>
							<td colspan="2"><input type="text" id="mNote" name="mNote"
										style="margin-left: 6px; text-align: center; width:600px;" 
										value="${member2.getmNote() }"/></td>
						</tr>
					</tbody>
					
				</table>

				<div class="container">
					<div class="row">
						<!-- 밑줄  -->
						<div class="divider-custom" style="display: block;">
							<hr style="background-color: black;">
						</div>
						<!-- 회원수정 버튼 -->
						<div class="contanier"
							style="position: relative; top: -20px; left: 940px;"> 
							<a href="DetailCustomerManage" class="btn btn-primary">뒤로가기</a>
							<input type="submit" class="btn btn-primary" value="수정완료">
						</div>
					</div>
				</div>
				</form>
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