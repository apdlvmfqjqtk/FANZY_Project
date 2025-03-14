<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<title> JARDIN SHOP </title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="JARDIN SHOP" />
<meta name="keywords" content="JARDIN SHOP" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
<link rel="stylesheet" type="text/css" href="../css/reset.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/layout.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/content.css?v=Y" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/top_navi.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../js/idangerous.swiper-2.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.anchor.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	var mySwiper = new Swiper('#mainRoll',{
		pagination: '#mainThum',
		paginationClickable: true,
		slidesPerView: 1,
		loop: true,
		autoplay:5000
	});

	var mySwiper2 = new Swiper('#bestseller',{
		paginationClickable: true,
		slidesPerView: 3,
		loop: true,
		autoplay:3000
	});

	var mySwiper3 = new Swiper('#mainSale',{
		paginationClickable: true,
		slidesPerView: 5,
		loop: true,
		autoplay:3000
	});
	
	$(window).bind('resize', function() {
		rollwidth();	
	});

	function rollwidth(){
		var winWidth = $(window).width();
		if(winWidth < 768){
			mySwiper2.params.slidesPerView = 1;
			mySwiper3.params.slidesPerView = 2;
		}else{
			mySwiper2.params.slidesPerView = 3;
			mySwiper3.params.slidesPerView = 5;
		}
	}
	$('.arrowLeft').bind('click', function(e){
		e.preventDefault()
		mySwiper2.swipePrev()
	});
	$('.arrowRight').bind('click', function(e){
		e.preventDefault()
		mySwiper2.swipeNext()
	});

	$('.saleLeft').bind('click', function(e){
		e.preventDefault()
		mySwiper3.swipePrev()
	});
	$('.saleRight').bind('click', function(e){
		e.preventDefault()
		mySwiper3.swipeNext()
	});

	rollwidth();


	var myWish = new Swiper('#wishList',{
		paginationClickable: true,
		slidesPerView: 3,
		loop: true,
		autoplay:3000
	});


});


//로그인 여부
if("${param.loginChk}"=="1"){
	alert("로그인이 되었습니다.");
}
//로그아웃 여부
if("${param.loginChk}"=="0"){
	alert("로그아웃 되었습니다.");
}

</script>
</head>
<body>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li><a href="#">MEMBERSHIP</a></li>
				<li class="last">로그인</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title2">MEMBERSHIP<span>멤버쉽</span></div>
				<ul>	
					<li><a href="#" id="leftNavi1">로그인</a></li>
					<li><a href="#" id="leftNavi2">회원가입</a></li>
					<li><a href="#" id="leftNavi3">아이디/<span>비밀번호 찾기</span></a></li>
					<li><a href="#" id="leftNavi4">회원약관</a></li>
					<li><a href="#" id="leftNavi5">개인정보<span>취급방침</span></a></li>
					<li class="last"><a href="#" id="leftNavi6">이메일무단<span>수집거부</span></a></li>
				</ul>			
			</div><script type="text/javascript">initSubmenu(1,0);</script>

			<!-- contents -->
			<div id="contents">
				<div id="member">
					<h2><strong>로그인</strong><span>로그인 후 주문하시면 다양한 혜택을 받으실 수 있습니다.</span></h2>
					<h3>회원 로그인</h3>
					<div class="informbox">
					<script>
						$(function() {
							$(".sbtn").click(function() {
								loginFrm.submit();
							})
						})		
					</script>
						<div class="inform">
							<form action="/login" name="loginFrm" method="post">
							<ul>
								<li><input type="text" name="id" id="id" class="loginType" onfocus="this.className='mfocus'" onblur="if (this.value.length==0) {this.className='loginType'}else {this.className='mfocusnot'}" style="ime-mode:inactive;" /></li>
								<li><input type="password" name="pw" class="passType" onfocus="this.className='mfocus'" onblur="if (this.value.length==0) {this.className='passType'}else {this.className='mfocusnot'}" style="ime-mode:inactive;" /></li>
							</ul>

							<div class="btn"><a class="sbtn">로그인</a></div>
							<div class="chk"><input type="checkbox" id="idsave" name="idsave" value="1"/><label for="idsave">아이디 저장</label></div>							
							</form>

							<div class="point">
								<p>아이디와 비밀번호를 잊으셨나요?</p>
								<a href="#" class="nbtn">아이디/비밀번호 찾기</a>
							</div>
						</div>
					</div>



					<h3>비회원 주문 조회</h3>
					<div class="informbox">
						<div class="inform">
							<ul>
								<li><input type="text" class="ordererType" onfocus="this.className='mfocus'" onblur="if (this.value.length==0) {this.className='ordererType'}else {this.className='mfocusnot'}" /></li>
								<li><input type="text" class="ordernumType" onfocus="this.className='mfocus'" onblur="if (this.value.length==0) {this.className='ordernumType'}else {this.className='mfocusnot'}" /></li>
							</ul>

							<div class="btn"><a href="#" class="gbtn">조회하기</a></div>
							<div class="point">
								<p>아직 JARDIN 회원이 아니신가요? <span>회원가입하시고 다양한 혜택을 받으세요.</span></p>
								<a href="#" class="nbtn">회원가입</a>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- //contents -->


		</div>
	</div>
	<!-- //container -->

</div>
</div>
</body>
</html>