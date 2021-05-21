package com.spring.ex.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.ex.dao.MemberDao;
import com.spring.ex.dto.BasketDto;
import com.spring.ex.dto.BoardDTO;
import com.spring.ex.dto.JumunDto;
import com.spring.ex.dto.MemberDto;
import com.spring.ex.dto.ProductDto;
import com.spring.ex.dto.RefundDto;


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
	
	//회원수정
	@Override
	public void MemberUpdate(MemberDto mdto) throws Exception {
		dao.MemberUpdate(mdto);
	}
	
	//로그인
	@Override
	public MemberDto login(MemberDto ldto) throws Exception{
		return dao.login(ldto);
	}
	//회원수정
	@Override
	public void MemberUpdate(MemberDto mdto) throws Exception {
		dao.MemberUpdate(mdto);

	}
	
	
	
	// 상품정보
	@Inject
	private MemberDao productDao;
	
	@Override
	public List<ProductDto> productList() throws Exception {
	
		return productDao.productList();
	}
	//상품수정
	@Override
	public void ProductUpdate(ProductDto Pdto)throws Exception {
		dao.ProductUpdate(Pdto);
	}
	
	// 주문내역 리스트
	@Inject
	private MemberDao JumunDao;
		
	@Override
	public List<JumunDto> jumunList() throws Exception {
	
		return JumunDao.jumunList();
	}
	
	// 장바구니 리스트
	@Inject
	private MemberDao BasketDao;
			
	@Override
	public List<BasketDto> basketList() throws Exception {
		
		return BasketDao.basketList();
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
	
	// 환불요청 목록
	@Inject
	private MemberDao RefundDao;
			
	@Override
	public List<RefundDto> refundList() throws Exception {
			
		return RefundDao.refundList();
	}
}
