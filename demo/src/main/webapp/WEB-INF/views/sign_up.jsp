<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background-color: white;
        }
        .signup-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }
        .signup-card {
            width: 400px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: white;
        }
        .signup-title {
            margin-bottom: 20px;
            font-size: 24px;
            text-align: center;
            color: #003366;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
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
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    콜가드 소개
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">센터 소개</a>
                    <a class="dropdown-item" href="#">콜가드 기능 소개</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownSpam" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    번호 신고
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownSpam">
                    <a class="dropdown-item" href="#">번호 신고 방법</a>
                    <a class="dropdown-item" href="#">번호 신고</a>
                    <a class="dropdown-item" href="#">번호 신고 처리 결과</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownCustomer" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    고객광장
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownCustomer">
                    <a class="dropdown-item" href="#">공지사항</a>
                    <a class="dropdown-item" href="#">보안뉴스</a>
                </div>
            </li>
        </ul>
    </div>
</nav>

<div class="signup-container">
    <div class="signup-card">
        <h2 class="signup-title">회원가입</h2>

        <!-- 성공 메시지 출력 -->
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success">${successMessage}</div>
        </c:if>

        <form action="/sign_up" method="post">
            <div class="form-group">
                <label for="username">아이디</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="confirm-password">비밀번호 확인</label>
                <input type="password" class="form-control" id="confirm-password" name="confirm-password" required>
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="phone">전화번호</label>
                <input type="text" class="form-control" id="phone" name="phone" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">회원가입</button>
        </form>
        <div class="text-center mt-3">
            <a href="/login">이미 계정이 있으신가요? 로그인</a>
        </div>
    </div>
</div>

<!-- Toast Notification -->
<div class="toast" id="successToast" style="position: absolute; top: 20px; right: 20px;" data-autohide="true" data-delay="3000">
    <div class="toast-header">
        <strong class="mr-auto">알림</strong>
        <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="toast-body">
        회원가입 되었습니다.
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    $(document).ready(function() {
        <c:if test="${not empty successMessage}">
            $('#successToast').toast('show');
        </c:if>
    });
</script>
</body>
</html>
