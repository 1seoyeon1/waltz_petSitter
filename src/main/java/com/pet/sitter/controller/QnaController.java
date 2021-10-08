package com.pet.sitter.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.pet.sitter.service.QnaReplyService;
import com.pet.sitter.service.QnaService;
import com.pet.sitter.service.SitterBoardService;
import com.pet.sitter.vo.PageMaker;
import com.pet.sitter.vo.QnaReplyVO;
import com.pet.sitter.vo.QnaVO;
import com.pet.sitter.vo.ReplyVO;
import com.pet.sitter.vo.SearchCriteria;
import com.pet.sitter.vo.SitterBoardVO;

@Controller
@RequestMapping("/qna/*")
public class QnaController {

	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);

	@Inject
	QnaService qnaService;

	@Inject
	QnaReplyService qnaReplyService;
	
	@Inject
	SitterBoardService sb_service;
	

	//qna 메인
	@RequestMapping(value="/qnaMain", method = RequestMethod.GET)
	public String qnaMain(Model model, QnaVO qnaVO, QnaReplyVO vo, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		logger.info("qna main 페이지 들어가기 성공");

		model.addAttribute("list", qnaService.list(scri));
		model.addAttribute("qnaReply", qnaReplyService.readReply(vo.getQna_rno()));
		model.addAttribute("replylist", qnaService.replylist());
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(qnaService.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "/qna/qnaMain";
		
	}
	
	//qna search
		@RequestMapping(value="/qnaSearch", method = RequestMethod.GET)
		public String qnaSearch(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

			logger.info("qna Search");

			model.addAttribute("list", qnaService.list(scri));
			
			
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(qnaService.listCount(scri));

			model.addAttribute("pageMaker", pageMaker);

			return "/qna/qnaList";
		}
				
	//qna 작성화면
	@RequestMapping(value = "/qnaWriteView", method = RequestMethod.GET)
	public void qnaWriteView() throws Exception{
		logger.info("qna 작성페이지 들어가기 성공");
	}

	//qna 작성
	@RequestMapping(value = "/qnaWrite", method = RequestMethod.POST)
	public String qnaWrite(QnaVO qnaVO) throws Exception{
		logger.info("qna 작성 성공");
		qnaService.qnaWrite(qnaVO);
		return "redirect:/qna/qnaMain";


	}

	//qna 목록 조회
	@RequestMapping(value = "/qnaList", method = RequestMethod.GET)
	public String qnaList(Model model,QnaReplyVO vo,QnaVO qnaVO, SitterBoardVO sbvo, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("qna list");

		model.addAttribute("list", qnaService.list(scri));
		model.addAttribute("replylist", qnaService.replylist());
		model.addAttribute("qnaReply", qnaReplyService.readReply(vo.getQna_rno()));	
		model.addAttribute("calist",qnaService.calist());
		
		model.addAttribute("replyTotal", qnaReplyService.replyTotal(vo.getQno()));
		
		
		System.out.println("qna넘버" + qnaVO.getQno());
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(qnaService.listCount(scri));
		

		model.addAttribute("pageMaker", pageMaker);

		return "qna/qnaList";
		
		/*
		 * List<QnaReplyVO> b = qnaReplyService.readReply(vo.getQna_rno()); String a =
		 * ""; for(int i = 0 ; i < b.size(); i++) { String c =
		 * b.get(i).getSitter_email(); System.out.println(c); sbvo.setSitter_email(c);
		 * String j = "sitterImage" + i; a =
		 * qnaReplyService.SitterImageView(sbvo.getSitter_email());
		 * b.get(i).setSitter_image(a); System.out.println("시터 이미지에 들어간 이메일 값은? " +
		 * b.get(i).getSitter_image());
		 * 
		 * } List<QnaReplyVO> replyList = qnaReplyService.readReply(qnaVO.getQno());
		 * model.addAttribute("replyList", replyList);
		 * 
		 * model.addAttribute("imgimg", b); model.addAttribute("sitterImage",
		 * qnaReplyService.SitterImageView(sbvo.getSitter_email()));
		 */
	}

	 // qna Main에서 sitter 이미지 뽑기
	   @RequestMapping(value="replyList", method=RequestMethod.GET)
	   @ResponseBody
	   public String replyList() throws Exception{
	      logger.info("replyList JSON으로 뽑기");
	      
	      List<QnaReplyVO> replyList = qnaReplyService.replyList();
	      ObjectMapper mapper = new ObjectMapper();
	      String json = mapper.writeValueAsString(replyList);
	      
	      System.out.println("reply JSON 값은??"+json);
	      return json;
	   }
	   
	//qna 읽기
	@RequestMapping(value = "/qnaReadView", method = RequestMethod.GET)
	public String qnaRead(HttpSession session, QnaVO qnaVO, QnaReplyVO vo, SitterBoardVO sbvo,  @ModelAttribute("scri") SearchCriteria scri,Model model) throws Exception {

		logger.info("qna read");
		
		model.addAttribute("read", qnaService.qnaRead(qnaVO.getQno()));
		model.addAttribute("scri", scri);
		
		//model.addAttribute("imageView", qnaService.SitterImageView(image));
		
		List<QnaReplyVO> replyList = qnaReplyService.readReply(qnaVO.getQno());
		model.addAttribute("replyList", replyList);

		model.addAttribute("replyTotal", qnaReplyService.replyTotal(vo.getQno()));
		model.addAttribute("qnaReply", qnaReplyService.readReply(vo.getQna_rno()));
		
		if(session.getAttribute("sitter") != null) {
		model.addAttribute("qnaimage", qnaService.SitterImageView(session.getAttribute("sitter").toString()));
		}
		System.out.println("글 번호 : " + qnaVO.getQno());
		System.out.println("답글 번호 : " + vo.getQna_rno());
		
		return "qna/qnaReadView";
		
	}

	//qna 수정뷰 
	@RequestMapping(value = "/qnaUpdateView", method = RequestMethod.GET)
	public String qnaUpdateView(QnaVO qnaVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("qnaUpdateView");

		model.addAttribute("update", qnaService.qnaRead(qnaVO.getQno()));
		model.addAttribute("scri", scri);

		return "qna/qnaUpdateView";
	}

	//qna 수정
	@RequestMapping(value = "/qnaUpdate", method = RequestMethod.POST)
	public String qnaUpdate(QnaVO qnaVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("qna Update");

		qnaService.qnaUpdate(qnaVO);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/qna/qnaMain";
	}

	//qna 삭제
	@RequestMapping(value = "/qnaDelete", method = RequestMethod.POST)
	public String qnaDelete(QnaVO qnaVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("qna delete");

		qnaService.qnaDelete(qnaVO.getQno());

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/qna/qnaMain";

	}

	//qna 답변 작성
	@RequestMapping(value="/qnaReplyWrite", method = RequestMethod.POST)
	public String qnaReplyWrite(QnaReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("qna reply Write");

		qnaReplyService.writeReply(vo);
		logger.info("qna reply Writedddddd");
		rttr.addAttribute("qno", vo.getQno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum() );
		rttr.addAttribute("searchType", scri.getSearchType() );
		rttr.addAttribute("keyword", scri.getKeyword());
		
		rttr.addAttribute("qno_rno", vo.getQna_rno());
		logger.info("답글 번호 : " + vo.getQna_rno());

		return "redirect:/qna/qnaReadView";
	}

	//qna 답변 수정 GET
	@RequestMapping(value="/qnaReplyUpdateView", method = RequestMethod.GET)
	public String qnaReplyUpdateView(QnaReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		logger.info("qna reply update get");
		System.out.println(vo);

		model.addAttribute("replyUpdate", qnaReplyService.selectReply(vo.getQna_rno()));
		model.addAttribute("scri", scri);

		return "qna/qnaReplyUpdateView";
	}

	//qna 답변 수정 POST
	@RequestMapping(value="/qnaReplyUpdate", method = RequestMethod.POST)
	public String qnaReplyUpdate(QnaReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("qna reply update post");

		qnaReplyService.updateReply(vo);
		System.out.println(vo);

		rttr.addAttribute("qno", vo.getQno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum() );
		rttr.addAttribute("searchType", scri.getSearchType() );
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/qna/qnaReadView";


	}

	//qna 답변 삭제 GET
	@RequestMapping(value="/qnaReplyDeleteView", method = RequestMethod.GET)
	public String qnaReplyDeleteView(QnaReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		logger.info("qna reply delete");

		model.addAttribute("replyDelete", qnaReplyService.selectReply(vo.getQna_rno()));
		model.addAttribute("scri", scri);

		return "qna/qnaReplyDeleteView";
		
		
	}
	
	// qna 답변 삭제
	@RequestMapping(value="/qnaReplyDelete", method = RequestMethod.GET)
	public String qnaReplyDelete(QnaReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("qna reply delete");

		qnaReplyService.deleteReply(vo);

		rttr.addAttribute("qno", vo.getQno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum() );
		rttr.addAttribute("searchType", scri.getSearchType() );
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/qna/qnaReadView";


	}

}
