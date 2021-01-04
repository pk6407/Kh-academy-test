package board;

import java.util.List;

public class BoardVo {
	
	int serial;
	String mid;
	String pwd;
	String subject;
	String doc;
	String mdate;
	int hit;
	int pSerial;
	
	int attCnt;
	List<BoardAttVo> attList;
	List<BoardAttVo> delFiles;
	
	public int getAttCnt() {
		return attCnt;
	}
	public void setAttCnt(int attCnt) {
		this.attCnt = attCnt;
	}
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDoc() {
		return doc;
	}
	public void setDoc(String doc) {
		this.doc = doc;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getpSerial() {
		return pSerial;
	}
	public void setpSerial(int pSerial) {
		this.pSerial = pSerial;
	}
	public List<BoardAttVo> getAttList() {
		return attList;
	}
	public void setAttList(List<BoardAttVo> attList) {
		this.attList = attList;
	}
	public List<BoardAttVo> getDelFiles() {
		return delFiles;
	}
	public void setDelFiles(List<BoardAttVo> delFiles) {
		this.delFiles = delFiles;
	}
	
	
}
