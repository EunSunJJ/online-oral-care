package com.sunny.onlineoralcare.manager;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//View 

@RequestMapping("/manager")
@Controller
public class ManagerController {
	
	// 로그아웃 기능
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("managerId");
		session.removeAttribute("managerLoginId");
		
		return "redirect:/manager/login-view";
	}
	
	// 사용자 로그인 화면
	@GetMapping("/login-view")
	public String userLogin() {
		return "manager/login";
	}
	
	// 관리자 회원가입 화면
	@GetMapping("/join-view")
	public String managerJoin() {
		return "manager/join";
	}

}
