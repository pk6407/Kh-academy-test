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
import javax.servlet.annotation.WebInitParam;

@WebFilter(urlPatterns = "/filter.do", initParams = {
				@WebInitParam(name="encoding", value="utf-8")
			})	// 필수 아님(옵션임:한글쓸때는 넣어야됨)
public class EncodingFilter implements Filter{	//implements => 추상메서드 -> prototype -> {}
	FilterConfig config;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException{
		System.out.println("웹 어플리케이션이 시작되면 처음 한번만 실행됩니다.");
		this.config = filterConfig;
	
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException{
		
		request.setCharacterEncoding(config.getInitParameter("encoding"));
		chain.doFilter(request, response);	//LIFO(마지막에 들어오는애가 먼저 나감)

		RequestDispatcher rd = request.getRequestDispatcher("./filter/filter_test.jsp");
		rd.forward(request, response);
		
	}
	
	@Override
	public void destroy() {
		System.out.println("웹 어플리케이션 서버가 종료되었습니다.");

	}
}
