package kr.jobtc.mybatis;

 

import java.util.List;

 

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Transactional;

 

import kr.jobtc.board.BoardVo;

import kr.jobtc.board.Page;

 

@Service

@Transactional

public class BoardService { // Mapper를 실행시킴

	@Autowired

	BoardMapper mapper;

	

	public List<BoardVo> select(){

		Page page = new Page();

		page.setFindStr("");

		List<BoardVo> list = mapper.select(page);

		System.out.println("BoardService.select()......");

		for(BoardVo v : list) {

			System.out.println(v.getSubject());

		}

		

		return list;

	}

	

}