package kr.jobtc.board;

import java.util.ArrayList;
import java.util.List;

public class BoardVo {
	String mid;
	String subject;
	
	List<AttVo> attFiles = new ArrayList<AttVo>();

	public List<AttVo> getAttFiles() {
		return attFiles;
	}

	public void setAttFiles(List<AttVo> attFiles) {
		this.attFiles = attFiles;
	}

	public String getMid() {
		return mid;
	}
	
	public void setMid(String mid) {
		this.mid = mid;
	}
	
	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
}
