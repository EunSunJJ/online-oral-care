package com.sunny.onlineoralcare.qpost.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sunny.onlineoralcare.config.FileManager;
import com.sunny.onlineoralcare.qpost.repository.QpostRepository;

@Service
public class QpostService {
	
	@Autowired
	private QpostRepository qpostRepository;
	
	// 질문 글 작성하기
	public int addQpost(int userId, String writer, String title, String content, MultipartFile imageFile, String password) {
		
		// imageFile -> imagePath로 
		String imagePath = FileManager.saveImageFile(userId, imageFile);
		return qpostRepository.insertQpost(userId, writer, title, content, imagePath, password);
				
		
	}
}
