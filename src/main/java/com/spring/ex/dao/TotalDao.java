package com.spring.ex.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.ex.dto.MemberDto;
import com.spring.ex.dto.ProductDto;

@Repository
public class TotalDao implements MemberDao{
	@Inject
	private SqlSession sqlSessionTemplate;
	private static final String namespace = "com.spring.ex.mapper";//mapper �� id �� ã�°�
	
	// 회원정보 select문
	@Override
	public List<MemberDto> memberList() throws Exception {
		
		return sqlSessionTemplate.selectList(namespace+".id");
		
	}
	
	// 회원가입 insert문
	@Override
	public void register(MemberDto dto) throws Exception {
		sqlSessionTemplate.insert(namespace + ".register", dto);
	}
	
	// 로그인
	@Override
	public MemberDto login(MemberDto ldto) throws Exception{
		return sqlSessionTemplate.selectOne(namespace + ".login", ldto);
	}
	
	// 상품정보 select문
	@Override
	public List<ProductDto> productList() throws Exception {
		
		return sqlSessionTemplate.selectList(namespace+".product");
		
	}
}
