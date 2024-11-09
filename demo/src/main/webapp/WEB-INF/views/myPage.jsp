<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.example.demo.entity.User"%>
<%@ page import="com.example.demo.entity.Dependent"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f7f7f7;
}

.mypage-container {
	background-color: #ffffff;
	padding: 40px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	margin-top: 20px;
}

h1 {
	color: #333;
	font-size: 2rem;
	font-weight: 600;
}

.navbar {
	margin-bottom: 30px;
}

.navbar-brand {
	font-weight: bold;
	color: #5f6368;
}

.navbar-nav .nav-item .nav-link {
	color: #007bff;
}

.navbar-nav .nav-item .nav-link:hover {
	color: #0056b3;
}

.user-info, .guardian-info {
	margin: 20px 0;
	font-size: 1.1rem;
}

.user-info strong {
	color: #333;
}

.guardian-list {
	list-style-type: none;
	padding: 0;
}

.guardian-list li {
	background-color: #e0f7fa;
	margin: 10px 0;
	padding: 15px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.guardian-list li:hover {
	background-color: #b2ebf2;
}

/* 버튼 공통 스타일 */
.guardian-form button, .action-buttons a {
	font-size: 1rem;
	padding: 10px 20px;
	border-radius: 5px;
	width: 100%;
	text-align: center;
}

.btn-logout, .btn-login {
	font-size: 1rem;
	padding: 10px 20px;
	border-radius: 5px;
	width: 100%;
	text-align: center;
}

.btn-logout {
	background-color: #d9534f;
	color: white;
}

.btn-logout:hover {
	background-color: #c9302c;
}

.btn-login {
	background-color: #28a745;
	color: white;
}

.btn-login:hover {
	background-color: #218838;
}

.alert {
	font-size: 1rem;
	padding: 10px;
	margin-top: 20px;
}

/* action-buttons 스타일 */
.action-buttons {
	display: flex;
	justify-content: space-between;
	margin-top: 10px;
}

/* 버튼들이 세로로 배열되게 조정 */
.action-buttons a, .guardian-form button {
	width: 100%;
	margin-bottom: 10px;
}
</style>
</head>
<body>

	<!-- Navigation Bar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#">콜가드</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="/">홈</a></li>
				<li class="nav-item"><a class="nav-link" href="/myPage">마이
						페이지</a></li>
			</ul>
		</div>
	</nav>

	<!-- Main Content -->
	<div class="container">
		<div class="mypage-container">
			<h1>마이 페이지</h1>
			<div class="alert alert-info">
				<p>현재 30일 무료 플랜을 사용 중입니다. 요금제를 구매하려면 아래 버튼을 클릭하세요.</p>
				<a href="/purchase-plan" class="btn btn-primary">요금제 구매하기</a>
			</div>

			<%
			User user = (User) request.getAttribute("user");
			List<Dependent> guardians = (List<Dependent>) request.getAttribute("guardians");
			%>

			<%
			if (user != null) {
			%>
			<div class="user-info">
				<strong>사용자 이름:</strong>
				<%=user.getUsername()%><br> <strong>이메일:</strong>
				<%=user.getEmail()%><br> <strong>전화번호:</strong>
				<%=user.getPhone()%><br>
			</div>
			<%
			} else {
			%>
			<div class="alert alert-danger">사용자 정보를 불러올 수 없습니다. 로그인 후 다시
				시도하세요.</div>
			<%
			}
			%>

			<h2>피보호자 목록</h2>
			<%
			if (guardians != null && !guardians.isEmpty()) {
			%>
			<ul class="guardian-list">
				<%
				for (Dependent guardian : guardians) {
				%>
				<li>
					<div>
						<strong>이름:</strong>
						<%=guardian.getName()%><br> <strong>관계:</strong>
						<%=guardian.getRelation()%><br> <strong>전화번호:</strong>
						<%=guardian.getPhone()%><br>
					</div>
					<form action="/guardian/delete" method="post">
						<input type="hidden" name="id" value="<%=guardian.getId()%>">
						<button type="submit" class="btn btn-danger btn-sm">피보호자
							삭제하기</button>
					</form>
				</li>
				<%
				}
				%>
			</ul>
			<%
			} else {
			%>
			<div class="alert alert-info">등록된 피보호자가 없습니다.</div>
			<%
			}
			%>

			<div class="guardian-form">
				<form action="/guardian/add" method="get">
					<button type="submit" class="btn btn-primary btn-lg">피보호자
						추가하기</button>
				</form>
			</div>

			<div class="action-buttons">
				<%
				if (user != null) {
				%>
				<a href="/logout" class="btn-logout">로그아웃</a>
				<%
				} else {
				%>
				<a href="/login" class="btn-login">로그인</a>
				<%
				}
				%>
			</div>

		</div>
	</div>

	<!-- Bootstrap JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
