package com.pet.sitter.controller;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pet.sitter.service.MemberService;
import com.pet.sitter.service.SitterService;
import com.pet.sitter.vo.MemberVO;
import com.pet.sitter.vo.SitterVO;

@Controller
@RequestMapping("/login/*")
public class LoginController {
	
	@Inject
	MemberService Mservice;
	
	@Inject
	SitterService Sservice;
	
	BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	
	
	//로그인 가능여부 체크
	@ResponseBody
	@RequestMapping(value="/memberLoginChk", method = RequestMethod.GET)
	public int memberLoginChk(MemberVO mvo)throws Exception
	{
		int result = Mservice.memberLoginChk(mvo);
		System.out.println("멤버 로그인 체크 후 result 값은 ? : ");
		return result;
		
		
	}

	//로그인 get
	@RequestMapping(value="/memberLogin" , method = RequestMethod.GET)
	public void memberLogin() throws Exception
	{
		logger.info("get login 로그인 되나 ~~~~");
	}
	
	//로그인 post
	@RequestMapping(value="/memberLogin" , method = RequestMethod.POST)
	public String memberLogin(MemberVO mvo , HttpServletRequest req , RedirectAttributes rttr , Model model) throws Exception
	{
		logger.info("post memberlogin 성공");
		HttpSession session = req.getSession();
		int mLoginChk = Mservice.memberLoginChk(mvo);
		String pass = mvo.getUser_password();
		System.out.println("mLogin Check is = " + mLoginChk);
		if(mLoginChk == 1) {
			MemberVO login = Mservice.memberLogin(mvo);
			if(pwdEncoder.matches(pass, login.getUser_password())){
				System.out.println("memeber 로그인 체크 성공" + login.getUser_email());
				System.out.println("로그인 아이디 : " + login.getUser_email());
				
				session.setAttribute("member", login.getUser_email());
				
				return "home";
			}else {
				model.addAttribute("loginChk", '1');
				System.out.println("비밀번호가 틀렸습니다.");
			}
		}

			model.addAttribute("loginChk", mLoginChk);
			System.out.println("멤버가 아닙니다, 로그인에 실패 하셨습니다.");
			
		return "login/memberLogin";
	}
	
	//로그인 get
	@RequestMapping(value="/sitterLogin" , method = RequestMethod.GET)
	public void sitterLogin() throws Exception
	{
		logger.info("get sitterlogin page 접속");
	}
	
	
	//로그인 post
	@RequestMapping(value="/sitterLogin" , method = RequestMethod.POST)
	public String sitterLogin(SitterVO svo , HttpServletRequest req , RedirectAttributes rttr, Model model) throws Exception
	{
		logger.info("post sitterlogin 성공");
		
		HttpSession session = req.getSession();
		String pass = svo.getSitter_password();
		int sLoginChk = Sservice.sitterLoginChk(svo);
		if(sLoginChk == 1) {
			SitterVO sitInfo = Sservice.sitterLogin(svo);
			String sitterPass = sitInfo.getSitter_password();
			if(pwdEncoder.matches(pass, sitterPass)) {
				System.out.println("memeber 로그인 체크 성공" + sitInfo.getSitter_email());
				System.out.println("로그인 아이디 : " + sitInfo.getSitter_password());
				
				session.setAttribute("sitter", sitInfo.getSitter_email());
				return "home";
			}else {
				model.addAttribute("loginChk", '1');
				System.out.println("비밀번호가 틀렸습니다.");
			}
		}
			model.addAttribute("msg", "로그인에 실패 하셨습니다.");
			model.addAttribute("loginChk", sLoginChk);
			return "login/sitterLogin";
	}
	
		// 로그아웃	
		@RequestMapping(value="/logout" , method = RequestMethod.GET)
		public String logout(HttpSession session) throws Exception
		{
			System.out.println(session);
			logger.info("로그아웃 성공!!");
			session.invalidate();
			System.out.println(session);
			return "redirect:/";
		}
		
		//회원 탈퇴 get
		@RequestMapping(value="/memberDeleteView" , method = RequestMethod.GET)
		public void memberDelete() throws Exception
		{
			logger.info("memberDelete get!!!");
		}
		
		// 회원 탈퇴 POST
		@RequestMapping(value="/memberDeleteViewForm" , method = RequestMethod.POST)
		public String memberDelete(MemberVO mvo , HttpSession session , RedirectAttributes rtt , Model model) throws Exception
		{
			
			logger.info("회원 탈퇴 post까지 들어 왔다잉");
			String pass = mvo.getUser_password();
			String memberDeleteChk = Mservice.memberDeleteChk(mvo); 
			
			if(pwdEncoder.matches(pass, memberDeleteChk)){
				Mservice.memberDelete(mvo);
				System.out.println("member 삭제 체크 성공 ");
				session.invalidate();
				return "home";
			}
			else
			{
				model.addAttribute("lucky" , '0');
				System.out.println("삭제실패");
				System.out.println(memberDeleteChk);
				return "/login/memberDeleteView";
			}
		}
		// member 프로필 보기
		@RequestMapping(value="/memberProfile", method=RequestMethod.GET)
		public String memberProfile(HttpSession session, Model model) throws Exception{
			System.out.println("읽어 오는지 확인 해보자.");
			String email = (String)session.getAttribute("member");
			 MemberVO a = Mservice.memberProfile(email);
			 model.addAttribute("mprofile", a);
			 
			 return "login/memberProfile";
		}
		
		// member 프로필 수정 get
		@RequestMapping(value="/memberProfileUpdateView" , method = RequestMethod.GET)
		public void memberProfileUp(HttpSession session , Model model) throws Exception
		{
			logger.info("memberProfileUpdate GET");
			
			String profile = (String)session.getAttribute("member");
			MemberVO p = Mservice.memberProfile(profile);
			model.addAttribute("updateprofile" , p);
		}
		
		// member 프로필 수정 POST
		@RequestMapping(value="/memberProfileUpdate" , method = RequestMethod.POST)
		public String memberProfileUpdate(HttpSession session ,MemberVO mvo) throws Exception
		{
			logger.info("memberProfileUpdate POST");
			Mservice.memberprofileUpdate(mvo);
			return "redirect:/login/memberProfile";
		}
}