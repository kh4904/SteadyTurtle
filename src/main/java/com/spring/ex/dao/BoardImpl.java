package com.spring.ex.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.ex.dto.BoardDTO;

@Repository
public class BoardImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSessionTemplate;
	private static final String namespace = "com.spring.ex.mapper";
	
	@Override
	public void board(BoardDTO bdto) throws Exception {
		sqlSessionTemplate.insert(namespace + ".boardWrite", bdto);
	}

}
