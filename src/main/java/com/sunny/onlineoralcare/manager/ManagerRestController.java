package com.sunny.onlineoralcare.manager;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sunny.onlineoralcare.manager.domain.Manager;
import com.sunny.onlineoralcare.manager.service.ManagerService;

@RequestMapping("/manager")
@RestController
public class ManagerRestController {

	@Autowired
	private ManagerService managerService;
	
	// 로그인 기능
	@PostMapping("/login")
	public Map<String, String>login(
			@RequestParam("loginId") String loginId
			,@RequestParam("password") String password
			, HttpSession session){
		
		Manager manager = managerService.getManagerByloginIdAndPassword(loginId, password);
		
		// response
		Map<String, String> resultMap = new HashMap<>();
		if(manager != null) {
			
			// session에 id, loginId 담아두기
			session.setAttribute("managerId", manager.getId());
			session.setAttribute("managerLoginId", manager.getLoginId());
			
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");			
		}
		
		return resultMap;
	}
	
	// 회원가입 아이디 중복확인 기능
	@GetMapping("/duplicate-id")
	public Map<String, Boolean> duplicateManagerId(
			@RequestParam("loginId") String loginId){
		
		boolean isDuplicate = managerService.isDuplicate(loginId);
		
		// response
		Map<String, Boolean> resultMap = new HashMap<>();
		if (isDuplicate) {
			resultMap.put("isDuplicate", true);
		} else {
			resultMap.put("isDuplicate", false);
		}
		
		return resultMap;
	}
	
	// 관리자 회원가입 기능
	@PostMapping("/join")
	public Map<String, String> managerJoin(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("email") String email){
		
		int count = managerService.addManager(loginId, password, name, email);
		
		// response
		Map<String, String> resultMap = new HashMap<>();
		if(count != 0) {
			resultMap.put("result", "success");
		}else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;	
	}
}
