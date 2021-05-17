package com.spring.ex.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.ex.dao.MemberDao;
import com.spring.ex.dto.BoardDTO;
import com.spring.ex.dto.JumunDto;
import com.spring.ex.dto.MemberDto;
import com.spring.ex.dto.ProductDto;


@Service
public class ServiceTurtle implements TurtleService{
	// 회원정보
	@Inject
	private MemberDao memberDao;
	
	@Override
	public List<MemberDto> memberList() throws Exception {
	
		return memberDao.memberList();
	}
	
	// 회원가입
	@Inject MemberDao dao;
	
	@Override
	public void register(MemberDto dto) throws Exception {
		
		dao.register(dto);

	}
	
	//로그인
	@Override
	public MemberDto login(MemberDto ldto) throws Exception{
		return dao.login(ldto);
	}
	
	// 상품정보
	@Inject
	private MemberDao productDao;
	
	@Override
	public List<ProductDto> productList() throws Exception {
	
		return productDao.productList();
	}
	
	// 상품정보
	@Inject
	private MemberDao JumunDao;
		
	@Override
	public List<JumunDto> jumunList() throws Exception {
	
		return JumunDao.jumunList();
	}
	
	// 고객문의 목록
	@Inject
	private MemberDao boardDao;
		
	@Override
	public List<BoardDTO> boardList() throws Exception {
		
		return boardDao.boardList();
	}
	
	
	// 고객문의 글쓰기
	@Inject MemberDao bdao;
	
	@Override
	public void boardWrite(BoardDTO bdto) throws Exception {
		
		bdao.board(bdto);
		
	}
}
