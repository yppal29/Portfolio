package com.ezen.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.dto.MemberVO;
import com.ezen.mappers.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberMapper memberMapper;
	
	public MemberVO login(Map<String, String> map) throws Exception {
		return memberMapper.login(map);
	}

	public void memberRegister(MemberVO member) throws Exception {
	
		memberMapper.memberRegister(member);
	}

	public int idCheck(String member_id) throws Exception {

		return  memberMapper.idCheck(member_id);
	}
}
