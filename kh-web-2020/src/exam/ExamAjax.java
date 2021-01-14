package exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet(urlPatterns = "/exam/searchKH")
public class ExamAjax extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		// 관련 dao 를 호출한 결과를 가져왔다.
		KH kh = new KH();
		kh.setKh_no(100);
		kh.setKh_name("당산지원");
		kh.setAddr("당산");
		kh.setFax("010-1111-2222");
		
		Gson gson = new Gson();
		String result = gson.toJson(kh);
		
		// result의 문자열에 ajax로 전달됨.
		out.print(result);
		out.close();
		
	}

}
