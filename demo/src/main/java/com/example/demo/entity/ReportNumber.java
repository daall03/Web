package com.example.demo.entity;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "reportnumber") // 테이블 이름 수정
public class ReportNumber {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "reportnumber_seq_generator") // SEQUENCE 전략 사용
    @SequenceGenerator(name = "reportnumber_seq_generator", sequenceName = "reportnumber_seq", allocationSize = 1) // 시퀀스 생성자
    private Long id;  // 자동 증가 ID

    @Column(name = "phoneNumber", nullable = false, length = 15)
    private String phoneNumber;  // 신고된 전화번호

    @Column(name = "reason", nullable = false, length = 50)
    private String reason;  // 신고 사유

    @Column(name = "details", length = 255)
    private String details;  // 기타 신고 내용

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "reportDate", nullable = false)
    private Date reportDate;  // 신고 날짜

    // 기본 생성자
    public ReportNumber() {
    }

    // 모든 필드를 사용하는 생성자
    public ReportNumber(String phoneNumber, String reason, String details, Date reportDate) {
        this.phoneNumber = phoneNumber;
        this.reason = reason;
        this.details = details;
        this.reportDate = reportDate;
    }

    // Getter 및 Setter 메소드
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public Date getReportDate() {
        return reportDate;
    }

    public void setReportDate(Date reportDate) {
        this.reportDate = reportDate;
    }
}
