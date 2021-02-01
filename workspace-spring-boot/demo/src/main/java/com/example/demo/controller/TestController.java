package com.example.demo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class TestController {
	
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public String test() {
		String msg = "hi...spring boot controller test";
		return msg;
	}
	
	@RequestMapping(value="/gugudan", method=RequestMethod.GET)
	public ModelAndView gugudan() {
		ModelAndView mv = new ModelAndView();
		String dan = "<h3>2단.....</h3>";
		//2단 출력(TODO)
		
		mv.addObject("gugudan",dan);
		mv.setViewName("gugudan");
		return mv;
	}
}
