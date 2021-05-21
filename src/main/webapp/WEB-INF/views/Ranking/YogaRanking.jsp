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
    <!-- 요가상품 순위 페이지 -->
    <body id="page-top">
        <!-- Navigation 맨위 로고-->
        <%@ include file="/WEB-INF/views/menu.jsp" %>
            
        <!-- 상품랭킹 헤드부분 -->
        <header class="bg-white text-white text-center">
           <div class="container d-flex align-items-center flex-column">
               <!-- 상품랭킹 라벨 -->
              <div class="divider-custom divider-light" style="width:1092px; height:66px;">
                  <br><br><br><br>  
                  <h1 style = "color:black;">상품랭킹</h1>
              </div>
              <!-- 판매랭킹,남여랭킹 선택부분 -->
              <div class="btn-group" role="group" aria-label="...">
<<<<<<< HEAD
                  <button type="button" class="btn btn-default" style="background-color:#999957;"><a href = "HealthRanking" style="text-decoration:none; color:black;">판매랭킹</a></button>
                  <button type="button" class="btn btn-default" style ="background-color:#ffff8d;"><a href = "ManRanking" style="text-decoration:none; color:black;">남여랭킹</a></button>
=======
                  <button type="button" class="btn btn-default" style="background-color:#ffff8d;"><a href = "HealthRanking" style="text-decoration:none; color:black;">판매랭킹</a></button>
                  <button type="button" class="btn btn-default" style ="background-color:#999957;"><a href = "ManRanking" style="text-decoration:none; color:black;">남여랭킹</a></button>
>>>>>>> refs/remotes/origin/Kuehun
              </div>
<<<<<<< HEAD
              <br />
=======
               <br />
>>>>>>> refs/remotes/origin/Kuehun
              <!-- 남성회원 여성회원 이미지 및 클릭시 이동  -->
<<<<<<< HEAD
              <div class="btn-group" role="group" aria-label="...">
                <a href="FoodRanking"><img src = "resources/assets/RankingImg/Food.jpg" style="width:60px; height:50px;"></a>
=======
             <div class="btn-group" role="group" aria-label="...">
                <a href="FoodRanking"><img src = "resources/assets/RankingImg/Food.jpg" style="width:70px; height:50px;"></a>
>>>>>>> refs/remotes/origin/Kuehun
                <a href="HealthRanking"><img src = "resources/assets/RankingImg/Health.png" style="width:70px; height:50px;"></a>
                <a href="YogaRanking"><img src = "resources/assets/RankingImg/Yoga.png" style="width:70px; height:50px;"></a>
              </div>
               <p style = "color:black; font-size:17px;">음식&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;헬스&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;요가</p>
           </div>
        </header>
        
        <!-- 요가상품순위 라벨 -->
        <br><br>
        <center><h1>요가상품순위</h1></center>
        
        <!-- 상품랭킹 -->
        <section class="page-section portfolio">
            <div class="container">
            <!-- 고정바(순위,상품명,가격,마일리지,배송) 라벨-->
               <table style="width:100%">
                  <tr>
                     <th style="width:200px; height:43px;"><center><h3>순위</h3></center></th>
                     <th style="width:170px; height:43px;"><center></center></th>
                     <th style="width:200px; height:43px;"><center><h3>상품명</h3></center></th> 
                     <th style="width:200px; height:43px;"><center><h3>가격</h3></center></th>
                     <th style="width:200px; height:43px;"><center><h3>마일리지</h3></center></th>
                     <th style="width:250px; height:43px;"><center><h3>배송</h3></center></th>
                   </tr>
                </table>
                <!-- 밑줄 -->
                <div class="divider-custom" style="display:block;">
                    <hr style="background-color:black;">
                </div>
                
                
                <%int i=0;%>
                <!-- 상품 랭킹 1~5위 -->
                <!-- 상품랭킹1위-->
                <c:forEach items = "${productList}" var= "product">
                  <c:if test = "${product.getpName() eq '핸들링봉'}">
                		<table style="width:100%">
                   			<tr style="height:100px;">
                     			<th style="width:150px; height:43px;"><center><img class="img-fluid" src="resources/assets/RankingImg/first.png"  style="width:70px; height: 50px;"alt="" /></center></th>
                     			<th style="width:150px; height:43px;"><center><a href = "#"><img class="img-fluid" src="${product.getpUrl() }"  style="width:120px; height: 100px;"alt="" /></a></center>
                     			<th style="width:200px; height:43px;"><center><h4>${product.getpName() }</h4></center>
                     			<th style="width:150px; height:43px;"><center><h4>${product.getpPrice()}</h4></center>
                     			<th style="width:200px; height:43px;"><center><h3>${product.getpMile() }%</h3></center>
                     			<th style="width:200px; height:43px;"><center><h3>${product.getpShip() }</h3></center></th> 
                   			</tr>
                		</table>
                		<!-- 밑줄  -->
               			<div class="divider-custom" style="display:block;">
                    		<hr style="background-color:black;">
                		</div>
                  </c:if>
                </c:forEach>
                
                
                <!-- 상품랭킹2위 -->
                <c:forEach items = "${productList}" var= "product">
                  <c:if test = "${product.getpName() eq '요가복(여성)'}">
                		<table style="width:100%">
                   			<tr style="height:100px;">
                     			<th style="width:150px; height:43px;"><center><img class="img-fluid" src="resources/assets/RankingImg/second.png"  style="width:70px; height: 50px;"alt="" /></center></th>
                     			<th style="width:150px; height:43px;"><center><a href = "#"><img class="img-fluid" src="${product.getpUrl() }"  style="width:120px; height: 100px;"alt="" /></a></center>
                     			<th style="width:200px; height:43px;"><center><h4>${product.getpName() }</h4></center>
                     			<th style="width:150px; height:43px;"><center><h4>${product.getpPrice()}</h4></center>
                     			<th style="width:200px; height:43px;"><center><h3>${product.getpMile() }%</h3></center>
                     			<th style="width:200px; height:43px;"><center><h3>${product.getpShip() }</h3></center></th> 
                   			</tr>
                		</table>
                		<!-- 밑줄  -->
               			<div class="divider-custom" style="display:block;">
                    		<hr style="background-color:black;">
                		</div>
                  </c:if>
                </c:forEach>
                
                <!-- 상품랭킹3위 -->
                <c:forEach items = "${productList}" var= "product">
                  <c:if test = "${product.getpName() eq '요가매트'}">
                		<table style="width:100%">
                   			<tr style="height:100px;">
                     			<th style="width:150px; height:43px;"><center><img class="img-fluid" src="resources/assets/RankingImg/third.png"  style="width:70px; height: 50px;"alt="" /></center></th>
                     			<th style="width:150px; height:43px;"><center><a href = "#"><img class="img-fluid" src="${product.getpUrl() }"  style="width:120px; height: 100px;"alt="" /></a></center>
                     			<th style="width:200px; height:43px;"><center><h4>${product.getpName() }</h4></center>
                     			<th style="width:150px; height:43px;"><center><h4>${product.getpPrice()}</h4></center>
                     			<th style="width:200px; height:43px;"><center><h3>${product.getpMile() }%</h3></center>
                     			<th style="width:200px; height:43px;"><center><h3>${product.getpShip() }</h3></center></th> 
                   			</tr>
                		</table>
                		<!-- 밑줄  -->
               			<div class="divider-custom" style="display:block;">
                    		<hr style="background-color:black;">
                		</div>
                  </c:if>
                </c:forEach>
                
                <!-- 상품랭킹4위 -->
                <c:forEach items = "${productList}" var= "product">
                  <c:if test = "${product.getpName() eq '돌기마사지봉'}">
                		<table style="width:100%">
                   			<tr style="height:100px;">
                     			<th style="width:150px; height:43px;"><center><img class="img-fluid" src="resources/assets/RankingImg/forth.png"  style="width:70px; height: 50px;"alt="" /></center></th>
                     			<th style="width:150px; height:43px;"><center><a href = "#"><img class="img-fluid" src="${product.getpUrl() }"  style="width:120px; height: 100px;"alt="" /></a></center>
                     			<th style="width:200px; height:43px;"><center><h4>${product.getpName() }</h4></center>
                     			<th style="width:150px; height:43px;"><center><h4>${product.getpPrice()}</h4></center>
                     			<th style="width:200px; height:43px;"><center><h3>${product.getpMile() }%</h3></center>
                     			<th style="width:200px; height:43px;"><center><h3>${product.getpShip() }</h3></center></th> 
                   			</tr>
                		</table>
                		<!-- 밑줄  -->
               			<div class="divider-custom" style="display:block;">
                    		<hr style="background-color:black;">
                		</div>
                  </c:if>
                </c:forEach>
                
                <!-- 상품랭킹5위 -->
                <c:forEach items = "${productList}" var= "product">
                  <c:if test = "${product.getpName() eq '요가매트(칼라)'}">
                		<table style="width:100%">
                   			<tr style="height:100px;">
                     			<th style="width:150px; height:43px;"><center><img class="img-fluid" src="resources/assets/RankingImg/fifth.png"  style="width:70px; height: 50px;"alt="" /></center></th>
                     			<th style="width:150px; height:43px;"><center><a href = "#"><img class="img-fluid" src="${product.getpUrl() }"  style="width:120px; height: 100px;"alt="" /></a></center>
                     			<th style="width:200px; height:43px;"><center><h4>${product.getpName() }</h4></center>
                     			<th style="width:150px; height:43px;"><center><h4>${product.getpPrice()}</h4></center>
                     			<th style="width:200px; height:43px;"><center><h3>${product.getpMile() }%</h3></center>
                     			<th style="width:200px; height:43px;"><center><h3>${product.getpShip() }</h3></center></th> 
                   			</tr>
                		</table>
                		<!-- 밑줄  -->
               			<div class="divider-custom" style="display:block;">
                    		<hr style="background-color:black;">
                		</div>
                  </c:if>
                </c:forEach>
            </div>  
        </section>
        
        <!-- Copyright Section(맨밑 하단)-->
        <div class="copyright py-4 text-center text-white">
            <div class="container"><small><a href ="#">회사소개</a>｜ <a href ="#">이용약관</a> ｜ <a href ="#">개인정보처리방침</a><br>
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