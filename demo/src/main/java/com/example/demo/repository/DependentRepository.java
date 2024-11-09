package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.Dependent;

@Repository
public interface DependentRepository extends JpaRepository<Dependent, Long> {
    // JpaRepository 인터페이스를 상속받아 기본 CRUD 메서드 사용 가능
}
