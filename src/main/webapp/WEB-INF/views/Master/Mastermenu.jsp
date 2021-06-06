<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<nav class="navbar " id="mainNav" style="width:100%; height:300px; background-color:#1A252F;">
            <div class="container-fluid">
                 <div class="col-lg-4">
                   <a class="navbar-brand js-scroll-trigger" href="mainMaster"><img
				src="resources/assets/img/turtleIcon.png"
				style="width: 250px; height: 230px; position: relative; top: -20px; left: 120px;"></a>
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
                     <li role="presentation" style="position:relative; "><a href="SalesStatus" style="color:#eef4f2; text-decoration:none; font-size:30px;">판매현황</a></li>
                     <li role="presentation" style="position:relative; left:30px;"><a href="OrderHistory" style="color:#eef4f2; text-decoration:none; font-size:30px;">주문내역</a></li>
                     <li role="presentation" style="position:relative; left:60px;"><a href="ProductManagement" style="color:#eef4f2; text-decoration:none; font-size:30px;">상품관리</a></li>
                     <li role="presentation" style="position:relative; left:90px;"><a href="CustomerManage" style="color:#eef4f2; text-decoration:none; font-size:30px;">회원관리</a></li>
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
                        <li role="presentation" class="active" style="position: relative; left: 60px;"><a href="main" style="text-decoration:none; color:#bdbdbd;">회원</a></li>
                        <li role="presentation" class="active" style="position: relative; left: 180px;">관리자모드</li>
                     </ul>
                     <ul class="nav nav-pills" style="position: relative; top: 40px; left: 40px;">
                        <li role="presentation" class="active">
                           <h3>관리자</h3>
                        </li>
                        <li role="presentation" style="position: relative; left: 70px;">
                           <h3>${member.mName } 님</h3>
                        </li>
                     </ul>
                     <br><br>
                     <hr>
                     <!-- 회원정보수정,로그아웃 -->
                     <ul class="nav nav-pills" style="position: relative; top: -15px; left: 30px;">
                        <li role="presentation" class="active"><a href="MyPage" style="color:black; text-decoration:none;">회원정보수정</a></li>
                        <form method="post" action="logout">
								<input type="submit" class="btn btn-link" id="logoutbtn"
									value="로그아웃"
									style="font-size: 15px; font-family:여린굴림; color: black; text-decoration: none; position:relative; top:-8px; left: 120px;">
							</form>
                     </ul>
                  </div>
                </div>
         </div>
      </nav>