package com.spring.ex.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.ex.dto.BasketDto;
import com.spring.ex.dto.BoardDTO;
import com.spring.ex.dto.JumunDto;
import com.spring.ex.dto.MemberDto;
import com.spring.ex.dto.ProductDto;
import com.spring.ex.dto.RefundDto;
import com.spring.ex.dto.SellDto;

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
	
	// 회원상세 dto
	public MemberDto memberDetail(MemberDto mddto) throws Exception;
	
	// 회원탈퇴
	public void memberdelete(MemberDto ddto) throws Exception;
	
	// 상품정보 dto
	public List<ProductDto> productList() throws Exception;
	
	// 상품상세 dto
	public ProductDto product(ProductDto pdto) throws Exception;
	
	// 헬스기구랭킹 dto
	public List<ProductDto> healthRanking() throws Exception;
	
	// 요가상품랭킹 dto
	public List<ProductDto> yogaRanking() throws Exception;
	
	// 운동식품랭킹 dto
	public List<ProductDto> foodRanking() throws Exception;
	
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
	
	// 판매상품 목록 dto
	public List<SellDto> sellList() throws Exception;
}
