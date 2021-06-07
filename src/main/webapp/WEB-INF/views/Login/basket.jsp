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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<style>
		/*
		section#content ul li { display:inline-block; margin:10px; }
		section#content div.goodsThumb img { width:200px; height:200px; }
		section#content div.goodsName { padding:10px 0; text-align:center; }
		section#content div.goodsName a { color:#000; }
		*/
		section#content ul li { margin:10px 0; padding:10px 0; border-bottom:1px solid #999; }
		section#content ul li img { width:250px; height:250px; }
		section#content ul li::after { content:""; display:block; clear:both; }
		section#content div.thumb { float:left; width:250px; }
		section#content div.gdsInfo { float:right; width:calc(100% - 320px); }
		section#content div.gdsInfo { font-size:20px; line-height:2; }
		section#content div.gdsInfo span { display:inline-block; width:100px; font-weight:bold; margin-right:10px; }
		section#content div.gdsInfo .delete { text-align:right; }
		section#content div.gdsInfo .delete button { font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;}
		
		.allCheck { float:left; width:200px; }
		.allCheck input { width:16px; height:16px; }
		.allCheck label { margin-left:10px; }
		.delBtn { float:right; width:300px; text-align:right; }
		.delBtn button { font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;}
		
		.checkBox { float:left; width:30px; }
		.checkBox input { width:16px; height:16px; }
		
		.listResult { padding:20px; background:#eee; }
		.listResult .sum { float:left; width:45%; font-size:22px; }
		
		.listResult .orderOpne { float:right; width:45%; text-align:right; }
		.listResult .orderOpne button { font-size:18px; padding:5px 10px; border:1px solid #999; background:#fff;}
		.listResult::after { content:""; display:block; clear:both; } 
		
		.orderInfo { border:5px solid #eee; padding:20px; display:none; }
		.orderInfo .inputArea { margin:10px 0; }
		.orderInfo .inputArea label { display:inline-block; width:120px; margin-right:10px; }
		.orderInfo .inputArea input { font-size:14px; padding:5px; }
		#userAddr2, #userAddr3 { width:250px; }
		
		.orderInfo .inputArea:last-child { margin-top:30px; }
		.orderInfo .inputArea button { font-size:20px; border:2px solid #ccc; padding:5px 10px; background:#fff; margin-right:20px;}
		
		.orderInfo .inputArea #sample2_address { width:230px; }
		.orderInfo .inputArea #sample2_detailAddress { width:280px; }
		.orderInfo .inputArea #sample2_extraAddress { width:280px; }
		
	</style>
	<script language="javascript">
function itemSum(frm)
{
   var sum = 0;
   var count = frm.chBox.length;
   for(var i=0; i < count; i++ ){
       if( frm.chBox[i].checked == true ){
	    sum += parseInt(frm.chBox[i].value);
       }
   }
   frm.total_sum.value = sum;
}
function itemAllSum(frm)
{
   var sum = 0;
   var count = frm.chBox.length;
   
   var chk = $("#allCheck").prop("checked");
		if(chk) {
		$(".chBox").prop("checked", true);
		 for(var i=0; i < count; i++ ){
		       if( frm.chBox[i].checked == true ){
			    sum += parseInt(frm.chBox[i].value);
		       }
		   }
		   frm.total_sum.value = sum;
		} else {
		$(".chBox").prop("checked", false);
		 for(var i=0; i < count; i++ ){
		       if( frm.chBox[i].checked == true ){
			    sum += parseInt(frm.chBox[i].value);
		       }
		   }
		   frm.total_sum.value = sum;
		}
  
}
$(function() {
	$('.checkT input[type="checkbox"]').click(function() {
		var tmpp = $(this).prop('checked');
		// this를 사용하여 클릭한 checkbox 가 체크되도록 설정
		if (tmpp) {
			$(".btnArea button").css({ "backgroundColor": "#d2201d", "cursor": "pointer", "color": "#fff" }).prop("disabled", false);
		}
		else {
			$(".btnArea button").css({ "backgroundColor": "#cbcbcb", "cursor": "auto", "color": "#303033" }).prop("disabled", true);
		}
	});
});
</script>
<!-- 장바구니 -->
<body>

	<!-- Navigation 맨위 로고-->
	<%@ include file="/WEB-INF/views/menu.jsp"%>
<form name="form" role="form" method="post" autocomplete="off">
	<!-- 장바구니-->
	<section class="page-section portfolio">
		<div class="container"
			style="width: 1431px; min-height: 650px; max-height: 100%;">
			<div class="checkbox_group">
				<!-- 장바구니 문구 및 밑줄표시-->
				<h2 class="page-section-heading text-uppercase text-secondary mb-0">장바구니</h2>
				<!-- 밑줄 -->
				<div class="divider-custom" style="display: block;">
					<hr style="background-color: black;">
				</div>
				

				<table style="width: 100%">
					<tr>
						<th style="width: 150px; height: 43px; text-align: center">
						
							<input type="checkbox" name="allCheck" id="allCheck" style="width: 25px; height: 25px;" value="1000"  onClick="itemAllSum(this.form);"/>
							
							
							<h5>전체선택</h5>
							<script>
                  				$("#allCheck").click(function(){
                   					var chk = $("#allCheck").prop("checked");
                   					if(chk) {
                    					$(".chBox").prop("checked", true);
                    					
                   					} else {
                    					$(".chBox").prop("checked", false);
                   					}
                  				});
               				</script></th>
						<th style="width: 200px; height: 43px; text-align: center"><h4>사진</h4></th>
						<th style="width: 300px; height: 43px; text-align: center"><h4>상품명</h4></th>
						<th style="width: 250px; height: 43px; text-align: center"><h4>수량</h4></th>
						<th style="width: 250px; height: 43px; text-align: center"><h4>상품
								개별 가격</h4></th>
						<th style="width: 250px; height: 43px; text-align: center"><h4>상품
								총 가격</h4></th>
					</tr>
				</table>
				<div class="divider-custom" style="display: block;">
					<hr style="background-color: black;">
				</div>
				<c:if test="${member.mId != null }">
					<!-- 장바구니에 담긴 상품 -->
					<div class="row">
						<c:set var = "total_sum" value="0" />
						<c:forEach items="${cartList}" var="cartList">
							
								<table style="width: 100%">
									<tr style="height: 100px;">
										<td style="width: 150px; height: 43px; text-align: center">
											<div class = "checkBox">
												<input type = "checkbox" name="chBox" class="chBox" value="${cartList.pPrice * cartList.cartStock}" data-pNum="${cartList.pNum}" data-cartNum="${cartList.cartNum}" onClick="itemSum(this.form);"/>
												
												<script>
													$(".chBox").click(function(){
														$("#allCheck").prop("checked", false);
													});
               									</script>
               								</div>
										</td>

										<td style="width: 200px; height: 43px; text-align: center">
											<a href="#"> <img class="img-fluid"
												src="resources/assets/img${cartList.getpUrl()} "
												style="width: 120px; height: 100px;" alt="" />
										</a>
										<td style="width: 300px; height: 43px; text-align: center">
											<h3>${cartList.getpName() }</h3>
											<input type="hidden" name="pName" value="${cartList.getpName() }" id="pName">
											<input type="hidden" name="pNum" value="${cartList.getpNum() }" id="pNum">
										</td>
										<td style="width: 250px; height: 43px; text-align: center">
											<h3>${cartList.getCartStock() }개</h3>
											<input type="hidden" name="pCountsSell" value="${cartList.getCartStock() }" id="CartStock">
											<input type="hidden" name="pCount" value="${cartList.getCartStock() }" id="pCount">
										</td>
										<td style="width: 250px; height: 43px; text-align: center">
											<h3>${cartList.getpPrice() }원</h3>
											<input type="hidden" name="pPrice" value="${cartList.getpPrice() }" id="pPrice">
										</td>
										<td style="width: 250px; height: 43px; text-align: center">
											<h3><fmt:formatNumber pattern="###,###,###" value="${cartList.pPrice * cartList.cartStock}" /> 원</h3>
											<c:if test="${product.getpShip() eq '일반배송'}">
												<input type="hidden" value="3000" id="pShip" name="pShip">
											</c:if>
											<c:if test="${product.getpShip() eq '무료배송'}">
												<input type="hidden" value="0" id="pShip" name="pShip">
											</c:if>
											<input type="hidden" value="${cartList.pPrice * cartList.cartStock}" id="sum" name="sum">
										</td>
									</tr>
								</table>
								
								
							
								<input type="submit" value="결제하기">
								
								<c:set var = "total_sum" value="${total_sum + (cartList.pPrice * cartList.cartStock) }" />
								
								
						</c:forEach>
						
					</div>
					
				</c:if>
				
			</div>
		</div>
	</section>
	<div class="container">
	<p style="text-align: right;">
	<!-- 밑줄 -->
		<div class="divider-custom" style="display: block;">
			<hr style="background-color: black;">
		</div>
			<div class="listResult">
				<div class="allsum">
					총 합계 : <input name="total_sum" type="text" size="20" readonly > 원
				</div>
				<div class="orderOpne">
					<button type="button" class="orderOpne_bnt">주문 정보 입력</button>
					
					<script>
						$(".orderOpne_bnt").click(function(){
							$(".orderInfo").slideDown();  // $(".orderInfo")를 나타내고
							$(".orderOpne_bnt").slideUp();  // $(".orderOpne_bnt")를 숨김
						});						
					</script>
					
				</div>
			</div>
			
			<div class="orderInfo">
							
					<div class="inputArea">
						<label for="">수령인</label>
						<input type="text" name="jCatchName" id="jCatchName" required="required" />
					</div>
					
					<div class="inputArea">
						<label for="orderPhon">수령인 연락처</label>
						<input type="text" name="jPhone" id="jPhone" required="required" />
					</div>
					<div class="inputArea">
					
						<p>
							<input type="text" id="sample2_postcode" placeholder="우편번호">
							<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기">
						</p>
						<p>
							<input type="text" name="userAddr1" id="sample2_address" placeholder="주소" >
							<input type="text" name="userAddr2" id="sample2_detailAddress" placeholder="상세주소">
							<input type="text" name="userAddr3" id="sample2_extraAddress" placeholder="참고항목">
						</p>
						<p>
										<b style="font-size: 20px; color: black;">마일리지 : </b>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<!-- db연동 -->
									<c:if test="${member != null }">
										<input type="text" value="0"
											style="position: relative; width: 70px; height: 30px;"></input><b
											style="font-size: 20px; color: black;">/ ${member.mMile } M</b>
									</c:if>
									<c:if test="${member == null }">
										<b style="font-size: 15px; color: black;">비회원은 사용할 수 없습니다</b>
									</c:if>
									</p>
						<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
						<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
						</div>
						
						<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
						<script>
						    // 우편번호 찾기 화면을 넣을 element
						    var element_layer = document.getElementById('layer');
						
						    function closeDaumPostcode() {
						        // iframe을 넣은 element를 안보이게 한다.
						        element_layer.style.display = 'none';
						    }
						
						    function sample2_execDaumPostcode() {
						        new daum.Postcode({
						            oncomplete: function(data) {
						                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						
						                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
						                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						                var addr = ''; // 주소 변수
						                var extraAddr = ''; // 참고항목 변수
						
						                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						                    addr = data.roadAddress;
						                } else { // 사용자가 지번 주소를 선택했을 경우(J)
						                    addr = data.jibunAddress;
						                }
						
						                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						                if(data.userSelectedType === 'R'){
						                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
						                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						                        extraAddr += data.bname;
						                    }
						                    // 건물명이 있고, 공동주택일 경우 추가한다.
						                    if(data.buildingName !== '' && data.apartment === 'Y'){
						                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						                    }
						                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						                    if(extraAddr !== ''){
						                        extraAddr = ' (' + extraAddr + ')';
						                    }
						                    // 조합된 참고항목을 해당 필드에 넣는다.
						                    document.getElementById("sample2_extraAddress").value = extraAddr;
						                
						                } else {
						                    document.getElementById("sample2_extraAddress").value = '';
						                }
						
						                // 우편번호와 주소 정보를 해당 필드에 넣는다.
						                document.getElementById('sample2_postcode').value = data.zonecode;
						                document.getElementById("sample2_address").value = addr;
						                // 커서를 상세주소 필드로 이동한다.
						                document.getElementById("sample2_detailAddress").focus();
						
						                // iframe을 넣은 element를 안보이게 한다.
						                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
						                element_layer.style.display = 'none';
						            },
						            width : '100%',
						            height : '100%',
						            maxSuggestItems : 5
						        }).embed(element_layer);
						
						        // iframe을 넣은 element를 보이게 한다.
						        element_layer.style.display = 'block';
						
						        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
						        initLayerPosition();
						    }
						
						    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
						    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
						    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
						    function initLayerPosition(){
						        var width = 300; //우편번호서비스가 들어갈 element의 width
						        var height = 400; //우편번호서비스가 들어갈 element의 height
						        var borderWidth = 5; //샘플에서 사용하는 border의 두께
						
						        // 위에서 선언한 값들을 실제 element에 넣는다.
						        element_layer.style.width = width + 'px';
						        element_layer.style.height = height + 'px';
						        element_layer.style.border = borderWidth + 'px solid';
						        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
						        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
						        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
						    }
						</script>
					</div>
					<p style="font-size: 20px; color: black; text-align: left;">
						배송 요청사항 <select name="jMemo" id="jMemo">
							<option selected>문앞에 놔주세요.</option>
							<option>부재시 경비실에 맡겨주세요.</option>
							<option>도착전 연락주세요.</option>
						</select>
					</p>
					<div class="divider-custom" style="display: block;">
					<hr style="background-color: black;">
				</div>

				<!-- 결제방법 문구 -->
				<h3 style="color: black;">결제방법</h3>
				<hr>
	<!-- 결제방법 (신용카드, 휴대폰결제, Toss) -->
			<div class="container">
				<table style="width: 100%">
					<tr style="color: black;">
						<th style="font-size: 20px;"><a href="#"
							style="color: black; text-decoration: none;">신용카드</a></th>
						<th style="font-size: 20px;"><a href="#"
							style="color: black; text-decoration: none;">휴대폰결제</a></th>
						<th style="font-size: 20px;"><a href="#"
							style="color: black; text-decoration: none;">Toss</a></th>
					</tr>
				</table>
				<hr>
				<br>
					<div class="col-md-5">
							<br>
							<h4 style="color: black;">신용카드 결제</h4>
						</div>
						<div class="col-md-6">
							<br>
							<p>
								<b style="font-size: 20px; color: black;">카드선택</b>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<!-- db연동 -->
								<select style="width: 220px; height: 30px;">
									<option value="">[필수] 카드사를 선택하세요.</option>
									<option value="KB">KB국민</option>
									<option value="IBK">IBK기업</option>
									<option value="SH">신한</option>
									<option value="SA">삼성</option>
									<option value="BC">BC</option>
									<option value="NH">농협</option>
								</select>
							</p>
							<hr>
							<p>
								<b style="font-size: 20px; color: black;">할부선택</b>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<!-- db연동 -->
								<select style="width: 220px; height: 30px;">
									<option value="">일시불</option>
									<option value="">1개월 할부</option>
									<option value="">3개월 할부</option>
									<option value="">6개월 할부</option>
									<option value="">12개월 할부</option>
								</select>
							</p>
							<hr>
							<!-- db연동 -->
							<p class="check" style="color: black; text-align: right; font-size: 15px;">
								<div class="checkT">
									<input type="checkbox" id="chk"> <span>구매조건 및 이용약관에 동의하며,<br>결제를 진행합니다. </span>
								</div>
							</p>
							<hr>
			</div>

			
					
					<div class="inputArea">
						
						<button type="button" class="cancel_btn">취소</button>
						
						<script>
						$(".cancel_btn").click(function(){
							$(".orderInfo").slideUp();  // $(".orderInfo")를 숨기고
							$(".orderOpne_bnt").slideDown();  // $(".orderOpne_bnt")를 나타냄
						});						
						</script>
					</div>
			</div>
			</div>
	
	</form>
	<div class="btnArea">
	<button type="button" class="order_btn" disabled="disabled">주문</button>
						<script>
								$(".order_btn").click(function(){
									var confirm_val = confirm("결제 하시겠습니까?");
					
									if(confirm_val) {
										var checkArr = new Array();
										
										$("input[class='chBox']:checked").each(function(){
											checkArr.push($(this).attr("data-cartNum"));
											
										});
										var checkArr2 = new Array();
										
										$("input[class='chBox']:checked").each(function(){
											checkArr2.push($(this).attr("data-pNum"));
											
										});
										sample2_detailAddress
										$.ajax({
											url:"/ex/basket",
											type : "post",
											data : {chbox : checkArr, chbox2 : checkArr2,
												userAddr1 : $('#sample2_address').val(), 
												userAddr2 : $('#sample2_detailAddress').val(), userAddr3 : $('#sample2_extraAddress').val() , 
												jMemo : $('#jMemo').val() , jPhone : $('#jPhone').val() },
											success : function(result){
												if(result == 1) {
													location.href = "/ex/basket";
												} else {
													alert("삭제 실패");
												}
											}
										});
									}
				
								});
							</script>
							
						</div>
		<p style="text-align: right;">
		<!-- 밑줄 -->
		<div class="divider-custom" style="display: block;">
			<hr style="background-color: black;">
		</div>
		<p style="text-align: right;">
			<!-- 전체선택 -->
			<label class="btn btn-primary pull-right"
				style="position: relative; top: 4px;" for="allCheck">전체선택</label>
			<!-- 선택삭제 -->
				<button type="button" class="cartDelete">선택삭제</button>
							<script>
								$(".cartDelete").click(function(){
									var confirm_val = confirm("삭제 하시겠습니까?");
					
									if(confirm_val) {
										var checkArr = new Array();
						
										$("input[class='chBox']:checked").each(function(){
											checkArr.push($(this).attr("data-cartNum"));
										});
										$.ajax({
											url:"/ex/deleteCart",
											type : "post",
											data : {chbox : checkArr},
											success : function(result){
												if(result == 1) {
													location.href = "/ex/basket";
												} else {
													alert("삭제 실패");
												}
											}
										});
									}
				
								});
							</script>
		</p>
	</div>
	<c:if test="${member.mId == null }">
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
</body>
</html>