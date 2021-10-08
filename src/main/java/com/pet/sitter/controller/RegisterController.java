package com.pet.sitter.controller;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pet.sitter.service.MemberService;
import com.pet.sitter.service.SitterService;
import com.pet.sitter.vo.MemberVO;
import com.pet.sitter.vo.SitterVO;

@Controller
@RequestMapping("/join/*")
public class RegisterController {

	private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);
	
	@Inject
	MemberService mService;
	
	@Inject
	SitterService sService;
	
	BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
	
	// member 이메일 중복 체크
		@ResponseBody
		@RequestMapping(value="memberPhoneChk" , method = RequestMethod.POST)
		public int memberPhoneChk(MemberVO mvo) throws Exception
		{
			int result = mService.memberPhoneChk(mvo);
			return result;
		}
		
		// sitter 이메일 중복 체크
		@ResponseBody
		@RequestMapping(value="sitterPhoneChk" , method = RequestMethod.POST)
		public int sitterPhoneChk(SitterVO svo) throws Exception
		{
			int result = sService.sitterPhoneChk(svo);
			return result;
		}
	
	
	// member 이메일 중복 체크
	@ResponseBody
	@RequestMapping(value="memberEmailChk" , method = RequestMethod.POST)
	public int memberEmailChk(MemberVO mvo) throws Exception
	{
		int result = mService.memberEmailChk(mvo);
		return result;
	}
	
	// sitter 이메일 중복 체크
	@ResponseBody
	@RequestMapping(value="sitterEmailChk" , method = RequestMethod.POST)
	public int sitterEmailChk(SitterVO svo) throws Exception
	{
		int result = sService.sitterEmailChk(svo);
		return result;
	}
	
	
	//회원가입 get
		@RequestMapping(value="/memberRegister" , method = RequestMethod.GET)
		public void getMemberRegister()throws Exception
		{
			logger.info("get member register");
		}
		
		//회원가입 post
		@RequestMapping(value="/memberRegister" , method = RequestMethod.POST)
		public String postMemberRegister(MemberVO mvo)throws Exception
		{
			mvo.setUser_password(pwdEncoder.encode(mvo.getUser_password()));
			
			logger.info("post member register 성공");
			mService.memberRegister(mvo);
			
			return "/login/memberLogin";
		}
		
		
		//회원가입 get
		@RequestMapping(value="/sitterRegister" , method = RequestMethod.GET)
		public void getSitterRegister()throws Exception
		{
			logger.info("get sitter register");
		}
		
		//회원가입 post
		@RequestMapping(value="/sitterRegister" , method = RequestMethod.POST)
		public String postSitterRegister(SitterVO svo)throws Exception
		{
			svo.setSitter_password(pwdEncoder.encode(svo.getSitter_password()));

			logger.info("post sitter register");
			sService.sitterRegister(svo);
			
			return "/login/sitterLogin";
		}
}
