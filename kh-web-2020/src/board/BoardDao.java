package board;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class BoardDao {
	
	SqlSession sqlSession;
	
	public BoardDao() {
		try {
			sqlSession = BoardFactory.getFactory().openSession();
			
			if(sqlSession == null) {
				System.out.println("연결중 오류");
			}else {
				System.out.println("성공~");
				
				//모든 serial값을 가져옴
				
				/*
				 * List<Integer> list = sqlSession.selectList("board.all_serial");
				 * System.out.println(Arrays.toString(list.toArray()));
				 * 
				 * int serial = sqlSession.selectOne("board.one_serial");
				 * System.out.println("serial : " + serial);
				 */
				
				// 모든 데이터를 BoardVo에 담아 출력
				/*
				 * List<BoardVo> list2 = sqlSession.selectList("board.list"); for(BoardVo vo :
				 * list2) { System.out.println(vo.getSerial() + " : " + vo.getSubject()); }
				 */				
				// serial번호에 해당하는 BoardVo 한건 출력
				/*
				 * BoardVo vo = sqlSession.selectOne("board.view", 33); //여러분은 1~10중 하나.
				 * System.out.println("-------------------------");
				 * System.out.println("serial : " + vo.getSerial());
				 * System.out.println("subject : " + vo.getSubject());
				 */				
				// 검색어를 전달받아 해당 자료를 BoardVo에 담아 출력
				/*
				 * List<BoardVo> list3 = sqlSession.selectList("board.select", "3");
				 * System.out.println("----------------------"); for(BoardVo v : list3) {
				 * System.out.println(v.getSerial()); System.out.println(v.getSubject()); }
				 */				
				//한건의 데이터를 BoardVo에 담아 저장하시오.
				/*
				 * BoardVo vo2 = new BoardVo(); vo2.setMid("hong"); vo2.setSubject("방가.....");
				 * 
				 * int cnt = sqlSession.insert("board.insert", vo2); if(cnt>0) {
				 * System.out.println("insert 성공"); sqlSession.commit(); }else {
				 * System.out.println("insert 실패"); }
				 */				
				// serial = 1인 자료의 subject, doc를 수정
				/*
				 * BoardVo vo3 = new BoardVo(); vo3.setSubject("수정된 제목"); vo3.setDoc("수정된 내용");
				 * vo3.setSerial(11); vo3.setPwd("1111");
				 * 
				 * int cnt = sqlSession.update("board.update", vo3); if(cnt>0) {
				 * System.out.println("수정됨"); sqlSession.commit(); }
				 */				
				
				// serial 과 암호를 전달받아 자료를 삭제
				BoardVo vo4 = new BoardVo();
				vo4.setSerial(11);
				vo4.setPwd("1111");
				
				int cnt = sqlSession.delete("board.delete", vo4);
				if(cnt>0) {
					System.out.println("삭제됨");
					sqlSession.commit();
				}
				
				
				
				
			}
			sqlSession.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		new BoardDao();
	}
	
}