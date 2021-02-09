package kr.jobtc.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.jobtc.board.BoardVo;
import kr.jobtc.board.Page;
import kr.jobtc.mybatis.BoardService;

@RestController
public class MainController {

	@Autowired
	BoardService service;
	
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("index");

		return mv;

	}

	@RequestMapping(value="/bSelect" , method= {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView select(Page page) {
		ModelAndView mv = new ModelAndView();

		List<BoardVo> list = service.select(page);

		mv.addObject("list", list);
		mv.setViewName("board/select");

		return mv;
	}

	@RequestMapping(value="/bInsert" , method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView insert(Page page) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("page",page);
		mv.setViewName("board/insert");
		return mv;
	}


}
