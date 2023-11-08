package com.sunny.onlineoralcare.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunny.onlineoralcare.common.EncryptUtil;
import com.sunny.onlineoralcare.common.mail.MailDto;
import com.sunny.onlineoralcare.common.mail.MailService;
import com.sunny.onlineoralcare.user.domain.User;
import com.sunny.onlineoralcare.user.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private MailService mailService;
	
	// 문진표 저장하기 
	public int addPrivateSurvey(
			int userId, String disease, String medicine, String drugAllergy
			, String lastDentalClinic, String discomfort, String address) {
		return userRepository.insertPrivateSurvey(userId, disease, medicine, drugAllergy, lastDentalClinic, discomfort, address);
	}
	
	// 비밀번호 변경하기
	public int updateNewPassword(String newPassword, String loginId) {
		String hashingPassword = EncryptUtil.md5(newPassword);
		return userRepository.updateNewPassword(loginId, hashingPassword);
	}
	
	// 메일 내용을 생성하고 임시 비밀번호로 회원 비밀번호를 변경 
	public User getUserByNameAndEmailAndLoginId (String name, String loginId, String email) {
		
		// 회원정보 일치여부 확인
		User user = userRepository.selectUserByNameAndEmailAndLoginId(name, loginId, email);
		
		// 랜덤함수로 새로운 비밀번호 만들기
        char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

        String newPassword = "";
        
        int idx = 0;
        for (int i = 0; i < 10; i++) {
            idx = (int) (charSet.length * Math.random());
            newPassword += charSet[idx];
        }
        
        // newPassword로 비밀번호 update
        updateNewPassword(newPassword, loginId);
        
		// 메일 전송하기
		MailDto mailDto = MailDto.builder()
				.receiver(email)
				.title( name + "님의 비밀번호 변경 안내 이메일 입니다.")
				.message("안녕하세요. 비밀번호 변경 안내 이메일 입니다." + "[" + name + "]" + " 님의 새로운 비밀번호는"
						+ "[" + newPassword + "]" + " 입니다. 로그인 후에 비밀번호를 변경을 해주세요")
				.build();
		
		mailService.sendSimpleMessage(mailDto);
		
		return user;
	}
	
	// 아이디 찾기
	public User getUserByNameAndEmail(String name, String email) {
		return userRepository.selectUserByNameAndEmail(name, email);
	}
	
	// 내 정보 수정하기 - 비밀번호 일치여부 확인하고 비밀번호 변경화면으로 이동
	public User getUserByPassword(int id, String password) {
		String hashingPassword = EncryptUtil.md5(password);
		return userRepository.selectUserByPassword(id, hashingPassword);
	}
	
	// 내 정보 수정하기
	public int updateMyInfo (int id, String name, String phoneNumber, String birthday, String email) {
		return userRepository.updateMyInfo(id, name, phoneNumber, birthday, email);
	}
	// 내 정보 불러오기
	public User getUserByloginId (String loginId) {
		return userRepository.selectUserByloginId(loginId);
	}
	
	// 로그인 - Id Password조회 일치하는 정보 찾기
	public User getUserByloginIdAndPassword(String loginId, String password) {
		
		// 암호화 된 password
		String hashingPassword = EncryptUtil.md5(password);
		return userRepository.selectUserByloginIdAndPassword(loginId, hashingPassword);
	}	
	
	// 본인인증 메일 보내기
	public String sendMail(String name, String email) {
		
		// 인증번호 만들기
        char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

        String number = "";
        
        int idx = 0;
        for (int i = 0; i < 10; i++) {
            idx = (int) (charSet.length * Math.random());
            number += charSet[idx];
            
        }
        
		// 메일 전송하기
		MailDto mailDto = MailDto.builder()
				.receiver(email)
				.title( name + "님의 본인 확인 이메일 입니다.")
				.message("안녕하세요. 본인 확인 이메일 입니다." + "[" + name + "]" + " 님의 본인인증 번호는"
						+ "[" + number + "]" + " 입니다. 인증번호를 입력해주세요.")
				.build();
		
		mailService.sendSimpleMessage(mailDto);
		
		return number;
	}
	
	// 로그인 아이디 중복확인
	public boolean isDuplicate (String loginId) {
		
		int count = userRepository.countDuplicateId(loginId);
		
		// return값이 boolean
		if (count == 0) {
			return false; // 중복안됬다!
		} else {
			return true;
			
		}
	}
	
	// 사용자 회원가입 - 가입정보 저장
	public int addUser(
			String loginId
			, String password
			, String name
			, String phoneNumber
			, String birthday
			, String email) {
		
		// 비밀번호 암호화
		String hashingPassword = EncryptUtil.md5(password);
		
	return userRepository.insertUser(loginId, hashingPassword, name, phoneNumber, birthday, email);
	}
}
