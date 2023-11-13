package com.sunny.onlineoralcare.survey;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/survey")
@Controller
public class SurveyController {

	// 설문지 결과 화면
	@GetMapping("/result-view")
	public String result(Model model) {
		
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
