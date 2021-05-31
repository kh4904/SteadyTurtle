<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
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
	<section class="page-section portfolio">
	<div class="container">
		<div class="col-lg-12">
			<div class="row">
				<form method="post" action="writeAction" enctype="multipart/form-data">
				<c:if test ="${member.mId != null }">
					<input type="hidden" id = "mName" name="mName" value="${member.mName }">
					<div class="" style="text-align:center;">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; width: 1000px;">
						<thead>
							<tr>
								<td colspan="5" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식 </td>
							</tr>
						</thead>
						<tbody style="width:100%;">
							<tr>
								<td colspan="4">
									<input type="text" class="form-control" placeholder="글 제목" id="bTitle" name="bTitle" maxlength="50" style="width:800px;" />
								</td>
								<td>
									<select class="form-control" id="bCate" name="bCate" style="width:200px;">
										<option>상품관련</option>
										<option>배송관련</option>
										<option>기타</option>
						  			</select>
								</td>
							</tr>
							<tr>
								<td colspan="5" style="text-align: left;">
									<div class="inputArea">
										<input type="file" id="bImg" name="file" />
										<div class="select_img"></div>
											<script>
												$("#bImg").change(function(){
													if(this.files && this.files[0]) {
														var reader = new FileReader;
														reader.onload = function(data) {
															$(".select_img img").attr("src", data.target.result).width(500);        
														}
														reader.readAsDataURL(this.files[0]);
													}
												});
											</script>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="5">
									<textarea class="form-control" placeholder="글 내용" id="bNote" name="bNote" maxlength="2048px;" style="height: 350px; resize: none;"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
					</div>
					<div style="text-align:right;">
					    <a href="CustomerWriteView" class="btn btn-primary">뒤로가기</a>
						<input type="submit" class="btn btn-primary pull-right" value="글쓰기" />
					</div>
					</c:if>
					<c:if test ="${member.mId == null }">
					<script>
						alert("로그인후 사용가능")
						location.href="main";
					</script>
					</c:if>
				</form>
			</div>
		</div>
	</div>
	</section>
	
	<!-- Copyright Section(맨밑 하단)-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small><a href="#" style="text-decoration: none;">회사소개</a>｜
				<a href="#" style="text-decoration: none;">이용약관</a> ｜ 
				<a href="#" style="text-decoration: none;">개인정보처리방침</a><br>
					(주)꾸준한거북이 ｜대표 : 김규헌 ｜ 개인정보보호책임자 : 원태연 ｜ 사업자등록번호: 111-22-34567
					사업자정보 확인> ｜ 02-159-8948<br> 경기도 의정부시 서부로 545 경민대학교 ｜ FAX.
					02-1234-5678 ｜ Email. steadyturtle@kyungmin.ac.kr
			</small>
		</div>
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