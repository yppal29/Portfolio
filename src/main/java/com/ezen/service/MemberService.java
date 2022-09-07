package com.ezen.service;

import java.util.Map;

import com.ezen.dto.MemberVO;

public interface MemberService {
	MemberVO login(Map<String, String> map) throws Exception;
	
	void memberRegister(MemberVO member) throws Exception;
	
	int idCheck(String member_id) throws Exception;
}
