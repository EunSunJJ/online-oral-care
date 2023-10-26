package com.sunny.onlineoralcare.qpost.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sunny.onlineoralcare.common.Pagination;
import com.sunny.onlineoralcare.config.FileManager;
import com.sunny.onlineoralcare.qpost.domain.Qpost;
import com.sunny.onlineoralcare.qpost.repository.QpostRepository;

@Service
public class QpostService {
	
	@Autowired
	private QpostRepository qpostRepository;
	
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
		return qpostRepository.insertQpost(userId, writer, title, content, imagePath, password);
				
		
	}
}
