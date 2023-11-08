package com.sunny.onlineoralcare.user.repository;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sunny.onlineoralcare.user.domain.User;

@Repository
public interface UserRepository {
	
	// 문진표 저장하기 
	public int insertPrivateSurvey(
			@Param("userId") int userId
			, @Param("disease") String disease
			, @Param("medicine") String medicine
			, @Param("drugAllergy") String drugAllergy
			, @Param("lastDentalClinic") String lastDentalClinic
			, @Param("discomfort") String discomfort
			, @Param("address") String address);
	
	// 비밀번호 변경하기
	public int updateNewPassword(
			@Param("loginId") String loginId
			, @Param("newPassword") String newPassword);
	
	// 임시 비밀번호 설정 전 정보확인하기
	public User selectUserByNameAndEmailAndLoginId(
			@Param("name") String name
			, @Param("loginId") String loginId
			, @Param("email") String email);
	
	// 아이디 찾기
	public User selectUserByNameAndEmail(
			@Param("name") String name
			, @Param("email") String email);
	
	// 내 정보 수정하기 - 비밀번호 일치여부 확인하고 비밀번호 변경화면으로 이동
	public User selectUserByPassword(
			@Param("id") int id
			, @Param("password") String password);
	
	// 내 정보 수정하기
	public int updateMyInfo (
			@Param("id") int id
			, @Param("name") String name
			, @Param("phoneNumber") String phoneNumber
			, @Param("birthday") String birthday
			, @Param("email") String email);
	
	// 내 정보 불러오기
	public User selectUserByloginId (@Param("loginId") String loginId);
	
	// 로그인 - Id Password조회 일치하는 정보 찾기
	public User selectUserByloginIdAndPassword(
			@Param("loginId") String loginId
			, @Param("password") String password);
	
	// 로그인 아이디 중복확인
	public int countDuplicateId(
			@Param("loginId") String loginId);
	
	// 사용자 회원가입 - 가입정보 저장
	public int insertUser(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("phoneNumber") String phoneNumber
			, @Param("birthday") String birthday
			, @Param("email") String email);
}
