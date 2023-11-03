package com.sunny.onlineoralcare.manager.repository;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sunny.onlineoralcare.manager.domain.Answer;
import com.sunny.onlineoralcare.manager.domain.Manager;

@Repository
public interface ManagerRepository {

	// 답변 수정하기
	public int updateAnswer(
			@Param("postId") int postId
			, @Param("content") String content);
	
	// 질문 게시판 정보 가져오기
	public Answer selectAnswerByPostId (@Param("id") int id);
	
	// 질문 게시판에 답변달기
	public int insertAnswer (
			@Param("postId") int postId
			, @Param("managerId") int managerId
			, @Param("content") String content
			, @Param("imagePath") String imagePath);
	
	// 로그인 - Id Password조회 일치하는 정보 찾기
	public Manager selectManagerByloginIdAndPassword(
			@Param("loginId") String loginId
			, @Param("password") String password);
	
	// 로그인 아이디 중복확인
	public int countDuplicateId(
			@Param("loginId") String loginId);
	
	// 관리자 회원가입 - 가입정보 저장
	public int insertManager (
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("email") String email);
}
