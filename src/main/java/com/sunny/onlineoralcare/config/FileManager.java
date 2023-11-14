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
	public final static String FILE_UPLOAD_PATH = "/home/ec2-user/web/onlineOralCare";
	
	public static String saveImageFile(int userId, MultipartFile imageFile) {
		
		// 필수가 아니라 null값 처리
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
	
	
	// 파일 삭제하기
	
	public static boolean removeImageFile(String imagePath) {
		
		if (imagePath == null) {
			return false;
		}
		
		String fullImagePath= FILE_UPLOAD_PATH + imagePath.replace("/images", "");
		Path path = Paths.get(fullImagePath);
		
		// 바로 삭제하지 말고, 삭제할 대상파일 존재 유무 확인
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				e.printStackTrace();
				
				return false;
			}
		}
		
		// 디렉토리도 삭제하기
		Path directoryPath = path.getParent(); // 상위경로를 리턴
		
		// 디렉토리 존재하는지 확인
		if (Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				e.printStackTrace();
				
				return false;
			}
		}
		
		return true;
	}
}
