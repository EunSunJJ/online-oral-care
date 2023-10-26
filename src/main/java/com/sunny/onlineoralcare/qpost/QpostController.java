package com.sunny.onlineoralcare.qpost;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sunny.onlineoralcare.common.Pagination;
import com.sunny.onlineoralcare.qpost.domain.Qpost;
import com.sunny.onlineoralcare.qpost.service.QpostService;

@RequestMapping("/qpost")
@Controller
public class QpostController {
	
	@Autowired
	private QpostService qpostService;
	
	// 질문 글 상세보기
	@GetMapping("/detail-view")
	public String qpostDetail(
			@RequestParam("id") int id
			, Model modle) {
		
		Qpost qpost= qpostService.getQpostById(id);
		modle.addAttribute("qpost", qpost);
		
		return "qpost/detail";
	}
	
	// 질문 글 리스트 + 페이징 추가
	@GetMapping("/list-view")
	public String qpostList(Model model,
			@RequestParam(value="page", required = false, defaultValue = "1") int page) {
		
		// 전체 게시물 개수 
		int totalPost = qpostService.countQpost();
		
		 //Pagination 객체생성
		Pagination pagination = new Pagination();
		 pagination.pageMaker(page, totalPost);
		 
		 model.addAttribute("pagination", pagination);
		
		// 페이징을 위해 질문 리스트에 리미트 조건걸어서 가져오기
		List<Qpost> qpostListLimit = qpostService.getQpostListLimit(pagination);
		model.addAttribute("qpostList" , qpostListLimit);
		
		return "qpost/list";
	}
	
	// 질문 글 쓰기
	@GetMapping("/create-view")
	public String qPostCreate() {
		return "qpost/create";
	}
}