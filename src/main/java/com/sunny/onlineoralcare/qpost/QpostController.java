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
	@GetMapping("detail-view")
	public String qpostDetail() {
		return "qpost/detail";
	}
	
	// 질문 글 리스트
	@GetMapping("/list-view")
	public String qpostList(Model model
			,@RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) {
		
		// 페이징을 위해 qpost 가져오기 = List<Qpost> qpostListLimit
		
		// 전체 질문글 개수
		int qpostCnt = qpostService.getQpostListCnt();
		
		 // Pagination 객체생성 + paging 정보 세팅
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, qpostCnt);	
		   
		model.addAttribute("pagination", pagination);
		model.addAttribute("qpostListLimit",qpostService.getQpostListLimit(pagination));
				
		// 질문 리스트에서 필요한 정보 가져오기
		List<Qpost> qpostList = qpostService.getQpostList();
		model.addAttribute("qpostList",qpostList);
		
		return "qpost/list";
	}
	
	// 질문 글 쓰기
	@GetMapping("/create-view")
	public String qPostCreate() {
		return "qpost/create";
	}
}
