package com.sunny.onlineoralcare.manager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//View 

@RequestMapping("/manager")
@Controller
public class ManagerController {
	
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
