package com.sunny.onlineoralcare.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

// View 

@RequestMapping("/user")
@Controller
public class UserController {
	
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
