package com.sunny.onlineoralcare.survey;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sunny.onlineoralcare.survey.survice.SurveyService;

@RequestMapping("/survey")
@RestController
public class SurveyRestController {
	
	@Autowired
	private SurveyService surveyService;

	// 설문지 응답값 저장하기
	@GetMapping("/answer")
	public Map<String, String> surveyAnswerSave(
			@RequestParam("userId") int userId
			, @RequestParam("age") String age
			, @RequestParam("brushingTeeth") boolean brushingTeeth
			, @RequestParam("fluorideToothpaste") boolean fluorideToothpaste
			, @RequestParam("interdental") boolean interdental
			, @RequestParam("sugar") boolean sugar
			, @RequestParam("dentalClinic") boolean dentalClinic) {
		
		int count = surveyService.addSurveyAnswer(userId, age, brushingTeeth, fluorideToothpaste, interdental, sugar, dentalClinic);
				
		// response
		Map<String, String> resultMap = new HashMap<>();
		if (count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
}
