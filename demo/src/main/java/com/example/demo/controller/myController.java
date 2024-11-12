package com.example.demo.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.entity.Dependent;
import com.example.demo.entity.ReportNumber;
import com.example.demo.entity.User;
import com.example.demo.repository.DependentRepository;
import com.example.demo.repository.ReportNumberRepository;
import com.example.demo.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
@SessionAttributes("username") // 세션에 저장할 속성 정의
public class myController {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ReportNumberRepository reportNumberRepository;
    @Autowired
    private DependentRepository dependentRepository;

    
    @GetMapping("/") // 메인
    public String home(Model model) {
        String username = (String) model.getAttribute("username");
        model.addAttribute("isLoggedIn", username != null);
        model.addAttribute("username", username);
        return "index"; // index.jsp
    }

    @GetMapping("/login") // 로그인 이동
    public String login() {
        return "login"; // login.jsp
    }

    @PostMapping("/login") // 로그인 처리
    public String loginUser(@ModelAttribute User user, Model model, RedirectAttributes redirectAttributes) {
        Optional<User> existingUser = userRepository.findByUsername(user.getUsername());

        if (existingUser.isPresent()) {
            User dbUser = existingUser.get();
            if (dbUser.getPassword().equals(user.getPassword())) {
                model.addAttribute("username", user.getUsername());
                redirectAttributes.addFlashAttribute("successMessage", "로그인 성공!");
                return "redirect:/"; // 로그인 성공 후 메인 페이지로 리다이렉트
            } else {
                redirectAttributes.addFlashAttribute("error", "비밀번호가 일치하지 않습니다.");
                return "redirect:/login"; // 비밀번호 불일치 시 로그인 페이지로 리다이렉트
            }
        } else {
            redirectAttributes.addFlashAttribute("error", "사용자가 존재하지 않습니다.");
            return "redirect:/login"; // 사용자 미존재 시 로그인 페이지로 리다이렉트
        }
    }

    @GetMapping("/sign_up") // 회원가입 이동
    public String signUp() {
        return "sign_up"; // 회원가입 페이지로 리다이렉트
    }

    @PostMapping("/sign_up") // 회원가입 처리
    public String registerUser(@ModelAttribute User user, RedirectAttributes redirectAttributes) {
        Optional<User> existingUserByUsername = userRepository.findByUsername(user.getUsername());
        if (existingUserByUsername.isPresent()) {
            redirectAttributes.addFlashAttribute("error", "이미 사용 중인 사용자 이름입니다.");
            return "redirect:/sign_up"; // 중복된 경우 회원가입 페이지로 리다이렉트
        }

        Optional<User> existingUserByEmail = userRepository.findByEmail(user.getEmail());
        if (existingUserByEmail.isPresent()) {
            redirectAttributes.addFlashAttribute("error", "이미 사용 중인 이메일입니다.");
            return "redirect:/sign_up"; // 중복된 경우 회원가입 페이지로 리다이렉트
        }

        Optional<User> existingUserByPhone = userRepository.findByPhone(user.getPhone());
        if (existingUserByPhone.isPresent()) {
            redirectAttributes.addFlashAttribute("error", "이미 사용 중인 전화번호입니다.");
            return "redirect:/sign_up"; // 중복된 경우 회원가입 페이지로 리다이렉트
        }

        userRepository.save(user);
        redirectAttributes.addFlashAttribute("successMessage", "회원가입이 완료되었습니다.");
        return "redirect:/sign_up"; // 성공적으로 회원가입한 후 회원가입 페이지로 리다이렉트
    }

    @GetMapping("/logout") // 로그아웃 처리
    public String logout(RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("username", null); // username 속성 제거
        return "redirect:/"; // 메인 페이지로 리다이렉트
    }

    @GetMapping("/report")
    public String reportForm(Model model) {
        return "reportNumber"; // reportNumber.jsp로 이동
    }

    @PostMapping("/report") // 신고 데이터 저장 처리
    public String reportSubmit(@ModelAttribute ReportNumber reportNumber, RedirectAttributes redirectAttributes) {
        reportNumber.setReportDate(new Date()); // reportDate에 현재 날짜 설정

    	// 신고 데이터를 데이터베이스에 저장
        reportNumberRepository.save(reportNumber);

        // 신고 성공 메시지를 전달
        redirectAttributes.addFlashAttribute("message", "신고가 성공적으로 접수되었습니다.");

        return "redirect:/report"; // 다시 신고 페이지로 리다이렉트
    }
    
    @GetMapping("/reportList")
    public String showReportList(Model model) {
        List<ReportNumber> reportList = reportNumberRepository.findAll(); // 모든 신고된 번호를 가져옵니다.
        model.addAttribute("reportList", reportList); // model에 reportList 추가
        return "reportList"; // reportList.jsp로 이동합니다.
    }
    

    @GetMapping("/myPage")
    public String myPage(Model model) {
        String username = (String) model.getAttribute("username"); // 세션에서 username 가져오기
        if (username != null) {
            Optional<User> userOpt = userRepository.findByUsername(username); // username으로 사용자 조회
            if (userOpt.isPresent()) {
                User user = userOpt.get(); // 사용자 정보
                model.addAttribute("user", user); // 모델에 사용자 정보 추가

                // User 객체에서 피보호자 목록 가져오기
                List<Dependent> dependents = user.getDependents(); // 피보호자 목록
                model.addAttribute("guardians", dependents); // 모델에 피보호자 목록 추가
            }
        }
        return "myPage"; // myPage.jsp로 리턴
    }
    

    @GetMapping("/guardian/add") // 피보호자 추가 페이지 이동
    public String addGuardianPage() {
        return "addGuardian";
    }
    @PostMapping("/guardian/add")
    public String addGuardian(@RequestParam("name") String name,
                              @RequestParam("age") int age,
                              @RequestParam("relation") String relation,
                              @RequestParam("phone") String phone,
                              HttpSession session,
                              RedirectAttributes redirectAttributes) {

        // 세션에서 username 가져오기
        String username = (String) session.getAttribute("username");
        
        if (username == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "로그인이 필요합니다.");
            return "redirect:/login";
        }

        // user_id로 User 객체 찾기
        Optional<User> userOpt = userRepository.findByUsername(username);
        if (userOpt.isEmpty()) {
            redirectAttributes.addFlashAttribute("errorMessage", "유효하지 않은 사용자입니다.");
            return "redirect:/login";
        }

        User user = userOpt.get(); // User 객체 가져오기

        // 피보호자 객체 생성 및 User 객체 설정
        Dependent newGuardian = new Dependent();
        newGuardian.setUser(user);  // User 객체 설정
        newGuardian.setName(name);
        newGuardian.setAge(age);
        newGuardian.setRelation(relation);
        newGuardian.setPhone(phone);

        // 데이터베이스에 저장
        dependentRepository.save(newGuardian);
        
        // 성공 메시지 추가
        redirectAttributes.addFlashAttribute("successMessage", "피보호자가 성공적으로 추가되었습니다.");
        
        // 마이페이지로 리다이렉트
        return "redirect:/myPage";
    }

    
    @PostMapping("/guardian/delete")
    public String deleteGuardian(@RequestParam("id") Long id, RedirectAttributes redirectAttributes) {
        Optional<Dependent> dependent = dependentRepository.findById(id);

        if (dependent.isPresent()) {
            dependentRepository.delete(dependent.get());
            redirectAttributes.addFlashAttribute("successMessage", "피보호자가 성공적으로 삭제되었습니다.");
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "해당 피보호자를 찾을 수 없습니다.");
        }

        return "redirect:/myPage"; // 삭제 후 마이페이지로 리다이렉트
    }

    @GetMapping("/purchase-plan")
    public String purchasePlan(Model model) {
        // 페이지 이동
        return "purchase"; 
    }


}
