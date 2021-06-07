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

<!-- section aside 크기 설정하는곳 되도록 건들지않는게 페이지망가짐 적음 -->
<style>
section,aside{float:left; width:1603px;height:672px;padding:10px}
section{width:1603px;background:white}
aside{width:300px;background:white}
aside ul{list-style:none; padding:0}
aside ul li{clear:both;float:left;margin-top:10px}
</style>
</head>
   <!-- 관리자모드 메인페이지 -->
	<body id="page-top">
        <!-- Navigation 맨위 로고-->
        <%@ include file="/WEB-INF/views/Master/Mastermenu.jsp" %>       
      
     <!-- 헤더 (실적 문구 및 당일 기간정하기) -->
	<header class="page-section portfolio">
	<form action="sellDate" method="POST" name="form">
		<div class="container">
            <!-- 고정바(순위,상품명,가격,마일리지,배송) 라벨-->
            <!-- sell값이 null인경우 -->
                <c:if test="${sell == null }">
                <table style="width:100%">
                  <tr>
                     <th style="width:200px; height:23px;">
                     <select name="sDate" id="sDate" style = "width:150px; height:30px; position:relative; top:-5px; left:10px;">
                        <c:forEach items="${sellOne}" var="sellOne">
                        <option>${sellOne.getsDate() }</option>
                        </c:forEach>
                     </select>
                     <button type="submit" class="btn btn-default" style="position:relative; width:50px; height:30px; top:-10px;"> <i
							class="fas fa-reply"
							style="width: 50px; height: 30px; color: #000000;"></i></button>
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
                  <c:if test="${sell.getsDate() eq '2021-05-21'}">
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
                 </c:if>
                </c:forEach>
                <table style="width:100%">
                  <tr>
                     <th style="width:200px; height:23px;"><center><h5>판매금액(원)</h5></center></th>
                     <th style="width:170px; height:23px;"><center><h5><fmt:formatNumber pattern="###,###,###" value="${health}" /></h5></center></th>
                     <th style="width:200px; height:23px;"><center><h5><fmt:formatNumber pattern="###,###,###" value="${yoga}" /></h5></center></th> 
                     <th style="width:200px; height:23px;"><center><h5><fmt:formatNumber pattern="###,###,###" value="${food}" /></h5></center></th>
                     <th style="width:200px; height:23px;"><center><h5><fmt:formatNumber pattern="###,###,###" value="${health + yoga + food}" /></h5></center></th>
                   </tr>
                </table>
                </c:if>
                
                <!-- sell값이 null이아닌경우 -->
                <c:if test="${sell != null }">
                <table style="width:100%">
                  <tr>
                     <th style="width:200px; height:23px;">
                     <select name="sDate" id="sDate" style = "width:150px; height:30px; position:relative; top:-5px; left:10px;">
                        <c:forEach items="${sellOne}" var="sellOne">
                        <option selected hidden>${sell.getsDate() }</option>
                        <option>${sellOne.getsDate() }</option>
                        </c:forEach>
                     </select>
                     <button type="submit" class="btn btn-default" style="position:relative; width:50px; height:30px; top:-10px;"> <i
							class="fas fa-reply"
							style="width: 50px; height: 30px; color: #000000;"></i></button>
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
                  <c:if test="${sell.getsDate() eq sessionScope.sell.getsDate()}">
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
                 </c:if>
                </c:forEach>
                <table style="width:100%">
                  <tr>
                     <th style="width:200px; height:23px;"><center><h5>판매금액(원)</h5></center></th>
                     <th style="width:170px; height:23px;"><center><h5><fmt:formatNumber pattern="###,###,###" value="${health}" /></h5></center></th>
                     <th style="width:200px; height:23px;"><center><h5><fmt:formatNumber pattern="###,###,###" value="${yoga}" /></h5></center></th> 
                     <th style="width:200px; height:23px;"><center><h5><fmt:formatNumber pattern="###,###,###" value="${food}" /></h5></center></th>
                     <th style="width:200px; height:23px;"><center><h5><fmt:formatNumber pattern="###,###,###" value="${health + yoga + food}" /></h5></center></th>
                   </tr>
                </table>
                </c:if>
        </div>
        </form>
        <br>
        
        <!-- 연도 설정 -->
        <div class = "container" style="height:50px;">
           <input type="date" class="form-control" name="userDate" maxlength="20" style="width: 200px; height: 40px;">
           <label style="position:relative; top:-35px; left:220px;"><h3>~</h3></label>
           <input type="date" class="form-control" name="userDate" maxlength="20" style="width: 200px; height: 40px; position:relative; top:-90px; left:250px;">
        </div>
	</header>
	
	<!-- 선그래프 -->
	<section class="page-section portfolio" id="portfolio">
		<div class="col-lg-6">
			<div class="" style="width:1000px; height:378px; position:relative; top:-150px; left:400px; ">
				<div class="card-header">
					<i class="fas fa-chart-area mr-1"></i>
					상품 판매량
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					<a href="SalesStatus" style="text-decoration:none;">더보기 +</a>
				</div>
				<div class="card-body">
					<canvas id="myBarChart" width="100%" height="40%"></canvas>
				</div>
			</div>
		</div>
		
		<!-- 헬스,요가,운동 막대 색 표시 라벨 -->
		<div class = "contanier" style="position:relative;">
			<div class="" style="background-color:#40c4ff; width: 70px; height: 10px; position:relative; left:700px;">
        	</div>
        	<b style="position:relative; left:780px; top:-15px;">헬스기구</b>
        	<div class="" style="background-color:#90a4ae; width: 70px; height: 10px; position: relative; left:880px; top:-33px;">
        	</div>
        	<b style="position: relative; left:960px; top:-48px;">요가상품</b>
        	<div class="" style="background-color:#ff9e80; width: 70px; height: 10px; position: relative; left:1060px; top:-66px; ">
        	</div>
        	<b style="position: relative; left:1140px; top:-80px;">운동식품</b>
        </div>
        
    
	</section>
   
    <!-- 사이드바 vip표시 -->
    <aside style="text-align:center;">
    <div style="position:relative; top:-250px; height: 800px; background-color:#c8e6c9;">
    <br>
        <h1>VIP 리스트</h1><br>
        <%int i=0;%>
        <c:forEach items="${memberList}" var="member">
        	<c:if test = "${member.getmGrade() eq '플래티넘' }">
           	 	${member.getmName() } ${member.getmGrade() }
           	 	<br>
        	</c:if>
    	</c:forEach>
        </div>
    </aside>
    
    <c:if test ="${member.mMaster != 1 }">
		<script>
			alert("관리자권한이 없습니다.")
			location.href="main";
		</script>
	</c:if>
	
	<!-- 기간별 매출 Chart -->
	<script>
		Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
		Chart.defaults.global.defaultFontColor = '#858796';
	
		function number_format(number, decimals, dec_point, thousands_sep) {
			// *     example: number_format(1234.56, 2, ',', ' ');
			// *     return: '1 234,56'
			number = (number + '').replace(',', '').replace(' ', '');
			var n = !isFinite(+number) ? 0 : +number,
				prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
				sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
				dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
				s = '',
				toFixedFix = function(n, prec) {
					var k = Math.pow(10, prec);
					return '' + Math.round(n * k) / k;
				};
			// Fix for IE parseFloat(0.55).toFixed(0) = 0;
			s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
			if (s[0].length > 3) {
				s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
			}
			if ((s[1] || '').length < prec) {
				s[1] = s[1] || '';
				s[1] += new Array(prec - s[1].length + 1).join('0');
			}
			return s.join(dec);
		}
		var ctx = document.getElementById("myBarChart");
	
		var OrderDate = new Array();
		var Earnings = new Array();
	
		<c:forEach items="${SellList }" var="sell">
			OrderDate.push("${sell.sDate}");
			Earnings.push("${sell.sPrice}");
		</c:forEach>
		var myLineChart = new Chart(ctx, {
			type: 'bar',
			data: {
				
				labels: OrderDate,
				datasets: [
				    {
				      label: "Health",
				      backgroundColor: "rgba(103,153,255,1)",
				      borderColor: "rgba(103,153,255,1)",
				      data: [300, 150, 200, 80, 170, 800,661],
				    },{
				      label: "Yoga",
				      backgroundColor: "rgba(140,140,140, 1)",
				      borderColor: "rgba(140,140,140,1)",
				      data: [482, 246, 297, 317, 200, 600,972],
				    },{
				        label: "Food",
				        backgroundColor: "rgba(255,94,0, 1)",
				        borderColor: "rgba(255,94,0,1)",
				        data: [600, 127, 497, 257, 800, 247,634],
				      }
				    ],
				  },
			options: {
				maintainAspectRatio: false,
				layout: {
					padding: {
						left: 10,
						right: 25,
						top: 25,
						bottom: 0
					}
				},
				scales: {
					xAxes: [{
						time: {
							unit: 'date'
						},
						gridLines: {
							display: false,
							drawBorder: false
						},
						ticks: {
							maxTicksLimit: 7
						}
					}],
					yAxes: [{
						ticks: {
							maxTicksLimit: 5,
							padding: 10,
							// Include a dollar sign in the ticks
							callback: function(value, index, values) {
								return '$' + number_format(value);
							}
						},
						gridLines: {
							color: "rgb(234, 236, 244)",
							zeroLineColor: "rgb(234, 236, 244)",
							drawBorder: false,
							borderDash: [2],
							zeroLineBorderDash: [2]
						}
					}],
				},
				legend: {
					display: false
				},
				tooltips: {
					backgroundColor: "rgb(255,255,255)",
					bodyFontColor: "#858796",
					titleMarginBottom: 10,
					titleFontColor: '#6e707e',
					titleFontSize: 14,
					borderColor: '#dddfeb',
					borderWidth: 1,
					xPadding: 15,
					yPadding: 15,
					displayColors: false,
					intersect: false,
					mode: 'index',
					caretPadding: 10,
					callbacks: {
						label: function(tooltipItem, chart) {
							var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
							return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
						}
					}
				}
			}
		});
	</script>

    <!-- Copyright Section(맨밑 하단)-->
	<div class="copyright py-4 text-center text-white">
		<div class="container" style="position:relative; top:20px;"> 
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

</body>
</html>