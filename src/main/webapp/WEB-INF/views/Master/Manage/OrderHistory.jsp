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
<!-- 주문내역 페이지 -->
	<body id="page-top">
        <!-- Navigation 맨위 로고-->
        <%@ include file="/WEB-INF/views/Master/Mastermenu.jsp" %>     

	<!-- 게시판 -->
	<section class="page-section portfolio" style="min-height: 600px;">
		<div class="container">
			
				<table class="table table-striped" style="position:relative; left:-80px; width:1250px; text-align: center; border: 1px solid #dddddd">
					<tbody>
						<tr>
						    <td>주문번호</td>
							<td>상품명</td>
							<td style="width: 20%;">주문날짜</td>
							<td>구매자</td>
							<td>아이디</td>
							<td>주문수량</td>
							<td>결제금액</td>
							<td>결재상태</td>
							<td></td>
							<td></td>
							
						</tr>
					<% int i = 0; %>
					<c:forEach items="${jumunList}" var="jumun">
						<tr>
							<td>${jumun.getjNum() }</td>
							<td style="width: 20%;">${jumun.getjName() }</td>
							<td>${jumun.getjJumunDate() }</td>
							<td>${jumun.getjCustomer() }</td>
							<td>${jumun.getjId() }</td>
							<td>${jumun.getjCount() }</td>
							<td><fmt:formatNumber pattern="###,###,###" value="${jumun.getjPrice()}" /></td>
							<c:choose>
								<c:when test="${jumun.getjState() eq '승인'}">
       							 <td style="color:blue;">승인</td>
    							</c:when>
    							<c:when test="${jumun.getjState() eq '미승인'}">
        						 <td style="color:red;">미승인</td>
    							</c:when>
    							<c:when test="${jumun.getjState() eq '배송'}">
        						 <td style="color:blue;">배송</td>
    							</c:when>
							</c:choose>
							<c:if test = "${jumun.getjState() eq '미승인' }">
							<td>
								<form action="jumunState" method="POST">
            					<input type="hidden" id="jNum" name="jNum" value="${jumun.getjNum()}">
									<input type="submit" class="btn btn-primary pull-right" value="승인" />
								</form>
							</td>
							<td >
								<text class="btn" style="width:92px; height: 40px; background-color:#e0e0e0;" >배송완료</text>
							</td>
							</c:if>
							<c:if test = "${jumun.getjState() eq '승인' }">
							<td>
								<text class="btn" style=" background-color:#e0e0e0;" >승인</text>
							</td>
							<td >
								<form action="sellSave" method="POST">
            						<input type="hidden" id="sProduct" name="sProduct" value="${jumun.getjName()}">
            						<input type="hidden" id="sId" name="sId" value="${jumun.getjId()}">
            						<input type="hidden" id="sCate" name="sCate" value="${jumun.getjCate()}">
            						<input type="hidden" id="sPrice" name="sPrice" value="${jumun.getjPrice() + jumun.getjShipPrice() - jumun.getjMile()}">
            						<input type="hidden" id="sCount" name="sCount" value="${jumun.getjCount()}">
            						<input type="hidden" id="sCustomer" name="sCustomer" value="${jumun.getjCustomer()}">
            						<input type="hidden" id="sGender" name="sGender" value="남성">
            						<input type="hidden" id="jNum" name="jNum" value="${jumun.getjNum()}">
										<input type="submit" class="btn btn-primary pull-right" value="배송완료" />
								</form>
							</td>
							</c:if>
							<c:if test = "${jumun.getjState() eq '배송' }">
							<td>
								<text class="btn" style=" background-color:#e0e0e0;" >승인</text>
							</td>
							<td >
								<text class="btn" style="width:92px; height: 40px; background-color:#e0e0e0;" >배송완료</text>
							</td>
							</c:if>
						</tr>
				    </c:forEach>
					</tbody>
				</table>
				</div>
	</section>
	
	<!-- 게시글 페이징 처리(기준 10개) -->
	<nav aria-label="Page navigation">
		<ul class="pagination justify-content-center" style="position:relative; top:-80px;">

			<!-- 첫 페이지면 Disabled 아니라면 Enabled -->
			<c:choose>
				<c:when test="${Paging.pageNo eq Paging.firstPageNo }">
					<li class="page-item disabled"><a class="page-link"
						href="OrderHistory?page=${Paging.prevPageNo}">Previus</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="OrderHistory?page=${Paging.prevPageNo}">Previus</a></li>
				</c:otherwise>
			</c:choose>
			<!-- 페이지 갯수만큼 버튼 생성 -->
			<c:forEach var="i" begin="${Paging.startPageNo }"
				end="${Paging.endPageNo }" step="1">
				<c:choose>
					<c:when test="${i eq Paging.pageNo }">
						<li class="page-item disabled"><a class="page-link"
							href="OrderHistory?page=${i}"><c:out value="${i}" /></a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="OrderHistory?page=${i}"><c:out value="${i}" /></a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<!-- 마지막 페이지면 Disabled 아니라면 Enabled -->
			<c:choose>
				<c:when test="${Paging.pageNo eq Paging.finalPageNo }">
					<li class="page-item disabled"><a class="page-link"
						href="OrderHistory?page=${Paging.nextPageNo}">Next</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="OrderHistory?page=${Paging.nextPageNo}">Next</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
	
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