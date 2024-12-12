package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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

	@GetMapping("/admin/notice")
	public String notice(HttpServletRequest request, PageDTO pageDTO, Model model) {
		System.out.println("NoticeController notice()");
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);

		List<NoticeDTO> noticeList = adminService.getNoticeList(pageDTO);

		int count = adminService.getNoticeCount(pageDTO);
		int pageBlock = 10;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		// 한 화면에 보여줄 끝페이지 구하기
		int endPage = startPage + pageBlock - 1;
		// 전체 페이지개수 구하기
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		// 끝페이지 , 전체 페이지수 비교 => 끝페이지 크면 => 전체 페이지수로 끝페이지 변경
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);

		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("noticeList", noticeList);

		return "admin/notice";
	}

	// 공지사항 작성
	@GetMapping("/admin/write")
	public String write() {
		System.out.println("AdminController write()");

		return "admin/write";
	}

	// 공지사항 작성 진행
	@PostMapping("/admin/writePro")
	public String writePro(NoticeDTO noticeDTO) {
		System.out.println("AdminController writePro()");
		System.out.println(noticeDTO);
		adminService.insertNotice(noticeDTO);
		return "redirect:/Admin/notice";
	}

	// 공지사항
	@GetMapping("/admin/content")
	public String content(NoticeDTO noticeDTO, Model model) {
		System.out.println("AdminController content()");
		System.out.println(noticeDTO);
		// 조회수 1 증가
		adminService.updateReadcount(noticeDTO);
		noticeDTO = adminService.getNotice(noticeDTO);
		model.addAttribute("noticeDTO", noticeDTO);
		return "admin/content";
	}

	// 자주묻는 질문
	@GetMapping("/admin/FAQ")
	public String FAQ(NoticeDTO noticeDTO) {
		System.out.println("AdminController FAQ()");
		System.out.println(noticeDTO);

		return "admin/FAQ";
	}

	// 문의
	@GetMapping("/admin/inquiry")
	public String list(HttpServletRequest request, PageDTO pageDTO, Model model, HttpSession session) {
		System.out.println("AdminController inquiry()");
		// 한화면에 보여줄 글개수 설정
		int pageSize = 10;
		// pageNum 에 파라미터값을 가져오기
		String pageNum = request.getParameter("pageNum");
		// pageNum이 없으면 "1"로 설정
		if (pageNum == null) {
			pageNum = "1";
		}
		// pageNum => 정수형 변경
		int currentPage = Integer.parseInt(pageNum);
		// pageDTO 저장
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setId((String) session.getAttribute("id"));

		List<InquiryDTO> inquiryList = null;
		String id = (String) session.getAttribute("id");
		if ((String) session.getAttribute("id") != (null)) {
			if (id.equals("admin")) {
				inquiryList = adminService.getInquiryList(pageDTO);

			} else {
				inquiryList = adminService.getInquiryList2(pageDTO);
			}
		}
		// 페이징 작업
		// 전체 글개수 구하기 int 리턴할형 count = getBoardCount()
		int count = adminService.getInquiryCount(pageDTO);
		// 한 화면에 보여줄 페이지 개수 설정
		int pageBlock = 10;
		// 한 화면에 보여줄 시작페이지 구하기
		// 1~10 => 1, 11~20 => 11,..
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		// 한 화면에 보여줄 끝페이지 구하기
		int endPage = startPage + pageBlock - 1;
		// 전체 페이지개수 구하기
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		// 끝페이지 , 전체 페이지수 비교 => 끝페이지 크면 => 전체 페이지수로 끝페이지 변경
		if (endPage > pageCount) {
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

		return "admin/inquiry";
	}

	// 문의 상세
	@GetMapping("/admin/inquiry_content")
	public String inquiey_content(InquiryDTO inquiryDTO, Model model) {
		System.out.println("AdminController inquiry_content()");
		inquiryDTO = adminService.getInquiry(inquiryDTO);
		model.addAttribute("inquiryDTO", inquiryDTO);
		return "admin/inquiry_content";
	}

	// 문의 작성
	@GetMapping("/admin/inquiry_write")
	public String inquiry_write() {
		System.out.println("AdminController inquiry_write()");
		return "admin/inquiry_write";
	}

	// 문의 작성 pro
	@PostMapping("/admin/inquiry_writePro")
	public String inquiry_writePro(InquiryDTO inquiryDTO) {
		System.out.println("AdminController inquiry_writePro()");
		adminService.insertInquiry(inquiryDTO);
		return "redirect:/admin/inquiry";
	}

	// 공지 수정
	@GetMapping("/admin/update")
	public String update(NoticeDTO noticeDTO, Model model) {
		System.out.println("AdminController update()");
		noticeDTO = adminService.getNotice(noticeDTO);
		model.addAttribute("noticeDTO", noticeDTO);
		return "admin/update";
	}

	// 공지 수정 pro
	@PostMapping("/admin/updatePro")
	public String updatePro(NoticeDTO noticeDTO) {
		System.out.println("AdminController updatePro()");
		adminService.updateNotice(noticeDTO);
		return "redirect:/admin/notice";
	}

	// 공지 삭제
	@GetMapping("/admin/delete")
	public String delete(NoticeDTO noticeDTO) {
		System.out.println("AdminController delete()");
		adminService.deleteNotice(noticeDTO);
		return "redirect:/admin/notice";
	}

	// 문의 수정
	@GetMapping("/admin/inquiry_update")
	public String update(InquiryDTO inquiryDTO, Model model) {
		System.out.println("AdminController inquiry_update()");
		inquiryDTO = adminService.getInquiry(inquiryDTO);
		model.addAttribute("inquiryDTO", inquiryDTO);
		return "admin/inquiry_update";
	}

	@GetMapping("/admin/inquiry_answer")
	public String updateAnswer(InquiryDTO inquiryDTO, Model model) {
		System.out.println("AdminController inquiry_answer()");
		inquiryDTO = adminService.getInquiry(inquiryDTO);
		model.addAttribute("inquiryDTO", inquiryDTO);
		return "admin/inquiry_write";
	}

	@PostMapping("/admin/inquiry_updatePro")
	public String inquiry_updatePro(InquiryDTO inquiryDTO) {
		System.out.println("AdminController inquiry_updatePro()");
		System.out.println(inquiryDTO);

		adminService.updateInquiry(inquiryDTO);

		// /board/list 글목록으로 주소변경하면서 이동
		return "redirect:/admin/inquiry";
	}

	@PostMapping("/admin/inquiry_answerPro")
	public String inquiry_answerPro(InquiryDTO inquiryDTO) {
		System.out.println("AdminController inquiry_answerPro()");
		System.out.println(inquiryDTO);

		adminService.inquiry_answer(inquiryDTO);

		// /board/list 글목록으로 주소변경하면서 이동
		return "redirect:/admin/inquiry";
	}

	// 문의 삭제
	@GetMapping("/admin/inquiry_delete")
	public String delete(InquiryDTO inquiryDTO) {
		System.out.println("AdminController delete()");
		System.out.println(inquiryDTO);
		adminService.deleteInquiry(inquiryDTO);
		return "redirect:/admin/inquiry";
	}

	@GetMapping("/admin/delete_answer")
	public String deleteAnswer(HttpServletRequest request) {
		System.out.println("AdminController delete_answer()");
		int i_num = Integer.parseInt(request.getParameter("i_num"));
		adminService.delete_answer(i_num);
		return "redirect:/admin/inquiry";
	}

	@GetMapping("/adminPage/adminMain")
	public String adminMain(HttpSession session, Model model) {
		System.out.println("MemberController adminMain()");
		List<MemberDTO> memberDTOList = adminService.amember();
		model.addAttribute("memberDTOList", memberDTOList);
		return "/adminPage/adminMain";
	}

	@GetMapping("/adminPage/adminPro")
	public String Adminpro(HttpSession session, Model model) {
		System.out.println("AdminController adminPro()");
		List<ProjectDTO> projectDTOList = adminService.aproject();
		model.addAttribute("projectDTOList", projectDTOList);
		return "/adminPage/adminPro";
	}

	@GetMapping("/adminPage/adminDeletePro")
	public String adminDeletePro(ProjectDTO projectDTO) {
		System.out.println("AdminController adminDeletePro()");
		adminService.deleteproject(projectDTO);
		return "redirect:/adminPage/adminPro";
	}

	@GetMapping("/adminPage/adminResume")
	public String adminResume(HttpSession session, Model model) {
		System.out.println("AdminController adminResume()");
		List<ResumeDTO> resumeDTOList = adminService.aresume();
		model.addAttribute("resumeDTOList", resumeDTOList);
		return "/adminPage/adminResume";
	}

	// 지원서 삭제
	@GetMapping("/adminPage/adminDeleteResume")
	public String adminDeleteResume(ResumeDTO resumeDTO) {
		System.out.println("AdminController adminDeleteResume()");
		adminService.deleteresume(resumeDTO);
		return "redirect:/adminPage/adminResume";
	}

	@GetMapping("/adminPage/adminNotice")
	public String adminNo(HttpSession session, Model model) {
		System.out.println("MemberController adminNotice()");
		List<NoticeDTO> noticeDTOList = adminService.anotice();
		model.addAttribute("noticeDTOList", noticeDTOList);
		return "/adminPage/adminNotice";
	}

	@GetMapping("/adminPage/adminInquiry")
	public String adminInquiry(HttpSession session, Model model) {
		System.out.println("MemberController adminInquiry()");
		List<InquiryDTO> inquiryDTOList = adminService.ainquiry();
		model.addAttribute("inquiryDTOList", inquiryDTOList);
		return "/adminPage/adminInquiry";
	}

}
