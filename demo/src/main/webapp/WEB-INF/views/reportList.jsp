<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.demo.entity.ReportNumber" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신고된 번호 목록</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background-color: white;
        }
        .container {
            padding: 20px;
        }
        .table {
            margin-top: 20px;
        }
        .navbar {
            margin-bottom: 20px;
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
						<a class="dropdown-item" href="/my-page">마이 페이지</a> <a
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


<div class="container">
    <h2>신고된 번호 목록</h2>

    <!-- 검색 폼 추가 -->
    <form action="reportList" method="get" class="mb-4">
        <div class="input-group">
            <input type="text" name="searchPhoneNumber" class="form-control" placeholder="전화번호 검색" required>
            <div class="input-group-append">
                <button class="btn btn-primary" type="submit">검색</button>
            </div>
        </div>
    </form>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>전화번호</th>
                <th>신고 횟수</th>
                <th>신고 사유</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<ReportNumber> reportList = (List<ReportNumber>) request.getAttribute("reportList");
                String searchPhoneNumber = request.getParameter("searchPhoneNumber");
                
                if (reportList != null && !reportList.isEmpty()) {
                    // 전화번호와 신고 횟수를 저장할 Map
                    Map<String, Integer> reportCountMap = new HashMap<>();
                    Map<String, ReportNumber> reportDetailMap = new HashMap<>();

                    // 신고 목록을 반복하여 전화번호 및 신고 횟수 집계
                    for (ReportNumber report : reportList) {
                        String phoneNumber = report.getPhoneNumber();
                        reportCountMap.put(phoneNumber, reportCountMap.getOrDefault(phoneNumber, 0) + 1);
                        reportDetailMap.put(phoneNumber, report); // 마지막 신고 정보를 저장
                    }

                    // 검색 기능 구현
                    if (searchPhoneNumber != null && !searchPhoneNumber.isEmpty()) {
                        reportCountMap.entrySet().removeIf(entry -> !entry.getKey().contains(searchPhoneNumber));
                    }

                    // Map을 반복하여 출력
                    for (Map.Entry<String, Integer> entry : reportCountMap.entrySet()) {
                        String phoneNumber = entry.getKey();
                        int count = entry.getValue();
                        ReportNumber report = reportDetailMap.get(phoneNumber);
            %>
            <tr>
                <td><%= phoneNumber %></td>
                <td><%= count %></td>
                <td><%= report.getReason() %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="5" class="text-center">신고된 번호가 없습니다.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
