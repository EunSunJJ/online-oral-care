package com.sunny.onlineoralcare.survey;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sunny.onlineoralcare.survey.survice.SurveyService;

@RequestMapping("/survey")
@Controller
public class SurveyController {

	@Autowired
	private SurveyService surveyService;
	
	// 설문지 결과 화면
	@GetMapping("/result-view")
	public String result(
			HttpSession session,
			Model model) {

		// session에 담긴 userId 가져오기
		int userId = (Integer) session.getAttribute("userId");
		
		// 설문지 응답값 카운트
		int count = surveyService.countSurveyAnswer(userId);
			
		String result = "";
		// count 개수에 따라서 나누기
		if(count <= 1) {  // 0 1
			result = "위험";
		} else if (count <= 3) { // 3 2
			result = "주의";
		} else { // 5 4
			result = "양호";
		}

		model.addAttribute("result", result);
		
		return "survey/result";
	}			

	// 설문지 5
	@GetMapping("/question5-view")
	public String question5() {
		return "survey/question5";
	}			

	// 설문지 4
	@GetMapping("/question4-view")
	public String question4() {
		return "survey/question4";
	}			
	
	// 설문지 3
	@GetMapping("/question3-view")
	public String question3() {
		return "survey/question3";
	}			

	// 설문지 2
	@GetMapping("/question2-view")
	public String question2() {
		return "survey/question2";
	}			
	
	// 설문지 1
	@GetMapping("/question1-view")
	public String question1() {
		return "survey/question1";
	}		
	
	// 설문지 나이 화면
	@GetMapping("/age-view")
	public String age() {
		return "survey/age";
	}	
	
	// 설문지 시작 화면
	@GetMapping("/start-view")
	public String start() {
		return "survey/start";
	}
}
