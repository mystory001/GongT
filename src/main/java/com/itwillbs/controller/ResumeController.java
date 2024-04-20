package com.itwillbs.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ResumeDTO;
import com.itwillbs.domain.Scrap_resumeDTO;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.ResumeService;



@Controller
public class ResumeController {

	@Inject
	private ResumeService resumeService;
	@Inject
	private MemberService memberService;
	
	@javax.annotation.Resource(name = "uploadPath")
	private String uploadPath;
	

	@RequestMapping(value = "/resume/resume", method = RequestMethod.GET)
	public String resume1(HttpServletRequest request, Model model) {
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		model.addAttribute("memberDTO", resumeService.getMember(r_num));
		model.addAttribute("resumeDTO", resumeService.getResume(r_num));
		return "resume/resume";
	}//resume()
	
	@GetMapping("/resume/resumeWrite")
	public String resumeWrite() {
		return "resume/resumeWrite";
	}//resumeWrite()
	
	@GetMapping("/board/searchFree")
	public String resume(HttpServletRequest request, PageDTO pageDTO, Model model) {
		//검색어 가져오기(notice submit에서 name = "search")
		String search = request.getParameter("search");
		String select = request.getParameter("select");
		String sort = request.getParameter("sort");

		// 한화면에 보여줄 글개수 설정
		int pageSize = 5;
		// pageNum 에 파라미터값을 가져오기
		String pageNum = request.getParameter("pageNum");
		// pageNum이 없으면 "1"로 설정
		if(pageNum == null) {
			pageNum = "1";
		}
		// pageNum => 정수형 변경
		int currentPage = Integer.parseInt(pageNum);
		// pageDTO 저장 
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		//검색어 추가
		pageDTO.setSearch(search);
		//select 추가
		pageDTO.setSelect(select);
		//sort 추가
		pageDTO.setSort(sort);
		
		List<ResumeDTO> resumeBoardList = resumeService.getResumeBoardList(pageDTO);
		
		//페이징 작업
		//전체 글개수 구하기 int 리턴할형 count = getResumeBoardCount()
		int count = resumeService.getResumeBoardCount(pageDTO);
		//한 화면에 보여줄 페이지 개수 설정
		int pageBlock = 10;
		//한 화면에 보여줄 시작페이지 구하기
		int startPage = (currentPage - 1)/pageBlock*pageBlock+1;
		//한 화면에 보여줄 끝페이지 구하기
		int endPage = startPage + pageBlock - 1;
		//전체 페이지개수 구하기
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		//끝페이지, 전체 페이지수 비교 => 끝페이지가 크면 전체 페이지로 변경
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		//pageDTO 저장
		pageDTO.setCount(count); // notice.jsp => [전체글개수 ${pageDTO.count}]
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
	
		//model 저장
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("resumeBoardList", resumeBoardList);
		
		return "board/searchFree";
	
	} //resume()
	
	//찜하기
	@GetMapping("/resume/scrap")
	public String scrap(Scrap_resumeDTO scrap_resumeDTO, HttpSession session, HttpServletRequest request) {
		System.out.println("ResumeController scrap()");
		scrap_resumeDTO.setR_num(Integer.parseInt(request.getParameter("r_num")));
		scrap_resumeDTO.setId((String)session.getAttribute("id"));
		Scrap_resumeDTO scrap_resumeDTO2 = resumeService.scrap(scrap_resumeDTO);
		String result="";
		if(scrap_resumeDTO2 !=null) {
			result="scrapDup";
		} else {
			result = "scrapOk";
			resumeService.insertScrap(scrap_resumeDTO);
		}
		return "redirect:/board/searchFree";
	}
	
	//이력서 작성(myPageFreelancer3)
	@PostMapping("resume/resumeWritePro")
	public String resumeWritePro(HttpServletRequest request, MultipartFile file) throws Exception {
		System.out.println("MemberController resumeWritePro()");
		ResumeDTO resumeDTO = new ResumeDTO();
		
		//파일 업로드
		UUID uuid = UUID.randomUUID();
		String filename = uuid.toString()+"_"+file.getOriginalFilename();
		System.out.println(filename);
		System.out.println(uploadPath);
		FileCopyUtils.copy(file.getBytes(), new File(uploadPath,filename));
		resumeDTO.setR_file(filename);
		resumeDTO.setId(request.getParameter("id"));
		resumeDTO.setRegion_num(Integer.parseInt(request.getParameter("region_num")));
		resumeDTO.setField_num(Integer.parseInt(request.getParameter("field_num")));
		resumeDTO.setR_name(request.getParameter("r_name"));
		resumeDTO.setR_career(Integer.parseInt(request.getParameter("r_career")));
		resumeDTO.setR_tech(request.getParameter("r_tech"));
		resumeDTO.setR_form(request.getParameter("r_form"));
		resumeDTO.setR_exp(request.getParameter("r_exp"));
		resumeDTO.setR_content(request.getParameter("r_content"));	
		
		System.out.println(resumeDTO.toString());
		resumeService.insertResume(resumeDTO);
		return "redirect:/mypageFreelancer/mypageFreelancer2";
	}
	
	@GetMapping("resume/resumeUpdate")
	public String resumeUpdate(ResumeDTO resumeDTO, HttpServletRequest request, Model model) {
		System.out.println("ResumeController resumeUpdate()");
		System.out.println(resumeDTO);
		int r_num = resumeDTO.getR_num();
		model.addAttribute("memberDTO", resumeService.getMember(r_num));
		System.out.println(resumeService.getMember(r_num));
		model.addAttribute("resumeDTO", resumeService.getResume(r_num));
		System.out.println(resumeService.getResume(r_num));

		
		
		
		return "resume/resumeUpdate";
	}
	
	@PostMapping("resume/resumeUpdatePro")
	public String resumeUpdatePro(HttpSession session,HttpServletRequest request, MultipartFile file) throws Exception{
		System.out.println("ResumeController resumeUpdatePro()");
		
		String id = (String)session.getAttribute("id");
		System.out.println(id);
		ResumeDTO resumeDTO = new ResumeDTO();
		
		resumeDTO.setId(request.getParameter("id"));
		resumeDTO.setR_num(Integer.parseInt(request.getParameter("r_num")));
		resumeDTO.setR_name(request.getParameter("r_name"));
		resumeDTO.setRegion_num(Integer.parseInt(request.getParameter("region_num")));
		resumeDTO.setField_num(Integer.parseInt(request.getParameter("field_num")));
		resumeDTO.setR_career(Integer.parseInt(request.getParameter("r_career")));
		resumeDTO.setR_tech(request.getParameter("r_tech"));
		resumeDTO.setR_form(request.getParameter("r_form"));
		resumeDTO.setR_salary(Integer.parseInt(request.getParameter("r_salary")));
		resumeDTO.setR_exp(request.getParameter("r_exp"));
		resumeDTO.setR_content(request.getParameter("r_content"));
		resumeDTO.setR_file(request.getParameter("file"));
		
		if(file.isEmpty()) {
			System.out.println("첨부파일 없음");
			resumeDTO.setR_file(request.getParameter("oldfile"));
		} else {
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID();
			String filename = uuid.toString() + "_" + file.getOriginalFilename();
			System.out.println(filename);
			
			System.out.println(uploadPath);
			FileCopyUtils.copy(file.getBytes(), new File(uploadPath,filename));
			
			resumeDTO.setR_file(filename);
		}
		
		
		System.out.println(resumeDTO);
		resumeService.resumeUpdate(resumeDTO);
		return "redirect:/board/searchFree";
	}
	
	@GetMapping("resume/resumeDelete")
	public String resumeDelete(ResumeDTO resumeDTO, HttpServletRequest request) {
		System.out.println("ResumeController resumeDelete()");
		System.out.println(request.getParameter("r_num"));
		resumeService.resumeDelete(resumeDTO);
		return "redirect:/board/searchFree";
	}
	
	
	
	
	
}
