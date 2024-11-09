package com.example.demo.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "dependent")
public class Dependent {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private int age;
    private String relation;
    private String phone;

    // User와의 다대일 관계
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false) // user_id가 User 테이블의 id를 참조
    private User user;

    public Dependent() {}

    public Dependent(String name, int age, String relation, String phone, User user) {
        this.name = name;
        this.age = age;
        this.relation = relation;
        this.phone = phone;
        this.user = user;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getRelation() {
        return relation;
    }

    public void setRelation(String relation) {
        this.relation = relation;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
