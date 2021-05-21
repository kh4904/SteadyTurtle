package com.spring.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.ex.dto.BasketDto;
import com.spring.ex.dto.BoardDTO;
import com.spring.ex.dto.JumunDto;
import com.spring.ex.dto.MemberDto;
import com.spring.ex.dto.ProductDto;
import com.spring.ex.dto.RefundDto;
import com.spring.ex.dto.SellDto;

@Service
public interface TurtleService {
	
	/* 회원정보 list MemberDto를 memberList()로 선언*/
	public List<MemberDto> memberList() throws Exception;
	
	/* 회원가입 MemberDto를 dto로 선언 */
	public void register(MemberDto dto) throws Exception;
	
	/* 회원수정 MemberUpdate 회원dto를 mDto로 선언*/ 
	public void MemberUpdate(MemberDto mDto) throws Exception;
	
	//로그인 MemberDto를 ldto로 선언
	public MemberDto login(MemberDto ldto) throws Exception;
	
	//회원상세 MemberDto를 mddto로 선언
	public MemberDto memberDetail(MemberDto mddto) throws Exception;
	
	//회원탈퇴
	public void memberdelete(MemberDto ddto) throws Exception;
	
	/* 상품정보 list ProductDto를 productList()로 선언*/
	public List<ProductDto> productList() throws Exception;
	
	/* 상품정보 상세 ProductDto를 pdto()로 선언*/
	public ProductDto product(ProductDto pdto) throws Exception;
	
	/* 주문내역 상품 list JumunDto를 jumunList()로 선언*/
	public List<JumunDto> jumunList() throws Exception;
	
	/* 장바구니  list BasketDto를 basketList()로 선언*/
	public List<BasketDto> basketList() throws Exception;
	
	// 고객문의 게시판 list BoardDTO를 boardList로 선언
	public List<BoardDTO> boardList() throws Exception;
	
	// 고객문의 글쓰기 BoardDTO를 bdto로 선언
	public void boardWrite(BoardDTO bdto) throws Exception;
	
	// 환불요청 게시판 list RefundDto를 refundList로 선언
	public List<RefundDto> refundList() throws Exception;
	
	// 환불요청 게시판 list RefundDto를 refundList로 선언
	public List<SellDto> sellList() throws Exception;
	
}
