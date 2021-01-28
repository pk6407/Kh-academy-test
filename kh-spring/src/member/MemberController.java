package member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	Dao dao ;
	FileUpload fu;
	String msg;
	
	public MemberController() {	}
	public MemberController(Dao dao) {
		this.dao = dao;
	}
	
	
	@RequestMapping(value="insert.mem", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView insert() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("insert"); // WEB-INF/member/insert.jsp
		
		return mv;
	}
	
	@RequestMapping(value="insertR.mem", method=RequestMethod.POST)
	public ModelAndView insertR(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		fu = new FileUpload(req);
		MemberVo vo = fu.getMember();
		Page page = fu.getPage();
		
		msg = dao.insert(vo);
		
		System.out.println("---------------------");
		System.out.println(vo.getMid());
		System.out.println(vo.getPwd());
		System.out.println(vo.getPhone());
		
		mv.setViewName("result");//WEB-INF/member/insert_result.jsp
		mv.addObject("msg", msg);
		
		return mv;
		
	}
	@RequestMapping(value="select.mem", method= {RequestMethod.GET, RequestMethod.POST} )
	public ModelAndView select(Page page) {
		ModelAndView mv = new ModelAndView();
		List<MemberVo> list = null;
		
		if(page != null) {
			System.out.println("controller.select().............");
			System.out.println("nowPage : " + page.getNowPage());
		}else {
			System.out.println("page is null");
		}
		
		Map<String, Object> map = dao.select(page);
		page = (Page)map.get("page");
		list = (List<MemberVo>) map.get("list");
		
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.setViewName("select");//WEB-INF/member/select.jsp
		
		
		return mv;
	}
	
	@RequestMapping(value="view.mem", method=RequestMethod.POST)
	public ModelAndView view(MemberVo vo) {
		ModelAndView mv = new ModelAndView();
		System.out.println("controller.view().......");
		System.out.println(vo.getMid());
		
		vo = dao.view(vo.getMid());
		mv.addObject("vo", vo);
		mv.setViewName("view");//WEB-INF/member/view.jsp
		
		return mv;
	}
	
	@RequestMapping(value="deleteR.mem", method=RequestMethod.POST)
	public ModelAndView delete(MemberVo vo) {
		ModelAndView mv = new ModelAndView();
		String msg = dao.delete(vo);
		
		mv.addObject("msg", msg);
		mv.setViewName("result");
		
		return mv;
	}
	
	@RequestMapping(value="modify.mem", method=RequestMethod.POST)
	public ModelAndView modify(MemberVo vo) {
		ModelAndView mv = new ModelAndView();
		vo = dao.view(vo.getMid());
		
		mv.addObject("vo", vo);
		mv.setViewName("modify");
		
		return mv;
	}
	
	@RequestMapping(value="modifyR.mem", method=RequestMethod.POST)
	public ModelAndView modifyR(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		fu = new FileUpload(req);
		MemberVo vo = fu.getMember();
		Page page = fu.getPage();
		
		msg = dao.update(vo);
		
		mv.setViewName("result");//WEB-INF/member/result.jsp
		mv.addObject("msg", msg);
		
		return mv;
		
	}
	
	
}















