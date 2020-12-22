package member;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.MemberDao;
import bean.MemberVo;
import bean.Page;

@WebServlet(urlPatterns = "/member.do")
public class MemberServlet extends HttpServlet{
	String url = "index.jsp?inc=./member/";
	MemberDao dao;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		String job = req.getParameter("job");
		
		int nowPage = 1;
		String findStr = "";
		
		RequestDispatcher rd = null;
		dao = new MemberDao();
		Page page = null;
		MemberVo vo = null;
		
		switch(job) {
		case "select":
			if(req.getParameter("nowPage") != null) {
				nowPage = Integer.parseInt(req.getParameter("nowPage"));
			}
			if(req.getParameter("findStr") != null) {
				findStr = req.getParameter("findStr");
			}
			
			page = new Page();
			page.setNowPage(nowPage);
			page.setFindStr(findStr);
			List<MemberVo> list = dao.select(page);
			
			req.setAttribute("list", list);
			req.setAttribute("page", page);
			rd = req.getRequestDispatcher(url+"select.jsp");
			rd.forward(req, resp);
			break;
			
			
		case "insert":
			FileUpload fu = new FileUpload(req);
			vo = fu.getMember();
			page = fu.getPage();
			String msg = dao.insert(vo);
			
			req.setAttribute("msg", msg);
			req.setAttribute("page", page);
			rd = req.getRequestDispatcher(url+"result.jsp");
			rd.forward(req, resp);
			
			break;
			
			
		case "view":
			String mid = req.getParameter("mid");
			vo = dao.view(mid);
			
			req.setAttribute("vo", vo);
			rd = req.getRequestDispatcher(url + "view.jsp");
			rd.forward(req, resp);
			
			break;
			
			
		case "delete":
			vo = new MemberVo();
			vo.setMid(req.getParameter("mid"));
			vo.setPwd(req.getParameter("pwd"));
			vo.setDelFile(req.getParameter("delFile"));
			
			msg = dao.delete(vo);
			
			page = new Page();
			page.setFindStr(req.getParameter("findStr"));
			page.setNowPage(Integer.parseInt(req.getParameter("nowPage")));
			req.setAttribute("page", page);
			
			req.setAttribute("msg", msg);
			
			rd = req.getRequestDispatcher(url + "result.jsp");
			rd.forward(req, resp);
			break;
		}
	
	}

}

