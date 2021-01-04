package board;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.Page;

public class BoardDao {

	SqlSession sqlSession;

	public BoardDao() {
		try {
			sqlSession = BoardFactory.getFactory().openSession();
			
			/*
			if (sqlSession == null) {
				System.out.println("연결중 오류");
			} else {
				System.out.println("성공~");
				// 모든 serial값을 가져옴
				  List<Integer> list = sqlSession.selectList("board.all_serial");
				  System.out.println(Arrays.toString(list.toArray()));
				  
				  int serial = sqlSession.selectOne("board.one_serial");
				  System.out.println("serial : " + serial);
				  
				  
				  // 모든 데이터를 BoardVo에 담아 출력
				
				  List<BoardVo> list2 = sqlSession.selectList("board.list"); for(BoardVo vo :
				  list2) { System.out.println(vo.getSerial() + " : " + vo.getSubject()); }
				 
				// serial번호에 해당하는 BoardVo 한건 출력
				
				  BoardVo vo = sqlSession.selectOne("board.view", 33); //여러분은 1~10중 하나.
				  System.out.println("-------------------------");
				  System.out.println("serial : " + vo.getSerial());
				  System.out.println("subject : " + vo.getSubject());
				 
				// 검색어를 전달받아 해당 자료를 BoardVo에 담아 출력
				
				  List<BoardVo> list3 = sqlSession.selectList("board.select", "3");
				  System.out.println("----------------------"); for(BoardVo v : list3) {
				  System.out.println(v.getSerial()); System.out.println(v.getSubject()); }
				 
				// 한건의 데이터를 BoardVo에 담아 저장하시오.
				
				  BoardVo vo2 = new BoardVo(); vo2.setMid("hong"); vo2.setSubject("방가.....");
				  
				  int cnt = sqlSession.insert("board.insert", vo2); if(cnt>0) {
				  System.out.println("insert 성공"); sqlSession.commit(); }else {
				  System.out.println("insert 실패"); }
				 
				// serial = 1인 자료의 subject, doc를 수정
				
				  BoardVo vo3 = new BoardVo(); vo3.setSubject("수정된 제목"); vo3.setDoc("수정된 내용");
				  vo3.setSerial(11); vo3.setPwd("1111");
				  
				  int cnt = sqlSession.update("board.update", vo3); if(cnt>0) {
				  System.out.println("수정됨"); sqlSession.commit(); }
				 
				// serial 과 암호를 전달받아 자료를 삭제
				BoardVo vo4 = new BoardVo();
				vo4.setSerial(11);
				vo4.setPwd("1111");
				int cnt = sqlSession.delete("board.delete", vo4);
				if (cnt > 0) {
					System.out.println("삭제됨");
					sqlSession.commit();
				}
			}
			sqlSession.close();
			 */
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	// insert -> att insert -> 오류시 첨부 파일 삭제
	public String insert(BoardVo vo) {
		String msg = "게시물이 저장되었습니다.";
		try {
			int cnt = sqlSession.insert("board.insert", vo);
			if(cnt<1) {
				throw new Exception("게시물 저장중 오류 발생");
			}
			sqlSession.commit();
		} catch (Exception ex) {
			sqlSession.rollback();
			msg = ex.getMessage();
			
			delFile(vo.getAttList());
		} finally {
			sqlSession.close();
			return msg;
		}
	}
	
	// insert -> att insert -> 오류시 첨부파일 삭제
	public String insertRepl(BoardVo vo) {
		String msg = "댓글이 저장되었습니다.";
		try {
			int cnt = sqlSession.insert("board.insert_repl", vo);
			if(cnt<1) {
				throw new Exception("댓글 저장중 오류 발생");
			}
			
			sqlSession.commit();
		} catch (Exception ex) {
			sqlSession.rollback();
			msg = ex.getMessage();
			delFile(vo.getAttList());
		} finally {
			sqlSession.close();
			return msg;
		}
	}

	// update -> att insert -> att delete -> file delete
	public String update(BoardVo vo) {
		String msg = "게시물이 수정되었습니다.";
		try {
			int cnt = sqlSession.update("board.update", vo);
			if(cnt>0) {
				if(vo.getAttList() != null) {
					cnt = sqlSession.insert("board.insert_att", vo);
					if(cnt<1) throw new Exception("첨부 저장중 오류 발생");
				}
				if(vo.getDelFiles() != null) {
					cnt = sqlSession.delete("board.delete_att", vo);
					if(cnt<1) throw new Exception("첨부 파일 삭제중 오류 발생"); 
					delFile(vo.getDelFiles());
				}
			}else {
				throw new Exception("수정중 오류 발생");
			}
			sqlSession.commit();
		} catch (Exception ex) {
			sqlSession.rollback();
			msg = ex.getMessage();
			delFile(vo.getAttList());
		} finally {
			sqlSession.close();
			return msg;
		}
	}

	// 댓글 여부 체크
	// delete -> att delete -> file delete
	public String delete(BoardVo vo) {
		String msg = "게시물이 삭제되었습니다.";
		List<BoardAttVo> attList = null;
		try {
			attList = sqlSession.selectList("board.select_att", vo.getSerial());
			int cnt = sqlSession.delete("board.delete", vo);
			if(cnt>0) {
				if(attList.size()>0) {
					cnt = sqlSession.delete("board.delete_att_pserial", vo.getSerial());
					if(cnt<1) throw new Exception("게시물 첨부 삭제중 오류 발생");
					delFile(attList);
				}
			}else {
				throw new Exception("게시물 삭제중 오류 발생");
			}

			sqlSession.commit();
		} catch (Exception ex) {
			msg = ex.getMessage();
			sqlSession.rollback();
		} finally {
			sqlSession.close();
			return msg;
		}
	}


	public Map<String, Object> select(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<BoardVo> list = null;
		try {
			int totListSize = sqlSession.selectOne("board.tot_list_size", page);
			page.setTotListSize(totListSize);
			page.pageCompute();
			list = sqlSession.selectList("board.select", page);
			map.put("page", page);
			map.put("list", list);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
			return map;
		}
	}

	public BoardVo view(int serial) {
		BoardVo vo = null;
		List<BoardAttVo> attList = null;
		try {
			vo = sqlSession.selectOne("board.view", serial);
			attList = sqlSession.selectList("board.select_att", serial);
			vo.setAttList(attList);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
			return vo;
		}
	}

	public void delFile(List<BoardAttVo> delList) {
		System.out.println("delFile");
		for(BoardAttVo v : delList) {
			System.out.println(v.getSysFile());
			File f = new File(FileUpload.saveDir + v.getSysFile());
			if(f.exists()) f.delete();
		}
	}
	
	
	public static void main(String[] args) {
		new BoardDao();
	}

}