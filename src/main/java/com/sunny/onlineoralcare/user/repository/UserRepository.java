package com.sunny.onlineoralcare.user.repository;

import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.sunny.onlineoralcare.user.domain.User;

@Repository
public interface UserRepository {
	
	// 로그인 아이디 중복확인
	public int selectLoginId(
			@Param("loginId") String loginId);
	
	// 사용자 회원가입 - 가입정보 저장
	public User insertUser(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("phoneNumber") String phoneNumber
			, @Param("birthday") String birthday
			, @Param("email") String email);
}
