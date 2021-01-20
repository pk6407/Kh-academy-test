package mvc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Hello {
	
	@RequestMapping(value="test.ddd", method= RequestMethod.GET)
	public ModelAndView test(ModelAndView mv) {
		mv.setViewName("myname");
		mv.addObject("message","하이~~~ 방가워");
		
		return mv;
	}
}
