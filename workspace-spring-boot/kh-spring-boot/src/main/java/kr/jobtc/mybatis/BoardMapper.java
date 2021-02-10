package kr.jobtc.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.jobtc.board.BoardAttVo;
import kr.jobtc.board.BoardVo;
import kr.jobtc.board.Page;

@Repository
@Mapper
public interface BoardMapper {
	public BoardVo view(int serial);
	
	// List<String> list = sqlSession.selectList("kr.jobtc.mybatis.BoardMapper.select", "hong");
	public List<BoardVo> select(Page page);
	public List<BoardAttVo> selectAtt(int pSerial);
	public int totListSize(Page page);
	public int replCheck(int pSerial);
	
	public int insert(BoardVo vo);
	public int insertRepl(BoardVo vo);
	public int insertAtt(BoardVo vo);
	
	public int update(BoardVo vo);
	
	public int delete(BoardVo vo);
	public int deleteAttPserial(int pSerial);
	public int deleteAtt(BoardVo vo);
}
