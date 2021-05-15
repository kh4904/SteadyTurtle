package com.spring.ex.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.ex.dao.BoardDAO;
import com.spring.ex.dto.BoardDTO;

@Service
public class ServiceBoard implements BoardService {

	@Inject BoardDAO bdao;
	
	@Override
	public void boardWrite(BoardDTO bdto) throws Exception {
		
		bdao.board(bdto);
		
	}

}
