package com.sunny.onlineoralcare.manager;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sunny.onlineoralcare.common.Pagination;
import com.sunny.onlineoralcare.qpost.domain.Qpost;
import com.sunny.onlineoralcare.qpost.service.QpostService;
 
@RequestMapping("/manager")
@Controller
public class ManagerController {

	@Autowired
	private QpostService qpostService;
	
	// 꿀팁 모음집 상세보기 - 수정/삭제 
	@GetMapping("/tpost/detail-view")
	public String tpostDetail() {
		return "manager/tpostDetail";
	}
	
	// 꿀팁 모음집 작성
	@GetMapping("/tpost/create-view")
	public String tpostCreate() {
		return "manager/tpostCreate";
	}
	
	// 질문 게시물 상세페이지 - 답변달기 기능
	@GetMapping("/qpost/answer-view")
	public String managerQpostDetail(
			@RequestParam("id") int id
			, Model modle
			, HttpSession session) {

		int managerId = (Integer)session.getAttribute("managerId");
		modle.addAttribute("managerId", managerId);
		
		Qpost qpost= qpostService.getQpostById(id);
		modle.addAttribute("qpost", qpost);
		
		return "manager/qpostDetail";
	}
	
	// 질문 글 리스트 + 페이징 추가
	@GetMapping("/qpost/list-view")
	public String managerQpostList(Model model
			, @RequestParam(value="page", required = false, defaultValue = "1") int page
			, @RequestParam(value="keyword", required=false) String keyword
			, @RequestParam(value="searchType", required=false) String searchType) {
		
			
			//Pagination 객체생성
			Pagination pagination = new Pagination();
			
			// 전체 게시물 개수 
			int totalPost = qpostService.countQpost(pagination);
			
			pagination.pageMaker(page, totalPost, keyword, searchType);
			
			model.addAttribute("pagination", pagination);
			
			
			// 페이징을 위해 질문 리스트에 리미트 조건걸어서 가져오기
			List<Qpost> qpostListLimit = qpostService.getQpostListLimit(pagination);
			model.addAttribute("qpostList" , qpostListLimit);

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
