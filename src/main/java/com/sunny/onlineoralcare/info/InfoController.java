package com.sunny.onlineoralcare.info;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/info")
@Controller
public class InfoController {

	// 꿀팁 모음집
	@GetMapping("/honeyTip-view")
	public String honeyTip() {
		return "info/honey";
	}
	
	// 구강관리 정보 상세보기
	@GetMapping("/careDetail-view")
	public String careDetail() {
		return "info/careDetail";
	}
	
	// 구강관리 정보 키워드로 보여주기
	@GetMapping("care-view")
	public String care() {
		return "info/care";
	}
}
