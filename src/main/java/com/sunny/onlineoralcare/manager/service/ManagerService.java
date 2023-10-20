package com.sunny.onlineoralcare.manager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunny.onlineoralcare.manager.domain.Manager;
import com.sunny.onlineoralcare.manager.repository.ManagerRepository;

@Service
public class ManagerService {

	@Autowired
	private ManagerRepository managerRepository;
	
	// 관리자 회원가입 - 가입정보 저장
	public Manager addManager (
			String loginId
			, String password
			, String name
			, String email) {
		
		return managerRepository.insertManager(loginId, password, name, email);
	}
}
