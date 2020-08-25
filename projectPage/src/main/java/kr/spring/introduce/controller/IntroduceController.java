package kr.spring.introduce.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IntroduceController {

	@RequestMapping("/main/introduce/fightclub.do")
	public String fightclub() {
		return "/introduce/fightclub";
	}
	
	@RequestMapping("/main/introduce/membership.do")
	public String membership() {
		return "/introduce/membership";
	}
	
	
}
