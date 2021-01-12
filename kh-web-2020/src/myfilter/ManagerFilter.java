package myfilter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"/member.kim", "/sale.park"})
public class ManagerFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("manager login filter가 구동되었습니다.");
	
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		chain.doFilter(request, response);
		
		//	request 객체에 있는 session 가져오기
		HttpSession session = ((HttpServletRequest)request).getSession();
		RequestDispatcher rd = null;
		
		// 요청 url
		String url = ((HttpServletRequest)request).getRequestURI().toString();
		String mid = (String)session.getAttribute("mid");
		
		if(mid == null || ! mid.contentEquals("manager")) {
			rd = request.getRequestDispatcher("./filter/login_fail.jsp");
		}else { // manager 아이디로 로그인 한 경우
			if(url.indexOf("member")>=0) {
				rd = request.getRequestDispatcher("./filter/member_select.jsp");
			}else if(url.lastIndexOf("sale")>=0) {
				rd = request.getRequestDispatcher("./filter/sale_select.jsp");
			}
		}
		
		rd.forward(request, response);
		
		
	}

	@Override
	public void destroy() {
		System.out.println("manager login filter가 종료되었습니다.");
		
	}

	
}
