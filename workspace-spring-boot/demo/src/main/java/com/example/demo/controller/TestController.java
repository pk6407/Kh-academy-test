package com.example.demo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.member.MemberVo;

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
		String dan = "<h3>3단.....</h3>";
		int su = 3;
		for(int i = 1; i<10; i++) {
			String temp = String.format("%d * %d = %d<br/>", su,i, (su*i));
			dan += temp;
		}
		
		
		//2단 출력(TODO)
		System.out.println(dan);
		
		mv.addObject("gugu",dan);
		mv.setViewName("gugudan");
		return mv;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	   public ModelAndView login(MemberVo vo) {
	      ModelAndView mv = new ModelAndView();
	      String msg = "로그인 실패";
	      if ((vo.getMid().equals("hong")) && (vo.getPwd().equals("1234"))) {
	         msg = "로그인 성공";
	      }
	      mv.addObject("msg", msg);
	      mv.setViewName("login_result");
	      return mv;
	   }
	
	@RequestMapping(value="/loginR", method=RequestMethod.POST)
	public ModelAndView loginR(MemberVo vo) {
		ModelAndView mv = new ModelAndView();
	      String msg = "로그인 실패";
	      if ((vo.getMid().equals("hong")) && (vo.getPwd().equals("1234"))) {
	         msg = "로그인 성공";
	      }
	      mv.addObject("msg", msg);
	      mv.setViewName("login");
	      return mv;                                         
	}
}
