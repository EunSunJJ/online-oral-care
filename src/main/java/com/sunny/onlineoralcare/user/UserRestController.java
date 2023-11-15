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

@RequestMapping("/user")
@RestController
public class UserRestController {

	@Autowired
	private UserService userService;
	
	// 문진표 저장하기 
	@PostMapping("/private-survey")
	public Map<String, String> privateSurvey(
			@RequestParam("userId") int userId
			, @RequestParam("disease") String disease
			, @RequestParam("medicine") String medicine
			, @RequestParam("drugAllergy") String drugAllergy
			, @RequestParam("lastDentalClinic") String lastDentalClinic
			, @RequestParam("discomfort") String discomfort
			, @RequestParam("address") String address) {
		
		int count = userService.addPrivateSurvey(userId, disease, medicine, drugAllergy, lastDentalClinic, discomfort, address);
				
		// response
		Map<String, String> resultMap = new HashMap<>();
		if (count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	// 비밀번호 변경하기
	@PutMapping("/modify/password")
	public Map<String, String> updatePassword(
			@RequestParam("newPassword") String newPassword
			, HttpSession session) {
		
		String longinId = (String) session.getAttribute("userLoginId");
		int count = userService.updateNewPassword(newPassword, longinId);
		
		// response
		Map<String, String> resultMap = new HashMap<>();
		if (count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	// 정보확인 후 새로운 비밀번호 이메일 발송
	@PostMapping("/send/password")
	public  Map<String, String> lostPassword (
			@RequestParam("name") String name
			, @RequestParam("loginId") String loginId
			, @RequestParam("email") String email) {
		
		User user = userService.getUserByNameAndEmailAndLoginId(name, loginId, email);
		
		 // response
		 Map<String, String> resultMap = new HashMap<>();
		 if (user != null) {
			 resultMap.put("result", "success");
			 
		 } else {
			 resultMap.put("result", "fail");
		 }
		 
		 return resultMap;
	}
	
	// 아이디 찾기
	@GetMapping("/find/id")
	public Map<String, String> findId(
			@RequestParam("name") String name
			, @RequestParam("email") String email) {
		
		User user = userService.getUserByNameAndEmail(name, email);
		
		// response
		Map<String, String> resultMap = new HashMap<>();
		if (user != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
 	}
	
	// 내 정보 수정하기 - 비밀번호 일치여부 확인하고 비밀번호 변경화면으로 이동
	@PostMapping("/password-check")
	public Map<String, String> myInfoPasswordCheck(
			@RequestParam("id") int id
			,@RequestParam("password") String password) {
		
		User user = userService.getUserByPassword(id, password);
		
		// response
		Map<String, String> resultMap = new HashMap<>();
		if (user != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
 	}
	
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

	//발송한 값이랑 checkNumber가 같으면 회원가입 진행
	@GetMapping("/ckeck/authentication-number")
	public Map<String, Boolean> checkNumber(
			@RequestParam("checkNumber") String checkNumber
			, HttpSession session) {
		
		String certificationNumber = (String) session.getAttribute("certificationNumber");
		
		boolean isSame = true;
		if (checkNumber.equals(certificationNumber)) {
			isSame = true;
		} else {
			isSame = false;
		}
		
		// response
		Map<String, Boolean> resultMap = new HashMap<>();
		if (isSame) {
			resultMap.put("isSame", true);
		} else {
			resultMap.put("isSame", false);
		}

		return resultMap;
	}
	
	// 본인인증 메일 보내기
	@PostMapping("/send/authentication-number")
	public Map<String, String> checkPerson(
			@RequestParam("email") String email
			, @RequestParam("name") String name
			, HttpSession session){
		
		String number = userService.sendMail(name, email);
		
        // session에 number값 저장
        session.setAttribute("certificationNumber", number);
		
		// response
		Map<String, String> resultMap = new HashMap<>();
		if (number != null) {
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
