package kr.jobtc.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.jobtc.board.BoardAttVo;
import kr.jobtc.board.BoardDao;
import kr.jobtc.board.BoardVo;
import kr.jobtc.board.Page;

@RestController
public class BoardController {
	
	//@Autowired
	//BoardService service; /* 중간 단계 하나 생략 ^^ */
	
	// BoardService에서 바로 BoardDao로 연결
	@Autowired
	BoardDao boardDao;
	@Autowired
	FileUploadController fc;

	@RequestMapping(value="/bSelect" , method= {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView select(Page page) {
		ModelAndView mv = new ModelAndView();
		
		if(page ==null || page.getNowPage()==0) {
			page.setNowPage(1);
		}
		
		Map<String, Object> map = boardDao.select(page);

		mv.addObject("list", map.get("list"));
		mv.addObject("page", map.get("page"));

		mv.setViewName("board/select");
		
		return mv;
	}
	
	@RequestMapping(value="/bView" , method= {RequestMethod.POST})
	public ModelAndView view(BoardVo v, Page page) {
		ModelAndView mv = new ModelAndView();
		BoardVo vo = boardDao.view(v.getSerial());

		System.out.println("BoardController.view()..........................");
		System.out.println(page.getNowPage());
		System.out.println(page.getFindStr());
		

		
		mv.addObject("vo", vo);		
		mv.addObject("page", page);
		mv.setViewName("board/view");
		return mv;
	}
	
	
		
	
	@RequestMapping(value="/bInsert" , method= {RequestMethod.GET})
	public ModelAndView insert(Page page) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("page", page);
		mv.setViewName("board/insert");
		return mv;
	}
	
	@RequestMapping(value="/bInsertR", method=RequestMethod.POST)
	public ModelAndView insertR(@RequestParam("attFile") List<MultipartFile> mul, 
								@ModelAttribute BoardVo vo, @ModelAttribute Page page) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		List<BoardAttVo> attList = fc.upload(mul);
		
		vo.setAttList(attList);
		
		msg = boardDao.insert(vo);
		
		
		return mv;
	}
	

	@RequestMapping(value="/bModify" , method= {RequestMethod.GET})
	public ModelAndView modify(BoardVo v, Page page) {
		ModelAndView mv = new ModelAndView();
		
		BoardVo vo = boardDao.view(v.getSerial());
		mv.addObject("vo", vo);
		mv.addObject("page", page);
		mv.setViewName("board/update");
		return mv;
	}
	
	@RequestMapping(value="/bModifyR" , method= {RequestMethod.POST})
	public ModelAndView modifyR(@RequestParam("attFile") List<MultipartFile> mul, 
								@ModelAttribute BoardVo vo, @ModelAttribute Page page) {
		ModelAndView mv = new ModelAndView();
		
		List<BoardAttVo> attList = fc.upload(mul);
		vo.setAttList(attList);
		
		String msg = boardDao.update(vo);
		
		mv.addObject("msg", msg);
		mv.addObject("page", page);
		mv.setViewName("board/result");
		return mv;
	}

	
	@RequestMapping(value="/bDelete" , method= {RequestMethod.POST})
	public ModelAndView deleteR(BoardVo vo, Page page) {
		ModelAndView mv = new ModelAndView();
		
		String msg = boardDao.delete(vo);
		
		mv.addObject("msg", msg);
		mv.addObject("page", page);
		mv.setViewName("board/result");
		return mv;
	}
	

	@RequestMapping(value="/bRepl" , method= {RequestMethod.GET})
	public ModelAndView repl(BoardVo v, Page page) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("vo", v);
		mv.addObject("page", page);
		mv.setViewName("board/repl");
		return mv;
	}
	
	@RequestMapping(value="/bReplR" , method= {RequestMethod.POST})
	public ModelAndView replR(@RequestParam("attFile") List<MultipartFile> mul, 
								@ModelAttribute BoardVo vo, @ModelAttribute Page page) {
		ModelAndView mv = new ModelAndView();
		
		List<BoardAttVo> attList = fc.upload(mul);
		vo.setAttList(attList);
		
		
		String msg = boardDao.insertRepl(vo);
		
		mv.addObject("msg", msg);
		mv.addObject("page", page);
		mv.setViewName("board/result");
		return mv;
	}
	
	
}

