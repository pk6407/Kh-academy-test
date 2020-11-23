package kr.or.iei;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet
 */
@WebServlet("/HelloServlet")	// ����� URI
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private List<String> list = new ArrayList<>();

	public HelloServlet() {
		super();
	}

	protected void doGet(
			HttpServletRequest request,	// ��Ĺ�� ���� ����ü 
			HttpServletResponse response	// ��Ĺ�� ���� ����ü
			) throws ServletException, IOException {
		final String message = request.getParameter("message");
		if (message != null) {
			System.out.println(message);
			list.add(message);
		}

		for(String m : list) {
			System.out.println(m);
		}
	}
}