<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>꾸준한거북이 - 헬스기구쇼핑몰</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />
    </head>
    <!-- 아이디 비밀번호 찾기 -->
    <body id="page-top">
        <!-- Navigation 맨위 로고-->
        <%@ include file="/WEB-INF/views/menu.jsp" %>
            
    	<!-- 아이디 비밀번호 찾기 -->
		<section class="navbar navbar-expand-xl" style="width: 100%; height: 700px; background:#e3f2fd;">
		    <!-- 아이디 찾기 -->
			<div class="container">
				<div class="col-lg-6">
					<h1 style="position: relative; top: -30px; left: 400px;">아이디 찾기</h1>
					<!-- 아이디 찾기 폼 -->
					<form method="post" action="loginAction.jsp" style="position: relative; top: 10px; left: 300px;">
					    <!-- 이름 입력란 -->
						<div class="form-group" style="position: relative; top: 1px;">
						이름 : <input type="text" class="form-control" placeholder="입력해주세요" name="userName" maxlength="20" style="width: 250px; height: 40px; position: relative; left: 80px; top: -30px;">
						</div>
						<!-- 전화번호 입력란 -->
						<div class="form-group" style="position: relative; top: -30px;">
						전화번호 : <input type="text" class="form-control" placeholder="입력해주세요" name="userNumber" maxlength="20" style="width: 250px; height: 40px; position: relative; left: 80px; top: -30px;">
						</div>
						<!-- 확인버튼 -->
						<input type="submit" class="btn btn-primary form-control" value="확인" style="width: 150px; height: 40px; position: relative; top: -30px; left: 130px;">
					</form>
				</div>
			</div>
			<br><br><br>
			<!-- 비밀번호 찾기 -->
			<div class="container">
				<div class="col-lg-6">
					<h1 style="position: relative; top: -30px; left: 200px;">비밀번호 찾기</h1>
					<!-- 비밀번호 찾기 폼 -->
					<form method="post" action="loginAction.jsp" style="position: relative; top: 10px; left: 100px;">
					    <!-- 아이디 입력란 -->
						<div class="form-group" style="position: relative; top: 1px;">
							아이디 : <input type="text" class="form-control" placeholder="입력해주세요" name="userID" maxlength="20" style="width: 250px; height: 40px; position: relative; left: 80px; top: -30px;">
						</div>
						<!-- 이름 입력란 -->
						<div class="form-group" style="position: relative; top: -30px;">
							이름 : <input type="text" class="form-control" placeholder="입력해주세요" name="userName" maxlength="20" style="width: 250px; height: 40px; position: relative; left: 80px; top: -30px;">
						</div>
						<!-- 이메일 입력란 -->
						<div class="form-group" style="position: relative; top: -55px;">
						이메일 : <input type="text" class="form-control" placeholder="입력해주세요" name="userNumber" maxlength="20" style="width: 250px; height: 40px; position: relative; left: 80px; top: -30px;">
						</div>
						<!-- 확인버튼 -->
						<input type="submit" class="btn btn-primary form-control" value="확인" style="width: 150px; height: 40px; position: relative; top: -70px; left: 130px;">
					</form>
				</div>
			</div>
		</section>
        
        <!-- Copyright Section(맨밑 하단)-->
        <div class="copyright py-4 text-center text-white">
            <div class="container"><small><a href ="#" style="text-decoration:none;">회사소개</a>｜ <a href ="#" style="text-decoration:none;">이용약관</a> ｜ <a href ="#" style="text-decoration:none;">개인정보처리방침</a><br>
            (주)꾸준한거북이 ｜대표 : 김규헌 ｜ 개인정보보호책임자 : 원태연 ｜ 사업자등록번호: 111-22-34567 사업자정보 확인> ｜ 02-159-8948<br>
                     경기도 의정부시 서부로 545 경민대학교 ｜ FAX. 02-1234-5678 ｜ Email. steadyturtle@kyungmin.ac.kr</small>
            </div>
        </div>
        
        <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes)-->
        <div class="scroll-to-top d-lg-none position-fixed">
            <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top"><i class="fa fa-chevron-up"></i></a>
        </div>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Contact form JS-->
        <script src="resources/assets/mail/jqBootstrapValidation.js"></script>
        <script src="resources/assets/mail/contact_me.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
