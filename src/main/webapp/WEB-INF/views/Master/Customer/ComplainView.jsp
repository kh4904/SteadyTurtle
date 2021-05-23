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
    <!-- 고객문의 상세내용 보기 페이지 -->
	<body id="page-top">
        <!-- Navigation 맨위 로고-->
        <%@ include file="/WEB-INF/views/Master/Mastermenu.jsp" %>  
	
	<!-- 고객문의 상세내용 및 답변달기 -->
	<section class="page-section portfolio" id="portfolio">
	     <div class="container">
        <div class="row">
            <table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
                  <!-- 글제목,카테고리,작성일,작성자 라벨 -->
                 <thead>
                     <tr>
                         <th colspan="2" style="background-color: #eeeeee;">글 제목</th>
                         <th style="background-color: #eeeeee;">카테고리</th>
                         <th style="background-color: #eeeeee;">작성일</th>
                         <th style="background-color: #eeeeee;">작성자</th>
                     </tr>
                 </thead>
                 
                 <!-- 고객문의 내용 -->
                 <tbody>
                 <% int i = 0; %>
				 <c:forEach items="${boardList}" var="board">
				  	<c:if test="${board.getbTitle() eq '제품에 이상이많아요' }">
                     <tr>
                         <td colspan="2">${board.getbTitle() }</td>
                         <td>${board.getbCate() }</td>
                         <td>${board.getbDate() }</td>
                         <td>${board.getmName() }</td>
                     </tr>
                     <tr>
                         <td colspan="6" style="height: 300px; text-align: left;">
                         	${board.getbNote() }
                         </td>
                     </tr>
                     </c:if>
                  </c:forEach>
                     
                     <!-- 관리자가 답변달아주는곳 -->
                     <tr>
                         <td colspan="6">
                         	<textarea class = "form-control" style="text-align: center; width:1145px; height:300px; resize:none;" placeholder="답변달기"></textarea>
                         </td>
                     </tr>
                 </tbody>
            </table>
            
            <!-- 이동버튼 -->
            <div class ="contanier" style="position:relative; left:950px;">
            	<a href="MCustomerWriteView" class="btn btn-primary" style="">목록</a>
            	<a href="#" class="btn btn-primary" style="">삭제</a>
           	 	<a href="#" class="btn btn-primary" style="">답변달기</a>
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