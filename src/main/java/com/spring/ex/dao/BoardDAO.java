package com.spring.ex.dao;

import org.springframework.stereotype.Repository;

import com.spring.ex.dto.BoardDTO;

@Repository
public interface BoardDAO {

	public void board(BoardDTO bdto) throws Exception;
}
