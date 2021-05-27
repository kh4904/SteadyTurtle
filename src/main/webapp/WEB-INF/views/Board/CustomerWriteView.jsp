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
<!-- 아이디 비밀번호 찾기 -->
<body id="page-top">
	<!-- Navigation 맨위 로고-->
	<%@ include file="/WEB-INF/views/menu.jsp"%>
	
	<!-- 게시판 -->
	<section class="page-section portfolio" style="height:800px;">
		<div class="container">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="6" style="background-color: #eeeeee; text-align: center;">글 보기
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>글번호</td>
							<td style="width: 20%;">카테고리</td>
							<td>글 제목</td>
							<td>작성자</td>
							<td>작성일</td>
							<td>답변현황</td>
						</tr>
						<c:forEach items="${boardList}" var="board">
						<form action="CustomerWriteAnswer" method="post">
						 <input type="hidden" id="bNum" name="bNum" value="${board.getbNum() }">
						<tr>
							<td>${board.getbNum() }</td>
							<td style="width: 20%;">${board.getbCate() }</a></td>
							<td>
								<input type="submit" class="btn" value="${board.getbTitle() }" style="height:30px; position:relative; top:-8px; color: #004d99;" >				
							</td>
							<td>${board.getmName() }</td>
							<td>${board.getbDate() }</td>
							<c:choose>
								<c:when test="${board.getbReply() eq '답변없음.'}">
       							 <td style="color:red;">미등록</td>
    							</c:when>
    							<c:when test="${board.getbReply() ne '답변없음.'}">
        						 <td style="color:blue;">등록</td>
    							</c:when>
							</c:choose>
						</tr>
						</form>
						</c:forEach>
					</tbody>
				</table>
				
				<!-- 글쓰기 버튼 -->
				<div style="text-align:right;">
						<a href="CustomerWrite" class="btn btn-info">글쓰기</a>
				</div>
				
				<div class="container">
					<div class="col-lg-12" style="text-align: center;">
						<nav aria-label="Page navigation example"style="position:relative; left:420px;">
							<ul class="pagination">
								<li class="page-item">
									<a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#">1</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#">2</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#">3</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
								</li>
							</ul>
						</nav>
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
	<script src="js/scripts.js"></script>
</body>
</html>