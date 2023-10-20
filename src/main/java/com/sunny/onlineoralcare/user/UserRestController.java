package com.sunny.onlineoralcare.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sunny.onlineoralcare.user.domain.User;
import com.sunny.onlineoralcare.user.service.UserService;

// API 

@RequestMapping("/user")
@RestController
public class UserRestController {

	@Autowired
	private UserService userService;
	
	// 회원가입 아이디 중복확인 기능
	@GetMapping("/duplicated-id")
	public Map<String, Boolean> duplicateUserId(
			@RequestParam("loginId") String loginId){
		
		boolean isDuplicate = userService.getloginId(loginId);
		
		// response
		Map<String, Boolean> resultMap = new HashMap<>();
		if(isDuplicate) {
			resultMap.put("isDuplicate", true);
		} else {
			resultMap.put("isDuplicate", false);			
		}
		
		return resultMap;
	}
	
	// 사용자 회원가입 기능
	@PostMapping("/join")
	public Map<String, String> userJoin(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("birthday") String birthday
			, @RequestParam("email") String email){
		
		User user = userService.addUser(loginId, password, name, phoneNumber, birthday, email);
		
		// response
		Map<String, String> resultMap = new HashMap<>();
		if(user != null) {
			resultMap.put("result", "success");
		}else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;	
	}
}
