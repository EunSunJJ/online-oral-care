package com.sunny.onlineoralcare.survey.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface SurveyRepository {

	// 설문지 응답값 카운트
	public int countSurveyAnswer(
			@Param("userId") int userId);
	
	// 설문지 응답값 저장하기
	public int insertSurveyAnswer(
			@Param("userId") int userId
			, @Param("age") String age
			, @Param("brushingTeeth") boolean brushingTeeth
			, @Param("fluorideToothpaste") boolean fluorideToothpaste
			, @Param("interdental") boolean interdental
			, @Param("sugar") boolean sugar
			, @Param("dentalClinic") boolean dentalClinic);
}
