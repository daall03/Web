package com.example.demo.controller;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.util.MultiValueMap;
import org.springframework.util.LinkedMultiValueMap;

import java.util.Map;

@RestController
@RequestMapping("/pay")
public class KakaoPayController {

    private static final String KAKAOPAY_API_URL = "https://kapi.kakao.com/v1/payment/ready";
    private static final String KAKAO_ADMIN_KEY = "a99dc32b48bbc830659a31aaafee0551"; // 카카오 어드민 키

    @PostMapping("/kakao")
    public ResponseEntity<?> prepareKakaoPayment(@RequestBody Map<String, Object> paymentInfo) {
        RestTemplate restTemplate = new RestTemplate();

        // Setting headers for the KakaoPay API request
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
        headers.set("Authorization", "KakaoAK " + KAKAO_ADMIN_KEY);

        // Preparing the request body
        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
        body.add("cid", "TC0ONETIME"); // Test merchant code
        body.add("partner_order_id", "partner_order_id"); // 주문 ID
        body.add("partner_user_id", "partner_user_id"); // 사용자 ID
        body.add("item_name", "초코파이"); // 상품명
        body.add("quantity", "1"); // 수량
        body.add("total_amount", "2200"); // 결제 금액
        body.add("vat_amount", "200"); // 부가세 금액
        body.add("tax_free_amount", "0"); // 면세 금액
        body.add("approval_url", "https://developers.kakao.com/success"); // 결제 성공 시 리다이렉트 URL
        body.add("fail_url", "https://developers.kakao.com/fail"); // 결제 실패 시 리다이렉트 URL
        body.add("cancel_url", "https://developers.kakao.com/cancel"); // 결제 취소 시 리다이렉트 URL

        HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);

        try {
            // Sending the request to KakaoPay API
            ResponseEntity<Map> response = restTemplate.exchange(
                KAKAOPAY_API_URL,
                HttpMethod.POST,
                entity,
                Map.class
            );

            // Handling response
            Map<String, Object> responseBody = response.getBody();
            if (responseBody != null && responseBody.containsKey("next_redirect_pc_url")) {
                String redirectUrl = (String) responseBody.get("next_redirect_pc_url");
                return ResponseEntity.ok(Map.of("redirect_url", redirectUrl));
            } else {
                return ResponseEntity.status(500).body("Failed to prepare KakaoPay payment: Missing redirect URL");
            }
        } catch (Exception e) {
            // Exception handling
            e.printStackTrace();
            return ResponseEntity.status(500).body("KakaoPay API request failed: " + e.getMessage());
        }
    }
}
