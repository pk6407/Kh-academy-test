package kr.jobtc.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.jobtc.board.BoardAttVo;
import kr.jobtc.board.BoardDao;
import kr.jobtc.board.BoardVo;
import kr.jobtc.board.Page;

@Service
public class FileUploadController {
	public static String saveDir = "C:\\Users\\asdas\\workspace-spring-boot\\kh-spring-boot\\src\\main\\webapp\\WEB-INF\\upload\\";

	public List<BoardAttVo> upload(List<MultipartFile> mul) {
		String msg = "";
		List<BoardAttVo> attFiles = new ArrayList<BoardAttVo>();
		
		
		try {
			for(MultipartFile m : mul) {
				File oriFile = new File(saveDir + m.getOriginalFilename());
				System.out.println(oriFile.toString());
				//file upload
				m.transferTo(oriFile);
				
				BoardAttVo v = new BoardAttVo();
				v.setOriFile(m.getOriginalFilename());

				attFiles.add(v);
				
			}
			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		
		return attFiles;
	}
	
}
