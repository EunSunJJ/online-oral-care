package com.sunny.onlineoralcare.qpost.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sunny.onlineoralcare.common.Pagination;
import com.sunny.onlineoralcare.qpost.domain.Qpost;

@Repository
public interface QpostRepository {
	
	
	// 질문 글 상세보기 - id 기반으로 정보가져오기
	public Qpost selectQpostById(@Param("id") int id);
	
	// 전체 질문글 개수 조회
	public int countQpost();
	
	// 페이징을 위해 질문 리스트에 리미트 조건걸어서 가져오기
	public List<Qpost> selectQpostListLimit(Pagination pagination);
	
	// 질문 글 작성하기
	public int insertQpost(
			
			@Param("userId") int userId,
			@Param("writer") String writer,
			@Param("title") String title,
			@Param("content") String content,
			@Param("imagePath") String imagePath,
			@Param("password") String password);

}
