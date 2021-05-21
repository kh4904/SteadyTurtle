package com.spring.ex.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.ex.dto.BasketDto;
import com.spring.ex.dto.BoardDTO;
import com.spring.ex.dto.JumunDto;
import com.spring.ex.dto.MemberDto;
import com.spring.ex.dto.ProductDto;
import com.spring.ex.dto.RefundDto;

@Repository
public interface MemberDao {
	// 회원정보 dto
	public List<MemberDto> memberList() throws Exception;
	
	//회원 수정 dto
	public void MemberUpdate(MemberDto Mdto) throws Exception;
	
	// 회원가입 dto
	public void register(MemberDto dto) throws Exception;
	
	// 로그인 dto
	public MemberDto login(MemberDto ldto) throws Exception;
	
	// 상품정보 dto
	public List<ProductDto> productList() throws Exception;
	
	//상품 수정 dto
	public void ProductUpdate(ProductDto Pdto) throws Exception;
		
	// 주문내역 dto
	public List<JumunDto> jumunList() throws Exception;
	
	// 장바구니 dto
	public List<BasketDto> basketList() throws Exception;
	
	// 고객문의 게시판 목록 dto
	public List<BoardDTO> boardList() throws Exception;
	
	// 고객문의 게시판 글쓰기 dto
	public void board(BoardDTO bdto) throws Exception;
	
	// 환불요청 게시판 목록 dto
	public List<RefundDto> refundList() throws Exception;
}
