package com.example.demo.service;

import com.example.demo.entity.User;
import com.example.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    // 사용자 등록
    @Transactional
    public User registerUser(User user) {
        return userRepository.save(user);
    }

    // ID로 사용자 조회
    public Optional<User> findUserById(Long userId) {
        return userRepository.findById(userId);
    }

    // 모든 사용자 조회
    public List<User> findAllUsers() {
        return userRepository.findAll();
    }

    // 사용자 삭제
    @Transactional
    public void deleteUser(Long userId) {
        userRepository.deleteById(userId);
    }

    // 사용자 이름으로 조회
    public Optional<User> findUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    // 사용자 이메일로 조회
    public Optional<User> findUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    // 사용자 전화번호로 조회
    public Optional<User> findUserByPhone(String phone) {
        return userRepository.findByPhone(phone);
    }
}
