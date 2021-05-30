package com.spring.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.ex.dto.BasketDto;
import com.spring.ex.dto.BoardDTO;
import com.spring.ex.dto.CashlistDto;
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
	
	//아이디 중복 체크
	public int idChk(MemberDto mdto) throws Exception;
	
	/* 회원수정 MemberUpdate 회원dto를 mDto로 선언*/ 
	public void MemberUpdate(MemberDto mDto) throws Exception;
	
	//로그인 MemberDto를 ldto로 선언
	public MemberDto login(MemberDto ldto) throws Exception;
	
	/* 아이디찾기 MemberDto를 memberId()로 선언*/
	public MemberDto memberId(MemberDto mIdDto) throws Exception;
	
	/* 비밀번호찾기 MemberDto를 memberPw()로 선언*/
	public MemberDto memberPw(MemberDto mPwDto) throws Exception;
	
	//회원상세 MemberDto를 mddto로 선언
	public MemberDto memberDetail(MemberDto mddto) throws Exception;
	
	//회원탈퇴
	public void memberdelete(MemberDto ddto) throws Exception;
	
	/* 상품정보 list ProductDto를 productList()로 선언*/
	public List<ProductDto> productList() throws Exception;
	
	/* 상품정보 상세 ProductDto를 pdto()로 선언*/
	public ProductDto product(ProductDto pdto) throws Exception;
	
	//상품추가
	public void addProduct(ProductDto apdto) throws Exception;
	
	// 상품수정
	public void ProductUpdate(ProductDto pudto) throws Exception;
	
	/* 헬스기구랭킹 list ProductDto를 healthRanking()로 선언*/
	public List<ProductDto> healthRanking() throws Exception;
	
	/* 요가상품랭킹 list ProductDto를 yogaRanking()로 선언*/
	public List<ProductDto> yogaRanking() throws Exception;
	
	/* 운동식품랭킹 list ProductDto를 foodRanking()로 선언*/
	public List<ProductDto> foodRanking() throws Exception;
	
	/* 남성상품랭킹 list ProductDto를 manRanking()로 선언*/
	public List<ProductDto> manRanking() throws Exception;
	
	/* 여성상품랭킹 list ProductDto를 womanRanking()로 선언*/
	public List<ProductDto> womanRanking() throws Exception;
	
	/* 주문내역 상품 list JumunDto를 jumunList()로 선언*/
	public List<JumunDto> jumunList() throws Exception;
	
	/* 주문내역 상세 JumunDto를 jdto()로 선언*/
	public JumunDto jumun(JumunDto jdto) throws Exception;
	
	/* 장바구니  list BasketDto를 basketList()로 선언*/
	public List<BasketDto> basketList() throws Exception;
	
	//장바구니 추가
	public void basketInsert(BasketDto bidto) throws Exception;
	
	// 고객문의 게시판 list BoardDTO를 boardList로 선언
	public List<BoardDTO> boardList() throws Exception;
	
	/* 고객문의 게시판 세션주기 BoardDTO를 bbdto()로 선언*/
	public BoardDTO board2(BoardDTO bbdto) throws Exception;
	
	// 고객문의 글쓰기 BoardDTO를 bdto로 선언
	public void boardWrite(BoardDTO bdto) throws Exception;
	
	/* 고객문의 게시글 답변 boardAnswer 보드dto를 bDto로 선언*/ 
	public void boardAnswer(BoardDTO bDto) throws Exception;
	
	// 고객문의 게시글 삭제 boardDelete 보드dto를 bddto로 선언
	public void boardDelete(BoardDTO bddto) throws Exception;
	
	// 환불요청 게시판 list RefundDto를 refundList로 선언
	public List<RefundDto> refundList() throws Exception;
	
	// 환불요청 글쓰기 RefundDto를 bdto로 선언
	public void refundWrite(RefundDto rwDto) throws Exception;
	
	/* 환불요청 게시판 세션주기 RefundDto를 rdto()로 선언*/
	public RefundDto refund2(RefundDto rdto) throws Exception;
	
	/* 환불요청 게시판 환불신청 승락 RefundUpdate의 RefundDto를 rrDto로 선언*/ 
	public void RefundUpdate(RefundDto rrDto) throws Exception;
	
	// 판매목록 게시판 list SellDto를 sellList로 선언
	public List<SellDto> sellList() throws Exception;
	
	//결제하기
	public void cashOk(CashlistDto cldto) throws Exception;
	
}
