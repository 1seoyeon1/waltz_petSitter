package com.pet.sitter.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pet.sitter.service.BlogReplyService;
import com.pet.sitter.service.BlogService;
import com.pet.sitter.vo.BlogCategories;
import com.pet.sitter.vo.BlogLikeVO;
import com.pet.sitter.vo.BlogVO;
import com.pet.sitter.vo.PageMaker;
import com.pet.sitter.vo.ReplyVO;
import com.pet.sitter.vo.SearchCriteria;

@Controller
@RequestMapping("/blog/*")
public class BlogController {

	@Inject
	BlogService service;

	@Inject
	BlogReplyService replyService;

	@RequestMapping(value = "/categorylist", method = RequestMethod.GET)
	public String categoryList(Model model, String blog_category, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		
		  
		BlogCategories cat1 = service.blogCategoryCnt();
		model.addAttribute("blogcat", cat1); 
		scri.setKeyword(blog_category);
		
		model.addAttribute("catList", service.list(scri));
		
		List <BlogVO> aa = service.list(scri);
		
		for(int i = 0; i < aa.size(); i++) {
			System.out.println("출력되는 객체들 이름 " + aa.get(i).getBlog_bno());
		}
		
		System.out.println("keyword 는?! "+ blog_category);
		model.addAttribute("keyword", blog_category);
		
	
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.blogCategoryCount(blog_category));

		model.addAttribute("pageMake", pageMaker);
		
		return "blog/categorylist";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String boardlist(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

	
		BlogCategories cat1 = service.blogCategoryCnt();
		model.addAttribute("blogcat", cat1);

		model.addAttribute("list", service.list(scri));
	

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "blog/list";
	}

	// 게시판 글 작성 화면
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception {
		System.out.println("write View Page");
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(HttpServletRequest rs, @RequestParam("image") MultipartFile file, Model model, BlogVO vo)
			throws Exception {

		// save mediaFile on System
		if (!file.getOriginalFilename().isEmpty()) {
			String path = rs.getSession().getServletContext().getRealPath("/");

			String DOWNLOAD_PATH = path + "/resources/images/";
			System.out.println("DownLoadPath = " + DOWNLOAD_PATH);
			BufferedOutputStream outputStream = new BufferedOutputStream(
					new FileOutputStream(new File(DOWNLOAD_PATH + "/", file.getOriginalFilename())));
			outputStream.write(file.getBytes());
			outputStream.flush();
			outputStream.close();
		}
		
		String blogImage = file.getOriginalFilename();

		vo.setBlog_image(blogImage);
		System.out.println("블로그 카테고리 : " + vo.getBlog_category());
		service.write(vo);

		return "redirect:/blog/list";
	}

	// 게시판 조회
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(BlogVO vo, BlogLikeVO likeVO, HttpSession session, @ModelAttribute("scri") SearchCriteria scri,
			Model model) throws Exception {
		System.out.println("게시물 조회! ");
		int likeTotal = service.likeTotal(vo.getBlog_bno());
		

		if (session.getAttribute("member") != null) {
		likeVO.setLikeBlog_bno(vo.getBlog_bno());
		String bb = (String) session.getAttribute("member");
		likeVO.setLikeBlog_email(bb);
			BlogLikeVO result = service.likeRead(likeVO);
			int likeChk = result.getRc();
			if(likeChk != 0) {
				model.addAttribute("heart", "/resources/images/full.png");
			}else {
				model.addAttribute("heart", "/resources/images/empty.png");
			}
			model.addAttribute("likeResult", result);
			model.addAttribute("sessionId", bb);
			System.out.println("session ID MEANS  : : : : " + bb);
		}
		
		if (session.getAttribute("sitter") != null) {
			likeVO.setLikeBlog_bno(vo.getBlog_bno());
			String aa = (String) session.getAttribute("sitter");
			likeVO.setLikeBlog_email(aa);
				BlogLikeVO result = service.likeRead(likeVO);
				int likeChk = result.getRc();
				if(likeChk != 0) {
					model.addAttribute("heart", "/resources/images/full.png");
				}else {
					model.addAttribute("heart", "/resources/images/empty.png");
				}
				model.addAttribute("likeResult", result);
				model.addAttribute("sessionId", aa);
				System.out.println("session Id is = " + aa);
			}
		
		if(session.getAttribute("member") == null && session.getAttribute("sitter") == null) {
			model.addAttribute("heart", "/resources/images/empty.png");
			System.out.println("model is equal too ");
		}

		 
		BlogCategories cat1 = service.blogCategoryCnt();
		model.addAttribute("blogcat", cat1); 

		 
		model.addAttribute("list", service.list(scri));

		model.addAttribute("likeTotal", likeTotal);
		model.addAttribute("read", service.read(vo.getBlog_bno()));
		model.addAttribute("scri", scri);
		List<ReplyVO> replyList = replyService.readReply(vo.getBlog_bno());
		model.addAttribute("replyTotal", replyService.replyTotal(vo.getBlog_bno()));
		model.addAttribute("replyList", replyList);

		return "blog/readView";
	}

	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(BlogVO vo, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		System.out.println("게시판 수정 해볼까?! ");

		model.addAttribute("update", service.read(vo.getBlog_bno()));
		model.addAttribute("scri", scri);

		return "blog/updateView";
	}

	// 게시판 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BlogVO vo, @ModelAttribute("scri") SearchCriteria scri,PageMaker pm, RedirectAttributes rttr)
			throws Exception {
		System.out.println("수정 중,,,, ");

		int a = vo.getBlog_bno();
		service.update(vo);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/blog/readView?blog_bno="+ a;
	}

	// 게시판 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(BlogVO vo, PageMaker pm, @ModelAttribute("scri") SearchCriteria scri)
			throws Exception {

		service.delete(vo.getBlog_bno());
	pm.setCri(scri);
//		rttr.addAttribute("page", scri.getPage());
//		rttr.addAttribute("perPageNum", scri.getPerPageNum());
//		rttr.addAttribute("searchType", scri.getSearchType());
//		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/blog/list" + pm.makeQuery(scri.getPage());
	}

	// 댓글 작성
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public String replyWrite(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		System.out.println("블로그 댓글 달아 보자잇" + vo.getReply_content());
		replyService.writeReply(vo);
		rttr.addAttribute("blog_bno", vo.getBlog_no());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/blog/readView";
	}


	// 댓글 삭제 POST
	@RequestMapping(value = "/replyDelete", method = RequestMethod.POST)
	public String replyDelete(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {

		replyService.deleteReply(vo);
		rttr.addAttribute("blog_bno", vo.getBlog_no());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/blog/readView";
	}

	@RequestMapping(value = "/like", method = RequestMethod.GET)
	@ResponseBody
	public BlogLikeVO like(BlogLikeVO vo, int likeblog_bno, HttpSession session, RedirectAttributes rttr, SearchCriteria scri,
			Model model) throws Exception {
		int aa = likeblog_bno;
		vo.setLikeBlog_bno(aa);
		String id = (String) session.getAttribute("member");
		System.out.println("블로그 라익에 들어간 likeblog_bno = " + vo.getLikeBlog_bno());
		if (id == null) {
			id = (String) session.getAttribute("sitter");

			if (id == null) {
				return service.likeRead(vo);
			}
			vo.setLikeBlog_email(id);
			BlogLikeVO result = service.likeRead(vo);

			if (result.getRc() != 0) {
				service.likeDelete(vo);
			} else {
				service.slikeAdd(vo);
			}
		} else {
			vo.setLikeBlog_email(id);
			BlogLikeVO result = service.likeRead(vo);
			if (result.getRc() != 0) {
				service.likeDelete(vo);
			} else {
				service.mlikeAdd(vo);
			}
		}
		BlogLikeVO validChk = service.likeRead(vo);
		
		int data = service.likeTotal(aa);

		rttr.addAttribute("blog_bno", vo.getLikeBlog_bno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		System.out.println("좋아요 JSON 리턴 하는 값은? " + validChk.getRc());
		System.out.println("좋아요 JSON 리턴 하는 값은? " + validChk.getTc());
		return validChk;
	} 
}