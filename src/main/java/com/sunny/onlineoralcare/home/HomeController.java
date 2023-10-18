package com.sunny.onlineoralcare.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("home-view")
	public String home() {
		return "home/home";
	}
}
