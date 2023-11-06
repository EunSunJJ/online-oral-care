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
	@GetMapping("/careDetail-view1")
	public String careDetail1() {
		return "info/careDetail1";
	}
	
	// 구강관리 정보 상세보기
	@GetMapping("/careDetail-view2")
	public String careDetail2() {
		return "info/careDetail2";
	}	
	
	// 구강관리 정보 상세보기
	@GetMapping("/careDetail-view3")
	public String careDetail3() {
		return "info/careDetail3";
	}	
	
	// 구강관리 정보 상세보기
	@GetMapping("/careDetail-view4")
	public String careDetail4() {
		return "info/careDetail4";
	}
	
	// 구강관리 정보 상세보기
	@GetMapping("/careDetail-view5")
	public String careDetail5() {
		return "info/careDetail5";
	}
	
	// 구강관리 정보 키워드로 보여주기
	@GetMapping("care-view")
	public String care() {
		return "info/care";
	}
}
