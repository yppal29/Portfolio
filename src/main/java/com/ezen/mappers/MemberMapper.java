package com.ezen.mappers;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ezen.dto.MemberVO;

@Mapper
@Repository
public interface MemberMapper {
	public MemberVO login(Map<String, String> map);
	
	public void memberRegister(MemberVO member) throws Exception;
	
	public int idCheck(String member_id) throws Exception;
}
