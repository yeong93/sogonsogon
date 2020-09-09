package com.kh.sogon.member.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sogon.member.model.dao.MemberDAO;
import com.kh.sogon.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	   @Autowired 
	   private MemberDAO memberDAO;
	   @Autowired // bcrypt 암호화 객체 의존성 주입(DI)
	   private BCryptPasswordEncoder bcPwd;
	
	//로그인
	@Override
	public Member login(Member member) {
		
		
	      Member loginMember = memberDAO.login(member);
	      if(loginMember!=null) {
	    	  if(!bcPwd.matches(member.getMemberPwd(), loginMember.getMemberPwd())) {
	    		 
	    		  // 임시비밀번호 발급받은사람일때
	    		  if(member.getMemberPwd().equals(loginMember.getMemberPwd())) {
	    			  loginMember.setMemberPwd(null);
	    			  
	    		  } else {
	    		  // 임시비밀번호 발급받은사람아닐때	    		  
	    		  loginMember = null;
	    		  
	    		  }
	    	  }else {
	              loginMember.setMemberPwd(null);
	           }
	      }
	      
	      return loginMember;
	}

	// id 중복검사
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int idDupCheck(String memberId) {
		return memberDAO.idDupCheck(memberId);
	}

	// 회원가입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int signUp(Member signUpMember) throws Exception {
		
		String encPwd = bcPwd.encode(signUpMember.getMemberPwd());
		
		signUpMember.setMemberPwd(encPwd);
		
		return memberDAO.signUp(signUpMember);
	}

	// 아이디찾기
	@Override
	public String findId(Map<String, Object> map) {
		return memberDAO.findId(map);
	}

	// 비밀번호 찾기
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int findPwd(Map<String, Object> paramMap) {
		
		return memberDAO.findPwd(paramMap);
	}

	
	
	
	
	
	
	
	
	
}
