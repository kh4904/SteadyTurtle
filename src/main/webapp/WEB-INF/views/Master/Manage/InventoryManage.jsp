<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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

<!-- 재고관리 -->

</head>
   <body id="page-top">
        <!-- Navigation 맨위 로고-->
        <nav class="navbar " id="mainNav" style="width:100%; height:300px; background-color:#000000;">
            <div class="container-fluid">
                 <div class="col-lg-4">
                   <a class="navbar-brand js-scroll-trigger" href="mainMaster"><img src = "resources/assets/img/SteadyTurtle.png" style = "position:relative; top:-40px;"></a>
                </div> 
                 <!-- 검색창 -->
                <div class ="col-lg-5">
               <form class="navbar-form navbar-left" role="search">
                  <div class="row">
                      <div class="jumbotron" style="padding-top: 1px; width: 700px; height: 10px; position:relative; left:-60px;">
                        <h2 style="position:relative; top:10px; text-align:center;">관리자 모드</h2>
                     </div>
                    </div>
                 </form>
                    
                 <!-- 판매현황, 주문내역, 상품관리, 회원관리 문구 -->
                     <ul class="nav nav-pills" style="position:relative; top:30px; left:-50px;">
                     <li role="presentation" style="position:relative; "><a href="SalesStatus" style="color:#ffff8d; text-decoration:none; font-size:30px;">판매현황</a></li>
                     <li role="presentation" style="position:relative; left:30px;"><a href="OrderHistory" style="color:#ffff8d; text-decoration:none; font-size:30px;">주문내역</a></li>
                     <li role="presentation" style="position:relative; left:60px;"><a href="ProductManagement" style="color:#ffff8d; text-decoration:none; font-size:30px;">상품관리</a></li>
                     <li role="presentation" style="position:relative; left:90px;"><a href="CustomerManage" style="color:#ffff8d; text-decoration:none; font-size:30px;">회원관리</a></li>
                   </ul>
              </div> 
                
                <!-- 로그인창 -->
                <div class = "col-lg-3">
                       <!-- 재고관리, 환불요청, 고객문의 -->
                       <ul class="nav nav-pills">
                     <li role="presentation" style="position:relative; left:40px;"><a href="InventoryManage" style="color:#fff;">재고관리</a></li>
                     <li role="presentation" style="position:relative; left:60px;"><a href="MRefund" style="color:#fff;">환불요청</a></li>
                     <li role="presentation" style="position:relative; left:80px;"><a href="MCustomerWriteView" style="color:#fff;">고객문의</a></li>
                   </ul>
                   
                   <!-- 회원,관리자모드 -->
                   <div class="jumbotron" style="padding-top: 20px; width: 400px; height: 190px; position:relative; top:10px; left:-100px;">
                     <ul class="nav nav-tabs">
                        <li role="presentation" class="active" style="position: relative; left: 60px;"><a href="LoginSuccess" style="text-decoration:none; color:#bdbdbd;">회원</a></li>
                        <li role="presentation" class="active" style="position: relative; left: 180px;">관리자모드</li>
                     </ul>
                     <ul class="nav nav-pills" style="position: relative; top: 40px; left: 40px;">
                        <li role="presentation" class="active">
                           <h3>관리자</h3>
                        </li>
                        <li role="presentation" style="position: relative; left: 70px;">
                           <h3>원태연 님</h3>
                        </li>
                     </ul>
                     <br><br>
                     <hr>
                     <!-- 회원정보수정,로그아웃 -->
                     <ul class="nav nav-pills" style="position: relative; top: -15px; left: 30px;">
                        <li role="presentation" class="active"><a href="MyPage" style="color:black; text-decoration:none;">회원정보수정</a></li>
                        <li role="presentation" style="position: relative; left: 120px;">
                           <a href="main" style="color:black; text-decoration:none;">로그아웃</a>
                        </li>
                     </ul>
                  </div>
                </div>
         </div>
      </nav>
     
     
     <!-- 재고관리 --> 
    <section class="page-section portfolio">
       <div class="container">
          <div class="col-lg-12">
             <div class="row">
                <table style="width:100%;" border="1">
                   <tr>
                      <td>
                      <div style="height:150px;  width:100%;overflow-y:scroll">
                         <table style="width:100%; text-align:center;">
                            <tr>
                               <td>
                                  <h5>상품</h5>
                               </td>
                               <td>
                                  <h5>남은수량 9개</h5>
                               </td>
                               <td>
                                  <a class="btn" href="#" style="background-color:#e0e0e0;">추가하기</a>
                               </td>
                            </tr>
                            <tr>
                               <td>
                                  <h5>상품</h5>
                               </td>
                               <td>
                                  <h5>남은수량 9개</h5>
                               </td>
                               <td>
                                  <a class="btn" href="#" style="background-color:#e0e0e0;">추가하기</a>
                               </td>
                            </tr>
                            <tr>
                               <td>
                                  <h5>상품</h5>
                               </td>
                               <td>
                                  <h5>남은수량 9개</h5>
                               </td>
                               <td>
                                  <a class="btn" href="#" style="background-color:#e0e0e0;">추가하기</a>
                               </td>
                            </tr>
                         </table>
                      </div>
                      </td>
                   </tr>
                </table>
                <br />
                <!-- 밑줄 -->
                   <div class="divider-custom" style="display:block;">
                       <hr style="background-color:black;">
                   </div>
                   <br />
                <table style="width:100%;">
                   <tr>
                      <td>
                         <h6>상품명</h6>
                      </td>
                      <td>
                         <h6>수량</h6>
                      </td>
                      <td>
                         <h6>상품명</h6>
                      </td>
                      <td>
                         <h6>수량</h6>
                      </td>
                      <td>
                         <h6>상품명</h6>
                      </td>
                      <td>
                         <h6>수량</h6>
                      </td>
                   </tr>
                </table>
                <br/>
                <!-- 밑줄 -->
                   <div class="divider-custom" style="display:block;">
                       <hr style="background-color:black;">
                   </div>
                   <div class="col-lg-4">
                      <table style="width:100%">
                         <tr>
                            <td rowspan="2">
                               <img class="img-fluid" src="resources/assets/FoodImg/f2.jpg" style="width:110px; height: 100px;">
                            </td>
                            <td>
                               <h5>9개</h5>
                            </td>   
                         </tr>
                         <tr>
                            <td>
                               <a class="btn" href="#" style="background-color:#e0e0e0;">추가하기</a>
                            </td>
                         </tr>
                      </table>
                   </div>
                   <div class="col-lg-4">
                      <table style="width:100%">
                         <tr>
                            <td rowspan="2">
                               <img class="img-fluid" src="resources/assets/FoodImg/f3.jpg" style="width:110px; height: 100px;">
                            </td>
                            <td>
                               <h5>9개</h5>
                            </td>   
                         </tr>
                         <tr>
                            <td>
                               <a class="btn" href="#" style="background-color:#e0e0e0;">추가하기</a>
                            </td>
                         </tr>
                      </table>
                   </div>
                   <div class="col-lg-4">
                      <table style="width:100%">
                         <tr>
                            <td rowspan="2">
                               <img class="img-fluid" src="resources/assets/FoodImg/f1.jpg" style="width:110px; height: 100px;">
                            </td>
                            <td>
                               <h5>9개</h5>
                            </td>   
                         </tr>
                         <tr>
                            <td>
                               <a class="btn" href="#" style="background-color:#e0e0e0;">추가하기</a>
                            </td>
                         </tr>
                      </table>
                   </div>
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
   
   <!-- 여기서부터 관리자페이지 부트스트랩 추가 -->
   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
   <script src="resources/js/scripts.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
   <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
   <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>

</body>
</html>