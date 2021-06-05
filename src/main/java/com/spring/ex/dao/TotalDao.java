package com.spring.ex.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.ex.dto.BoardDTO;
import com.spring.ex.dto.CartListVO;
import com.spring.ex.dto.CartVO;
import com.spring.ex.dto.JumunDto;
import com.spring.ex.dto.MemberDto;
import com.spring.ex.dto.ProductDto;
import com.spring.ex.dto.RefundDto;
import com.spring.ex.dto.SellDto;

@Repository
public class TotalDao implements MemberDao {
	@Inject
	private SqlSession sqlSessionTemplate;
	private static final String namespace = "com.spring.ex.mapper";// mapper �� id �� ã�°�

	// 상품 관리자 출력
	@Override
	public List<ProductDto> ProductList(HashMap<String, Integer> map) throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".ProductList", map);
	}

	@Override
	public List<ProductDto> HealthList(HashMap<String, Integer> map) throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".HealthList", map);
	}

	@Override
	public List<ProductDto> FoodList(HashMap<String, Integer> map) throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".FoodList", map);
	}

	@Override
	public List<ProductDto> YogaList(HashMap<String, Integer> map) throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".YogaList", map);
	}

	// 검색기능
	public List<ProductDto> productSearch(String keyword) throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".productSearch", keyword);
	}

	// 관리자 페이징 정보
	public int productTotalCount() throws Exception {
		return sqlSessionTemplate.selectOne(namespace + ".productTotalCount");
	}

	// 관리자 페이징 정보
	public int  yogaTotalCount() throws Exception {
		return sqlSessionTemplate.selectOne(namespace + ".yogaTotalCount");
	}

	// 관리자 페이징 정보
	public int healthTotalCount() throws Exception {
		return sqlSessionTemplate.selectOne(namespace + ".healthTotalCount");
	}

	// 관리자 페이징 정보
	public int foodTotalCount() throws Exception {
		return sqlSessionTemplate.selectOne(namespace + ".foodTotalCount");
	}

	// 멤버 검색 기능
	public List<MemberDto> memberSearch(String key) throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".memberSearch", key);
	}

	// 회원정보 select문
	@Override
	public List<MemberDto> memberList() throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".id");
	}

	// 회원가입 insert문
	@Override
	public void register(MemberDto dto) throws Exception {
		sqlSessionTemplate.insert(namespace + ".register", dto);
	}

	// 아이디 중복 체크
	@Override
	public int idChk(MemberDto mdto) throws Exception {
		int result = sqlSessionTemplate.selectOne(namespace + ".idChk", mdto);
		return result;
	}

	// 회원 정보 update문 수정
	@Override
	public void MemberUpdate(MemberDto Mdto) throws Exception {
		sqlSessionTemplate.update(namespace + ".MemberUpdate", Mdto);
	}

	// 로그인
	@Override
	public MemberDto login(MemberDto ldto) throws Exception {
		return sqlSessionTemplate.selectOne(namespace + ".login", ldto);
	}

	// 아이디 찾기 select문
	@Override
	public MemberDto memberId(MemberDto mIdDto) throws Exception {
		return sqlSessionTemplate.selectOne(namespace + ".mId", mIdDto);
	}

	// 비번 찾기 select문
	@Override
	public MemberDto memberPw(MemberDto mPwDto) throws Exception {
		return sqlSessionTemplate.selectOne(namespace + ".mPw", mPwDto);
	}

	// 회원상세
	@Override
	public MemberDto memberDetail(MemberDto mddto) throws Exception {
		return sqlSessionTemplate.selectOne(namespace + ".memberDetail", mddto);
	}

	// 회원탈퇴
	@Override
	public void memberdelete(MemberDto ddto) throws Exception {
		sqlSessionTemplate.delete(namespace + ".memberdelete", ddto);

	}

	// 상품정보 select문
	@Override
	public List<ProductDto> productList(HashMap<String, Integer> map) throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".productList", map);
	}

	// 상품상세 select문
	@Override
	public ProductDto product(ProductDto pdto) throws Exception {
		return sqlSessionTemplate.selectOne(namespace + ".product2", pdto);
	}

	// 상품추가
	public void addProduct(ProductDto apdto) throws Exception {
		sqlSessionTemplate.insert(namespace + ".addProduct", apdto);
	}

	// 상품수정
	@Override
	public void ProductUpdate(ProductDto pudto) throws Exception {
		sqlSessionTemplate.update(namespace + ".productUpdate", pudto);
	}

	// 상품삭제
	@Override
	public void productDelete(ProductDto pzdto) throws Exception {
		sqlSessionTemplate.delete(namespace + ".productDelete", pzdto);
	}

	// 재고관리
	public void productAdd(ProductDto pADto) throws Exception {
		sqlSessionTemplate.update(namespace + ".productAdd", pADto);
	}

	// 헬스기구랭킹 select문
	@Override
	public List<ProductDto> healthRanking() throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".health");
	}

	// 요가상품랭킹 select문
	@Override
	public List<ProductDto> yogaRanking() throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".yoga");
	}

	// 운동식품랭킹 select문
	@Override
	public List<ProductDto> foodRanking() throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".food");
	}

	// 남성상품랭킹 select문
	@Override
	public List<ProductDto> manRanking() throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".man");
	}

	// 여성상품랭킹 select문
	@Override
	public List<ProductDto> womanRanking() throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".woman");
	}

	// 주문내역 select문
	@Override
	public List<JumunDto> jumunList() throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".jumun");
	}

	// 주문내역 세션유지
	@Override
	public JumunDto jumun(JumunDto jdto) throws Exception {
		return sqlSessionTemplate.selectOne(namespace + ".jumun2", jdto);
	}

	// 주문내역 결재승인
	@Override
	public void jumunState(JumunDto juDto) throws Exception {
		sqlSessionTemplate.update(namespace + ".jumunState", juDto);
	}

	// 주문신청삭제(취소)
	@Override
	public void jumundelete(JumunDto jddto) throws Exception {
		sqlSessionTemplate.delete(namespace + ".jumunDelete", jddto);

	}

	// 장바구니 추가2
	@Override
	public void addCart(CartListVO cart) throws Exception {
		sqlSessionTemplate.insert(namespace + ".addCart", cart);
	}

	// 장바구니 추가3
	@Override
	public void addCart5(CartVO cart) throws Exception {
		sqlSessionTemplate.insert(namespace + ".addCart", cart);
	}

	// 장바구니 추가4
	@Override
	public List<CartListVO> cartList(String mId) throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".cartList", mId);
	}

	// 장바구니 삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		sqlSessionTemplate.delete(namespace + ".deleteCart", cart);
	}

	// 고객문의 게시판 목록 select문
	@Override
	public List<BoardDTO> boardList() throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".board");
	}

	// 고객문의 게시판 목록 세션값 select문
	@Override
	public BoardDTO board2(BoardDTO bbdto) throws Exception {
		return sqlSessionTemplate.selectOne(namespace + ".board2", bbdto);
	}

	// 고객문의 게시판 글쓰기 insert문
	@Override
	public void board(BoardDTO bdto) throws Exception {
		sqlSessionTemplate.insert(namespace + ".boardWrite", bdto);
	}

	// 고객문의 게시글 답변 update문
	@Override
	public void boardAnswer(BoardDTO bdto) throws Exception {
		sqlSessionTemplate.update(namespace + ".boardAnswer", bdto);
	}

	// 고객문의 게시글 삭제 delete문
	@Override
	public void boardDelete(BoardDTO bddto) throws Exception {
		sqlSessionTemplate.delete(namespace + ".boardDelete", bddto);

	}

	// 환불요청 게시판 목록 select문
	@Override
	public List<RefundDto> refundList() throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".refund");
	}

	// 고객문의 게시판 글쓰기 insert문
	@Override
	public void refundWrite(RefundDto rwDto) throws Exception {
		sqlSessionTemplate.insert(namespace + ".refundWrite", rwDto);
	}

	// 환불요청 게시판 목록 세션값 select문
	@Override
	public RefundDto refund2(RefundDto rdto) throws Exception {
		return sqlSessionTemplate.selectOne(namespace + ".refund2", rdto);
	}

	// 환불요청 신청 승락 update문
	@Override
	public void RefundUpdate(RefundDto rrDto) throws Exception {
		sqlSessionTemplate.update(namespace + ".RefundUpdate", rrDto);
	}

	// 환불요청시 주문쪽 환불처리로 변경 update문
	@Override
	public void refundJumun(JumunDto jrDto) throws Exception {
		sqlSessionTemplate.update(namespace + ".refundJumun", jrDto);
	}

	// 환불요청 신청 승락시 주문쪽 환불완료로 변경 update문
	@Override
	public void jumunRefund(JumunDto rjDto) throws Exception {
		sqlSessionTemplate.update(namespace + ".jumunRefund", rjDto);
	}

	// 판매상품목록 select문
	@Override
	public List<SellDto> sellList() throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".sell");
	}

	// 판매상품목록 중복된 날짜데이터값 1회만출력 select문
	@Override
	public List<SellDto> sellOne() throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".sellOne");
	}

	// 결제하기
	@Override
	public void cashOk(JumunDto cldto) throws Exception {
		sqlSessionTemplate.insert(namespace + ".cashOk", cldto);
	}

	// 결제시 상품 목록 변경
	@Override
	public void productDecrease(ProductDto pudto) throws Exception {
		sqlSessionTemplate.update(namespace + ".productDecrease", pudto);
	}
}
