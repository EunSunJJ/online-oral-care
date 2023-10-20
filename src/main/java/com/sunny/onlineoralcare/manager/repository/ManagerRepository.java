package com.sunny.onlineoralcare.manager.repository;

import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.sunny.onlineoralcare.manager.domain.Manager;

@Repository
public interface ManagerRepository {

	// 관리자 회원가입 - 가입정보 저장
	public Manager insertManager (
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("email") String email);
}
