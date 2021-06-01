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
<!-- 아이디 비밀번호 찾기 -->
<body id="page-top">
	<!-- Navigation 맨위 로고-->
	<%@ include file="/WEB-INF/views/menu.jsp"%>
        
        <!-- 상품환불 조회 --> 
        <section class="page-section portfolio" style="height:1000px;">
            <div class="container">
            <table style="width:100%">
                   <tr style="height:10px;">
				   		<h3>상품환불</h3>
				   </tr>
				   
				   <!-- 밑줄 -->
				   <div class="divider-custom" style="display:block;">
                      <hr style="background-color:black;">
                   </div>
                   <!-- 환불테이블 라벨 -->
               		<tr>
               		    <h5>&emsp;&emsp;&emsp;&emsp;&emsp;상품정보
                			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;주문일자
                  			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;주문번호
                  			&emsp;&emsp;&emsp;&emsp;&emsp;주문금액
                    		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;주문상태
                		</h5>
                	</tr>
                	<!-- 밑줄 -->
                	<div class="divider-custom" style="display:block;">
                    	<hr style="background-color:black;">
                	</div>
             <c:if test="${member.mId != null }">
                
                <!-- 상품정보 -->
                <c:forEach items="${jumunList}" var="jumun">
                  <c:if test="${jumun.getjId() eq sessionScope.member.getmId()}">
               		<tr>
                	<th style="width:250px;"><img class="img-fluid" src="${jumun.getjUrl() }"  style="width:110px; height: 100px;"/></th>
               		<th style="width:300px;">${jumun.getjName() }</th>
                    <th style="width:350px;">${jumun.getjJumunDate() }</th>
                    <th style="width:300px;">${jumun.getjNum() }</th>
                    <th style="width:200px;">${jumun.getjPrice()}원<br>${jumun.getjCount() }개</th>
                    <th style="width:150px;">
                    <c:choose>
                    	<c:when test="${jumun.getjShip() eq '환불완료'}">
        					<h style="color:red;">${jumun.getjShip() }</h>
    					</c:when>
    					<c:when test="${jumun.getjShip() ne '환불완료'}">
        					<h style="color:orange;">${jumun.getjShip() }</h>
    					</c:when>
    				</c:choose>
                    </th>
                    <th style="width:150px; height:100px;">
                        <c:choose>
							<c:when test="${jumun.getjShip() eq '배송준비'}">
       							<!-- 주문취소 버튼 -->
       							<form action="jumundelete" method="POST">
                  					<input type="hidden" id="jNum" name="jNum" value="${jumun.getjNum() }">
                    					<input type="submit" class="btn btn-primary form-control" value="주문취소" style=" position:relative; top:-10px; height:40px; width: 100px;"></input>
                    			</form>
                    			<!-- 상품환불 버튼 비활성화 -->
                    			<text class="btn" style="width: 100px; height: 40px; background-color:#e0e0e0;" >상품환불</text>
    						</c:when>
    						<c:when test="${jumun.getjShip() eq '배송중'}">
        						<!-- 주문취소 버튼 비활성화 -->
    							<text class="btn" style=" position:relative; top:-10px; height:40px; width: 100px; background-color:#e0e0e0;" >주문취소</text>
                    			<!-- 상품환불 버튼 비활성화 -->
                    			<text class="btn" style="width: 100px; height: 40px; background-color:#e0e0e0;" >상품환불</text>
    						</c:when>
    						<c:when test="${jumun.getjShip() eq '배송완료'}">
    						    <!-- 주문취소 버튼 비활성화 -->
    							<text class="btn" style=" position:relative; top:-10px; height:40px; width: 100px; background-color:#e0e0e0;" >주문취소</text>
                    			<!-- 상품환불 버튼 -->
                    			<form action="DetailRefund" method="POST">
                  					<input type="hidden" id="jNum" name="jNum" value="${jumun.getjNum() }">
                    			<input type="submit" class ="btn btn-primary form-control" style="width: 100px; height: 40px;" value="상품환불"  >
                    			</form>
    						</c:when>
    						<c:when test="${jumun.getjShip() eq '환불요청'}">
        						<!-- 주문취소 버튼 비활성화 -->
    							<text class="btn" style=" position:relative; top:-10px; height:40px; width: 100px; background-color:#e0e0e0;" >주문취소</text>
                    			<!-- 상품환불 버튼 비활성화 -->
                    			<text class="btn" style="width: 100px; height: 40px; background-color:#e0e0e0;" >상품환불</text>
    						</c:when>
    						<c:when test="${jumun.getjShip() eq '환불완료'}">
        						<!-- 주문취소 버튼 비활성화 -->
    							<text class="btn" style=" position:relative; top:-10px; height:40px; width: 100px; background-color:#e0e0e0;" >주문취소</text>
                    			<!-- 상품환불 버튼 비활성화 -->
                    			<text class="btn" style="width: 100px; height: 40px; background-color:#e0e0e0;" >상품환불</text>
    						</c:when>
						</c:choose>
                    </th>
                	</tr>
                  </c:if>
                </c:forEach>
             </c:if>
             </table>
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
