package com.pet.sitter.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.pet.sitter.service.PetInfoService;
import com.pet.sitter.vo.PetInfoVO;

@Controller
@RequestMapping("/petinfo/*")
public class PetInfoController {
	
	@Inject
	PetInfoService pservice;
	
	private static final Logger logger = LoggerFactory.getLogger(PetInfoController.class);
	
	// write petinfo page
	@RequestMapping(value="/writePetInfo" , method = RequestMethod.GET)
	public void infoWriteView(PetInfoVO petVO, HttpSession session) throws Exception
	{
		
		System.out.println(session.getAttribute("member"));
		System.out.println(petVO.getUser_email());
		logger.info("펫 정보 작성 페이지 성공");
		
	}
	
	// write petinfo page post
	@RequestMapping(value="/infowrite" , method = RequestMethod.POST)
	public String infoWrite(HttpSession session, HttpServletRequest rs,@RequestParam("image") MultipartFile file, Model model, PetInfoVO pvo)throws Exception
	{
		System.out.println(pvo.getUser_email());
		logger.info("펫 정보 입력 성공 post");
		if(!file.getOriginalFilename().isEmpty()) {
			String path = rs.getSession().getServletContext().getRealPath("/");
			
			String DOWNLOAD_PATH = path + "/resources/petinfo/";

			BufferedOutputStream outputStream = new BufferedOutputStream(
					new FileOutputStream( 
			
			new File(DOWNLOAD_PATH + "/", file.getOriginalFilename())));
			outputStream.write(file.getBytes());
			outputStream.flush();
			outputStream.close();
		}
		
		String PetImage = file.getOriginalFilename();
		
		pvo.setPet_image(PetImage);
		pservice.petinfoWrite(pvo);
		System.out.println(session.getAttribute("member"));
		
		return "redirect:/petinfo/petInfo";
	}
	
	// petinfo page
	@RequestMapping(value="/petInfo", method = RequestMethod.GET)
	public String petInfo(HttpSession session , Model model, PetInfoVO petVO) throws Exception {
		
		logger.info("펫 정보 페이지 성공");
		String email = (String)session.getAttribute("member");
		model.addAttribute("list", pservice.list(email));
		
		return "petinfo/petInfo";
	}
	
	// petinfo detail page get
	@RequestMapping(value="/readPetInfo", method=RequestMethod.GET)
	public String readpetinfo(PetInfoVO petVO, Model model) throws Exception {
		logger.info("펫 정보 상세보기 페이지 성공");
		
		model.addAttribute("read", pservice.readPetInfo(petVO.getPno()));
		
		return "petinfo/readPetInfo";
	}
	
	// petinfo detail page post
	@RequestMapping(value="/readPetInfo", method=RequestMethod.POST)
	public String readpetinfo(int pno) throws Exception {
		
		logger.info("펫정보 상세보기 성공");
		pservice.readPetInfo(pno);
		
		return "redirect/petinfo/readPetInfo";
	}
	
	// pet image update page get
	@RequestMapping(value="/updatePetImage", method = RequestMethod.GET)
	public String updatePetImage(Model model, PetInfoVO petvo) throws Exception{
	
		logger.info("펫 이미지 수정 페이지 성공");
		
		model.addAttribute("imageUpdate", pservice.readPetInfo(petvo.getPno()));
		
		return "petinfo/updatePetImage";
	}
	
	
	// pet image update
	@RequestMapping(value="/updatePetImage" , method = RequestMethod.POST)
	public String updatePetImage(HttpServletRequest rs,@RequestParam("image") MultipartFile file, Model model, PetInfoVO pvo)throws Exception
	{
		logger.info("펫 정보 입력 성공 post");
		
		String rootPath = rs.getSession().getServletContext().getRealPath("/");
		String path = rootPath + "/resources/petinfo/";
		String orName = file.getOriginalFilename();
		String ext = FilenameUtils.getExtension(orName);
		String rnonum = pvo.getPno() + "." + ext;
		
		if(!file.getOriginalFilename().isEmpty()) {

			BufferedOutputStream outputStream = new BufferedOutputStream(
					new FileOutputStream(new File(path, rnonum)));
			outputStream.write(file.getBytes());
			outputStream.flush();
			outputStream.close();
		}
		
		pvo.setPet_image(rnonum);
		pservice.petImageUpdate(pvo);
		
		return "redirect:/petinfo/updatePetInfo?pno="+rs.getParameter("pno");
	}
	
	// petinfo update page
	@RequestMapping(value="/updatePetInfo", method=RequestMethod.GET)
	public String updatePetInfo(PetInfoVO petVO, Model model) throws Exception {
		logger.info("펫 정보 수정 페이지");
		model.addAttribute("update", pservice.readPetInfo(petVO.getPno()));
		
		return "petinfo/updatePetInfo";
	}
	// petinfo update post
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(PetInfoVO petVO) throws Exception {
		logger.info("펫  정보 수정 성공");
		pservice.updatePetInfo(petVO);
		
		return "redirect:/petinfo/petInfo";
	}
	
	// petinfo delete post
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String delete(PetInfoVO petVO) throws Exception {
		logger.info("펫 정보 삭제 성공");

		pservice.deletePetInfo(petVO.getPno());
		return "redirect:/petinfo/petInfo";
	}
}
