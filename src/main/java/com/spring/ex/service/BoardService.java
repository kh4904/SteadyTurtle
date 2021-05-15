package com.spring.ex.service;

import org.springframework.stereotype.Service;

import com.spring.ex.dto.BoardDTO;

@Service
public interface BoardService {

	public void boardWrite(BoardDTO bdto) throws Exception;
}
