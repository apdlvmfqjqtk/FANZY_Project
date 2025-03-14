<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fm" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>Title</title>
<link rel="stylesheet" as="style" crossorigin
  href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<style>
/* 전체 기본 스타일 */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

a {
	text-decoration: none;
	color: #17171B;
}

body {
	font-family: "Pretendard Variable", sans-serif;
	background: #f0f0f0;
}

/* 메인 컨테이너 */
.container {
	max-width: 1080px;
	margin: 0 auto;
}

/* 숨김 처리 */
.container.hidediv {
	display: none;
}

/* 이미지 슬라이더 스타일 */
.slider-container {
	position: relative;
	width: 100%;
	height: 500px;
	overflow: hidden;
	border-radius: 10px;
}

.slide {
	position: absolute;
	width: 100%;
	height: 100%;
	object-fit: cover;
	opacity: 0;
	transition: opacity 1s ease-in-out;
}

.slide.active {
	opacity: 1;
}

.slider-btn {
	position: absolute;
	bottom: 10px;
	left: 50%;
	transform: translateX(-50%);
	padding: 10px 20px;
	background: rgba(0, 0, 0, 0.5);
	color: white;
	border: none;
	cursor: pointer;
	border-radius: 5px;
}

/* 제목 + 카드 묶는 래퍼 */
.title-and-cards {
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	padding: 16px;
	margin-top: 10px;
}

.title-bar {
	background-color: #F5C3B2;
	border-radius: 4px;
	padding: 20px;
	margin-bottom: 20px;
	font-size: 24px;
	font-weight: bold;
	text-align: left;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
	color: #17171B;
}

.cards {
	display: grid;
	/* 4개의 고정 너비 열(예: 238px) */
	grid-template-columns: repeat(4, 238px);
	/* 카드 사이 간격 */
	gap: 20px;
	justify-content: space-between;
}

.card {
	width: 238px;
	background-color: #ffffff;
	border-radius: 8px;
	overflow: hidden;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.image-section {
	background-color: white;
	text-align: center;
	overflow: hidden;
	height: 238px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.image-section img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform 0.15s ease;
	will-change: transform;
}

.text-section {
	background-color: #F5C3B2;
	padding: 15px;
	text-align: center;
	overflow: hidden;
	color: #17171B;
}

.more-button {
	width: 100%;
	border: 2px solid #ccc;
	border-radius: 42px;
	padding: 10px;
	text-align: center;
	font-size: 16px;
	cursor: pointer;
	margin-top: 20px;
	background: none;
	color: #17171B;
}

.more-button:hover {
	background: #f0f0f0;
}

.image-section:hover img {
	transform: scale(1.1);
}

/* 아티스트 검색 모달 */
.modal-backdrop {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.4);
	display: none;
	justify-content: center;
	align-items: center;
	z-index: 999;
}

.modal-backdrop.active {
	display: flex;
}

.alphabet-buttons button.active {
  background: #17171B;
  color: #fff; /* 글자색도 대비되게 변경 */
}

.modal-content {
	background: #fff;
	width: 400px;
	max-height: 80vh;
	overflow-y: auto;
	border-radius: 8px;
	padding: 20px;
	position: relative;
}

.modal-close-btn {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
	background: none;
	border: none;
	font-size: 20px;
	font-weight: bold;
}

.alphabet-buttons {
	display: flex;
	flex-wrap: wrap;
	gap: 5px;
	margin-bottom: 10px;
}

.alphabet-buttons button {
	border: 1px solid #ccc;
	background: #fff;
	cursor: pointer;
	padding: 5px 10px;
	border-radius: 4px;
}

.alphabet-buttons button:hover {
	background: #f0f0f0;
}

.artist-list {
	display: flex;
	flex-direction: column;
	gap: 8px;
}

.artist-item {
	display: flex;
	align-items: center;
	gap: 10px;
	padding: 8px;
	border-radius: 4px;
	cursor: pointer;
}

.artist-item:hover {
	background: #eee;
}

.artist-item img {
	width: 40px;
	height: 40px;
	border-radius: 35%;
	object-fit: cover;
}

/* Recommended Artist (가로 스크롤, 원형 이미지) */
.recommended-artist-container {
  max-width: 1080px;
  margin: 20px auto;
  padding: 16px;
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 1px 4px rgba(0,0,0,0.2);
}

.recommended-artist-container h2 {
  margin-bottom: 20px;
  font-size: 20px;
  font-weight: bold;
}

.artist-scroll-wrapper {
  display: flex;
  gap: 16px;
  overflow-x: auto;  /* 좌우 스크롤 허용 */
  padding-bottom: 10px;
}

.artist-scroll-wrapper::-webkit-scrollbar {
  height: 6px;       /* 스크롤바 높이 */
}
.artist-scroll-wrapper::-webkit-scrollbar-thumb {
  background: #ccc;  /* 스크롤바 색상 */
  border-radius: 3px;
}

.artist-item-circle {
  flex: 0 0 auto;  /* 내용물 크기만큼 */
  width: 80px;
  text-align: center;
}

.artist-item-circle img {
  width: 73px;
  height: 73px;
  object-fit: cover;
  border-radius: 35%;
  display: block;
  margin: 0 auto 8px auto;
}

.artist-item-circle p {
  font-size: 14px;
  line-height: 1.2;
  margin: 0;
  
  /* 줄바꿈 허용을 위해 추가/수정 */
  white-space: normal;      /* 기본적으로 여러 줄로 감 */
  word-break: keep-all;     /* 단어가 너무 길면 다음 줄로 넘김 */
  /* 필요하다면 word-break: break-all; 로 교체 가능 */
}

</style>

</head>

<body>
	<!-- 이미지 고유 ID앞 링크 -->
	<c:set var="baseurl" value="https://lh3.googleusercontent.com/d/" />
	
	<!-- 메인배너 -->
	<div class="container">
		<div class="slider-container">
			<img src="/images/stelLive/groupimg02.png" class="slide active">
			<img src="/images/stelLive/groupimg03.jpg" class="slide">
			<img src="/images/stelLive/groupimg04.png" class="slide">
			<button class="slider-btn" onclick="nextSlide()">다음</button>
		</div>
	</div>
	<!-- 메인배너 -->

	<!-- Recommended Artist 섹션 -->
	<div class="recommended-artist-container">
	  <h2>Today's Recomend Artist</h2>
	  <div class="artist-scroll-wrapper">
	    <c:forEach var="adto" items="${list}">
	    <a href="/sprods?artistNo=${adto.artist_no}">
	      <div class="artist-item-circle">
	        <img src="${baseurl}${adto.artist_group_image}"
	             onerror="this.src='https://picsum.photos/73/73';"
	             alt="${adto.artist_group_name}" />
	        <p>${adto.artist_group_name}</p>
	      </div>
	    </a>
	    </c:forEach>
	  </div>
	  <button class="more-button" id="openSearchBtn">아티스트 검색</button>
	</div>
	<!-- Recommended Artist 섹션 -->

	<!-- 아티스트 검색 버튼 + 모달 -->
	<div class="container">

		<!-- 검색 모달 -->
		<div id="artistSearchModal" class="modal-backdrop">
			<div class="modal-content">
				<button class="modal-close-btn" id="closeSearchBtn">&times;</button>
				<h2 style="margin-bottom: 10px;">아티스트 검색</h2>

				<!-- 알파벳 버튼들 -->
				<c:set var="alphabet" value="ABCDEFGHIJKLMNOPQRSTUVWXYZ" />
				<div class="alphabet-buttons">
					<button data-letter="ALL">ALL</button>
					<c:forEach var="i" begin="0" end="25">
						<button data-letter="${fn:substring(alphabet, i, i+1)}">
							${fn:substring(alphabet, i, i+1)}</button>
					</c:forEach>
				</div>

				<!-- 아티스트 목록 -->
				<div class="artist-list" id="artistList">
					<c:forEach var="adto" items="${list}">
						<div class="artist-item" data-name="${adto.artist_group_name}"
							data-no="${adto.artist_no}">
							<img src="/images/${adto.artist_group_image}" alt="artist"
								onerror="this.src='https://picsum.photos/40/40';" />
							<span>${adto.artist_group_name}</span>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-- 아티스트 검색 버튼 + 모달 -->


	<!-- container(아티스트 상품출력) -->
	<c:forEach items="${list}" var="adto">
		<div class="container ${ empty adto.shopList ? 'hidediv' : ''}">
			<div class="title-and-cards">
				<div class="title-bar">${adto.artist_group_name}</div>
				<div class="cards">
					<c:forEach items="${adto.shopList}" begin="0" end="3" step="1"
						var="sdto">
						<div class="card">
							<a href="/sprodview?shopNo=${sdto.shop_no}">
								<div class="image-section">
									<img src='https://picsum.photos/238/238' alt="test이미지" />
								</div>
								<div class="text-section">
									<p>${sdto.shop_title}</p>
									<p><fm:formatNumber value="${sdto.shop_price}" pattern="#,###" /> ₩</p>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
				<a href="/sprods?artistNo=${adto.artist_no}">
				  <button class="more-button">see All</button>
				</a>
			</div>
		</div>
	</c:forEach>
	<!-- container(아티스트 상품출력) -->

	<script>
    // 메인배너 출력
    let slides = document.querySelectorAll(".slide");
    let currentSlide = 0;

    function nextSlide() {
        slides[currentSlide].classList.remove("active");
        currentSlide = (currentSlide + 1) % slides.length;
        slides[currentSlide].classList.add("active");
    }
    setInterval(nextSlide, 3000);

    // 아티스트 검색 모달
    const openSearchBtn = document.getElementById("openSearchBtn");
    const artistSearchModal = document.getElementById("artistSearchModal");
    const closeSearchBtn = document.getElementById("closeSearchBtn");

    // 모달 열기
    openSearchBtn.addEventListener("click", () => {
      artistSearchModal.classList.add("active");
    });

    // 모달 닫기
    closeSearchBtn.addEventListener("click", () => {
      artistSearchModal.classList.remove("active");
    });

    // 알파벳 버튼 클릭 시 필터링
    const alphaButtons = document.querySelectorAll(".alphabet-buttons button");
    const artistItems = document.querySelectorAll(".artist-item");

    alphaButtons.forEach(btn => {
      btn.addEventListener("click", () => {
 	    // 모든 버튼에서 active 클래스 제거
 	    alphaButtons.forEach(b => b.classList.remove("active"));
 	    // 클릭한 버튼에 active 클래스 추가
 	    btn.classList.add("active");

        const letter = btn.getAttribute("data-letter");
        artistItems.forEach(item => {
          const name = item.getAttribute("data-name") || "";
          if(letter === "ALL") {
            item.style.display = "flex";
          } else {
            if(name.trim().charAt(0).toUpperCase() === letter) {
              item.style.display = "flex";
            } else {
              item.style.display = "none";
            }
          }
        });
      });
    });

    // 아티스트 클릭 시 동작 (예: 모달 닫고 상세 페이지로 이동)
    artistItems.forEach(item => {
      item.addEventListener("click", () => {
        const artistName = item.getAttribute("data-name");
        const artistNo = item.getAttribute("data-no");
        //alert("선택된 아티스트: " + artistName + " (No: " + artistNo + ")");
        location.href = "/sprods?artistNo=" + artistNo;

        // 모달 닫기
        artistSearchModal.classList.remove("active");
      });
    });
	</script>
</body>
</html>
