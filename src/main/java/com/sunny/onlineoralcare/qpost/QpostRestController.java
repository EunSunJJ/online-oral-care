package com.sunny.onlineoralcare.qpost;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.sunny.onlineoralcare.qpost.domain.Qpost;
import com.sunny.onlineoralcare.qpost.service.QpostService;

@RequestMapping("/qpost")
@RestController
public class QpostRestController {

	@Autowired
	private QpostService qpostService;
	
	// 답변여부 변경해주기
//	@PutMapping("/update/answer")
//	public Map<String, String> updateAnswer(
//			@RequestParam("id") int id
//			, @RequestParam("answer") boolean answer) {
//		
//		int count = qpostService.updateQpostAnswer(id, answer); 
//		
//		// answer_post정보 가져오기
//		Answer answerData = managerService.getAnswerByPostId(id);
//		if(answerData.getContent() != null) {
//			// answer값이 true로 바뀐다
//		}
//		
//		// response
//		Map<String, String> resultMap = new HashMap<>();
//		if (count == 1) {
//			resultMap.put("result", "success");
//		} else {
//			resultMap.put("result", "fail");
//		}
//		
//		return resultMap;
//	}
//	
	
	// 질문 글 삭제하기
	@DeleteMapping("/delete")
	public Map<String, String> deleteQpost(
			@RequestParam("id") int id) {
		
		int count = qpostService.deleteQpost(id);
		
		// response
		Map<String, String> resultMap = new HashMap<>();
		if (count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	// 질문 글 수정하기
	@PutMapping("/modify")
	public Map<String, String> modifyQpost(
			@RequestParam("id") int id,
			@RequestParam("title") String title,
			@RequestParam("content") String content) {
		
		int count = qpostService.updateQpost(id, title, content);
		
		// response
		Map<String, String> resultMap = new HashMap<>();
		if (count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	// 비밀 글 비밀번호 확인하기
	@PostMapping("/password-check")
	public Map<String, String> passwordChecK (
			@RequestParam("postId") int id,
			@RequestParam("password") String password){
		
		Qpost qpost = qpostService.getQpostByPassword(id, password);
		
		// response
		Map<String, String> resultMap = new HashMap<>();
		if (qpost != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	// 질문 글 작성하기
	@PostMapping("/create")
	public Map<String, String> createQpost(
			@RequestParam("title") String title
			, @RequestParam("content") String content
			, @RequestParam(value="imageFile" , required=false) MultipartFile imageFile
			, @RequestParam(value="password" , required=false) String password
			, HttpSession session) {
		
		if (password.isEmpty() == true) {
			password = null;
		}
		
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
