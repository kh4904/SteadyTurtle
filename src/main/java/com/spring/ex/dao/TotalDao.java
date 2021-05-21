package com.spring.ex.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.ex.dto.BasketDto;
import com.spring.ex.dto.BoardDTO;
import com.spring.ex.dto.JumunDto;
import com.spring.ex.dto.MemberDto;
import com.spring.ex.dto.ProductDto;
import com.spring.ex.dto.RefundDto;

@Repository
public class TotalDao implements MemberDao {
	@Inject
	private SqlSession sqlSessionTemplate;
	private static final String namespace = "com.spring.ex.mapper";// mapper �� id �� ã�°�

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

	// 상품정보 select문
	@Override
	public List<ProductDto> productList() throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".product");
	}

	// 상품 정보 update문 수정
	@Override
	public void ProductUpdate(ProductDto Pdto) throws Exception {
		sqlSessionTemplate.update(namespace + ".ProductUpdate",Pdto);
	}

	// 주문내역 select문
	@Override
	public List<JumunDto> jumunList() throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".jumun");
	}

	// 장바구니 select문
	@Override
	public List<BasketDto> basketList() throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".basket");
	}

	// 고객문의 게시판 목록 select문
	@Override
	public List<BoardDTO> boardList() throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".board");
	}

	// 고객문의 게시판 글쓰기 insert문
	@Override
	public void board(BoardDTO bdto) throws Exception {
		sqlSessionTemplate.insert(namespace + ".boardWrite", bdto);
	}

	// 환불요청 게시판 목록 select문
	@Override
	public List<RefundDto> refundList() throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".refund");
	}
}
