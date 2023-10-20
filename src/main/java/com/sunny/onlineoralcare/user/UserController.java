package com.sunny.onlineoralcare.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

// View 

@RequestMapping("/user")
@Controller
public class UserController {
	
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
