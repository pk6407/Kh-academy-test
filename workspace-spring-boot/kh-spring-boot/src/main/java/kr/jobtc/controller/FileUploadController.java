package kr.jobtc.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.jobtc.board.AttVo;
import kr.jobtc.board.BoardVo;
import kr.jobtc.mybatis.BoardService;

@Controller
public class FileUploadController {
	String saveDir = "C:\\Users\\asdas\\workspace-spring-boot\\kh-spring-boot\\src\\main\\webapp\\WEB-INF\\upload\\";

	@Autowired
	BoardService service;
	
	@RequestMapping(value="/bInsertR", method=RequestMethod.POST)
	public String upload(@RequestParam("attFile") List<MultipartFile> mul, @ModelAttribute BoardVo vo) {
		String msg = "";
		List<AttVo> attFiles = new ArrayList<AttVo>();
		
		
		try {
			for(MultipartFile m : mul) {
				File oriFile = new File(saveDir + m.getOriginalFilename());
				System.out.println(oriFile.toString());
				//file upload
				m.transferTo(oriFile);

				AttVo v = new AttVo();
				v.setOriFile(m.getOriginalFilename());
				
				attFiles.add(v);
				
			}
			
			vo.setAttFiles(attFiles);
			
			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		
		return msg;
	}
	
}
