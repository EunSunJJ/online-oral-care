package com.sunny.onlineoralcare.user.repository;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sunny.onlineoralcare.user.domain.User;

@Repository
public interface UserRepository {
	
	// 로그인 - Id Password조회 일치하는 정보 찾기
	public User selectUserByloginIdAndPassword(
			@Param("loginId") String loginId
			, @Param("password") String password);
	
	// 로그인 아이디 중복확인
	public int countDuplicateId(
			@Param("loginId") String loginId);
	
	// 사용자 회원가입 - 가입정보 저장
	public int insertUser(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("phoneNumber") String phoneNumber
			, @Param("birthday") String birthday
			, @Param("email") String email);
}
