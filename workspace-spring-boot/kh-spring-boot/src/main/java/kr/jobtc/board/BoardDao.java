package kr.jobtc.board;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.server.ServerEndpoint;

import org.apache.ibatis.session.SqlSession;
import org.apache.tomcat.util.http.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import kr.jobtc.controller.FileUploadController;
import kr.jobtc.mybatis.BoardMapper;


@Service
@Transactional
public class BoardDao {

	@Autowired
	BoardMapper mapper;

	//transaction
	@Autowired
	PlatformTransactionManager manager;
	TransactionStatus status;

	/*
	 * public BoardDao() throws Exception { status = manager.getTransaction(new
	 * DefaultTransactionDefinition()); }
	 */	
	
	// insert -> att insert -> 오류시 첨부 파일 삭제
	public String insert(BoardVo vo) {
		String msg = "게시물이 저장되었습니다.";
		try {
			int cnt = mapper.insert(vo);
			
			if(cnt<1) {
				throw new Exception("게시물 저장중 오류 발생");
			}
			
		} catch (Exception ex) {
			manager.rollback(status);
			msg = ex.getMessage();
			
			delFile(vo.getAttList());
		} finally {
			manager.commit(status);
			return msg;
		}
	}
	
	// insert -> att insert -> 오류시 첨부파일 삭제
	public String insertRepl(BoardVo vo) {
		String msg = "댓글이 저장되었습니다.";
		try {
			int cnt = mapper.insertRepl(vo);
			
			if(cnt<1) {
				throw new Exception("댓글 저장중 오류 발생");
			}
			
		} catch (Exception ex) {
			manager.rollback(status);
			msg = ex.getMessage();
			delFile(vo.getAttList());
		} finally {
			manager.commit(status);
			return msg;
		}
	}

	// update -> att insert -> att delete -> file delete
	public String update(BoardVo vo) {
		String msg = "게시물이 수정되었습니다.";
		try {
			int cnt = mapper.update(vo);
			if(cnt>0) {
				if(vo.getAttList() != null) {
					cnt = mapper.insertAtt(vo);
					if(cnt<1) throw new Exception("첨부 저장중 오류 발생");
				}
				if(vo.getDelFiles() != null) {
					cnt = mapper.deleteAtt(vo);
					if(cnt<1) throw new Exception("첨부 파일 삭제중 오류 발생"); 
					delFile(vo.getDelFiles());
				}
			}else {
				throw new Exception("수정중 오류 발생");
			}
		} catch (Exception ex) {
			manager.rollback(status);
			msg = ex.getMessage();
			delFile(vo.getAttList());
		} finally {
			manager.commit(status);
			return msg;
		}
	}

	// 댓글 여부 체크
	// delete -> att delete -> file delete
	public String delete(BoardVo vo) {
		String msg = "게시물이 삭제되었습니다.";
		List<BoardAttVo> attList = null;
		try {
			attList = mapper.selectAtt(vo.getSerial());
			int cnt = mapper.delete(vo);
			if(cnt>0) {
				if(attList.size()>0) {
					cnt = mapper.deleteAttPserial(vo.getSerial());
					if(cnt<1) throw new Exception("게시물 첨부 삭제중 오류 발생");
					delFile(attList);
				}
			}else {
				throw new Exception("게시물 삭제중 오류 발생");
			}

		} catch (Exception ex) {
			msg = ex.getMessage();
			manager.rollback(status);
		} finally {
			manager.commit(status);
			return msg;
		}
	}


	public Map<String, Object> select(Page page) {
		
		System.out.println("BoardDao.select()..........................1");
		System.out.println(page.getNowPage());
		System.out.println(page.getFindStr());
		
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<BoardVo> list = null;
		try {
			int totListSize = mapper.totListSize(page);
			page.setTotListSize(totListSize);
			page.pageCompute();

			System.out.println("BoardDao.select()..........................2");
			System.out.println(page.getNowPage());
			System.out.println(page.getFindStr());

			
			
			list = mapper.select(page);
			map.put("page", page);
			map.put("list", list);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return map;
		}
	}

	public BoardVo view(int serial) {
		BoardVo vo = null;
		List<BoardAttVo> attList = null;
		try {
			vo = mapper.view(serial);
			attList = mapper.selectAtt(serial);
			vo.setAttList(attList);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return vo;
		}
	}

	public void delFile(List<BoardAttVo> delList) {
		System.out.println("delFile");
		for(BoardAttVo v : delList) {
			System.out.println(v.getSysFile());
			File f = new File(FileUploadController.saveDir + v.getSysFile());
			if(f.exists()) f.delete();
		}
	}
	


}
