package board;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bean.MemberVo;
import bean.Page;

public class FileUpload {
	// 학원
	public static final String saveDir = "C:\\Users\\user1\\Documents\\hipwg\\git\\kh-web-2020\\WebContent\\upload\\";
	
	//home
	//public static final String saveDir = "C:/Users/jobtc/git/kh-web-2020/kh-web-2020/WebContent/upload/";
	
	// notebook
	//public static final String saveDir = "C:/Users/pwg/git/kh-web-2020/kh-web-2020/WebContent/upload/";
	int maxSize = 1024*1024*100;//100Mb;
	String encoding = "utf-8";
	MultipartRequest mul;
	String sysFile = "";
	String oriFile = "";
	List<BoardAttVo> attList = new ArrayList<BoardAttVo>();
	
	public FileUpload(HttpServletRequest req) {
		try {
			mul = new MultipartRequest(req,saveDir,maxSize, encoding, new DefaultFileRenamePolicy());
			//업로드된 파일명
			Enumeration<String> en = mul.getFileNames();
			while(en.hasMoreElements()) {
				String tag = (String)en.nextElement();
				sysFile = mul.getFilesystemName(tag); // 수정된 파일명
				oriFile = mul.getOriginalFileName(tag); //원본 파일명
				if(oriFile == null) continue;
				
				BoardAttVo attVo = new BoardAttVo();
				attVo.setSysFile(sysFile);
				attVo.setOriFile(oriFile);
				attList.add(attVo);
			}
			
			
		}catch(Exception ex) {
			System.out.println("FileUpload 생성자");
			ex.printStackTrace();
		}
	}
	
	//mode : i(insert), u(update), r(repl), d(delete)
	public BoardVo getBoardVo(char mode) {
		BoardVo vo = new BoardVo();
		vo.setMdate(mul.getParameter("mdate"));
		vo.setMid(mul.getParameter("mid"));
		vo.setPwd(mul.getParameter("pwd"));
		vo.setSubject(mul.getParameter("subject"));
		vo.setDoc(mul.getParameter("doc"));
		
		if(mul.getParameter("serial") !=null) {
			vo.setpSerial(Integer.parseInt(mul.getParameter("serial")));
		}
		
		if(mul.getParameter("hit") != null) {
			vo.setHit(Integer.parseInt(mul.getParameter("hit")));
		}
		
		//첨부 파일이 존재하는 경우
		if(attList.size()>0) {
			vo.setAttList(attList);
		}
		
		if(mode == 'u' || mode == 'd') {
			vo.setSerial(Integer.parseInt(mul.getParameter("serial")));
			if(mul.getParameterValues("delFiles") != null) {
				List<BoardAttVo> delFiles = new ArrayList<BoardAttVo>();
				for(String s : mul.getParameterValues("delFiles")){
					
					BoardAttVo v = new BoardAttVo();
					v.setSysFile(s);
					delFiles.add(v);
				}
				vo.setDelFiles(delFiles);
			}
		}
		return vo;
	}
	
	public Page getPage() {
		Page page = new Page();
		
		if(mul.getParameter("findStr") != null) {
			page.setFindStr(mul.getParameter("findStr"));
		}
		if(mul.getParameter("nowPage") != null && !mul.getParameter("nowPage").equals("") ) {
			int nowPage = Integer.parseInt(mul.getParameter("nowPage"));
			page.setNowPage(nowPage);
		}else {
			page.setNowPage(1);
		}
		return page;
		
	}
	
	
}