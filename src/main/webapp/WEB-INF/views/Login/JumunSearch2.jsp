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
<!-- 주문조회 -->
<body id="page-top">
   <!-- Navigation 맨위 로고-->
   <%@ include file="/WEB-INF/views/menu.jsp"%>


   <!-- 주문조회-->
   <section class="page-section portfolio">
      <div class="container" style="width: 1431px; min-height: 1000px;">
         		<!-- 주문조회 문구 및 밑줄표시-->
            	<h2 class="page-section-heading text-uppercase text-secondary mb-0">주문조회</h2>
            	<!-- 밑줄 -->
            	<div class="divider-custom" style="display: block;">
               	<hr style="background-color: black;">
           		 </div>
           	<c:if test="${blogin != null }">
            <div class="row">
               <!-- 주문내역 출력 -->
               <c:forEach items="${jumunList}" var="jumun">
                  <c:if test="${jumun.getjCustomer() eq sessionScope.blogin.getjCustomer()}">
                  <c:if test="${jumun.getjPhone() eq sessionScope.blogin.getjPhone()}">
                  <form action="DetailOrder" method="POST">
                  <input type="hidden" id="jNum" name="jNum" value="${jumun.getjNum() }">
                  <input type="hidden" id="jName" name="jName" value="${jumun.getjName() }">
               
                  <!-- 주문일자, 주문번호, 주문상세>> 및 밑줄 -->
               <div class="divider-custom"
                  style="display: block; width: 1140px; height: 30px;">
                  <p>
                     <b>&emsp;&emsp;&emsp;&nbsp; ${jumun.getjJumunDate() }
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 주문번호 ${jumun.getjNum() }
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        
                        <input type="submit" class="btn" style="height:30px;" value="주문상세 >" >
                     </b>
                  </p>
                  <hr class="divider-custom" style="background-color: black;">
               </div>
                     <table style="width: 100%;">
                        <tr style="height: 100px;">
                           <th style="width: 200px; height: 35px;"><center>
                             <input type="image" src="resources/assets/img${jumun.getjUrl()}" style="width: 120px; height: 100px;" >
                              </center>
                           <th style="width: 300px; height: 35px;"><center>
                                 <h4>${jumun.getjName() }</h4>
                              </center>
                           <th style="width: 250px; height: 35px;"><center>
                                 <h4><fmt:formatNumber pattern="###,###,###" value="${jumun.getjPrice()}" />원</h4>
                              </center>
                           <th style="width: 250px; height: 35px;"><center>
                                 <h4>${jumun.getjCount()}  개</h4>
                              </center>
                           <th style="width: 150px; height: 35px;"><center>
                                 <h4 style="color: orange;">${jumun.getjShip() }</h4>
                              </center></th>
                        </tr>
                      
                     </table>
                     </form>
                     </c:if>
                  </c:if>
               </c:forEach>
            </div>
         </c:if>
      </div>
   </section>

   <div class="container">
      <!-- 밑줄 -->
      <div class="divider-custom" style="display: block;">
         <hr style="background-color: black;">
      </div>
   </div>

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