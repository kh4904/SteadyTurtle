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
<!-- 환불요청 상세내용 보기 페이지 -->
<body id="page-top">
        <!-- Navigation 맨위 로고-->
        <%@ include file="/WEB-INF/views/Master/Mastermenu.jsp" %>
        
   <!-- 환불신청 -->
   <section class="page-section portfolio">
      <div class="container">
         <div class="col-lg-12">
            <table>
               <tr>
                  <td>
                     <img style="width: 220px; height: 200px;" class="img-fluid" src="resources/assets/FoodImg/f2.jpg" />
                  </td>
                  <td rowspan="4">
                     <textarea  class="form-control" placeholder="사유 : 기구가 저랑 안맞아요<br/>배송완료일 : 2021.04.02" name="bbsContent" maxlength="2048" style="width: 700px; height: 300px;"></textarea>
                  </td>
               </tr>
               <tr>
                  <th style="text-align: center;">프로틴(초코)</th>
               </tr>
               <tr>
                  <th style="text-align: center;">10,000원</th>
               </tr>
               <tr>
                  <th style="text-align: center;">1 개</th>
               </tr>
            </table>
            <table>
               <tr>
                  <th>
                     <div class="fileBox">
                        <input type="text" id="img-file" readonly="readonly" style="width:820px; height: 35px;">
                        <input type="button" value="파일업로드" onclick="onclick=document.all.file.click()">
                        <input type="file" name="file" id="fileDocument" onchange="javascript:document.getElementById('img-file').value=this.value" style="display:none">
                     </div>
                  </th>
               </tr>
               <tr>
                  <th>
                     <div class="fileBox">
                        <input type="text" id="img-file2" readonly="readonly" style="width:820px; height: 35px;">
                        <input type="button" value="파일업로드" onclick="onclick=document.all.file2.click()">
                        <input type="file" name="file2" id="fileDocument2" onchange="javascript:document.getElementById('img-file2').value=this.value" style="display:none">
                     </div>
                  </th>
               </tr>
            </table>
            <table style="width: 700px;">
               <tr>
                  <td>
                     <h6 style="text-align:left;">이름 :</h6>
                  </td>
                  <td>
                     <h6 style="text-align:left;">박남일</h6>
                  </td>
                  <td>
                     <h6 style="text-align:left;">상품구매일 :</h6>
                  </td>
                  <td>
                     <h6 style="text-align:left;">2021.03.30</h6>
                  </td>
               </tr>
               <tr>
                  <td>
                     <h6 style="text-align:left;">아이디 :</h6>
                  </td>
                  <td>
                     <h6 style="text-align:left;">namil12</h6>
                  </td>
                  <td>
                     <h6 style="text-align:left;">배송완료일 :</h6>
                  </td>
                  <td>
                     <h6 style="text-align:left;">2021.04.02</h6>
                  </td>
               </tr>
               <tr>
                  <td>
                     <h6 style="text-align:left;">이메일 :</h6>
                  </td>
                  <td>
                     <h6 style="text-align:left;">namilLove@naver.com</h6>
                  </td>
                  <td>
                     <h6 style="text-align:left;">등급 :</h6>
                  </td>
                  <td>
                     <h6 style="text-align:left;">플래티넘</h6>
                  </td>
               </tr>
               <tr>
                  <td>
                     <h6 style="text-align:left;">전화번호 :</h6>
                  </td>
                  <td>
                     <h6 style="text-align:left;">010-8282-5252</h6>
                  </td>
               </tr>
            </table>
            <div style="text-align: right;">
               <form action="MRefund" method="post">
                  <input type="submit" class="btn btn-primary" value="뒤로가기" onclick="#">
                  <input type="submit" class="btn btn-primary" value="환불완료" onclick="#">
               </form>
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
            Email. steadyturtle@kyungmin.ac.kr </small>
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
   <script src="resources/js/scripts.js"></script>
</body>
</html>