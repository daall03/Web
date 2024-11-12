<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.net.*, java.io.*, org.json.JSONObject" %>
<%@ page import="org.json.JSONObject" %>

<%
    // 카카오페이 API 요청을 위한 키 및 URL
    String adminKey = "8dc2c3db5eed9a03aeeebdc045c168a4";  // 카카오페이 관리자 키
    String requestUrl = "https://kapi.kakao.com/v1/payment/ready"; // 카카오페이 결제 준비 API

    // 요금제 및 가격 정보
    String selectedPlan = request.getParameter("selectedPlan");
    int price = Integer.parseInt(request.getParameter("price").replaceAll("[^0-9]", ""));

    // 사용자 정보
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");

    // 카카오페이 결제 요청 JSON 생성
    JSONObject payload = new JSONObject();
    payload.put("cid", "TC0ONETIME");  // 카카오페이 상점 코드 (예시)
    payload.put("partner_order_id", System.currentTimeMillis());  // 주문 ID
    payload.put("partner_user_id", name);  // 사용자 ID
    payload.put("item_name", selectedPlan);  // 상품명
    payload.put("quantity", 1);  // 수량
    payload.put("total_amount", price);  // 결제 금액
    payload.put("tax_free_amount", 0);  // 면세 금액
    payload.put("approval_url", "http://localhost:8080/approval.jsp");  // 결제 성공 후 리다이렉트 URL
    payload.put("cancel_url", "http://localhost:8080/cancel.jsp");  // 결제 취소 후 리다이렉트 URL
    payload.put("fail_url", "http://localhost:8080/fail.jsp");  // 결제 실패 후 리다이렉트 URL

    // 카카오페이 결제 요청
    URL url = new URL("https://open-api.kakaopay.com");
    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
    connection.setRequestMethod("POST");
    connection.setRequestProperty("Authorization", "KakaoAK " + "a99dc32b48bbc830659a31aaafee0551");
    connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
    connection.setDoOutput(true);
    connection.setDoInput(true);

    // JSON 데이터를 바디에 넣어 전송
    try (OutputStream os = connection.getOutputStream()) {
        byte[] input = payload.toString().getBytes("utf-8");
        os.write(input, 0, input.length);
    }

 // 카카오페이 응답 받기
    try (BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"))) {
        String responseBody = reader.readLine();  // 응답 내용을 변수에 저장
        System.out.println("카카오페이 응답: " + responseBody);  // 응답 내용 출력
        JSONObject responseJson = new JSONObject(responseBody);
        String redirectUrl = responseJson.getString("next_redirect_pc_url");  // 결제 페이지 URL

        // 결제 페이지로 리다이렉트
        System.out.println("리다이렉트 URL: " + redirectUrl);  // 리다이렉트 URL 출력
        response.sendRedirect(redirectUrl);
    }
%>
