package com.sunny.onlineoralcare.qpost.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface QpostRepository {
	
	// 질문 글 작성하기
	public int insertQpost(
			
			@Param("userId") int userId
			, @Param("writer") String writer
			, @Param("title") String title
			, @Param("content") String content
			, @Param("imagePath") String imagePath
			, @Param("password") String password);

}
