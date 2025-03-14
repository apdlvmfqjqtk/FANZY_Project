<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fm"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>물건 상세 뷰</title>
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<style>
/* 기본 초기화 */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

a {
	text-decoration: none;
	color: white;
}

body {
	font-family: "Pretendard Variable", sans-serif;
	background-color: #f5f5f5;
	color: #333;
}

/* 헤더: 화면 최상단에 고정 (sticky) */
header {
	width: 100%;
	background-color: #fafaf8;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 20px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
	position: sticky; /* 상단 고정 */
	top: 0;
	z-index: 10;
}

.header-left h1 {
	font-size: 1.5rem;
	font-weight: bold;
	cursor: pointer;
}

.header-right nav ul {
	display: flex;
	list-style: none;
	gap: 20px;
}

.header-right nav ul li {
	cursor: pointer;
	font-size: 0.9rem;
	color: #666;
	transition: color 0.2s ease;
}

.header-right nav ul li:hover {
	color: #000;
}

.icons {
	display: flex;
	gap: 15px;
	margin-left: 20px;
}

.icons span {
	cursor: pointer;
	font-size: 0.9rem;
	color: #666;
	transition: color 0.2s ease;
}

.icons span:hover {
	color: #000;
}

/* wrapper: 상단·하단 섹션 모두 폭 1200px로 고정 */
.wrapper {
	max-width: 1200px;
	margin: 0 auto;
	padding: 40px 20px; /* 좌우 20px, 위아래 40px */
}

/* 메인 컨테이너 (상단 상품정보 섹션) */
.main-container {
	display: flex;
	gap: 40px;
	margin-bottom: 20px; /* 아래쪽 여백 */
}

/* 왼쪽 상품 이미지 섹션 */
.product-images {
	background-color: #fafaf8;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
	flex: 1;
}

.main-image {
	width: 100%;
	text-align: center;
	margin-bottom: 25px;
}

.main-image img {
	max-width: 422px;
	height: 422px;
	border: 1px solid #eee;
	background-color: #fafaf8;
	mix-blend-mode: multiply;
}

.thumbnail-list {
	display: flex;
	gap: 10px;
	justify-content: center;
}

.thumbnail-list img {
	width: 60px;
	height: 60px;
	object-fit: cover;
	cursor: pointer;
	border: 1px solid #eee;
	border-radius: 4px;
	transition: border-color 0.2s ease;
}

.thumbnail-list img:hover {
	border-color: #aaa;
}

/* 오른쪽 상품 정보 섹션 */
.product-info {
	flex: 1;
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.product-header {
	background-color: #fafaf8;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}

.product-header .brand {
	font-size: 0.9rem;
	color: #888;
	margin-bottom: 5px;
}

.product-header .title {
	font-size: 1.4rem;
	font-weight: bold;
	margin-bottom: 10px;
	line-height: 1.4;
}

.product-header .sub-info {
	font-size: 0.9rem;
	color: #555;
	line-height: 1.6;
}

.product-pricing {
	background-color: #fafaf8;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
	display: flex;
	flex-direction: column;
	gap: 15px;
}

.price-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.price-row .label {
	font-size: 1rem;
	color: #555;
}

.price-row .price {
	font-size: 1.2rem;
	font-weight: bold;
	color: #eb5757;
}

.quantity-control {
	display: flex;
	align-items: center; /* 수직 중앙정렬 */
	justify-content: space-between;
}

.quantity-control .label {
	font-size: 0.95rem;
	color: #333;
}

.input-group {
	display: flex;
	align-items: center;
	border: 1px solid #ccc;
	border-radius: 8px;
	overflow: hidden; /* 둥근 모서리 안쪽 영역 잘리게 */
}

.input-group button {
	background-color: #fff;
	border: none;
	width: 40px; /* 버튼 너비 */
	height: 40px; /* 버튼 높이 */
	font-size: 1rem;
	cursor: pointer;
	outline: none;
}

.input-group button:hover {
	background-color: #f0f0f0;
}

.input-group #minusBtn {
	border-right: 1px solid #ccc;
}

.input-group #plusBtn {
	border-left: 1px solid #ccc;
}

input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

.input-group input {
	width: 60px; /* 숫자 입력칸 너비 */
	text-align: center;
	font-size: 1rem;
	border: none;
	outline: none;
}

.action-buttons {
	display: flex;
	gap: 10px;
	margin-top: 10px;
}

.action-buttons button {
	flex: 1;
	padding: 15px 0;
	border: none;
	border-radius: 6px;
	font-size: 1rem;
	cursor: pointer;
	transition: background-color 0.2s ease;
	font-weight: bold;
}

.sold-out-item .buy-btn {
	filter: grayscale(100%);
	pointer-events: none; /* 클릭 안되게 */
	cursor: not-allowed;
}

.buy-btn {
	background-color: #eb5757;
	color: #fafaf8;
}

.buy-btn:hover {
	background-color: #cf4545;
}

.cart-btn {
	background-color: green;
	color: #fafaf8;
	transition: background-color 0.2s ease;
}

.sell-btn:hover {
	background-color: #25A767;
}
.cart-btn:hover {
	background-color: #25A767;
}

.shipping-info {
	background-color: #fafaf8;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
	font-size: 0.9rem;
	line-height: 1.6;
}

.shipping-info .info-row {
	display: flex;
	justify-content: space-between;
	margin-bottom: 8px;
}

.shipping-info .info-row span {
	color: #666;
}

.shipping-info .info-row .value {
	font-weight: bold;
}

.interest {
	color: #eb5757;
	font-weight: bold;
	cursor: pointer;
	margin-left: 5px;
}

/* 상품설명 및 평점 섹션 (하단) */
.product-description {
	margin-bottom: 40px; /* 위 섹션과 통일감 */
	background-color: #fafaf8;
	border-radius: 8px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
	padding: 20px;
}

.description-image img {
	width: 100%;
	height: auto;
	border-radius: 4px;
	border: 1px solid #eee;
	display: block;
}
/* Collapsible 영역: prodlist.png 전용 */
.collapsible-image {
	max-height: 1000px; /* 접었을 때 보여줄 높이 */
	overflow: hidden;
	position: relative;
	transition: max-height 0.3s ease;
}

.collapsible-image.expanded {
	max-height: none; /* 펼쳐졌을 때 제한 없음 */
}

.toggle-btn {
	display: block;
	width: 100%;
	padding: 10px;
	background-color: #eee;
	border: none;
	border-top: 1px solid #ddd;
	cursor: pointer;
	font-size: 1rem;
	text-align: center;
	margin-bottom: 10px;
}

/* 상품 상세 정보 섹션 */
.product-details, .extra-box {
	margin-bottom: 40px;
	background-color: #fafaf8;
	border-radius: 8px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
	padding: 20px;
}

.product-details h2, .extra-box h2 {
	margin-bottom: 10px;
	font-size: 1.4rem;
}

.product-details p, .extra-box p {
	font-size: 1rem;
	line-height: 1.5;
	color: #555;
	margin-bottom: 5px; /* 요소들 아래에 여백 10px */
	line-height: 1.6; /* 줄 간격 조절 */
}

a {
	text-decoration: none;
	text-indent: none;
	color: green;
	font-size: 14px;
}
</style>
</head>
<body>
	<!-- 이미지 고유 ID앞 링크 -->
	<c:set var="baseurl" value="https://lh3.googleusercontent.com/d/" />

	<!-- 헤더: .wrapper 바깥에 두어야 sticky가 문제 없이 동작 -->
	<header>
		<div class="header-left">
			<h1>FANZY</h1>
		</div>
		<div class="header-right">
			<nav>
				<ul>
					<li>HOME</li>
					<li>STYLE</li>
					<li>SHOP</li>
				</ul>
			</nav>
			<div class="icons">
				<span>검색</span> <span>♥</span> <span>장바구니</span> <span>마이페이지</span>
			</div>
		</div>
	</header>

	<div class="wrapper">
		<!-- 메인 컨테이너 -->
		<div class="main-container">
			<!-- 왼쪽 상품 이미지 섹션 -->
			<div class="product-images">
				<div class="main-image">
					<img src="${baseurl}${prod.shop_image1}" alt="Product image1(main)"
						onerror="this.onerror=null; this.src='${baseurl}17z6AniRT9Im-Ouxy_7qgqTuJdcR37bhU';"
						width="422px" height="422px" />
				</div>
				<div class="thumbnail-list">
					<img src="${baseurl}${prod.shop_image1}" alt="Product image1"
						onerror="this.onerror=null; this.src='${baseurl}17z6AniRT9Im-Ouxy_7qgqTuJdcR37bhU';">
					<img src="${baseurl}${prod.shop_image2}" alt="Product image2"
						onerror="this.onerror=null; this.src='${baseurl}17z6AniRT9Im-Ouxy_7qgqTuJdcR37bhU';">
					<img src="${baseurl}${prod.shop_image3}" alt="Product image3"
						onerror="this.onerror=null; this.src='${baseurl}17z6AniRT9Im-Ouxy_7qgqTuJdcR37bhU';">
				</div>
			</div>

			<!-- 오른쪽 상품 정보 섹션 -->
			<div class="product-info">
				<div class="product-header">
					<a href="/sprods?artistNo=${artist.artist_no}"><div
							class="brand">${artist.artist_group_name}</div></a>
					<div class="title">${prod.shop_title}</div>
					<div class="sub-info">
						출시일 25/02/2020<br /> 컬러: Green<br /> 가격 : ${prod.shop_price} ₩
					</div>
				</div>

				<div class="product-pricing">
<div class="price-row">
  <span class="label">일반 구매가</span>
  <span id="normalPrice" class="price" data-unitprice="${prod.shop_price}">
    <fm:formatNumber value="${prod.shop_price}" pattern="#,###" /> ₩
  </span>
</div>
<div class="price-row">
  <span class="label">회원 구매가 <a href="/">회원이란?</a></span>
  <span id="memberPrice" class="price" data-unitprice="${prod.shop_discount_price}">
    <fm:formatNumber value="${prod.shop_discount_price}" pattern="#,###" /> ₩
  </span>
</div>


					<!-- 수량 조절 영역 -->
					<div class="quantity-control">
						<span class="label">구매수량 &nbsp; (최대 ${prod.shop_buylimit}개)</span>
						<div class="input-group">
							<button type="button" id="minusBtn">&#45;</button>
							<!-- 마이너스 기호 -->
							<input type="number" id="quantityInput" value="1" min="1"
								max="${prod.shop_buylimit}" />
							<button type="button" id="plusBtn">&#43;</button>
							<!-- 더하기 기호 -->
						</div>
					</div>

					<script>
					function buyBtn() {
							if(${prod.shop_quantity} - document.getElementById('quantityInput').value < 0) {
								alert("상품이" + ${prod.shop_quantity} + "개 남았습니다. 다시 주문해주세요")
							}else {
						  	location.href = "/sptwind?sprodId=" + ${prod.shop_no} + "&quantity=" + document.getElementById('quantityInput').value;
							}
						}

						 
					</script>
					
					<div
						class="action-buttons ${prod.shop_quantity == 0 ? 'sold-out-item' : ''}">
						<button class="cart-btn">장바구니</button>
						<button class="buy-btn"
							onclick=buyBtn()
							${prod.shop_quantity == 0 ? "disabled" : ""}>
							${prod.shop_quantity == 0 ? "품절" : "구매"}</button>
					</div>

				</div>
	

				<div class="shipping-info">
					<div class="info-row">
						<span>국내 배송비</span> <span class="value">무료</span>
					</div>
					<div class="info-row">
						<span>해외 배송비</span> <span class="value">East Asia: 10,000 ₩
							&nbsp&nbsp Etc: 40,000 ₩</span>
					</div>
					<div class="info-row">
						<span>멤버쉽 혜택 안내</span> <span class="value">상품가 1% 포인트 적립</span>
					</div>
					<div>
						브랜드: <span>Supreme</span> <span class="interest">관심상품</span>
					</div>
				</div>
			</div>
		</div>
		<!-- /.main-container -->

		<!-- 상품설명 이미지와 평점 섹션 -->
		<div class="product-description">
			<div class="description-image">
				<!-- 첫 번째 상품설명 이미지 -->
				<img src="/images/stelLive/memAll.jpg"
					alt="Product Description Image" />
				<!-- prodlist.png는 접을 수 있는 영역으로 -->
				<div class="collapsible-image">
					<img src="/images/prodlist.png" alt="Long Product Description" />
				</div>
				<button class="toggle-btn">더보기</button>
			</div>
		</div>

		<!-- 상품 상세 정보 섹션 -->
		<div class="product-details">
			<h2>상품 상세 정보</h2>
			<p>여기에 상품에 대한 상세한 정보를 입력하세요. 소재, 기능, 사용법 등 중요한 내용들을 기술하면 좋음.</p>
		</div>

		<!-- 추가 정보 상자 섹션 -->
		<div class="extra-box">
			<h2>FANZY 교환 및 반품 안내문</h2>

			<p>1) 교환/반품 가능 조건</p>
			<p>- 단순 변심(고객 변심)</p>
			<p>* 상품 수령 후 7일 이내에 요청하시면 교환/반품이 가능합니다.</p>
			<p>* 단, 음반, 포스터 등 굿즈 제품은 포장 개봉 또는 훼손된 경우 교환/반품이 불가합니다.</p>
			<p>- 표시·광고 불일치 또는 상품 하자</p>
			<p>* 상품 수령 후 3개월 이내, 또는 그 사실을 인지한 날부터 30일 이내에 요청해 주시면 처리해 드립니다 (둘
				중 빠른 기간 적용).</p>
			<p>- 특수 상품</p>
			<p>* 가전제품 등 포장이 중요한 상품은 개봉 또는 훼손 시 교환·반품이 어렵습니다.</p>
			<p>* 미성년자의 경우, 법정대리인 동의가 없으면 상품 수령 후 7일 이내에 취소/환불이 가능합니다.</p>

			<hr />

			<p>2) 교환/반품 불가능 조건</p>
			<p>- 상품 수령 후 7일이 지난 경우</p>
			<p>- 고객님의 부주의로 상품이 멸실·훼손되거나 사용 흔적이 남아 상품 가치가 현저히 감소한 경우</p>
			<p>- 포장 개봉 또는 훼손으로 인해 상품의 가치가 상실된 경우 (음반, 포스터, 가전제품 등)</p>
			<p>- 이벤트·프로모션 증정품 누락 시 (교환/환불 불가)</p>
			<p>- 주문제작 상품, 세일 상품 등 상세페이지에 교환/환불 불가로 명시된 상품</p>
			<p>- 오배송·불량 상품이라도 사용 흔적이나 훼손이 있으면 교환/반품이 불가합니다.</p>

			<hr />

			<p>3) 교환/반품 절차</p>
			<p>- 사전 접수 필수: FANZY 고객센터(마이페이지 1:1 문의 등)를 통해 주문번호, 성함, 연락처, 문제
				확인용 사진 등을 반드시 제출해 주셔야 합니다.</p>
			<p>- 임의로 택배를 발송하실 경우 반송될 수 있으니 주의해 주시기 바랍니다.</p>
			<p>- FANZY 측에서 확인 후 회수 택배를 발송하거나 교환/환불 절차를 진행해 드립니다.</p>
			<p>- 지정 택배사 이용을 권장하며, 타 택배사 사용 시 선불 부담이 발생할 수 있습니다.</p>

			<hr />

			<p>4) 배송비 및 환불 안내</p>
			<p>- 단순 변심의 경우</p>
			<p>* 왕복 배송비 6,000원이 부과되며, 최초 무료배송 상품인 경우 추가로 6,000원이 적용됩니다.</p>
			<p>- 상품 하자·오배송의 경우</p>
			<p>* 배송비는 FANZY에서 부담합니다.</p>
			<p>- 교환</p>
			<p>* 동일 상품으로 교환 처리되며, 재고가 없을 경우 환불해 드립니다.</p>
			<p>- 부분 반품</p>
			<p>* 남은 상품이 무료배송 기준에 미달할 경우, 반품 금액에서 택배비 3,000원을 차감한 후 환불됩니다.</p>
			<p>- 취소/환불</p>
			<p>* 상품 도착 후 주말·공휴일을 제외한 5일 이내에 처리됩니다.</p>
			<p>* 수령 후 7일 초과 시 상품 금액의 10%를 취소 수수료로 차감한 후 환불됩니다.</p>
			<p>* 결제 방식에 따라 환불 방법이 달라질 수 있습니다.</p>

			<hr />

			<p>5) 기타 주의사항</p>
			<p>- 모든 상품은 재고 소진 위험이 있으므로 단순 변심에 의한 교환은 어려울 수 있습니다.</p>
			<p>- 무료배송 상품이라도 단순 변심 반품 시 왕복 택배비는 고객님 부담입니다.</p>
			<p>- FANZY 온라인 구매 상품은 FANZY 오프라인 매장에서 교환·환불이 불가하며, 반대의 경우도 동일합니다.</p>
			<p>- 상품은 반드시 수령 당시의 상태 그대로 반품되어야 합니다.</p>
			<p>- 각 상품별 상세 안내가 상이할 수 있으므로, 상품 상세페이지와 1:1 문의를 통해 최종 확인해 주시기
				바랍니다.</p>
			<p>
				<a href="/squestion">고객센터에 문의</a>
			</p>


		</div>
		<!-- extra-boxe -->


	</div>
	<!-- /.wrapper -->
	<!-- 썸네일 클릭 시 메인 이미지 교체 & collapsible toggle 스크립트 -->
	<script>
	document.addEventListener('DOMContentLoaded', function() {
		  // 썸네일 클릭 시 메인 이미지 교체
		  const thumbnails = document.querySelectorAll('.thumbnail-list img');
		  const mainImage = document.querySelector('.main-image img');
		  thumbnails.forEach(thumbnail => {
		    thumbnail.addEventListener('click', function() {
		      mainImage.src = this.src;
		    });
		  });

		  // collapsible-image 토글
		  const toggleBtn = document.querySelector('.toggle-btn');
		  const collapsibleImage = document.querySelector('.collapsible-image');
		  toggleBtn.addEventListener('click', function() {
		    if (collapsibleImage.classList.contains('expanded')) {
		      collapsibleImage.classList.remove('expanded');
		      toggleBtn.textContent = '더보기';
		    } else {
		      collapsibleImage.classList.add('expanded');
		      toggleBtn.textContent = '접기';
		    }
		  });
		  
		  // 수량 조절 및 가격 업데이트 코드
		  const minusBtn = document.getElementById('minusBtn');
		  const plusBtn = document.getElementById('plusBtn');
		  const quantityInput = document.getElementById('quantityInput');
		  const maxQuantity = parseInt(quantityInput.getAttribute('max'));
		  
		  // 일반 구매가와 회원 구매가 요소에서 단가 추출 (data-unitprice 속성을 미리 지정해둔 상태)
		  const normalPriceElem = document.getElementById('normalPrice');
		  const memberPriceElem = document.getElementById('memberPrice');
		  const normalUnitPrice = parseInt(normalPriceElem.getAttribute('data-unitprice'));
		  const memberUnitPrice = parseInt(memberPriceElem.getAttribute('data-unitprice'));

		  function updatePrices() {
		    let quantity = parseInt(quantityInput.value);
		    normalPriceElem.textContent = (normalUnitPrice * quantity).toLocaleString() + " ₩";
		    memberPriceElem.textContent = (memberUnitPrice * quantity).toLocaleString() + " ₩";
		  }

		  // 초기 가격 업데이트
		  updatePrices();

		  minusBtn.addEventListener('click', function(){
		    let currentVal = parseInt(quantityInput.value);
		    if (currentVal > 1) {
		      quantityInput.value = currentVal - 1;
		      updatePrices();
		    }
		  });

		  plusBtn.addEventListener('click', function(){
		    let currentVal = parseInt(quantityInput.value);
		    if (currentVal < maxQuantity) {
		      quantityInput.value = currentVal + 1;
		      updatePrices();
		    }
		  });
		});

	// 장바구니 버튼에 이벤트 리스너 추가
	document.querySelector('.cart-btn').addEventListener('click', function() {
	    // 상품 정보 수집
	    const shopNo = ${prod.shop_no}; // 상품 번호
	    const quantity = document.getElementById('quantityInput').value; // 수량
	    const unitPrice = document.getElementById('normalPrice').getAttribute('data-unitprice'); // 단가

	    // AJAX로 서버에 장바구니 추가 요청
	    fetch('/addToCart', {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/json',
	        },
	        body: JSON.stringify({
	            shopNo: shopNo,
	            quantity: quantity,
	            unitPrice: unitPrice
	        })
	    })
	    .then(response => response.json())
	    .then(data => {
	        if(data.success) {
	            alert('장바구니에 추가되었습니다.');
	        } else {
				// 수량이 넘는 경우 메시지 출력
	            alert(data.message || '장바구니 추가에 실패했습니다.');
	        }
	    })
	    .catch(error => {
	        console.error('Error:', error);
	        alert('오류가 발생했습니다.');
	    });
	});

</script>