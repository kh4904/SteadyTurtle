package com.spring.ex.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.ex.dao.MemberDao;
import com.spring.ex.dto.BasketDto;
import com.spring.ex.dto.BoardDTO;
import com.spring.ex.dto.CartListVO;
import com.spring.ex.dto.CartVO;
import com.spring.ex.dto.CashlistDto;
import com.spring.ex.dto.JumunDto;
import com.spring.ex.dto.MemberDto;
import com.spring.ex.dto.ProductDto;
import com.spring.ex.dto.RefundDto;
import com.spring.ex.dto.SellDto;


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
	
	//아이디 중복 체크
	@Override
	public int idChk(MemberDto mdto) throws Exception {
		int result = dao.idChk(mdto);
		return result;
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
	
	//아이디찾기
	@Inject
	private MemberDao memberDaoId;
		
	@Override
	public MemberDto memberId(MemberDto mIdDto) throws Exception {
	
		return memberDaoId.memberId(mIdDto);
	}
		
	//비밀번호찾기
	@Inject
	private MemberDao memberDaoPw;
	@Override
	public MemberDto memberPw(MemberDto mPwDto) throws Exception {
	
		return memberDaoPw.memberPw(mPwDto);
	}
	
	//회원상세
	@Inject MemberDao mddao;
		
	@Override
	public MemberDto memberDetail(MemberDto mddto) throws Exception{
		return mddao.memberDetail(mddto);
	}
	
	//회원탈퇴
	@Override
	public void memberdelete(MemberDto ddto) throws Exception{
		dao.memberdelete(ddto);
	}
	
	// 상품정보
	@Inject
	private MemberDao productDao;
	
	@Override
	public List<ProductDto> productList() throws Exception {
	
		return productDao.productList();
	}
	
	//상품 상세
	@Inject MemberDao pdao;
		
	@Override
	public ProductDto product(ProductDto pdto) throws Exception {
		return pdao.product(pdto);
	}
	
	//상품추가
	@Override
	public void addProduct(ProductDto apdto) throws Exception {
		productDao.addProduct(apdto);
	}
	
	// 상품수정
	@Override
	public void ProductUpdate(ProductDto pudto) throws Exception{
		productDao.ProductUpdate(pudto);
	}
	
	// 상품삭제
	@Override
	public void productDelete(ProductDto pzdto) throws Exception{
		productDao.productDelete(pzdto);
	}
	
	//재고수정
	@Override
	public void productAdd(ProductDto pADto) throws Exception{
		productDao.productAdd(pADto);
	}
	
	// 상품랭킹 MemberDao를 Ranking으로 지정
	@Inject
	private MemberDao Ranking;
		
	// 헬스기구랭킹
	@Override
	public List<ProductDto> healthRanking() throws Exception {
	
		return Ranking.healthRanking();
	}
	// 요가상품랭킹
	@Override
	public List<ProductDto> yogaRanking() throws Exception {
	
		return Ranking.yogaRanking();
	}
	// 운동식품랭킹
	@Override
	public List<ProductDto> foodRanking() throws Exception {
	
		return Ranking.foodRanking();
	}
	// 남성상품랭킹
	@Override
	public List<ProductDto> manRanking() throws Exception {
	
		return Ranking.manRanking();
	}
	// 여성상품랭킹
	@Override
	public List<ProductDto> womanRanking() throws Exception {
	
		return Ranking.womanRanking();
	}
	
	// 주문내역 리스트
	@Inject
	private MemberDao JumunDao;
		
	@Override
	public List<JumunDto> jumunList() throws Exception {
	
		return JumunDao.jumunList();
	}
	
	// 주문내역
	@Override
	public JumunDto jumun(JumunDto jdto) throws Exception {
		return JumunDao.jumun(jdto);
	}
	
	// 주문신청삭제(취소)
	@Override
	public void jumundelete(JumunDto jddto) throws Exception{
		JumunDao.jumundelete(jddto);
	}
	
	// 장바구니 리스트
	@Inject
	private MemberDao BasketDao;
			
	@Override
	public List<BasketDto> basketList() throws Exception {
		
		return BasketDao.basketList();
	}
	
	// 장바구니 추가
	@Inject MemberDao bidao;
	
	//장바구니 추가2
	@Override
	public void addCart(CartListVO cart) throws Exception {
		bidao.addCart(cart);
	}
		
	//장바구니 추가5
	@Override
	public void addCart5(CartVO cart) throws Exception {
		bidao.addCart5(cart);
	}
	
	//장바구니 추가4
	@Override
	public List<CartListVO> cartList(String mId) throws Exception {
		return dao.cartList(mId);
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
	
	// 고객문의 게시글 답변 
	@Override
	public void boardAnswer(BoardDTO bdto) throws Exception {
		bdao.boardAnswer(bdto);
	}
	
	// 고객문의 세션주기
	@Inject MemberDao bbdao;
			
	@Override
	public BoardDTO board2(BoardDTO bbdto) throws Exception {
		return bbdao.board2(bbdto);
	}
	
	// 고객문의 게시글 삭제하기
	@Override
	public void boardDelete(BoardDTO bddto) throws Exception{
		bdao.boardDelete(bddto);
	}

	// 환불요청 목록
	@Inject
	private MemberDao RefundDao;
			
	@Override
	public List<RefundDto> refundList() throws Exception {
			
		return RefundDao.refundList();
	}
	
	// 환불요청 글쓰기
	@Override
	public void refundWrite(RefundDto rwDto) throws Exception {
			
		RefundDao.refundWrite(rwDto);
			
	}
	
	// 환불요청 게시글 세션주기
	@Override
	public RefundDto refund2(RefundDto rdto) throws Exception {
		return RefundDao.refund2(rdto);
	}
	
	// 환불신청 승락 update 
	@Override
	public void RefundUpdate(RefundDto rrDto) throws Exception {
		RefundDao.RefundUpdate(rrDto);
	}
	
	// 판매상품 목록
	@Inject
	private MemberDao SellDao;
				
	@Override
	public List<SellDto> sellList() throws Exception {
			
		return SellDao.sellList();
	}
	
	//결제하기
	@Inject MemberDao cdao;
		
	//결제하기
	@Override
	public void cashOk(CashlistDto cldto) throws Exception {
		cdao.cashOk(cldto);
	}
}
