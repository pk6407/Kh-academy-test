/* 
 * package kr.jobtc.mybatis;
 * 
 * import java.util.List;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.context.annotation.Bean; import
 * org.springframework.stereotype.Service; import
 * org.springframework.transaction.annotation.Transactional;
 * 
 * import kr.jobtc.board.BoardDao; import kr.jobtc.board.BoardVo; import
 * kr.jobtc.board.Page;
 * 
 * @Service
 * 
 * @Transactional public class BoardService { // Mapper를 실행시킴
 * 
 * @Autowired BoardMapper mapper;
 * 
 * @Autowired BoardDao dao;
 * 
 * public List<BoardVo> select(Page page){ int totListSize =
 * mapper.totListSize(page); page.setTotListSize(totListSize);
 * page.pageCompute();
 * 
 * List<BoardVo> list = mapper.select(page);
 * System.out.println("BoardService.select()......");
 * 
 * for(BoardVo v : list) { System.out.println(v.getSubject()); }
 * 
 * return list; }
 * 
 * public String insert(BoardVo vo) { String msg = "게시물이 정상적으로 입력됨."; int cnt =
 * mapper.insert(vo);
 * 
 * return msg; }
 * 
 * }
 */