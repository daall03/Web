<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>번호 신고하기</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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

body {
	font-family: Arial, sans-serif;
	background-color: #f9f9f9;
	padding: 80px 20px; /* navbar 공간 확보 */
}

.container {
	max-width: 600px;
	margin: 0 auto;
	padding: 20px;
	background-color: white;
	border-radius: 10px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	margin-bottom: 20px;
}

.btn-submit {
	width: 100%;
	padding: 10px;
	margin-top: 20px;
}

@media (max-width: 768px) {
	body {
		padding: 60px 10px; /* 모바일 환경에서의 패딩 감소 */
	}
	.container {
		padding: 15px;
	}
	h2 {
		font-size: 1.5rem; /* 작은 화면에서 헤더 폰트 크기 조정 */
	}
	.btn-submit {
		padding: 12px;
		font-size: 1rem; /* 버튼 텍스트 크기 조정 */
	}
}

@media (max-width: 576px) {
	.navbar-brand {
		font-size: 1.2rem;
	}
	.form-control {
		font-size: 0.9rem; /* 폼 입력 폰트 크기 조정 */
	}
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="/">콜가드</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 콜가드 소개 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">센터 소개</a> <a class="dropdown-item" href="#">콜가드 기능 소개</a>
					</div></li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdownSpam" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 번호신고 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownSpam">
						<a class="dropdown-item" href="#">번호 신고 방법</a> <a class="dropdown-item" href="/report">번호 신고</a> <a class="dropdown-item" href="/reportList">번호 조회</a>
					</div></li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdownCustomer" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 고객광장 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownCustomer">
						<a class="dropdown-item" href="#">공지사항</a> <a class="dropdown-item" href="#">보안뉴스</a>
					</div></li>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item dropdown">
					<%
					if (request.getAttribute("username") != null) {
					%> <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <%=request.getAttribute("username")%>님 환영합니다 </a>
					<div class="dropdown-menu" aria-labelledby="userDropdown">
						<a class="dropdown-item" href="/my-page">마이 페이지</a> <a class="dropdown-item" href="/logout">로그아웃</a>
					</div> <%
 } else {
 %> <a class="nav-link" href="/login">로그인</a> <%
 }
 %>
				</li>
			</ul>
		</div>
	</nav>

	<div class="container">
		<h2>번호 신고하기</h2>

		<form action="report" method="post" id="reportForm">
			<!-- 전화번호 입력 -->
			<div class="form-group">
				<label for="phoneNumber">신고할 전화번호</label> 
                <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" required placeholder="전화번호를 입력하세요 (예: 010-1234-5678)">
			</div>

			<!-- 신고 사유 선택 -->
			<div class="form-group">
				<label for="reason">신고 사유</label> 
                <select class="form-control" id="reason" name="reason" required>
					<option value="">사유를 선택하세요</option>
					<option value="스팸">스팸</option>
					<option value="사기">사기</option>
					<option value="협박">협박</option>
					<option value="기타">기타</option>
				</select>
			</div>

			<!-- 기타 사유 입력 -->
			<div class="form-group">
				<label for="details">기타 사유 (선택)</label>
				<textarea class="form-control" id="details" name="details" rows="3" placeholder="기타 신고 사유를 입력하세요"></textarea>
			</div>

			<!-- 로그인된 경우에만 버튼 활성화 -->
			<%
			if (request.getAttribute("username") != null) {
			%>
			<button type="submit" class="btn btn-primary btn-submit">신고하기</button>
			<%
			} else {
			%>
			<div class="alert alert-warning" role="alert">
				신고하기 기능을 사용하려면 로그인이 필요합니다. <a href="/login" class="alert-link">로그인</a>하세요.
			</div>
			<%
			}
			%>
		</form>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
		// 폼 제출 이벤트 리스너
		document.getElementById("reportForm").addEventListener("submit", function(event) {
			// 신고가 완료된 후 알림창을 표시합니다.
			alert("신고가 완료되었습니다.");
		});
	</script>
</body>
</html>
