package com.pet.sitter.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.pet.sitter.service.SitterBoardService;
import com.pet.sitter.vo.PageMaker;
import com.pet.sitter.vo.ReserveVO;
import com.pet.sitter.vo.ReviewVO;
import com.pet.sitter.vo.SearchCriteria;
import com.pet.sitter.vo.SitterBoardVO;

@Controller
@RequestMapping("/sitter/*")
public class SitterBoardController {
	private static final Logger log = LoggerFactory.getLogger(SitterBoardController.class);

	// realpath :
	// C:\spring_0826\spring_work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\pet_sitter\/upload/sitter_profile/
	@Inject
	SitterBoardService sb_service;
	
	// sitter 프로필 리스트조회
	@RequestMapping(value = "/profileBoard", method = RequestMethod.GET)
	public String profileList(SitterBoardVO sbvo, Model model, @ModelAttribute("scri") SearchCriteria scri)
			throws Exception {
		log.info("profileList GET");
		model.addAttribute("profileList", sb_service.sbList(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(sb_service.listCount(scri));
		model.addAttribute("pageMaker", pageMaker);

		return "sitter/sitt_profile_board";
	}
	
	// rvList 조회(JSON)
	@RequestMapping(value="rvList", method=RequestMethod.GET)
	@ResponseBody
	public String rvList(HttpServletRequest rq) throws Exception{
		log.info("rvList GET");
		System.out.println("rq에서 sitter_email??"+rq.getAttribute("sitter_email"));
		List<ReviewVO> rvList = sb_service.rvList();
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(rvList);
		
		return json;
	}
	// sitter 프로필 디테일
	@RequestMapping(value = "/profileView", method = RequestMethod.GET)
	public String ProfileView(HttpSession session, SitterBoardVO sbvo, @ModelAttribute("scri") SearchCriteria scri, Model model)
			throws Exception {
		log.info("profileView GET");
		model.addAttribute("profileView", sb_service.profileView(sbvo.getSitter_email()));
		model.addAttribute("reserveList",sb_service.reserveList(sbvo.getSitter_email()));
		SitterBoardVO sb = sb_service.profileView(sbvo.getSitter_email());
		System.out.println("주소값?????"+sb.getSitter_addr());
		model.addAttribute("newrq",sb_service.newRqCount(sbvo.getSitter_email()));
		return "sitter/sitt_profile_detail";
	}

	// sitter 프로필 수정뷰
	@RequestMapping(value = "/profileEditView", method = RequestMethod.GET)
	public String editSitterProfileView(SitterBoardVO sbvo, @ModelAttribute("scri") SearchCriteria scri, Model model)
			throws Exception {
		log.info("editSitterProfileView GET");
		model.addAttribute("profileEdit", sb_service.profileView(sbvo.getSitter_email()));
		model.addAttribute("scri", scri);
		return "sitter/sitt_profile_edit";
	}
	
	// sitter 프로필 이미지 수정뷰
	@RequestMapping(value="/profileImageEV", method = RequestMethod.GET)
	public String imageEditView(SitterBoardVO sbvo, Model model) throws Exception{
		log.info("imageEdit GET");
		model.addAttribute("profileEdit", sb_service.profileView(sbvo.getSitter_email()));
		return "sitter/sitt_profile_image";
	}
	
	// sitter 프로필 이미지 수정
	 @RequestMapping(value="/profileImageEdit", method=RequestMethod.POST) 
	 public String imageEdit(SitterBoardVO sbvo,HttpServletRequest rs, @RequestParam("file") MultipartFile file, @ModelAttribute("scri") SearchCriteria scri,RedirectAttributes rttr) throws Exception {
		 log.info("imageEdit POST");
	  String rootPath = rs.getSession().getServletContext().getRealPath("/");
	  String path = rootPath + "/upload/sitter_profile/";
	  String orName = file.getOriginalFilename();
	  String ext = FilenameUtils.getExtension(orName);
	  String sittName = sbvo.getSitter_email() + "." + ext;
		// Save mediaFile on system
		if (!file.getOriginalFilename().isEmpty()) {
			BufferedOutputStream outputStream = new BufferedOutputStream(
					new FileOutputStream(new File(path, sittName)));
			outputStream.write(file.getBytes());
			outputStream.flush();
			outputStream.close();
		}
		sbvo.setSitter_image(sittName);
		sb_service.updateImage(sbvo.getSitter_image());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/sitter/profileView?sitter_email="+rs.getParameter("sitter_email");
	  }
	 
	// sitter 프로필 수정
	@RequestMapping(value = "/profileEdit", method = RequestMethod.POST)
	public String editSitterProfile(SitterBoardVO sbvo,@ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		log.info("editSitterProfile POST");
		sb_service.update(sbvo);
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/sitter/profileView?sitter_email="+sbvo.getSitter_email(); // 메인페이지
	}
	
	// calendar 날짜 추출
	@RequestMapping(value="/reserveList", method = RequestMethod.GET)
	@ResponseBody
	public String reserveList(ReserveVO rvo) throws Exception{
		log.info("calendar GET");
		List<ReserveVO> reserveList = sb_service.reserveList(rvo.getSitter_email());
		System.out.println("캘린더에서 rvo???"+rvo.getSitter_email());
		ObjectMapper mapper = new ObjectMapper();
		String jsonSt = mapper.writeValueAsString(reserveList);
		
		System.out.println("JSON 값?? 리턴???"+jsonSt);
		return jsonSt;
	}
	
	   // sitter 예약신청 GET
	   @RequestMapping(value="/sittReserve", method = RequestMethod.GET)
	   public String sittReserve(SitterBoardVO sbvo, Model model) {
	      log.info("sittReserve GET");
	      System.out.println("sitter-email?????"+sbvo.getSitter_email());
	      model.addAttribute("sitter_email",sbvo.getSitter_email());
	      return "/sitter/sitt_reserv_popup";
	   }
	
	// sitter 예약신청 POST
	@RequestMapping(value="/sittReserve_rq", method = RequestMethod.POST)
	public String reqReserve(Model model, ReserveVO rvo) throws Exception{
		log.info("reqReserve POST");
		System.out.println("넌누구냐" +rvo.getSitter_email());
		sb_service.sendReq(rvo);
		return "redirect:/sitter/profileView?sitter_email="+rvo.getSitter_email();
	}
	
	// sitter 요청 리스트 조회
	@RequestMapping(value="/rq_list", method = RequestMethod.GET)
	public String rqList(ReserveVO rvo, HttpServletRequest rq, HttpServletResponse res, @Param("sitter_email") String sitter, Model model, HttpSession session, @Param("scri") @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		log.info("rq_List GET");
		System.out.println("kewword???"+rq.getParameter("keyword"));
		System.out.println("scri에서 keyword는???"+scri.getKeyword());
		System.out.println("rq rd??"+rq.getParameter("rd"));
		System.out.println("session 이메일??? "+session.getAttribute("sitter"));
		if(session.getAttribute("sitter")==null) {
			res.setContentType("text/html; charset=utf-8");
			PrintWriter out=res.getWriter();
			out.println("<script>");
			out.println("alert('SITTER 로그인이 필요합니다.');");
			out.println("javascript:history.go(-1);");
			out.println("</script>");
			out.close();
		}
		Map<String,Object>map = new HashMap<String, Object>();
		if(sitter== null)
			map.put(sitter,0);
		
		map.put("sitter_email",session.getAttribute("sitter"));
		map.put("scri",scri);
		int rd = 1;
		int rcount =0;
		if(rq.getParameter("rd")==null) {
			rd = 1;
		}
		else {
		rd = Integer.parseInt(rq.getParameter("rd"));
		rvo.setRd(rd);
		}
		if(rd == 0) {
		model.addAttribute("rqList",sb_service.newrqList(map));
		rcount = sb_service.newRqCount((String)session.getAttribute("sitter"));
		}
		else {
		model.addAttribute("rqList",sb_service.rqList(map));
		rcount = sb_service.rqlistCount((String)session.getAttribute("sitter"));
		}
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(rcount);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("rd",rd);
		return "/sitter/sitt_reserv_list";
	}
	
	// sitter 요청내용 뷰
	@RequestMapping(value="/sittReserve_rqView", method = RequestMethod.GET)
	public String rqView(Model model, HttpServletRequest rq) throws Exception{
		log.info("rqView GET");
		int num = Integer.parseInt(rq.getParameter("reno"));
		System.out.println("num ??? "+num);
		System.out.println("vo에서 user_emai???"+rq.getParameter("User_email"));
		String user_email = rq.getParameter("User_email");
		model.addAttribute("petinfo",sb_service.petinfo(user_email));
		model.addAttribute("rqView",sb_service.rqView(num));
		return "/sitter/sitt_reserv_rqview";
	}
	
	// sitter 요청 거절
	@RequestMapping(value="/rqReject", method=RequestMethod.GET)
	public String rejectRq(ReserveVO vo, HttpServletRequest rq) throws Exception{
		log.info("rejectRq GET");
		int num = Integer.parseInt(rq.getParameter("reno"));
		System.out.println("num $$$$ "+num);
		sb_service.rqReject(num); 
		return "redirect:/sitter/rq_list?read=1&sitter_email="+vo.getSitter_email();
	}
	
	// sitter 요청 수락
	@RequestMapping(value="/rqAccept", method = RequestMethod.GET)
	public String acceptRq(ReserveVO vo, HttpServletRequest rq) throws Exception{
		log.info("acceptRq GET");
		System.out.println("acceptRq에서 sitter_email??"+vo.getSitter_email());
		int num= Integer.parseInt(rq.getParameter("reno"));
		System.out.println("acceptRq에서 num??? "+num);
		sb_service.acceptRq(num);
		return "redirect:/sitter/rq_list?read=1&sitter_email="+vo.getSitter_email();
	}
	
	
	
	// member 요청 리스트 조회
		@RequestMapping(value="/memReserve_rq_list", method = RequestMethod.GET)
		public String mreqReserveList(HttpServletResponse res, @Param("user_email") String member, Model model, HttpSession session, @Param("scri") @ModelAttribute("scri") SearchCriteria scri) throws Exception
		{
			log.info("mreqReserveList GET");
			System.out.println("member 이메일??? "+session.getAttribute("member"));
			if(session.getAttribute("member")==null) {
				res.setContentType("text/html; charset=utf-8");
				PrintWriter out=res.getWriter();
				out.println("<script>");
				out.println("alert('member 로그인이 필요합니다.');");
				out.println("javascript:history.go(-1);");
				out.println("</script>");
				out.close();
			}
			Map<String,Object>map = new HashMap<String, Object>();
			if(member== null)
				map.put(member,0);
			map.put("user_email",session.getAttribute("member"));
			map.put("scri",scri);
			model.addAttribute("mreserveList",sb_service.mrqList(map));
			System.out.println(sb_service.mrqList(map));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(sb_service.mrqlistCount(session.getAttribute("member").toString()));
			model.addAttribute("pageMaker", pageMaker);
			
			return "/sitter/mem_reserv_list";
		}
		
	// member 요청 취소
		@RequestMapping(value="/mem_rqcancel", method=RequestMethod.GET)
		public String rqcancel(HttpServletRequest rq) throws Exception{
			System.out.println("reno 왜????"+rq.getParameter("reno"));
			int reno = Integer.parseInt(rq.getParameter("reno"));
			sb_service.rqcancel(reno);
			
			return "redirect:/sitter/memReserve_rq_list";
		}
		
	// member rq리스트에서 sitter profile 보기
		@RequestMapping(value="/rq_sitterpf", method=RequestMethod.GET)
		public String rqSitterPf(Model model, ReserveVO rvo) throws Exception{
			log.info("rqSitterPf GET");
			System.out.println("reno????"+rvo.getReno());
			model.addAttribute("sitterPf",sb_service.rq_sittpf(rvo.getReno()));
			model.addAttribute("rqinfo",sb_service.rq_info(rvo.getReno()));
			return "/sitter/mem_rq_sitter_profile";
		}
}
