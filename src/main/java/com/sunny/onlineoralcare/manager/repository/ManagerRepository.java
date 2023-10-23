package com.sunny.onlineoralcare.manager.repository;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sunny.onlineoralcare.manager.domain.Manager;

@Repository
public interface ManagerRepository {

	// 로그인 - Id Password조회 일치하는 정보 찾기
//	public Manager selectManagerByloginIdAndPassword(
//			@Param("loginId") String loginId
//			, @Param("password") String password);
	
	// 로그인 아이디 중복확인
	public int countDuplicateId(
			@Param("loginId") String loginId);
	
	// 관리자 회원가입 - 가입정보 저장
	public int insertManager (
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("email") String email);
}
