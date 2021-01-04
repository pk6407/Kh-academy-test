package board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Page;

@WebServlet(urlPatterns = "/board.do")
public class BoardServlet extends HttpServlet{
	String url = "index.jsp?inc=./board/";
	BoardDao dao;
	
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
		String msg = "";
		int serial=0;
		RequestDispatcher rd = null;
		dao = new BoardDao();
		Page page = new Page();
		BoardVo vo = null;
		FileUpload fu;
		
		if(req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}else {
			nowPage = 1;
		}
		if(req.getParameter("findStr") != null) {
			findStr = req.getParameter("findStr");
		}
		
		page.setNowPage(nowPage);
		page.setFindStr(findStr);
		
		switch(job) {
		case "select":
			Map<String, Object> map = dao.select(page);
			
			List<BoardVo> list = (List<BoardVo>)map.get("list");
			page = (Page)map.get("page");
			
			req.setAttribute("list", list);
			req.setAttribute("page", page);
			rd = req.getRequestDispatcher(url+"select.jsp");
			rd.forward(req, resp);
			break;
			
		case "insert":
			req.setAttribute("page", page);
			rd = req.getRequestDispatcher(url+"insert.jsp");
			rd.forward(req, resp);
			
			break;
			
		case "insertR":
			fu = new FileUpload(req);
			vo = fu.getBoardVo('i');
			page = fu.getPage();
			msg = dao.insert(vo);
			
			req.setAttribute("msg", msg);
			req.setAttribute("page", page);
			rd = req.getRequestDispatcher(url+"result.jsp");
			rd.forward(req, resp);
			
			break;
			
		case "repl":
			vo = new BoardVo();
			vo.setSerial(Integer.parseInt(req.getParameter("serial")));
			req.setAttribute("msg", msg);
			req.setAttribute("page", page);
			rd = req.getRequestDispatcher(url+"repl.jsp");
			rd.forward(req, resp);
			
			break;
		case "replR":
			fu = new FileUpload(req);
			vo = fu.getBoardVo('r');
			page = fu.getPage();
			msg = dao.insertRepl(vo);
			
			req.setAttribute("msg", msg);
			req.setAttribute("page", page);
			rd = req.getRequestDispatcher(url+"result.jsp");
			rd.forward(req, resp);
			
			break;
			
		case "view":
			serial = Integer.parseInt(req.getParameter("serial"));
			vo = dao.view(serial);
			
			req.setAttribute("vo", vo);
			req.setAttribute("page", page);
			rd = req.getRequestDispatcher(url + "view.jsp");
			rd.forward(req, resp);
			
			break;
			
			
		case "deleteR":
			vo = new BoardVo();
			vo.setSerial(Integer.parseInt(req.getParameter("serial")));
			vo.setPwd(req.getParameter("pwd"));
			
			msg = dao.delete(vo);
			
			req.setAttribute("page", page);
			req.setAttribute("msg", msg);
			
			rd = req.getRequestDispatcher(url + "result.jsp");
			rd.forward(req, resp);
			break;
		case "update":
			serial = Integer.parseInt(req.getParameter("serial"));
			vo = dao.view(serial);
			
			req.setAttribute("vo", vo);
			rd = req.getRequestDispatcher(url + "update.jsp");
			rd.forward(req, resp);
			
			break;
		case "updateR":
			fu = new FileUpload(req);
			vo = fu.getBoardVo('u');
			page = fu.getPage();
			msg = dao.update(vo);
			
			req.setAttribute("msg", msg);
			req.setAttribute("page", page);
			rd = req.getRequestDispatcher(url+"result.jsp");
			rd.forward(req, resp);
			
			break;
		}

	}
	
}