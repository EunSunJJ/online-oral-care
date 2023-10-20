package com.sunny.onlineoralcare.manager;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
//API 

import com.sunny.onlineoralcare.manager.domain.Manager;
import com.sunny.onlineoralcare.manager.service.ManagerService;

@RequestMapping("/manager")
@RestController
public class ManagerRestController {

	@Autowired
	private ManagerService managerService;
	
	// 회원가입 아이디 중복확인 기능
	@GetMapping("/duplicate-id")
//	public Map<String, Object> duplicateManagerId(
//			@RequestParam("loginId") String loginId){
//	}
	

	
	// 관리자 회원가입 기능
	@PostMapping("/join")
	public Map<String, String> managerJoin(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("email") String email){
		
		Manager manager = managerService.addManager(loginId, password, name, email);
		
		// response
		Map<String, String> resultMap = new HashMap<>();
		if(manager != null) {
			resultMap.put("result", "success");
		}else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;	
	}
}
