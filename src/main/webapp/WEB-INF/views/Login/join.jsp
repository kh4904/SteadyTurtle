<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <!-- 회원가입 -->
    <body id="page-top">
        <!-- Navigation 맨위 로고-->
        <nav class="navbar " id="mainNav" style="width:100%; height:300px; background-color:#000000;">
            <div class="container-fluid">
                 <div class="col-lg-4">
                   <a class="navbar-brand js-scroll-trigger" href="main"><img src = "resources/assets/img/SteadyTurtle.png" style = "width: 500px; height:190px; position:relative; top:-40px; left:80px;"></a>
                </div> 
                 <!-- 검색창 -->
                <div class ="col-lg-5">
               <form class="navbar-form navbar-left" role="search">
                  <div class="row">
                      <div class="form-group">
                        <input type="text" class="form-control" placeholder="검색창" style="width:500px; height:50px;">
                     </div>
                      <button type="submit" class="btn btn-default"><i class ="fas fa-search" style="width:30px; height:30px; color:#fff;"></i></button>
                    </div>
                 </form>
                    
                 <!-- 헬스기구, 요가상품, 운동식품, 상품랭킹 문구 -->
                     <ul class="nav nav-pills" style="position:relative; top:30px; left:-50px;">
                     <li role="presentation" style="position:relative; "><a href="Health" style="color:#ffff8d; text-decoration:none; font-size:30px;">헬스기구</a></li>
                     <li role="presentation" style="position:relative; left:30px;"><a href="Yoga" style="color:#ffff8d; text-decoration:none; font-size:30px;">요가상품</a></li>
                     <li role="presentation" style="position:relative; left:60px;"><a href="Food" style="color:#ffff8d; text-decoration:none; font-size:30px;">운동식품</a></li>
                     <li role="presentation" style="position:relative; left:90px;"><a href="#" style="color:#fff; text-decoration:none; font-size:30px;" data-toggle="dropdown"> <label style="color:#ffff8d;">상품랭킹</label> <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                           <li><a href="ManRanking" style="color:#000000;">남여랭킹</a></li>
                           <li><a href="HealthRanking" style="color:#000000;">헬스기구 랭킹</a></li>
                           <li><a href="YogaRanking" style="color:#000000;">요가용품 랭킹</a></li>
                           <li><a href="FoodRanking" style="color:#000000;">건강식품 랭킹</a></li>
                        </ul>
                         </li>
                   </ul>
              </div> 
                
                <!-- 로그인창 -->
                <div class = "col-lg-3">
                       <!-- 장바구니, 상품환불, 고객문의 -->
                       <ul class="nav nav-pills">
                     <li role="presentation" style="position:relative; left:40px;"><a href="basket" style="color:#fff;">장바구니</a></li>
                     <li role="presentation" style="position:relative; left:60px;"><a href="refund" style="color:#fff;">상품환불</a></li>
                     <li role="presentation" style="position:relative; left:80px;"><a href="CustomerWriteView" style="color:#fff;">고객문의</a></li>
                   </ul>
                   
                   <!-- 회원, 비회원(주문조회) -->
                   <div class="jumbotron"  style="padding-top: 20px; width: 400px; height: 190px; position:relative; top:10px; left:-100px;">
                    <ul class="nav nav-tabs">
                     <li class="nav-item in active" role="presentation" style="position: relative; left: 60px;">
                        <a href="#login" data-toggle="tab" data-load="true" style="color:#000000;">회원</a>
                     </li>
                     <li class="nav-item" role="presentation" style="position: relative; left: 150px;">
                        <a href="#nLogin" data-toggle="tab" data-load="false" style="color:#000000;">비회원(주문조회)</a>
                     </li>
                   </ul>
                     <br>
                     
                       <!-- 회원 ,비회원(주문하기) 탭창 클릭시 변화 (로그인폼) -->
                       <div class="tab-content">
                  <div class="tab-pane fade show active" id="login">
                     <!-- 아이디, 비밀번호 입력후 로그인버튼 이벤트 -->
                     <form method="post" action="LoginSuccess">
                         <!-- 아이디입력 -->
                        <div class="form-group" style="position: relative; top: 1px;">
                           I D : <input type="text" class="form-control" placeholder="아이디" id="mId" name="mId" maxlength="20" style="width: 200px; height: 40px; position: relative; left: 40px; top: -30px;">
                        </div>
                        <!-- 비밀번호입력 -->
                        <div class="form-group" style="position: relative; top: -30px;">
                           PW : <input type="password" class="form-control" placeholder="비밀번호" id = "mPw" name="mPw" maxlength="20" style="width: 200px; height: 40px; position: relative; left: 40px; top: -30px;">
                        </div>
                        <!-- 로그인버튼 -->
                        <input type="submit" class="btn" value="로그인" style="color:#fff;  background-color:#373737; width: 100px; height: 80px; position: relative; top: -160px; left: 250px;">
                     </form>
                     
                     <!-- 아이디, 비밀번호찾기 ,회원가입 -->
                             <ul class="nav nav-pills" style="position:relative; top:-150px; left:30px;">
                           <li role="presentation"><a href="idSearch" style="color:#000000;">아이디 ·</a></li>
                           <li role="presentation"><a href="idSearch" style="color:#000000;">비밀번호 찾기</a></li>
                           <li role="presentation" style="position:relative; left:60px;"><a href="join" style="color:#000000;">회원가입</a></li>
                        </ul>
                  </div>
                  
                  <!-- 회원 ,비회원(주문하기) 탭창 클릭시 변화 (비회원 주문조회폼) -->
                  <div class="tab-pane fade" id="nLogin">
                     <!-- 이름, 전화번호 입력후 배송조회버튼 이벤트 -->
                     <form method="post" action="loginAction.jsp">
                         <!-- 이름 입력 -->
                        <div class="form-group" style="position: relative; top: 1px;">
                              이름 <input type="text" class="form-control" placeholder="입력해주세요" name="userName" maxlength="20" style="width: 200px; height: 40px; position: relative; left: 40px; top: -30px;">
                        </div>
                        <!-- 전화번호 입력 -->
                        <div class="form-group" style="position: relative; top: -30px;">
                           P.H.<input type="text" class="form-control" placeholder="입력해주세요" name="userNumber" maxlength="20" style="width: 200px; height: 40px; position: relative; left: 40px; top: -30px;">
                        </div>
                        <!-- 배송조회 버튼 -->
                        <input type="submit" class="btn" value="배송조회" style="color:#fff;  background-color:#373737; width: 100px; height: 80px; position: relative; top: -160px; left: 250px;">
                     </form>
                     <!-- 회원가입 -->
                             <ul class="nav nav-pills" style="position:relative; top:-150px; left:200px;">
                           <li role="presentation" style="position:relative; left:60px;"><a href="join" style="color:#000000;">회원가입</a></li>
                         </ul>
                  </div>
                     </div>
                    </div>
                </div>
         </div>
      </nav>
            
        <!-- 회원가입  -->
        <section class="page-section portfolio" id="portfolio">
		<div class="container"
			style="height: 500px; width: 100%; height: 100%; background-color: #e3f2fd;">
			<div class="col-lg-12">
				<form action="main" method="post">
					<h1 style="position: relative; top: -20px; left: 400px;">회원가입</h1>
					<!-- 아이디 입력 -->
					<div class="list-group"
						style="position: relative; top: 30px; left: 200px;">
						아이디 : <input type="text" class="form-control" placeholder="입력해주세요"
							id="mId" name="mId" maxlength="20"
							style="width: 300px; height: 40px; position: relative; left: 130px; top: -30px;">
						<input type="submit" class="btn btn-primary form-control"
							value="중복확인"
							style="width: 100px; height: 40px; position: relative; top: -70px; left: 480px;">
						<p
							style="color: red; width: 300px; height: 20px; position: relative; top: -60px; left: 10px;">※
							4-16자 이상 영문 또는 숫자만 사용가능</p>
					</div>

					<!-- 비밀번호 입력 -->
					<div class="list-group"
						style="position: relative; top: -20px; left: 200px;">
						비밀번호 : <input type="password" class="form-control"
							placeholder="입력해주세요" id="mPw" name="mPw" maxlength="20"
							style="width: 300px; height: 40px; position: relative; left: 130px; top: -30px;">
					</div>

					<!-- 비밀번호 확인 -->
					<div class="list-group"
						style="position: relative; top: -20px; left: 200px;">
						비밀번호 확인 : <input type="password" class="form-control"
							placeholder="입력해주세요" id="mPw" name="userPwOk" maxlength="20"
							style="width: 300px; height: 40px; position: relative; left: 130px; top: -30px;">
					</div>

					<!-- 이름 입력 -->
					<div class="list-group"
						style="position: relative; top: -20px; left: 200px;">
						이름 : <input type="text" class="form-control" placeholder="입력해주세요"
							id="mName" name="mName" maxlength="20"
							style="width: 300px; height: 40px; position: relative; left: 130px; top: -30px;">
					</div>

					<!-- 전화번호 입력 -->
					<div class="list-group"
						style="position: relative; top: -20px; left: 200px;">
						전화번호 : <input type="text" class="form-control"
							placeholder="입력해주세요" id="mPhone" name="mPhone" maxlength="20"
							style="width: 300px; height: 40px; position: relative; left: 130px; top: -30px;">
					</div>

					<!-- 이메일 입력 -->
					<div class="list-group"
						style="position: relative; top: -20px; left: 200px;">
						이메일 : <input type="email" class="form-control"
							placeholder="입력해주세요" id="mEmail" name="mEmail" maxlength="10"
							style="width: 300px; height: 40px; position: relative; left: 130px; top: -30px;">
					</div>

					<!-- 주소 입력 -->
					<div class="list-group"
						style="position: relative; top: -20px; left: 200px;">
						주소 : <input type="text" class="form-control" placeholder="입력해주세요"
							id="mAddr" name="mAddr" maxlength="20"
							style="width: 300px; height: 40px; position: relative; left: 130px; top: -30px;">
					</div>

					<!-- 생년월일 입력 -->
					<div class="list-group"
						style="position: relative; top: -20px; left: 200px;">
						생년월일 : <input type="date" class="form-control"
							placeholder="입력해주세요" id="mBirth" name="mBirth" maxlength="20"
							style="width: 200px; height: 40px; position: relative; left: 130px; top: -30px;">
					</div>

					<!-- 성별 -->
					<div class="list-group"
						style="position: relative; top: -20px; left: 200px;">
						성별 : <select class="form-control" id="mGender" name="mGender"
							style="width: 200px; height: 40px; position: relative; left: 130px; top: -30px;">
							<option>남성</option>
							<option>여성</option>
						</select>
					</div>
					<br>
					<!-- 회원가입하기 버튼 -->
					<div class="list-group" style="text-align: right;">
						<input type="submit" class="btn btn-primary form-control"
							value="회원가입하기"
							style="width: 150px; height: 40px; position: relative; top: -50px; left: 480px;">
					</div>
				</form>
			</div>
		</div>
	</section>
        
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