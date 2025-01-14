<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>콜가드 홈</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap"
	rel="stylesheet">
<style>
body, html {
	height: 100%;
	margin: 0;
	font-family: 'Roboto', sans-serif;
	overflow-x: hidden;
}

.navbar {
	position: fixed;
	width: 100%;
	top: 0;
	z-index: 1000;
}

.main-container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: auto;
	padding: 20px;
	box-sizing: border-box;
	margin-top: 80px;
}

.text-container {
	text-align: left;
	margin-bottom: 20px;
}

.main-text {
	font-size: 2.5em;
	color: black;
}

.highlight {
	color: blue;
}

.small-text {
	font-size: 0.9em;
	color: black;
	margin-bottom: 20px;
}

img {
	max-width: 120%;
	height: auto;
}

.function-container {
	text-align: left;
	margin-top: 40px;
	justify-content: center;
}

video {
	max-width: 100%;
	height: auto;
	border: none;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	padding: 10px;
}

h2 {
	margin-top: 30px;
	margin-bottom: 30px;
	font-size: 2em;
	font-weight: 700;
}

.card-columns {
	column-count: 1;
}

.card {
	border: none;
	border-radius: 12px;
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
	opacity: 0;
	transform: translateX(-100%);
	transition: transform 0.5s ease, opacity 0.5s ease;
	height: 150px;
}

.card.visible {
	opacity: 1;
	transform: translateX(0);
}

.card.hidden {
	opacity: 0;
	transform: translateX(100%);
}

@media ( min-width : 768px) {
	.main-container {
		flex-direction: row;
	}
	.text-container {
		margin-right: 20px;
		margin-bottom: 0;
	}
	img {
		width: 300px;
	}
	.card-columns {
		column-count: 2;
	}
}
</style>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="/">콜가드</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> 콜가드 소개 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">센터 소개</a> <a
							class="dropdown-item" href="#">콜가드 기능 소개</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdownSpam"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> 번호신고 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownSpam">
						<a class="dropdown-item" href="#">번호 신고 방법</a> <a
							class="dropdown-item" href="/report">번호 신고</a> <a class="dropdown-item"
							href="/reportList">번호 조회</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownCustomer" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> 고객광장 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownCustomer">
						<a class="dropdown-item" href="#">공지사항</a> <a
							class="dropdown-item" href="#">보안뉴스</a>
					</div></li>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item dropdown">
					<%
					if (request.getAttribute("username") != null) {
					%> <a
					class="nav-link dropdown-toggle" href="#" id="userDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <%=request.getAttribute("username")%>님
						환영합니다
				</a>
					<div class="dropdown-menu" aria-labelledby="userDropdown">
						<a class="dropdown-item" href="/myPage">마이 페이지</a> <a
							class="dropdown-item" href="/logout">로그아웃</a>
					</div> <%
 } else {
 %> <a class="nav-link" href="/login">로그인</a> <%
 }
 %>
				</li>
			</ul>
		</div>
	</nav>

	<div class="main-container">
		<div class="text-container">
			<p class="main-text">
				보이스피싱 걱정없이 <span class="highlight">안심통화</span>하세요
			</p>
			<p class="small-text">AI가 감지하고 경고해드립니다. 저희가 알아서 지켜드릴게요.</p>
			<div class="store-buttons">
				<a class="store-button"
					href="https://play.google.com/store/apps/details?id=YOUR_APP_ID"
					target="_blank"> <img
					src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Google_Play_Logo_2016.svg/1024px-Google_Play_Logo_2016.svg.png"
					alt="Google Play" style="width: 100%; height: auto;">
				</a> <a class="store-button"
					href="https://apps.apple.com/app/idYOUR_APP_ID" target="_blank">
					<img
					src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Apple_App_Store_logo.svg/1024px-Apple_App_Store_logo.svg.png"
					alt="App Store" style="width: 100%; height: auto;">
				</a>
			</div>
		</div>
		<img alt="" src="1.png">
	</div>

	<div class="container mt-5 card-container">
		<h2>공지사항</h2>
		<div class="card-columns">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">새로운 보안 업데이트</h5>
					<p class="card-text">콜가드의 보안 기능이 강화되었습니다. 최신 업데이트를 통해 더욱 안전한
						통화를 즐기세요.</p>
					<p class="card-text">
						<small class="text-muted">2024년 10월 1일</small>
					</p>
				</div>
			</div>
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">AI 보이스 탐지 강화</h5>
					<p class="card-text">콜가드가 AI 음성을 더욱 빠르게 탐지하고 경고하는 기능이 추가되었습니다.</p>
					<p class="card-text">
						<small class="text-muted">2024년 9월 25일</small>
					</p>
				</div>
			</div>
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">고객 지원 강화</h5>
					<p class="card-text">고객 지원 팀이 새롭게 조직되었습니다. 24시간 언제든지 문의해 주세요.</p>
					<p class="card-text">
						<small class="text-muted">2024년 9월 15일</small>
					</p>
				</div>
			</div>
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">이벤트: 보이스피싱 예방 캠페인</h5>
					<p class="card-text">저희의 새로운 캠페인에 참여하여 보이스피싱 예방에 동참하세요!</p>
					<p class="card-text">
						<small class="text-muted">2024년 10월 3일</small>
					</p>
				</div>
			</div>
		</div>
	</div>

	<div class="container mt-5 function-container">
		<h2>기능 소개</h2>
		<video controls autoplay loop muted>
			<source src="callguard.mp4" type="video/mp4">
		</video>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
	const cards = document.querySelectorAll('.card');

	const observerOptions = {
		root: null,
		rootMargin: '0px',
		threshold: 0.1
	};

	const observerCallback = (entries) => {
		entries.forEach(entry => {
			if (entry.isIntersecting) {
				entry.target.classList.add('visible');
				entry.target.classList.remove('hidden');
			} else {
				entry.target.classList.add('hidden');
			}
		});
	};

	const observer = new IntersectionObserver(observerCallback, observerOptions);

	cards.forEach(card => {
		observer.observe(card);
	});
</script>
</body>
</html>
