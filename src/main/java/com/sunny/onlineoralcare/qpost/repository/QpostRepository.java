package com.sunny.onlineoralcare.qpost.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sunny.onlineoralcare.common.Pagination;
import com.sunny.onlineoralcare.qpost.domain.Qpost;

@Repository
public interface QpostRepository {
	
	// 전체 질문글 개수
	public int selectQpostListCnt();
	
	// 페이징을 위해 질문 리스트에 리미트 조건걸어서 가져오기
	public List<Qpost> selectQpostListLimit(Pagination pagination);
	
	// 질문 리스트에서 필요한 정보 가져오기
	public List<Qpost> selectQpostList();
	
	// 질문 글 작성하기
	public int insertQpost(
			
			@Param("userId") int userId
			, @Param("writer") String writer
			, @Param("title") String title
			, @Param("content") String content
			, @Param("imagePath") String imagePath
			, @Param("password") String password);

}
