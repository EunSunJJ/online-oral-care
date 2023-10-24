package com.sunny.onlineoralcare.qpost;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.sunny.onlineoralcare.qpost.service.QpostService;

@RequestMapping("/qpost")
@RestController
public class QpostRestController {

	@Autowired
	private QpostService qpostService;
	
	// 질문 글 작성하기
	@PostMapping("/create")
	public Map<String, String> createQpost(
			@RequestParam("title") String title
			, @RequestParam("content") String content
			, @RequestParam(value="imageFile" , required=false) MultipartFile imageFile
			, @RequestParam(value="password" , required=false) String password
			, HttpSession session) {
		
		String writer = (String) session.getAttribute("userLoginId");
		int userId = (Integer) session.getAttribute("userId");
		int count = qpostService.addQpost(userId, writer, title, content, imageFile, password);
				
		// response
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
}
