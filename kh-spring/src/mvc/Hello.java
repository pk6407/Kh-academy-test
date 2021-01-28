package mvc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Hello {

	@RequestMapping(value="test.ddd", method= RequestMethod.GET )
	public ModelAndView test(ModelAndView mv) {
		mv.setViewName("myname");
		mv.addObject("message", "하이~~~  방가.. 난 원기라고해~ ^^");
		
		return mv;
	}
	
	@RequestMapping(value="gugudan.ddd", method=RequestMethod.GET)
	public ModelAndView abc() {
		ModelAndView mv = new ModelAndView();
		StringBuffer sb = new StringBuffer();
		
		int dan=9;
		for(int i=1; i<10 ;i++) {
			String str = String.format("%d * %d = %d <br/>", dan, i, (dan*i));
			sb.append(str);
		}
		
		mv.setViewName("gugudan_result");
		mv.addObject("gu", sb.toString());
		
		
		return mv;
	}
	
	@RequestMapping(value="sum.ddd", method=RequestMethod.GET)
	public ModelAndView sum() {
		ModelAndView mv = new ModelAndView();
		int a=10;
		int b=20;
		int r=a+b;
		
		mv.setViewName("sum_result");
		mv.addObject("a", a);
		mv.addObject("b", b);
		mv.addObject("r",r );
		
		return mv;
	}

}












