package com.sunny.onlineoralcare.manager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunny.onlineoralcare.common.EncryptUtil;
import com.sunny.onlineoralcare.manager.domain.Manager;
import com.sunny.onlineoralcare.manager.repository.ManagerRepository;

@Service
public class ManagerService {

	@Autowired
	private ManagerRepository managerRepository;

	// 질문 글 리스트
	
	// 로그인 - Id Password조회 일치하는 정보 찾기
	public Manager getManagerByloginIdAndPassword(String loginId, String password) {
		
		// 암호화 된 password
		String hashingPassword = EncryptUtil.md5(password);
		return managerRepository.selectManagerByloginIdAndPassword(loginId, hashingPassword);
	}

	// 로그인 아이디 중복확인
	public boolean isDuplicate(String loginId) {
		int count = managerRepository.countDuplicateId(loginId);

		if (count == 0) {
			return false;
		} else {
			return true;
		}
	}

	// 관리자 회원가입 - 가입정보 저장
	public int addManager(String loginId, String password, String name, String email) {

		// password 암호화
		String hashingPassword = EncryptUtil.md5(password);
		return managerRepository.insertManager(loginId, hashingPassword, name, email);
	}
}
