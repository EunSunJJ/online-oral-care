package com.sunny.onlineoralcare.survey.survice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunny.onlineoralcare.survey.repository.SurveyRepository;

@Service
public class SurveyService {

	@Autowired
	private SurveyRepository surveyRepository;
	
	// 설문지 응답값 저장하기
	public int addSurveyAnswer(int userId, String age, boolean brushingTeeth
			, boolean fluorideToothpaste, boolean interdental, boolean sugar, boolean dentalClinic) {
		return surveyRepository.insertSurveyAnswer(userId, age, brushingTeeth, fluorideToothpaste, interdental, sugar, dentalClinic);
	}
}
