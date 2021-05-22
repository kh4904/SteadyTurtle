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
<!-- 판매현황 페이지 -->
	<body id="page-top">
        <!-- Navigation 맨위 로고-->
        <%@ include file="/WEB-INF/views/Master/Mastermenu.jsp" %>
           
     <!-- 헤더 (실적 문구 및 당일 기간정하기) -->
	<header class="page-section portfolio">
		<div class="container">
            <!-- 고정바(순위,상품명,가격,마일리지,배송) 라벨-->
               <table style="width:100%">
                  <tr>
                     <th style="width:200px; height:23px;">
                     <select style = "width:150px; height:30px; position:relative; top:-5px; left:40px;">
                        <option value = "">2021.05.02</option>
                        <option value = "">2021.05.01</option>
                        <option value = "">2021.04.30</option>
                     </select>
                     </th>
                     <th style="width:170px; height:23px;"><center><h5>헬스기구</h5></center></th>
                     <th style="width:200px; height:23px;"><center><h5>요가상품</h5></center></th> 
                     <th style="width:200px; height:23px;"><center><h5>운동식품</h5></center></th>
                     <th style="width:200px; height:23px;"><center><h5>Total</h5></center></th>
                   </tr>
                </table>
                <!-- 밑줄 -->
                <div class="divider-custom" style="display:block;">
                    <hr style="background-color:black;">
                </div>
                
                <c:forEach var = "sell" items = "${sellList }">
                   <!-- 헬스기구끼리만 합계 -->
                   <c:if test = "${sell.getsCate()  eq '헬스기구'}">
                       <c:set var = "health" value = "${health + sell.getsPrice() }" />
                   </c:if>
                   <!-- 요가상품끼리만 합계 -->
                   <c:if test = "${sell.getsCate()  eq '요가상품'}">
                       <c:set var = "yoga" value = "${yoga + sell.getsPrice() }" />
                   </c:if>
                   <!-- 운동식품끼리만 합계 -->
                   <c:if test = "${sell.getsCate()  eq '운동식품'}">
                       <c:set var = "food" value = "${food + sell.getsPrice() }" />
                   </c:if>
                </c:forEach>
                
                <table style="width:100%">
                  <tr>
                     <th style="width:200px; height:23px;"><center><h5>판매금액(원)</h5></center></th>
                     <th style="width:170px; height:23px;"><center><h5><c:out value="${health}" /></h5></center></th>
                     <th style="width:200px; height:23px;"><center><h5><c:out value="${yoga}" /></h5></center></th> 
                     <th style="width:200px; height:23px;"><center><h5><c:out value="${food}" /></h5></center></th>
                     <th style="width:200px; height:23px;"><center><h5><c:out value="${health + yoga + food}" /></h5></center></th>
                   </tr>
                </table>
        </div>
        <br>
        
        <!-- 연도 설정 -->
        <div class = "container" style="height:50px;">
           <input type="date" class="form-control" name="userDate" maxlength="20" style="width: 200px; height: 40px;">
           <label style="position:relative; top:-35px; left:220px;"><h3>~</h3></label>
           <input type="date" class="form-control" name="userDate" maxlength="20" style="width: 200px; height: 40px; position:relative; top:-90px; left:250px;">
        </div>
	</header>
	
	<!-- 막대그래프 -->
	<section class="page-section portfolio" id="portfolio" style="height:700px">
		<div class="col-lg-6">
			<div class="" style="width:400px; height:200px; position:relative; top:-120px; left:280px; ">
				<div class="card-header">
				      <h1>
					<i class="fas fa-chart-area mr-1"></i>
					헬스기구
					  </h1>
				</div>
				<div class="card-body">
					<canvas id="myBarChart1" width="150%" height="110%"></canvas>
				</div>
			</div>
		</div>
		
		<div class="col-lg-6">
			<div class="" style="width:400px; height:200px; position:relative; top:-320px; left:780px; ">
				<div class="card-header">
				      <h1>
					<i class="fas fa-chart-area mr-1"></i>
					요가기구
					  </h1>
				</div>
				<div class="card-body">
					<canvas id="myBarChart2" width="150%" height="110%"></canvas>
				</div>
			</div>
		</div>
		
		<div class="col-lg-6">
			<div class="" style="width:400px; height:200px; position:relative; top:-520px; left:1280px; ">
				<div class="card-header">
				      <h1>
					<i class="fas fa-chart-area mr-1"></i>
					운동식품
					  </h1>

				</div>
				<div class="card-body">
					<canvas id="myBarChart3" width="150%" height="110%"></canvas>
				</div>
			</div>
		</div>
		
		<!-- 남성,여성 막대 색 표시 라벨 -->
		<div class = "contanier" style="position:relative;">
			<div class="" style="background-color:#40c4ff; width: 70px; height: 10px; position:relative; left:800px;top:-320px;">
        	</div>
        	<b style="position: relative; left:900px; top:-335px;">남성</b>
        	<div class="" style="background-color:#ff9e80; width: 70px; height: 10px; position: relative; left:1000px; top:-355px; ">
        	</div>
        	<b style="position: relative; left:1100px; top:-370px;">여성</b>
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
	
	<!-- 여기서부터 관리자페이지 부트스트랩 추가 -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="resources/js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	<script src="resources/assets/demo/chart-area-demo.js"></script>
	<script src="resources/assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
	<script src="resources/assets/demo/datatables-demo.js"></script>
	<script src="resources/assets/demo/chart-bar-demo1.js"></script>
	<script src="resources/assets/demo/chart-bar-demo2.js"></script>
	<script src="resources/assets/demo/chart-bar-demo3.js"></script>

</body>
</html>