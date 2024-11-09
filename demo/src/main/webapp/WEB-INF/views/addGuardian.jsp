<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>피보호자 추가</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
            background-color: #f8f9fa;
        }
        .main-container {
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #343a40;
        }
        .highlight {
            color: #007bff;
        }
        .form-group label {
            font-weight: bold;
        }
        .btn-submit {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .btn-submit:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

    <!-- Main Content -->
    <div class="container mt-5 main-container">
        <h1>피보호자 추가</h1>
        <p class="highlight">새로운 피보호자 정보를 입력하세요</p>
        
        <form action="/guardian/add" method="post">
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="age">나이</label>
                <input type="number" id="age" name="age" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="relation">관계</label>
                <input type="text" id="relation" name="relation" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="phone">전화번호</label>
                <input type="text" id="phone" name="phone" class="form-control" required>
            </div>
            <button type="submit" class="btn-submit">추가</button>
        </form>
    </div>

    <!-- JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
