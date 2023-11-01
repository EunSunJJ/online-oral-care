package com.sunny.onlineoralcare.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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

	// 내 정보 수정하기
	@PutMapping("/modify/myInfo")
	public Map<String, String> myInfoModify(
			@RequestParam("id") int id
			, @RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("birthday") String birthday
			, @RequestParam("email") String email) {
		
		int count = userService.updateMyInfo(id, name, phoneNumber, birthday, email);
		
		// response
		Map<String, String> resultMap = new HashMap<>();
		if (count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	// 로그인 기능
	@PostMapping("/login")
	public Map<String, String> login(
			@RequestParam("loginId") String loginId, 
			@RequestParam("password") String password,
			HttpSession session) {

		User user = userService.getUserByloginIdAndPassword(loginId, password);

		// response
		Map<String, String> resultMap = new HashMap<>();
		if (user != null) {
			
			// session에 id, loginId 담아두기
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());
			
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}

		return resultMap;
	}

	// 회원가입 아이디 중복확인 기능
	@GetMapping("/duplicate-id")
	public Map<String, Boolean> duplicateUserId(@RequestParam("loginId") String loginId) {

		boolean isDuplicate = userService.isDuplicate(loginId);

		// response
		Map<String, Boolean> resultMap = new HashMap<>();
		if (isDuplicate) {
			resultMap.put("isDuplicate", true);
		} else {
			resultMap.put("isDuplicate", false);
		}

		return resultMap;
	}

	// 사용자 회원가입 기능
	@PostMapping("/join")
	public Map<String, String> userJoin(@RequestParam("loginId") String loginId,
			@RequestParam("password") String password, @RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber, @RequestParam("birthday") String birthday,
			@RequestParam("email") String email) {

		int count = userService.addUser(loginId, password, name, phoneNumber, birthday, email);

		// response
		Map<String, String> resultMap = new HashMap<>();
		if (count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}

		return resultMap;
	}
}
