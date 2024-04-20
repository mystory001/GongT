package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.itwillbs.domain.InquiryDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.NoticeDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.ResumeDTO;
import com.itwillbs.service.AdminService;

@Controller
public class AdminController {
	@Inject
	private AdminService adminService;
	
	//공지사항
	@RequestMapping(value="/Admin/notice" ,method=RequestMethod.GET)
	public String notice(HttpServletRequest request, PageDTO pageDTO, Model model) {
		System.out.println("NoticeController notice()");
		int pageSize =10;
		String pageNum = request.getParameter("pageNum");
	if(pageNum == null) {
		pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		System.out.println(pageDTO);
		
		List<NoticeDTO> noticeList = adminService.getNoticeList(pageDTO);
		
		int count = adminService.getNoticeCount(pageDTO);
		int pageBlock=10;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		// 한 화면에 보여줄 끝페이지 구하기
		int endPage = startPage + pageBlock - 1;
		// 전체 페이지개수 구하기
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		// 끝페이지 , 전체 페이지수 비교 => 끝페이지 크면 => 전체 페이지수로 끝페이지 변경
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		pageDTO.setCount(count); 
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("noticeList", noticeList);
		
		return "Admin/notice";
	}
	
	//공지사항 작성
	@RequestMapping(value="/Admin/write" ,method=RequestMethod.GET)
	public String write() {
		System.out.println("AdminController write()");
		
		return "Admin/write";
	}//write()
	
	//공지사항 작성 pro
	@RequestMapping(value="/Admin/writePro" ,method=RequestMethod.POST)
	public String writePro(NoticeDTO noticeDTO) {
		System.out.println("AdminController writePro()");
		System.out.println(noticeDTO);
		adminService.insertNotice(noticeDTO);
		return "redirect:/Admin/notice";
	}//writePro()
	
	//공지사항 상세
	@RequestMapping(value="/Admin/content" ,method=RequestMethod.GET)
	public String content(NoticeDTO noticeDTO,Model model) {
		System.out.println("AdminController content()");
		System.out.println(noticeDTO);
		// 조회수 1 증가
		adminService.updateReadcount(noticeDTO);
		noticeDTO = adminService.getNotice(noticeDTO);
		System.out.println(noticeDTO);
		
		model.addAttribute("noticeDTO",noticeDTO);
		
		return "Admin/content";
	}
	
	//자주묻는 질문
	@RequestMapping(value="/Admin/FAQ" ,method=RequestMethod.GET)
	public String FAQ(NoticeDTO noticeDTO) {
		System.out.println("AdminController FAQ()");
		System.out.println(noticeDTO);
		
		
		return "Admin/FAQ";
	}
	
	//문의
	@RequestMapping(value="/Admin/inquiry" ,method=RequestMethod.GET)
	public String list(HttpServletRequest request, PageDTO pageDTO, Model model, HttpSession session) {
		System.out.println("AdminController list()");
		// 한화면에 보여줄 글개수 설정
		int pageSize = 10;
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
		pageDTO.setId((String)session.getAttribute("id"));
		
		List<InquiryDTO> inquiryList = null;
		String id = (String)session.getAttribute("id");
		if((String)session.getAttribute("id")!= (null)) {
			if (id.equals("admin")) { 
				inquiryList = adminService.getInquiryList(pageDTO);
				
			} else {
				inquiryList = adminService.getInquiryList2(pageDTO);
			}
		}
		// 페이징 작업
		// 전체 글개수 구하기  int 리턴할형 count = getBoardCount()
		int count = adminService.getInquiryCount(pageDTO);
		// 한 화면에 보여줄 페이지 개수 설정
		int pageBlock = 10;
		// 한 화면에 보여줄 시작페이지 구하기
		// 1~10 => 1, 11~20 => 11,..
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		// 한 화면에 보여줄 끝페이지 구하기
		int endPage = startPage + pageBlock - 1;
		// 전체 페이지개수 구하기
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		// 끝페이지 , 전체 페이지수 비교 => 끝페이지 크면 => 전체 페이지수로 끝페이지 변경
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		// pageDTO 저장
		pageDTO.setCount(count); // notice.jsp => [전체글개수 ${pageDTO.count}]
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		
		
		// model 저장
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("inquiryList", inquiryList);
		
		// center/notice.jsp 주소변경없이 이동
		return "Admin/inquiry";
	}
	
	//문의 상세
	@RequestMapping(value="/Admin/inquiry_content" ,method=RequestMethod.GET)
	public String inquiey_content(InquiryDTO inquiryDTO,Model model) {
		System.out.println("AdminController inquiry_content()");
		System.out.println(inquiryDTO);
		
		inquiryDTO = adminService.getInquiry(inquiryDTO);
		System.out.println(inquiryDTO);
		
		model.addAttribute("inquiryDTO",inquiryDTO);
		
		return "Admin/inquiry_content";
	}
	
	//문의 작성
	@RequestMapping(value="/Admin/inquiry_write" ,method=RequestMethod.GET)
	public String inquiry_write() {
		System.out.println("AdminController inquiry_write()");
		
		return "Admin/inquiry_write";
	}	
	
	//문의 작성 pro
	@RequestMapping(value="/Admin/inquiry_writePro" ,method=RequestMethod.POST)
	public String inquiry_writePro(InquiryDTO inquiryDTO) {
		System.out.println("AdminController inquiry_writePro()");
		System.out.println(inquiryDTO);
		
		adminService.insertInquiry(inquiryDTO);
//		adminService.insertInquiry2(inquiryDTO);
		return "redirect:/Admin/inquiry";
}
	//공지 수정
	@RequestMapping(value="/Admin/update" ,method=RequestMethod.GET)
	public String update(NoticeDTO noticeDTO,Model model) {
		System.out.println("AdminController update()");
		System.out.println(noticeDTO);
		noticeDTO = adminService.getNotice(noticeDTO);
		System.out.println(noticeDTO);
		model.addAttribute("noticeDTO",noticeDTO);
		return "Admin/update";
	}	
	
	//공지 수정 pro
	@RequestMapping(value="/Admin/updatePro" ,method=RequestMethod.POST)
	public String updatePro(NoticeDTO noticeDTO) {
		System.out.println("AdminController updatePro()");
		System.out.println(noticeDTO);
		
		adminService.updateNotice(noticeDTO);
		
		// /board/list 글목록으로 주소변경하면서 이동
		return "redirect:/Admin/notice";
	}
	
	//공지 삭제
	@RequestMapping(value="/Admin/delete" ,method=RequestMethod.GET)
	public String delete(NoticeDTO noticeDTO) {
		System.out.println("AdminController delete()");
		System.out.println(noticeDTO);
		adminService.deleteNotice(noticeDTO);
		return "redirect:/Admin/notice";
	}
	
	
	
	//문의 수정
	@RequestMapping(value="/Admin/inquiry_update" ,method=RequestMethod.GET)
	public String update(InquiryDTO inquiryDTO, Model model) {
		System.out.println("AdminController inquiry_update()");
		System.out.println(inquiryDTO);
		inquiryDTO = adminService.getInquiry(inquiryDTO);
		
		model.addAttribute("inquiryDTO",inquiryDTO);
		System.out.println("AdminController inquiry_update()");
		return "Admin/inquiry_update";
	}	
	@RequestMapping(value="/Admin/inquiry_answer" ,method=RequestMethod.GET)
	public String updateAnswer(InquiryDTO inquiryDTO, Model model) {
		System.out.println("AdminController inquiry_answer()");
		System.out.println(inquiryDTO);
		inquiryDTO = adminService.getInquiry(inquiryDTO);
		
		model.addAttribute("inquiryDTO",inquiryDTO);
		System.out.println("AdminController inquiry_answer()");
		return "Admin/inquiry_write";
	}
	
	@RequestMapping(value="/Admin/inquiry_updatePro" ,method=RequestMethod.POST)
	public String inquiry_updatePro(InquiryDTO inquiryDTO) {
		System.out.println("AdminController inquiry_updatePro()");
		System.out.println(inquiryDTO);
		
		adminService.updateInquiry(inquiryDTO);
		
		// /board/list 글목록으로 주소변경하면서 이동
		return "redirect:/Admin/inquiry";
	}
	
	@RequestMapping(value="/Admin/inquiry_answerPro" ,method=RequestMethod.POST)
	public String inquiry_answerPro(InquiryDTO inquiryDTO) {
		System.out.println("AdminController inquiry_answerPro()");
		System.out.println(inquiryDTO);
		
		adminService.inquiry_answer(inquiryDTO);
		
		// /board/list 글목록으로 주소변경하면서 이동
		return "redirect:/Admin/inquiry";
	}
	
	//문의 삭제
	@RequestMapping(value="/Admin/inquiry_delete" ,method=RequestMethod.GET)
	public String delete(InquiryDTO inquiryDTO) {
		System.out.println("AdminController delete()");
		System.out.println(inquiryDTO);
		adminService.deleteInquiry(inquiryDTO);
		return "redirect:/Admin/inquiry";
	}
	
	@RequestMapping(value="/Admin/delete_answer" ,method=RequestMethod.GET)
	public String deleteAnswer(HttpServletRequest request) {
		System.out.println("AdminController delete_answer()");
		int i_num = Integer.parseInt(request.getParameter("i_num"));
		adminService.delete_answer(i_num);
		return "redirect:/Admin/inquiry";
	}
	
	
	
	@RequestMapping(value="/Adminpage/Adminmain" ,method=RequestMethod.GET)
	public String Adminmain(HttpSession session, Model model) {
		System.out.println("MemberController Adminmain()");
		
//		String id = (String)session.getAttribute("id");
//		System.out.println(id);

		List<MemberDTO>MemberDTOList = adminService.amember();
		System.out.println(MemberDTOList.size());
		model.addAttribute("MemberDTOList",MemberDTOList);
		
		return "/Adminpage/Adminmain";
	}
	
	@RequestMapping(value="/Adminpage/Adminpro" ,method=RequestMethod.GET)
	public String Adminpro(HttpSession session, Model model) {
		System.out.println("AdminController Adminpro()");
		
		List<ProjectDTO>ProjectDTOList = adminService.aproject();
		
		
//		int p_num = (int)session.getAttribute("p_num");
//		System.out.println(p_num);
		
		model.addAttribute("ProjectDTOList",ProjectDTOList);
		
		return "/Adminpage/Adminpro";
	}
	
	@GetMapping("/Adminpage/AdeletePro")
	public String AdeletePro(ProjectDTO projectDTO) {

		System.out.println("AdminController AdeletePro()");
		System.out.println(projectDTO); 


		
		adminService.deleteproject(projectDTO);

		
		return "redirect:/Adminpage/Adminpro";
	}

	@RequestMapping(value="/Adminpage/Adminresume" ,method=RequestMethod.GET)
	public String Adminre(HttpSession session, Model model) {
		System.out.println("MemberController Adminre()");
		
		List<ResumeDTO>ResumeDTOList = adminService.aresume();
		
		model.addAttribute("ResumeDTOList",ResumeDTOList);
		
		return "/Adminpage/Adminresume";
	}
	
	@GetMapping("/Adminpage/AdeleteRe")
	public String AdeleteRe(ResumeDTO resumeDTO) {

		System.out.println("AdminController AdeleteRe()");
		System.out.println(resumeDTO); 


		
		adminService.deleteresume(resumeDTO);

		
		return "redirect:/Adminpage/Adminresume";
	}

	
	
	
	
	@RequestMapping(value="/Adminpage/Adminnotice" ,method=RequestMethod.GET)
	public String Adminno(HttpSession session, Model model) {
		System.out.println("MemberController Adminno()");
		
		List<NoticeDTO>NoticeDTOList = adminService.anotice();
		
		model.addAttribute("NoticeDTOList",NoticeDTOList);
		
		return "/Adminpage/Adminnotice";
	}
	@RequestMapping(value="/Adminpage/Admininquiry" ,method=RequestMethod.GET)
	public String Adminin(HttpSession session, Model model) {
		System.out.println("MemberController Adminin()");
		
		List<InquiryDTO>InquiryDTOList = adminService.ainquiry();
		
		model.addAttribute("InquiryDTOList",InquiryDTOList);
		
		return "/Adminpage/Admininquiry";
	}
}
