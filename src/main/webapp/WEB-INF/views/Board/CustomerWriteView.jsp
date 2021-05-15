<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
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
<title>꾸준한거북이 - 헬스기구쇼핑몰</title>
</head>
<!-- 고객문의게시판 -->
<body>
	<!-- Navigation 맨위 로고-->
        <nav class="navbar " id="mainNav" style="width:100%; height:300px; background-color:#000000;">
            <div class="container-fluid">
                 <div class="col-lg-4">
                   <a class="navbar-brand js-scroll-trigger" href="main"><img src = "resources/assets/img/SteadyTurtle.png" style = "width: 500px; height:190px; position:relative; top:-40px; left:80px;"></a>
                </div> 
                 <!-- 검색창 -->
                <div class ="col-lg-5">
               <form class="navbar-form navbar-left" role="search">
                  <div class="row">
                      <div class="form-group">
                        <input type="text" class="form-control" placeholder="검색창" style="width:500px; height:50px;">
                     </div>
                      <button type="submit" class="btn btn-default"><i class ="fas fa-search" style="width:30px; height:30px; color:#fff;"></i></button>
                    </div>
                 </form>
                    
                 <!-- 헬스기구, 요가상품, 운동식품, 상품랭킹 문구 -->
                     <ul class="nav nav-pills" style="position:relative; top:30px; left:-50px;">
                     <li role="presentation" style="position:relative; "><a href="Health" style="color:#ffff8d; text-decoration:none; font-size:30px;">헬스기구</a></li>
                     <li role="presentation" style="position:relative; left:30px;"><a href="Yoga" style="color:#ffff8d; text-decoration:none; font-size:30px;">요가상품</a></li>
                     <li role="presentation" style="position:relative; left:60px;"><a href="Food" style="color:#ffff8d; text-decoration:none; font-size:30px;">운동식품</a></li>
                     <li role="presentation" style="position:relative; left:90px;"><a href="#" style="color:#fff; text-decoration:none; font-size:30px;" data-toggle="dropdown"> <label style="color:#ffff8d;">상품랭킹</label> <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                           <li><a href="ManRanking" style="color:#000000;">남여랭킹</a></li>
                           <li><a href="HealthRanking" style="color:#000000;">헬스기구 랭킹</a></li>
                           <li><a href="YogaRanking" style="color:#000000;">요가용품 랭킹</a></li>
                           <li><a href="FoodRanking" style="color:#000000;">건강식품 랭킹</a></li>
                        </ul>
                         </li>
                   </ul>
              </div> 
                
                <!-- 로그인창 -->
                <div class = "col-lg-3">
                       <!-- 장바구니, 상품환불, 고객문의 -->
                       <ul class="nav nav-pills">
  						 <li role="presentation" style="position:relative; left:40px;"><a href="basket" style="color:#fff;">장바구니</a></li>
  						 <li role="presentation" style="position:relative; left:60px;"><a href="refund" style="color:#fff;">상품환불</a></li>
  						 <li role="presentation" style="position:relative; left:80px;"><a href="CustomerWriteView" style="color:#fff;">고객문의</a></li>
 					   </ul>
 					   
 					   <!-- 로그인성공된 창 -->
 					   <div class="jumbotron" style="padding-top: 20px; width: 400px; height: 190px; position: relative; top: 10px; left: -100px;">
							<ul class="nav nav-tabs">
								<li role="presentation" class="active" style="position: relative; left: 60px; color:#000000;">회원</li>
							</ul>
							<ul class="nav nav-pills" style="position: relative; top: 30px; left: 20px;">
								<li role="presentation" class="active">
									<p>사용기능/누적 <br /> 마일리지<br /> <label>3000/6000 p</label></p>
								</li>
								<li role="presentation" style="position: relative; left: 80px;">
									<p style="position: relative;">나의 등급: 플래티넘 <br /> 원태연 님</p>
								</li>
							</ul>
							<hr>
							<!-- 회원정보수정 주문조회 로그아웃 -->
							<ul class="nav nav-pills" style="position: relative; top: -15px; left: 30px;">
								<li role="presentation" class="active"><a href="MyPage" style="color:black; text-decoration:none;">회원정보수정</a> /</li>
								<li role="presentation"><a href="JumunSearch" style="color:black; text-decoration:none;"> 주문조회</a></li>
								<li role="presentation" style="position: relative; left: 60px;">
								<a href="main" style="color:black; text-decoration:none;">로그아웃</a>
								</li>
							</ul>
						</div>
			     </div>
      </nav>
	<br />
	<br />
	<br />
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
							<td style="width: 20%;">글 제목</td>
							<td>작성자</td>
							<td>작성일</td>
							<td>내용</td>
							<td>답변현황</td>
						</tr>
						<tr>
							<td>2</td>
							<td style="width: 20%;">상품문의</td>
							<td>2021.04.04</td>
							<td>기구가파손되었어요</td>
							<td>박남일</td>
							<td style="color:red;">미등록</td>
						</tr>
						<tr>
							<td>1</td>
							<td style="width: 20%;">결제문의</td>
							<td>2021.04.01</td>
							<td>국민카드결제오류</td>
							<td>이동진</td>
							<td style="color:blue;">등록</td>
						</tr>
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