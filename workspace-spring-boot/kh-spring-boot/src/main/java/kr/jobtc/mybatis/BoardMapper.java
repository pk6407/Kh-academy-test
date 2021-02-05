package kr.jobtc.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.jobtc.board.BoardVo;
import kr.jobtc.board.Page;

@Repository
@Mapper
public interface BoardMapper {
	// List<String> list = sqlSession.selectList("kr.jobtc.mybatis.BoardMapper.select","hong");
	public List<BoardVo> select(Page page);
	
}
