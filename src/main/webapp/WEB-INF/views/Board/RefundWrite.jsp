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
<!-- 아이디 비밀번호 찾기 -->
<body id="page-top">
	<!-- Navigation 맨위 로고-->
	<%@ include file="/WEB-INF/views/menu.jsp"%>
      
   <!-- 환불 -->
   <!-- 환불요청 글쓰기 -->
   <section class="page-section portfolio">
  
      <div class="container">
         <div class="col-lg-12">
         <c:if test ="${member.mId != null }">
         <form method="post" action="refundwrite" enctype="multipart/form-data">
         <input type="hidden" id = "rNumber" name="rNumber" value="${jumun.getjNum() }">
         <input type="hidden" id = "rProduct" name="rProduct" value="${jumun.getjName() }">
         <input type="hidden" id = "rId" name="rId" value="${member.getmId() }">
         <input type="hidden" id = "rName" name="rName" value="${member.getmName() }">
         <input type="hidden" id = "rEmail" name="rEmail" value="${member.getmEmail() }">
         <input type="hidden" id = "rPhone" name="rPhone" value="${member.getmPhone() }">
         <input type="hidden" id = "rGrade" name="rGrade" value="${member.getmGrade() }">
         <input type="hidden" id = "rUrl" name="rUrl" value="${jumun.getjUrl() }">
         <input type="hidden" id = "rJumunDate" name="rJumunDate" value="${jumun.getjJumunDate() }">
         <input type="hidden" id = "rFinishDate" name="rFinishDate" value="${jumun.getjFinishDate() }">
         <input type="hidden" id = "jNum" name="jNum" value="${jumun.getjNum() }">
            
            <table>
            
               <tr>
                  <th style="text-align: left;">
                  	<img class="img-fluid" src="resources/assets/img${jumun.getjUrl() }" style="width: 220px; height: 200px;" />
                  </th>
                  <th rowspan="4">
                     <div style="text-align: right; margin-left: 20px;">
                        <textarea class="form-control" placeholder="꼭 기재 해주세요. 1) 환불사유 2) 배송완료일 3) 상품사진첨부 4) 통장사본사진첨부" id="rNote" name="rNote" maxlength="2048" style="width: 700px; height: 300px; resize:none;"></textarea>
                     </div>
                  </th>
               </tr>
               <tr>
                  <th style="text-align: center;">${jumun.getjName() }</th>
               </tr>
               <tr>
                  <th style="text-align: center;"><fmt:formatNumber pattern="###,###,###" value="${jumun.getjPrice() - jumun.getjMile() }" />원</th>
               </tr>
               <tr>
                  <th style="text-align: center;">${jumun.getjCount() } 개</th>
               </tr>
            </table>
               <table>
                  <tr>
                     <th>
                        <div class="fileBox">
                           <input type="file" id="pImg" name="file" />
							<div class="select_img"><img src="" /></div>
								<script>
									$("#pImg").change(function(){
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
                     </th>
                  </tr>
               </table>
               <br /> <br />
               <table>
                  <tr>
                     <th>
                        <div style="margin-left: 525px; position:relative; left:180px;">
                           <a href="DetailRefund" class="btn btn-info" style="width: 100px; height: 40px;">뒤로가기</a> 
                           <input type="submit" class="btn btn-info" style="margin-left: 10px; width: 100px; height: 40px;" value="환불신청" />
                        </div>
                     </th>
                  </tr>
                 
               </table>
          </form>
               
            
            </c:if>
            </div>
         </div>
   </section>
   <c:if test ="${member.mId == null }">
			<script>
				alert("로그인후 사용가능")
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