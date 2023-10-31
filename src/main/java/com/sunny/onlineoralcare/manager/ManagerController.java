package com.sunny.onlineoralcare.manager;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sunny.onlineoralcare.qpost.domain.Qpost;

//View 

@RequestMapping("/manager")
@Controller
public class ManagerController {
	
	// 질문 게시물 상세페이지 - 답변달기 기능
	@GetMapping("/qpost/answer-view")
	public String qpostDetail() {
		return "manager/detail";
	}
	
	// 질문 글 리스트 + 페이징 추가
	@GetMapping("/qpost/list-view")
	public String qpostList(Model model) {
		
//		List<Qpost> qpostList = 
//		model.addAttribute("qpostList",qpostList);
		return "manager/list";
	}	
	
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
