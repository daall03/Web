<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>상품 정보</h2>
        <div class="alert alert-info">
            <strong>주의!</strong> 결제 전에 요금제와 결제 방법을 확인해주세요.
        </div>

        <div class="title">상품 정보</div>
        <p>토스 티셔츠</p>
        <p>결제 금액: 15,000원</p>

        <!-- 결제 방법 영역 -->
        <div class="title">결제 방법</div>
        <div id="payment-method"></div>
        <div id="agreement"></div>

        <!-- 결제 버튼 -->
        <button id="payment-button" class="btn btn-success btn-lg btn-block">결제하기</button>
    </div>

    <script>
        const clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq'; // 상점을 특정하는 키
        const customerKey = 'YbX2HuSlsC9uVJW6NMRMj'; // 결제 고객을 특정하는 키
        const amount = 15_000; // 결제 금액

        // 결제위젯 영역 렌더링
        const paymentWidget = PaymentWidget(clientKey, customerKey); // 회원 결제 초기화
        // const paymentWidget = PaymentWidget(clientKey, PaymentWidget.ANONYMOUS); // 비회원 결제 초기화
        const paymentMethods = paymentWidget.renderPaymentMethods('#payment-method', amount);

        // 약관 영역 렌더링
        const paymentAgreement = paymentWidget.renderAgreement('#agreement');

        // 결제 요청 함수 정의
        document.querySelector("#payment-button").addEventListener("click", () => {
            paymentWidget.requestPayment({
                orderId: 'AD8aZDpbzXs4EQa-UkIX6', // 주문 ID
                orderName: '토스 티셔츠 외 2건', // 주문명
                successUrl: 'http://localhost:8080/success', // 결제 성공 후 리디렉션 URL
                failUrl: 'http://localhost:8080/fail', // 결제 실패 후 리디렉션 URL
                customerEmail: 'customer123@gmail.com', // 고객 이메일
                customerName: '김토스' // 고객 이름
            }).catch(function (error) {
                if (error.code === 'USER_CANCEL') {
                    console.log('결제창이 닫혔습니다.');
                } else if (error.code === 'INVALID_CARD_COMPANY') {
                    console.log('유효하지 않은 카드입니다.');
                } else {
                    console.log('알 수 없는 오류가 발생했습니다.');
                }
            });
        });
    </script>

    <!-- Bootstrap JS (Optional, for modal/pop-up support) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
