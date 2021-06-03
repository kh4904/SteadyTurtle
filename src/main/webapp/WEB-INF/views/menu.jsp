<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<nav class="navbar " id="mainNav"
	style="width: 100%; height: 300px; background-color: #000000;">
	<div class="container-fluid">
		<div class="col-lg-4">
			<a class="navbar-brand js-scroll-trigger" href="main"><img
				src="resources/assets/img/TurtleIcon.png"
				style="width: 300px; height: 200px; position: relative; top: -20px; left: 120px;"></a>
		</div>
		<!-- 검색창 -->
		<div class="col-lg-5">
			<form method="POST" action="productSearch" id ="search" name="search">
					<div class="list-group">
						<input type="text" class="form-control" placeholder="검색창"
							id="keyword" name="keyword" style="width: 500px; height: 50px; position:relative; left:-30px;">
					</div>
					<div class="list-group">
						<button type="submit" class="btn btn-default" style="position:relative; width:50px; height:30px; left:470px; top:-50px;"> <i
							class="fas fa-search"
							style="width: 50px; height: 30px; color: #fff;"></i></button>
					</div>
				
			</form>



			<!-- 헬스기구, 요가상품, 운동식품, 상품랭킹 문구 -->
			<ul class="nav nav-pills"
				style="position: relative; top: 30px; left: -50px;">
				<li role="presentation" style="position: relative;"><a
					href="Health"
					style="color: #ffff8d; text-decoration: none; font-size: 30px;">헬스기구</a></li>
				<li role="presentation" style="position: relative; left: 30px;"><a
					href="Yoga"
					style="color: #ffff8d; text-decoration: none; font-size: 30px;">요가상품</a></li>
				<li role="presentation" style="position: relative; left: 60px;"><a
					href="Food"
					style="color: #ffff8d; text-decoration: none; font-size: 30px;">운동식품</a></li>
				<li role="presentation" style="position: relative; left: 90px;"><a
					href="#"
					style="color: #fff; text-decoration: none; font-size: 30px;"
					data-toggle="dropdown"> <label style="color: #ffff8d;">상품랭킹</label>
						<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="ManRanking" style="color: #000000;">남여랭킹</a></li>
						<li><a href="HealthRanking" style="color: #000000;">헬스기구
								랭킹</a></li>
						<li><a href="YogaRanking" style="color: #000000;">요가용품 랭킹</a></li>
						<li><a href="FoodRanking" style="color: #000000;">운동식품 랭킹</a></li>
					</ul></li>
			</ul>
		</div>

		<!-- 로그인창 -->
		<div class="col-lg-3">
			<!-- 장바구니, 상품환불, 고객문의 -->
			<ul class="nav nav-pills">
				<li role="presentation" style="position: relative; left: 40px;"><a
					href="basket" style="color: #fff;">장바구니</a></li>
				<li role="presentation" style="position: relative; left: 60px;"><a
					href="refund" style="color: #fff;">상품환불</a></li>
				<li role="presentation" style="position: relative; left: 80px;"><a
					href="CustomerWriteView" style="color: #fff;">고객문의</a></li>
			</ul>

			<!-- 회원, 비회원(주문조회) -->
			<div class="jumbotron"
				style="padding-top: 20px; width: 400px; height: 190px; position: relative; top: 10px; left: -100px;">
				<c:if test="${member == null }">
					<c:if test="${msg == false }">
						<script>
							alert("아이디 혹은 비밀번호가 틀립니다")
						</script>
					</c:if>
					<c:if test="${msg2 == false }">
						<script>
							alert("로그아웃하셨습니다.")
						</script>
					</c:if>
					<ul class="nav nav-tabs">
						<li class="nav-item in active" role="presentation"
							style="position: relative; left: 60px;"><a href="#login"
							data-toggle="tab" data-load="true" style="color: #000000;">회원</a>
						</li>
						<li class="nav-item" role="presentation"
							style="position: relative; left: 150px;"><a href="#nLogin"
							data-toggle="tab" data-load="false" style="color: #000000;">비회원(주문조회)</a>
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
									I D : <input type="text" class="form-control" placeholder="아이디"
										id="mId" name="mId" maxlength="20"
										style="width: 200px; height: 40px; position: relative; left: 40px; top: -30px;">
								</div>
								<!-- 비밀번호입력 -->
								<div class="form-group" style="position: relative; top: -30px;">
									PW : <input type="password" class="form-control"
										placeholder="비밀번호" id="mPw" name="mPw" maxlength="20"
										style="width: 200px; height: 40px; position: relative; left: 40px; top: -30px;">
								</div>
								<!-- 로그인버튼 -->
								<input type="submit" class="btn" value="로그인"
									style="color: #fff; background-color: #373737; width: 100px; height: 80px; position: relative; top: -160px; left: 250px;">

							</form>
							<!-- 아이디, 비밀번호찾기 ,회원가입 -->
							<ul class="nav nav-pills"
								style="position: relative; top: -150px; left: 30px;">
								<li role="presentation"><a href="idSearch"
									style="color: #000000;">아이디 ·</a></li>
								<li role="presentation"><a href="idSearch"
									style="color: #000000;">비밀번호 찾기</a></li>
								<li role="presentation" style="position: relative; left: 60px;"><a
									href="join" style="color: #000000;">회원가입</a></li>
							</ul>


						</div>

						<!-- 회원 ,비회원(주문하기) 탭창 클릭시 변화 (비회원 주문조회폼) -->
						<div class="tab-pane fade" id="nLogin">
							<!-- 이름, 전화번호 입력후 배송조회버튼 이벤트 -->
							<form method="post" action="loginAction.jsp">
								<!-- 이름 입력 -->
								<div class="form-group" style="position: relative; top: 1px;">
									이름 <input type="text" class="form-control" placeholder="입력해주세요"
										name="userName" maxlength="20"
										style="width: 200px; height: 40px; position: relative; left: 40px; top: -30px;">
								</div>
								<!-- 전화번호 입력 -->
								<div class="form-group" style="position: relative; top: -30px;">
									P.H.<input type="text" class="form-control"
										placeholder="입력해주세요" name="userNumber" maxlength="20"
										style="width: 200px; height: 40px; position: relative; left: 40px; top: -30px;">
								</div>
								<!-- 배송조회 버튼 -->
								<input type="submit" class="btn" value="배송조회"
									style="color: #fff; background-color: #373737; width: 100px; height: 80px; position: relative; top: -160px; left: 250px;">
							</form>
							<!-- 회원가입 -->
							<ul class="nav nav-pills"
								style="position: relative; top: -150px; left: 200px;">
								<li role="presentation" style="position: relative; left: 60px;"><a
									href="join" style="color: #000000;">회원가입</a></li>
							</ul>
						</div>
					</div>
				</c:if>

				<c:if test="${msg3 == false }">
					<script>
						alert("${member.mName} 님 환영합니다.")
					</script>
				</c:if>
				<c:if test="${member != null }">
					<ul class="nav nav-tabs">
						<li role="presentation" class="active"
							style="position: relative; left: 60px; color: #000000;">회원</li>
						<c:if test="${member.mMaster == 1 }">
							<li role="presentation" class="active"
								style="position: relative; left: 180px;"><a
								href="mainMaster" style="text-decoration: none; color: #bdbdbd;">관리자모드</a></li>
						</c:if>
					</ul>
					<ul class="nav nav-pills"
						style="position: relative; top: 30px; left: 20px;">
						<li role="presentation" class="active">
							<p>
								사용기능/누적 <br /> 마일리지<br /> <label><fmt:formatNumber pattern="###,###,###" value="${member.getmMile()}" />/<fmt:formatNumber pattern="###,###,###" value="${member.mCumulmile}" />
									p</label>
							</p>
						</li>
						<li role="presentation" style="position: relative; left: 80px;">
							<p style="position: relative;">
								나의 등급: ${member.mGrade} <br />${member.mName } 님
							</p>
						</li>
					</ul>
					<hr>
					<!-- 회원정보수정 주문조회 로그아웃-->
					<ul class="nav nav-pills"
						style="position: relative; top: -15px; left: 30px;">
						<li role="presentation" class="active"><a href="MyPage"
							style="color: black; text-decoration: none;">회원정보수정</a> /</li>
						<li role="presentation"><a href="JumunSearch"
							style="color: black; text-decoration: none;"> 주문조회</a></li>
						<li role="presentation" style="position: relative; left: 60px;">
							<form method="post" action="logout">
								<input type="submit" class="btn btn-link" id="logoutbtn"
									value="로그아웃"
									style="font-size: 15px; font-family: 여린굴림; color: black; text-decoration: none; position: relative; top: -10px;">
							</form>
						</li>
					</ul>
				</c:if>
			</div>
		</div>
	</div>
</nav>