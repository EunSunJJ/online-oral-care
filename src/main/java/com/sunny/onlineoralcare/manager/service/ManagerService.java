package com.sunny.onlineoralcare.manager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sunny.onlineoralcare.common.EncryptUtil;
import com.sunny.onlineoralcare.config.FileManager;
import com.sunny.onlineoralcare.manager.domain.Answer;
import com.sunny.onlineoralcare.manager.domain.Manager;
import com.sunny.onlineoralcare.manager.repository.ManagerRepository;

@Service
public class ManagerService {

	@Autowired
	private ManagerRepository managerRepository;

	// 답변 수정하기
	public int updateAnswer(int postId, String content) {
		return managerRepository.updateAnswer(postId, content);
	}
	
	// 질문 게시판 정보 가져오기
	public Answer getAnswerByPostId(int id) {
		return managerRepository.selectAnswerByPostId(id);
	}
	
	// 질문 게시판에 답변달기
	public int addAnswer(int postId, int managerId, String content, MultipartFile imageFile) {
		
		//  imageFile을 imagePath로 변경
		String imagePath = FileManager.saveImageFile(managerId, imageFile);
		
		return managerRepository.insertAnswer(postId, managerId, content, imagePath);
	}
	
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
