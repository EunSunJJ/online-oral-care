package com.sunny.onlineoralcare.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sunny.onlineoralcare.user.domain.User;
import com.sunny.onlineoralcare.user.service.UserService;

// View 

@RequestMapping("/user")
@Controller
public class UserController {
	
	@Autowired
	private UserService userService;

	// 문진표 기반 근처치과 list
	@GetMapping("/private/dentalClinic-view") 
	public String dentalClinic() {
		return "user/dentalClinic";
	}
	
	// 사적인 구강관리 문진표 
	@GetMapping("/private/survey-view")
		public String privateSurvey() {
			return "user/survey";
		}
	
	// 비밀번호 재설정하기
	@GetMapping("/reset/password-view")
	public String resetPassword() {
		return "user/resetPassword";
	}
	
	// 임시 비밀번호 발송하기
	@GetMapping("/lost/password-view")
	public String lostPassword() {
		return "user/lostPassword";
	}
	
	// 찾은 아이디 알려주기
	@PostMapping("/find/loginId-view")
	public String findLoginId(
			@RequestParam("name") String name
			, @RequestParam("email") String email
			, Model model) {
		
		User user = userService.getUserByNameAndEmail(name, email);
		model.addAttribute("userInfo", user);
		return "user/findId";
	}
	
	// 아이디 찾기
	@GetMapping("/lost/loginId-view")
	public String lostLoginId() {
		return "user/lostId";
	}
	
	// 내 정보 화면
	@GetMapping("/myInfo-view")
	public String myInfo(
			HttpSession session
			, Model model) {
		
		String loginId = (String)session.getAttribute("userLoginId");
		model.addAttribute("userId" , loginId);
		
		User user = userService.getUserByloginId(loginId);
		model.addAttribute("user", user);
		
		return "user/info";
	}
	
	// 로그아웃 기능
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("userId");
		session.removeAttribute("userLoginId");
		
		return "redirect:/user/login-view";
	}
	
	// 사용자 로그인 화면
	@GetMapping("/login-view")
	public String userLogin() {
		return "user/login";
	}
	
	// 사용자 회원가입 화면
	@GetMapping("/join-view")
	public String userJoin() {
		return "user/join";
	}
}
