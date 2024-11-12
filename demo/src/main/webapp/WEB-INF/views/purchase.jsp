<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.net.*, java.io.*, org.json.JSONObject" %>
<%@ page import="org.json.JSONObject" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>요금제 구매</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f7f7f7;
	margin: 0;
	padding: 0;
}

.container {
	margin-top: 50px;
}

.plan-card {
	border: 1px solid #ddd;
	border-radius: 8px;
	padding: 20px;
	text-align: center;
	background-color: #ffffff;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.plan-card h3 {
	color: #333;
	font-weight: 600;
	font-size: 1.5rem;
}

.plan-card p {
	font-size: 1.2rem;
	color: #777;
}

.plan-card .price {
	font-size: 2rem;
	color: #007bff;
	margin: 15px 0;
}

.btn-pay {
	width: 100%;
	font-size: 1.2rem;
	padding: 10px;
	border-radius: 5px;
	background-color: #FFEB00;
	color: #000;
	font-weight: bold;
}

.btn-pay:hover {
	background-color: #FFD700;
	color: #000;
}

.navbar {
	margin-bottom: 30px;
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

	<div class="container">
		<h1 class="text-center">요금제 구매</h1>
		<p class="text-center text-muted">원하는 요금제를 선택하여 결제하세요.</p>

		<div class="row justify-content-center">
			<!-- Basic Plan -->
			<div class="col-md-4">
				<div class="plan-card">
					<h3>베이직 요금제</h3>
					<p>기본 기능 제공</p>
					<div class="price">₩5,000 / 월</div>
					<!-- 카카오페이 결제를 위한 hidden input 추가 -->
					<form id="paymentForm" action="#" method="post">
						<input type="hidden" name="plan" value="basic"> <input
							type="hidden" name="amount" value="5000"> <input
							type="hidden" name="item_name" value="베이직 요금제"> <input
							type="hidden" name="quantity" value="1"> <input
							type="hidden" name="tax_free_amount" value="0">
						<button type="submit" class="btn btn-pay">카카오페이로 결제</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script>
	document.getElementById('paymentForm').onsubmit = function(event) {
	    event.preventDefault();

	    // 결제 준비 API 호출
	    fetch('/pay/kakao', {
	        method: 'POST',
	        headers: { 
	            'Content-Type': 'application/json' 
	        },
	        body: JSON.stringify({
	            plan: 'basic',
	            amount: 5000,
	            item_name: '베이직 요금제',
	            quantity: 1,
	            tax_free_amount: 0
	        })
	    })
	    .then(response => response.json())  // Try to parse response as JSON
	    .then(data => {
	        // Check if the response contains the redirect URL
	        if (data.redirect_url) {
	            window.location.href = data.redirect_url;
	        } else {
	            console.error('Invalid response format', data);
	        }
	    })
	    .catch(error => {
	        console.error('결제 준비 중 오류 발생', error);
	    });
	}

    </script>
</body>
</html>
