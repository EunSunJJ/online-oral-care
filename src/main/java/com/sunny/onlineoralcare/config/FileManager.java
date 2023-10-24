package com.sunny.onlineoralcare.config;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class FileManager {

	// 파일 저장하기
	
	// 객체생성 없이 바로 사용할 수 있도록 static 붙여준다
	public final static String FILE_UPLOAD_PATH = "C:\\Project\\upload";
	
	public static String saveImageFile(int userId, MultipartFile imageFile) {
		
		if (imageFile == null) {
			return null;
		}
		
		// 디렉토리 생성
		String directoryName = "/" + userId + "-" + System.currentTimeMillis();
		
		String directoryPath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(directoryPath);
		
		if(!directory.mkdir()) {
			return null;
		}
			
		// 디렉토리 안에 파일 저장하기
		String imageFilePath = directoryPath + "/" + imageFile.getOriginalFilename();
		
		try {
			byte[] bytes = imageFile.getBytes();
			
			// 문자열(String filePath)을 Path객체로 변환해서 넣어줘야해
			Path path = Paths.get(imageFilePath);
			Files.write( path , bytes );
			
		} catch (IOException e) {
			
			e.printStackTrace();
			return null;
		}
	
		return "/images" + directoryName + "/" + imageFile.getOriginalFilename();
	}
}
