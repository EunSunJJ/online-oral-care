package com.sunny.onlineoralcare.qpost.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sunny.onlineoralcare.common.EncryptUtil;
import com.sunny.onlineoralcare.common.Pagination;
import com.sunny.onlineoralcare.config.FileManager;
import com.sunny.onlineoralcare.qpost.domain.Qpost;
import com.sunny.onlineoralcare.qpost.repository.QpostRepository;

@Service
public class QpostService {
	
	@Autowired
	private QpostRepository qpostRepository;
	
	// 질문 글 삭제하기
	public int deleteQpost(int id) {
		
		Qpost qpost = qpostRepository.selectQpostById(id);
		
		// 첨부된 파일 삭제하기
		FileManager.removeImageFile(qpost.getImagePath());
		return qpostRepository.deleteQpost(id);
	}
	
	// 질문 글 수정하기
	public int updateQpost(int id, String title, String content) {
		return qpostRepository.updateQpost(id, title, content);
	}
	
	// 질문 글 리스트 페이지 검색 기능 - 작성자 검색
	public Qpost getQpostByWriter(String writer) {
		return qpostRepository.selectQpostByWriter(writer);
	}
	
	// 질문 글 리스트 페이지 검색 기능 - 제목 검색
	public Qpost getQpostByTitel(String title) {
		return qpostRepository.selectQpostByTitel(title);
	}

	// 비밀 글 비밀번호 확인하기 - password 일치 여부 체크
	public Qpost getQpostByPassword(int id, String password) {
		
		// password hashing
		String hashingPassword = EncryptUtil.md5(password);
		
		return qpostRepository.selectQpostByPassword(id, hashingPassword);
	}
	
	// 질문 글 상세보기 - id 기반으로 정보가져오기
	public Qpost getQpostById(int id) {
		return qpostRepository.selectQpostById(id);
	}
	
	// 전체 질문글 개수 조회
	public int countQpost() {
		return qpostRepository.countQpost();
	}
	
	// 페이징을 위해 질문 리스트에 리미트 조건걸어서 가져오기
	public List<Qpost> getQpostListLimit(Pagination pagination) {
		return qpostRepository.selectQpostListLimit(pagination);
	}
	
	// 질문 글 작성하기
	public int addQpost(int userId, String writer, String title, String content, MultipartFile imageFile, String password) {
		
		// imageFile -> imagePath로 
		String imagePath = FileManager.saveImageFile(userId, imageFile);
		
		// password hashing
		String hashingPassword = EncryptUtil.md5(password);
		
		return qpostRepository.insertQpost(userId, writer, title, content, imagePath, hashingPassword);
				
		
	}
}
