package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.entity.Dependent;
import com.example.demo.repository.DependentRepository;

@Service
public class DependentService {

    @Autowired
    private DependentRepository dependentRepository; // Repository 주입

    // 피보호자 추가 메서드
    @Transactional
    public void addDependent(Dependent dependent) {
        dependentRepository.save(dependent); // DB에 피보호자 정보 저장
    }

    // 피보호자 삭제 메서드
    @Transactional
    public void deleteDependent(Long dependentId) {
        dependentRepository.deleteById(dependentId); // ID에 해당하는 피보호자 삭제
    }
}
