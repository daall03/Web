package com.example.demo.entity;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "users") // 'users'라는 이름의 테이블에 매핑
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String username;
    private String email;
    private String phone;
    
    private String password; // 비밀번호 변수 추가

    // Dependent와의 일대다 관계
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Dependent> dependents;

    // 기본 생성자
    public User() {}

    // 매개변수가 있는 생성자
    public User(String username, String email, String phone, String password) {
        this.username = username;
        this.email = email;
        this.phone = phone;
        this.password = password; // 생성자에 비밀번호 추가
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() { // 비밀번호 Getter 추가
        return password;
    }

    public void setPassword(String password) { // 비밀번호 Setter 추가
        this.password = password;
    }

    public List<Dependent> getDependents() { // 피보호자 목록 Getter 추가
        return dependents;
    }

    public void setDependents(List<Dependent> dependents) { // 피보호자 목록 Setter 추가
        this.dependents = dependents;
    }
}
