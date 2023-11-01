package com.sunny.onlineoralcare.survey;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/survey")
@Controller
public class SurveyController {

	@GetMapping("/start-view")
	public String start() {
		return "survey/start";
	}
}
