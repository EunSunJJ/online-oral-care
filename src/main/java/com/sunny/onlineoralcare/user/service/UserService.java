package com.sunny.onlineoralcare.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunny.onlineoralcare.common.EncryptUtil;
import com.sunny.onlineoralcare.user.domain.User;
import com.sunny.onlineoralcare.user.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	// 로그인 - Id Password조회 일치하는 정보 찾기
	public User getUserByloginIdAndPassword(String loginId, String password) {
		
		// 암호화 된 password
		String hashingPassword = EncryptUtil.md5(password);
		return userRepository.selectUserByloginIdAndPassword(loginId, hashingPassword);
	}	
	
	// 로그인 아이디 중복확인
	public boolean isDuplicate (String loginId) {
		
		int count = userRepository.countDuplicateId(loginId);
		
		// return값이 boolean
		if (count == 0) {
			return false; // 중복안됬다!
		} else {
			return true;
			
		}
	}
	
	// 사용자 회원가입 - 가입정보 저장
	public int addUser(
			String loginId
			, String password
			, String name
			, String phoneNumber
			, String birthday
			, String email) {
		
		// 비밀번호 암호화
		String hashingPassword = EncryptUtil.md5(password);
		
	return userRepository.insertUser(loginId, hashingPassword, name, phoneNumber, birthday, email);
	}
}
