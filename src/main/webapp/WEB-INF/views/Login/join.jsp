<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />
    </head>
    <script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				location.href = "/";
			})
			
			$("#submit").on("click", function(){
				if($("#mId2").val()==""){
					alert("아이디를 입력해주세요.");
					$("#mId2").focus();
					return false;
				}
				if($("#mPw2").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#mPw2").focus();
					return false;
				}
				if($("#mPwOk").val()==""){
					alert("비밀번호 확인을 입력해주세요.");
					$("#mPwOk").focus();
					return false;
				}
				if($("#mName2").val()==""){
					alert("성명을 입력해주세요.");
					$("#mName2").focus();
					return false;
				}
				if($("#mPhone2").val()==""){
					alert("전화번호를 입력해주세요.");
					$("#mPhone2").focus();
					return false;
				}
				if($("#mEmail2").val()==""){
					alert("이메일을 입력해주세요.");
					$("#mEmail2").focus();
					return false;
				}
				if($("#mAddr2").val()==""){
					alert("주소를 입력해주세요.");
					$("#mAddr2").focus();
					return false;
				}
				if($("#mBirth2").val()==""){
					alert("생년월일을 입력해주세요.");
					$("#mBirth2").focus();
					return false;
				}
				var idChkVal = $("#idChk").val();
				if(idChkVal == "N"){
					alert("중복확인 버튼을 눌러주세요.");
					return false;
				}else if(idChkVal == "Y"){
					$("#regForm").submit();
				}
			});
		})
		//아이디 중복확인
		function fn_idChk(){
			$.ajax({
				url : "/ex/idChk",
				type : "post",
				dataType : "json",
				data : {"mId" : $("#mId2").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else {
						$("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}
		//패스워드 확인란 입력값 검증.
	    $(function(){ 
	    	$("#alert-success").hide(); 
	    	$("#alert-danger").hide(); 
	    	$("input").keyup(function(){ 
	    		var pwd1=$("#mPw2").val(); 
	    		var pwd2=$("#mPwOk").val(); 
	    		if(pwd1 != "" || pwd2 != ""){ 
	    			if(pwd1 == pwd2){
	    				$("#alert-success").show(); 
	    				$("#alert-danger").hide(); 
	    				$("#submit").removeAttr("disabled"); 
	    			} else{ 
	    				$("#alert-success").hide(); 
	    				$("#alert-danger").show(); 
	    				$("#submit").attr("disabled", "disabled"); 
	    			} 
	    		} 
	    	}); 
	    });
	</script>
    <!-- 회원가입 -->
    <body id="page-top">
        <!-- Navigation 맨위 로고-->
        <%@ include file="/WEB-INF/views/menu.jsp" %>
            
        <!-- 회원가입  -->
        <section class="page-section portfolio" id="portfolio">
		<div class="container"
			style="height: 500px; width: 100%; height: 100%; background-color: #e3f2fd;">
			<div class="col-lg-12">
				<form action="main" method="post" id="regForm">
					<h1 style="position: relative; top: -20px; left: 400px;">회원가입</h1>
					<!-- 아이디 입력 -->
					<div class="list-group"
						style="position: relative; top: 30px; left: 200px;">
						아이디 : 
						<input type="text" class="form-control" placeholder="입력해주세요" id="mId2" name="mId" maxlength="20" style="width: 300px; height: 40px; position: relative; left: 130px; top: -30px;">
						<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N" style="width: 100px; height: 40px; position: relative; top: -70px; left: 480px;">중복확인</button>
						<p
							style="color: red; width: 300px; height: 20px; position: relative; top: -60px; left: 10px;">※
							4-16자 이상 영문 또는 숫자만 사용가능</p>
					</div>

					<!-- 비밀번호 입력 -->
					<div class="list-group"
						style="position: relative; top: -20px; left: 200px;">
						비밀번호 : <input type="password" class="form-control"
							placeholder="입력해주세요" id="mPw2" name="mPw" maxlength="20"
							style="width: 300px; height: 40px; position: relative; left: 130px; top: -30px;">
					</div>

					<!-- 비밀번호 확인 -->
					<div class="list-group"
						style="position: relative; top: -20px; left: 200px;">
						비밀번호 확인 : <input type="password" class="form-control"
							placeholder="입력해주세요" id="mPwOk" name="mPwOk" maxlength="20"
							style="width: 300px; height: 40px; position: relative; left: 130px; top: -30px;">
						<div class="alert alert-success" id="alert-success" style="width: 300px; height: 40px; ">비밀번호가 일치합니다.</div> 
						<div class="alert alert-danger" id="alert-danger" style="width: 300px; height: 40px; ">비밀번호가 일치하지 않습니다.</div>
					</div>

					<!-- 이름 입력 -->
					<div class="list-group"
						style="position: relative; top: -20px; left: 200px;">
						이름 : <input type="text" class="form-control" placeholder="입력해주세요"
							id="mName2" name="mName" maxlength="20"
							style="width: 300px; height: 40px; position: relative; left: 130px; top: -30px;">
					</div>

					<!-- 전화번호 입력 -->
					<div class="list-group"
						style="position: relative; top: -20px; left: 200px;">
						전화번호 : <input type="text" class="form-control"
							placeholder="입력해주세요" id="mPhone2" name="mPhone" maxlength="20"
							style="width: 300px; height: 40px; position: relative; left: 130px; top: -30px;">
					</div>

					<!-- 이메일 입력 -->
					<div class="list-group"
						style="position: relative; top: -20px; left: 200px;">
						이메일 : <input type="email" class="form-control"
							placeholder="입력해주세요" id="mEmail2" name="mEmail" maxlength="30"
							style="width: 300px; height: 40px; position: relative; left: 130px; top: -30px;">
					</div>

					<!-- 주소 입력 -->
					<div class="list-group"
						style="position: relative; top: -20px; left: 200px;">
						주소 : <input type="text" class="form-control" placeholder="입력해주세요"
							id="mAddr2" name="mAddr" maxlength="50"
							style="width: 300px; height: 40px; position: relative; left: 130px; top: -30px;">
					</div>

					<!-- 생년월일 입력 -->
					<div class="list-group"
						style="position: relative; top: -20px; left: 200px;">
						생년월일 : <input type="date" class="form-control"
							placeholder="입력해주세요" id="mBirth2" name="mBirth" maxlength="20"
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
						<button type="submit" class="btn btn-primary form-control" id="submit"
							style="width: 150px; height: 40px; position: relative; top: -50px; left: 480px;">회원가입</button>
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
        <!-- Contact form JS-->
        <script src="resources/assets/mail/jqBootstrapValidation.js"></script>
        <script src="resources/assets/mail/contact_me.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/scripts.js"></script>
    </body>
</html>