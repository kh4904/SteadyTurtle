package com.spring.ex.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.ex.dto.MemberDto;
import com.spring.ex.dto.ProductDto;

@Repository
public interface MemberDao {
	// 회원정보 dto
	public List<MemberDto> memberList() throws Exception;
	
	// 회원가입 dto
	public void register(MemberDto dto) throws Exception;
	
	//로그인 dto
	public MemberDto login(MemberDto ldto) throws Exception;
	
	// 상품정보 dto
	public List<ProductDto> productList() throws Exception;
}
