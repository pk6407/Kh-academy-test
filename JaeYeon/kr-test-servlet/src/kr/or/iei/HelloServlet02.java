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
@WebServlet("/HelloServlet02")	// »ó´ëÀû URI
public class HelloServlet02 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private List<String> list = new ArrayList<>();
	
    public HelloServlet02() {
        super();
    }

	protected void doGet(
			HttpServletRequest request,	// ÅèÄ¹ÀÌ ¸¸µç ±¸ÇöÃ¼ 
			HttpServletResponse response	// ÅèÄ¹ÀÌ ¸¸µç ±¸ÇöÃ¼
	) throws ServletException, IOException {
		final String message = request.getParameter("message");
		if (message != null) {
			System.out.println(message);
			list.add(message);
		}
		
		for(String m : list) {
			System.out.println(m);
		}
		System.out.println("----------------------");
		
		response.getWriter()
		.append("<!DOCTYPE html>\r\n"
				+ "<html>\r\n"
				+ "    <head>\r\n"
				+ "        <title>¼­ºí¸´Àº ½Ì±ÛÅæÀÓ ¾ÏÆ° ±×·³</title>\r\n"
				+ "    </head>\r\n"
				+ "    <body>\r\n"
				+ "\r\n"
				+ "        <form name=\"message-test\" action=\"/Project1123-test-servlet/HelloServlet02\" method=\"GET\">\r\n"
				+ "            <input id=\"message\" name=\"message\" type=\"text\"/>\r\n"
				+ "            <input type=\"submit\"/>\r\n"
				+ "        </form> \r\n"
				+ "    </body>\r\n"
				+ "</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
	}

}