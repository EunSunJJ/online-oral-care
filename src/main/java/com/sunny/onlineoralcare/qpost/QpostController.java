package com.sunny.onlineoralcare.qpost;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/qpost")
@Controller
public class QpostController {

	// 질문 글 상세보기
	@GetMapping("detail-view")
	public String qpostDetail() {
		return "qpost/detail";
	}
	
	// 질문 글 리스트
	@GetMapping("/list-view")
	public String qpostList() {
		return "qpost/list";
	}
	
	// 질문 글 쓰기
	@GetMapping("/create-view")
	public String qPostCreate() {
		return "qpost/create";
	}
}
