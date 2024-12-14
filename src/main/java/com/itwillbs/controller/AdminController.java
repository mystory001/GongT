package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject; // @Inject 어노테이션을 사용하여 의존성 주입
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller; // Spring의 Controller 어노테이션
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping; // GET 요청 처리 어노테이션
import org.springframework.web.bind.annotation.PostMapping; // POST 요청 처리 어노테이션

import com.itwillbs.domain.InquiryDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.NoticeDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.ResumeDTO;
import com.itwillbs.service.AdminService;

@Controller // Spring MVC의 Controller 역할
public class AdminController {

	@Inject // AdminService 객체를 의존성 주입
	private AdminService adminService;

	// 공지사항 리스트 조회 페이지
	@GetMapping("/admin/notice")
	public String notice(HttpServletRequest request, PageDTO pageDTO, Model model) {
		System.out.println("NoticeController notice()");

		int pageSize = 10; // 한 페이지에 보여줄 글 수 설정
		String pageNum = request.getParameter("pageNum"); // URL에서 pageNum 파라미터값을 가져옴
		if (pageNum == null) { // pageNum 값이 없으면 기본값 "1"로 설정
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum); // 문자열로 받은 pageNum을 정수로 변환
		pageDTO.setPageSize(pageSize); // PageDTO 객체에 페이지 사이즈 설정
		pageDTO.setPageNum(pageNum); // PageDTO 객체에 페이지 번호 설정
		pageDTO.setCurrentPage(currentPage); // PageDTO 객체에 현재 페이지 번호 설정

		List<NoticeDTO> noticeList = adminService.getNoticeList(pageDTO); // 공지사항 목록 조회

		int count = adminService.getNoticeCount(pageDTO); // 공지사항 전체 개수 조회
		int pageBlock = 10; // 한 화면에 보여줄 페이지 블록의 개수 설정
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1; // 시작 페이지 계산
		int endPage = startPage + pageBlock - 1; // 끝 페이지 계산
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1); // 전체 페이지 수 계산
		if (endPage > pageCount) { // 끝 페이지가 전체 페이지 수를 초과하지 않도록 조정
			endPage = pageCount;
		}

		// PageDTO에 페이지 관련 정보를 설정
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);

		model.addAttribute("pageDTO", pageDTO); // 페이지 정보 모델에 추가
		model.addAttribute("noticeList", noticeList); // 공지사항 목록 모델에 추가

		return "admin/notice"; // 공지사항 리스트 페이지 반환
	}

	// 공지사항 작성 페이지
	@GetMapping("/admin/write")
	public String write() {
		System.out.println("AdminController write()");

		return "admin/write"; // 공지사항 작성 페이지 반환
	}

	// 공지사항 작성 처리
	@PostMapping("/admin/writePro")
	public String writePro(NoticeDTO noticeDTO) {
		System.out.println("AdminController writePro()");
		System.out.println(noticeDTO);
		adminService.insertNotice(noticeDTO); // 공지사항 데이터 삽입
		return "redirect:/Admin/notice"; // 공지사항 목록 페이지로 리다이렉트
	}

	// 공지사항 상세보기 페이지
	@GetMapping("/admin/content")
	public String content(NoticeDTO noticeDTO, Model model) {
		System.out.println("AdminController content()");
		System.out.println(noticeDTO);

		adminService.updateReadcount(noticeDTO); // 조회수 증가
		noticeDTO = adminService.getNotice(noticeDTO); // 공지사항 상세 조회
		model.addAttribute("noticeDTO", noticeDTO); // 공지사항 상세 정보를 모델에 추가

		return "admin/content"; // 공지사항 상세 페이지 반환
	}

	// 자주 묻는 질문 페이지
	@GetMapping("/admin/FAQ")
	public String FAQ(NoticeDTO noticeDTO) {
		System.out.println("AdminController FAQ()");
		System.out.println(noticeDTO);

		return "admin/FAQ"; // FAQ 페이지 반환
	}

	// 문의 목록 페이지
	@GetMapping("/admin/inquiry")
	public String list(HttpServletRequest request, PageDTO pageDTO, Model model, HttpSession session) {
		System.out.println("AdminController inquiry()");

		int pageSize = 10; // 한 페이지에 보여줄 글 수 설정
		String pageNum = request.getParameter("pageNum"); // URL에서 pageNum 파라미터값을 가져옴
		if (pageNum == null) { // pageNum 값이 없으면 기본값 "1"로 설정
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum); // pageNum을 정수로 변환
		pageDTO.setPageSize(pageSize); // 페이지 사이즈 설정
		pageDTO.setPageNum(pageNum); // 페이지 번호 설정
		pageDTO.setCurrentPage(currentPage); // 현재 페이지 설정
		pageDTO.setId((String) session.getAttribute("id")); // 세션에서 사용자 ID 설정

		List<InquiryDTO> inquiryList = null;
		String id = (String) session.getAttribute("id");
		if (id != null) { // 세션에 id가 있는 경우에만 처리
			if (id.equals("admin")) {
				inquiryList = adminService.getInquiryList(pageDTO); // 관리자용 문의 목록 조회
			} else {
				inquiryList = adminService.getInquiryList2(pageDTO); // 일반 사용자용 문의 목록 조회
			}
		}

		int count = adminService.getInquiryCount(pageDTO); // 문의 전체 개수 조회
		int pageBlock = 10; // 한 화면에 보여줄 페이지 블록의 개수 설정
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1; // 시작 페이지 계산
		int endPage = startPage + pageBlock - 1; // 끝 페이지 계산
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1); // 전체 페이지 수 계산
		if (endPage > pageCount) { // 끝 페이지가 전체 페이지 수를 초과하지 않도록 조정
			endPage = pageCount;
		}

		pageDTO.setCount(count); // PageDTO에 전체 글 수 설정
		pageDTO.setPageBlock(pageBlock); // PageDTO에 페이지 블록 크기 설정
		pageDTO.setStartPage(startPage); // PageDTO에 시작 페이지 설정
		pageDTO.setEndPage(endPage); // PageDTO에 끝 페이지 설정
		pageDTO.setPageCount(pageCount); // PageDTO에 전체 페이지 수 설정

		model.addAttribute("pageDTO", pageDTO); // 페이지 정보 모델에 추가
		model.addAttribute("inquiryList", inquiryList); // 문의 목록 모델에 추가

		return "admin/inquiry"; // 문의 목록 페이지 반환
	}

	// 문의 상세보기 페이지
	@GetMapping("/admin/inquiry_content")
	public String inquiey_content(InquiryDTO inquiryDTO, Model model) {
		System.out.println("AdminController inquiry_content()");
		inquiryDTO = adminService.getInquiry(inquiryDTO); // 문의 상세 조회
		model.addAttribute("inquiryDTO", inquiryDTO); // 문의 상세 정보를 모델에 추가
		return "admin/inquiry_content"; // 문의 상세 페이지 반환
	}

	// 문의 작성 페이지
	@GetMapping("/admin/inquiry_write")
	public String inquiry_write() {
		System.out.println("AdminController inquiry_write()");
		return "admin/inquiry_write"; // 문의 작성 페이지 반환
	}

	// 문의 작성 처리
	@PostMapping("/admin/inquiry_writePro")
	public String inquiry_writePro(InquiryDTO inquiryDTO) {
		System.out.println("AdminController inquiry_writePro()");
		adminService.insertInquiry(inquiryDTO); // 문의 데이터 삽입
		return "redirect:/admin/inquiry"; // 문의 목록 페이지로 리다이렉트
	}

	// 공지 수정 페이지
	@GetMapping("/admin/update")
	public String update(NoticeDTO noticeDTO, Model model) {
		System.out.println("AdminController update()");
		noticeDTO = adminService.getNotice(noticeDTO); // 수정할 공지사항 조회
		model.addAttribute("noticeDTO", noticeDTO); // 공지사항 정보를 모델에 추가
		return "admin/update"; // 공지사항 수정 페이지 반환
	}

	// 공지 수정 처리
	@PostMapping("/admin/updatePro")
	public String updatePro(NoticeDTO noticeDTO) {
		System.out.println("AdminController updatePro()");
		adminService.updateNotice(noticeDTO); // 공지사항 수정
		return "redirect:/admin/notice"; // 공지사항 목록 페이지로 리다이렉트
	}

	// 공지 삭제 처리
	@GetMapping("/admin/delete")
	public String delete(NoticeDTO noticeDTO) {
		System.out.println("AdminController delete()");
		adminService.deleteNotice(noticeDTO); // 공지사항 삭제
		return "redirect:/admin/notice"; // 공지사항 목록 페이지로 리다이렉트
	}

	// 문의 수정 페이지
	@GetMapping("/admin/inquiry_update")
	public String update(InquiryDTO inquiryDTO, Model model) {
		System.out.println("AdminController inquiry_update()");
		inquiryDTO = adminService.getInquiry(inquiryDTO); // 수정할 문의사항 조회
		model.addAttribute("inquiryDTO", inquiryDTO); // 문의사항 정보를 모델에 추가
		return "admin/inquiry_update"; // 문의 수정 페이지 반환
	}

	// 문의 답변 페이지
	@GetMapping("/admin/inquiry_answer")
	public String updateAnswer(InquiryDTO inquiryDTO, Model model) {
		System.out.println("AdminController inquiry_answer()");
		inquiryDTO = adminService.getInquiry(inquiryDTO); // 답변할 문의사항 조회
		model.addAttribute("inquiryDTO", inquiryDTO); // 문의사항 정보를 모델에 추가
		return "admin/inquiry_write"; // 문의 작성 페이지로 이동 (답변 작성)
	}

	// 문의 수정 처리
	@PostMapping("/admin/inquiry_updatePro")
	public String inquiry_updatePro(InquiryDTO inquiryDTO) {
		System.out.println("AdminController inquiry_updatePro()");
		System.out.println(inquiryDTO);

		adminService.updateInquiry(inquiryDTO); // 문의 수정 처리

		return "redirect:/admin/inquiry"; // 문의 목록 페이지로 리다이렉트
	}

	// 문의 답변 처리
	@PostMapping("/admin/inquiry_answerPro")
	public String inquiry_answerPro(InquiryDTO inquiryDTO) {
		System.out.println("AdminController inquiry_answerPro()");
		System.out.println(inquiryDTO);

		adminService.inquiry_answer(inquiryDTO); // 문의 답변 처리

		return "redirect:/admin/inquiry"; // 문의 목록 페이지로 리다이렉트
	}

	// 문의 삭제 처리
	@GetMapping("/admin/inquiry_delete")
	public String delete(InquiryDTO inquiryDTO) {
		System.out.println("AdminController delete()");
		System.out.println(inquiryDTO);
		adminService.deleteInquiry(inquiryDTO); // 문의 삭제 처리
		return "redirect:/admin/inquiry"; // 문의 목록 페이지로 리다이렉트
	}

	// 답변 삭제 처리
	@GetMapping("/admin/delete_answer")
	public String deleteAnswer(HttpServletRequest request) {
		System.out.println("AdminController delete_answer()");
		int i_num = Integer.parseInt(request.getParameter("i_num")); // i_num 파라미터로 답변 삭제
		adminService.delete_answer(i_num); // 답변 삭제
		return "redirect:/admin/inquiry"; // 문의 목록 페이지로 리다이렉트
	}

	// 관리자 메인 페이지
	@GetMapping("/adminPage/adminMain")
	public String adminMain(HttpSession session, Model model) {
		System.out.println("MemberController adminMain()");
		List<MemberDTO> memberDTOList = adminService.amember(); // 회원 목록 조회
		model.addAttribute("memberDTOList", memberDTOList); // 회원 목록 모델에 추가
		return "/adminPage/adminMain"; // 관리자 메인 페이지 반환
	}

	// 프로젝트 목록 페이지
	@GetMapping("/adminPage/adminPro")
	public String Adminpro(HttpSession session, Model model) {
		System.out.println("AdminController adminPro()");
		List<ProjectDTO> projectDTOList = adminService.aproject(); // 프로젝트 목록 조회
		model.addAttribute("projectDTOList", projectDTOList); // 프로젝트 목록 모델에 추가
		return "/adminPage/adminPro"; // 관리자 프로젝트 페이지 반환
	}

	// 프로젝트 삭제 처리
	@GetMapping("/adminPage/adminDeletePro")
	public String adminDeletePro(ProjectDTO projectDTO) {
		System.out.println("AdminController adminDeletePro()");
		adminService.deleteproject(projectDTO); // 프로젝트 삭제
		return "redirect:/adminPage/adminPro"; // 프로젝트 목록 페이지로 리다이렉트
	}

	// 이력서 목록 페이지
	@GetMapping("/adminPage/adminResume")
	public String adminResume(HttpSession session, Model model) {
		System.out.println("AdminController adminResume()");
		List<ResumeDTO> resumeDTOList = adminService.aresume(); // 이력서 목록 조회
		model.addAttribute("resumeDTOList", resumeDTOList); // 이력서 목록 모델에 추가
		return "/adminPage/adminResume"; // 관리자 이력서 페이지 반환
	}

	// 이력서 삭제 처리
	@GetMapping("/adminPage/adminDeleteResume")
	public String adminDeleteResume(ResumeDTO resumeDTO) {
		System.out.println("AdminController adminDeleteResume()");
		adminService.deleteresume(resumeDTO); // 이력서 삭제
		return "redirect:/adminPage/adminResume"; // 이력서 목록 페이지로 리다이렉트
	}

	// 공지사항 목록 페이지
	@GetMapping("/adminPage/adminNotice")
	public String adminNo(HttpSession session, Model model) {
		System.out.println("MemberController adminNotice()");
		List<NoticeDTO> noticeDTOList = adminService.anotice(); // 공지사항 목록 조회
		model.addAttribute("noticeDTOList", noticeDTOList); // 공지사항 목록 모델에 추가
		return "/adminPage/adminNotice"; // 관리자 공지사항 페이지 반환
	}

	// 문의 목록 페이지
	@GetMapping("/adminPage/adminInquiry")
	public String adminInquiry(HttpSession session, Model model) {
		System.out.println("MemberController adminInquiry()");
		List<InquiryDTO> inquiryDTOList = adminService.ainquiry(); // 문의 목록 조회
		model.addAttribute("inquiryDTOList", inquiryDTOList); // 문의 목록 모델에 추가
		return "/adminPage/adminInquiry"; // 관리자 문의 페이지 반환
	}

}
