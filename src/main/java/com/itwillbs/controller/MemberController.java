package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.ChatDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.ResumeDTO;
import com.itwillbs.domain.Scrap_projectDTO;
import com.itwillbs.domain.Scrap_resumeDTO;
import com.itwillbs.service.ChattingService;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.ProjectService;
import com.itwillbs.service.ResumeService;

@Controller
public class MemberController {

	// MemberController 어노테이션 정리

	// @Controller
	// MVC 아키텍처에서 컨트롤러를 정의할 때 사용. 해당 클래스가 웹 애플리케이션의 컨트롤러임을 표시
	// HTTP 요청 처리하고 응답을 생성하는 역할을 담당

	// @Inject
	// 종속성 주입(DI:Dependency Injection)을 수행하는 데 사용.
	// 클래스의 필드, 생성자, 메서드 등에 적용할 수 있음.
	// 클래스에 필요한 종속성을 자동으로 주입할 수 있음. 즉, 개발자가 직접 객체를 생성하거나 관리하지 않아도 됨

	// @GetMapping, @PostMapping
	// HTTP Get/Post 요청을 처리하는 메서드

	// @ResponseBody
	// 컨트롤러의 메서드에 적용되어 해당 메서드가 HTTP 응답의 본문(body)을 직접 반환함을 나타냄.
	// 메서드가 반환하는 객체가 HTTP 응답 본문에 직접적으로 포함되어 클라이언트로 전송됨
	// 일번적으로 컨트롤러의 메서드가 String, JSON, XML 등의 데이터를 반환할 때 사용

	@Inject
	private ProjectService projectService;

	@Inject
	private ResumeService resumeService;

	@Inject
	private MemberService memberService;

	@Inject
	private ChattingService chattingService;

	// 로그인
	@GetMapping("/main/login")
	public String login() {
		System.out.println("MemberController login()");
		return "main/login";
	}

	// 로그인 처리
	@PostMapping("/main/loginPro")
	public String loginPro(MemberDTO memberDTO, HttpSession session) {
		System.out.println("MemberController loginPro()");
		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);
		if (memberDTO2 != null) {
			session.setAttribute("id", memberDTO2.getId()); // 세션에 "id"라는 이름으로 memberDTO2 객체의 ID를 저장. 사용자의 ID를 세션에 유지하고
															// 다른 페이지에서도 이 ID에 접근할 수 있게 됨
			session.setAttribute("type", memberDTO2.getType());
			session.setAttribute("name", memberDTO2.getName());
			session.setAttribute("email", memberDTO2.getEmail());
			session.setAttribute("phone", memberDTO2.getPhone());
			session.setAttribute("matching", memberDTO2.getMatching());
			return "redirect:/main/main";
		} else {
			return "main/msg";
		}
	}

	// 아이디 찾기
	@GetMapping("/main/searchID")
	public String searchID() {
		System.out.println("MemberController searchID()");
		return "/main/searchID";
	}

	// 아이디 찾기 처리
	@PostMapping("/main/searchIDPro")
	public String searchIDPro(MemberDTO memberDTO, Model model) {
		System.out.println("MemberController searchIDPro()");
		MemberDTO memberDTO2 = new MemberDTO();
		memberDTO2 = memberService.userCheckID(memberDTO);
		if (memberDTO2 != null) {
			model.addAttribute("memberDTO2", memberDTO2);
			return "/main/findID";
		} else {
			return "/main/msg_search";
		}
	}

	// 아이디 찾기 결과
	@PostMapping("/main/findID")
	public String findID(MemberDTO memberDTO, HttpSession session) {
		System.out.println("MemberController findID()");
		session.getAttribute(memberDTO.getId());
		return "redirect:/main/findID";
	}

	// 비밀번호 찾기
	@GetMapping("/main/searchPW")
	public String searchPW() {
		System.out.println("MemberController searchPW()");
		return "/main/searchPW";
	}

	// 비밀번호 찾기 처리
	@PostMapping("/main/searchPWPro")
	public String searchPWPro(MemberDTO memberDTO, Model model) {
		System.out.println("MemberController searchPWPro()");
		MemberDTO memberDTO2 = new MemberDTO();
		memberDTO2 = memberService.userCheckPW(memberDTO);
		if (memberDTO2 != null) {
			model.addAttribute("memberDTO2", memberDTO2);
			return "/main/findPW";
		} else {
			return "/main/msg_search";
		}
	}

	// 회원가입
	@GetMapping("/main/join")
	public String insert() {
		System.out.println("MemberController insert()");
		return "main/join";
	}

	// 프리랜서 회원가입
	@GetMapping("/main/insertFreelancer")
	public String insertFreelance() {
		System.out.println("MemberController insertFreelancer()");
		return "/main/insertFreelancer";
	}

	// 프리랜서 회원가입 처리
	@PostMapping("/main/insertFreelancerPro")
	public String insertFreelancerPro(MemberDTO memberDTO) {
		System.out.println("MemberController insertFreelancerPro()");
		List<MemberDTO> memberDTOList = memberService.insertCheck(memberDTO);
		if (memberDTOList.isEmpty()) {
			memberService.insertMember(memberDTO);
			return "redirect:/main/main";
		} else {
			return "main/msg_error";
		}
	}

	// 기업 회원가입
	@GetMapping("/main/insertCompany")
	public String insertCompany() {
		System.out.println("MemberController insertCompany()");
		return "/main/insertCompany";
	}

	// 기업 회원가입 처리
	@PostMapping("/main/insertCompanyPro")
	public String insertCompanyPro(MemberDTO memberDTO) {
		System.out.println("MemberController insertCompanyPro()");
		List<MemberDTO> memberDTOList = memberService.insertCheck(memberDTO);
		if (memberDTOList.isEmpty()) {
			memberService.insertMember(memberDTO);
			return "redirect:/main/main";
		} else {
			return "main/msg_error";
		}
	}

	// ============ 회원가입
	// 아이디 중복확인
	@GetMapping("/main/idCheck")
	@ResponseBody
	public String idCheck(MemberDTO memberDTO, HttpServletResponse response) {
		System.out.println("MemberController idCheck()");
		System.out.println(memberDTO);
		MemberDTO memberDTO1 = memberService.getMember(memberDTO.getId());
		System.out.println(memberDTO1);
		String result = "";
		if (memberDTO1 != null) {
			result = "iddup";
		} else {
			result = "idok";
		}
		System.out.println(result);
		return result;
	}

	// 사업자 번호 중복확인
	@GetMapping("/main/comnumCheck")
	@ResponseBody
	public String comnumCheck(MemberDTO memberDTO, HttpServletResponse response) {
		System.out.println("MemberController comnumCheck()");
		System.out.println(memberDTO);
		MemberDTO memberDTO1 = memberService.getComNum(memberDTO.getComnum());
		System.out.println(memberDTO1);
		String result = "";
		if (memberDTO1 != null) {
			result = "comnumdup";
		} else {
			result = "comnumok";
		}
		System.out.println(result);
		return result;
	}

	// 이메일 중복확인
	@GetMapping("/main/emailCheck")
	@ResponseBody
	public String emailCheck(MemberDTO memberDTO, HttpServletResponse response) {
		System.out.println("MemberController emailCheck()");
		System.out.println(memberDTO);
		MemberDTO memberDTO1 = memberService.getEmail(memberDTO.getEmail());
		System.out.println(memberDTO1);
		String result = "";
		if (memberDTO1 != null) {
			result = "emaildup";
		} else {
			result = "emailok";
		}
		System.out.println(result);
		return result;
	}

	// 전화번호 중복확인
	@GetMapping("/main/phoneCheck")
	@ResponseBody
	public String phoneCheck(MemberDTO memberDTO, HttpServletResponse response) {
		System.out.println("MemberController phoneCheck()");
		System.out.println(memberDTO);
		MemberDTO memberDTO1 = memberService.getPhone(memberDTO.getPhone());
		System.out.println(memberDTO1);
		String result = "";
		if (memberDTO1 != null) {
			result = "phonedup";
		} else {
			result = "phoneok";
		}
		System.out.println(result);
		return result;
	}

	// 로그아웃
	@GetMapping("/main/logout")
	public String logout(HttpSession session) {
		System.out.println("MemberController logout()");
		session.invalidate();
		return "redirect:/main/main";
	}

	// 메인 페이지
	@GetMapping("/main/main")
	public String main(Model model) {
		System.out.println("MemberController main()");
		model.addAttribute("projectcount", projectService.getProjectCount());
		model.addAttribute("resumecount", resumeService.getResumeCount());
		model.addAttribute("companycount", memberService.getCompanyCount());
		model.addAttribute("matchingcount", memberService.getMatchingCount());
		return "main/main";
	}

	// ============ 마이페이지(기업)
	@GetMapping("/mypageCompany/mypageCompany1")
	public String mypageCompany1(HttpSession session, Model model) {
		System.out.println("MemberController mypageCompany1()");
		String id = (String) session.getAttribute("id");
		MemberDTO memberDTO = memberService.getMember(id);
		model.addAttribute("memberDTO", memberDTO);
		return "mypageCompany/mypageCompany1";
	}

	@GetMapping("/mypageCompany/mypageCompany2")
	public String mypageCompany2(HttpSession session, Model model) {
		System.out.println("MemberController mypageCompany2()");
		String id = (String) session.getAttribute("id");
		System.out.println(id);
		List<ProjectDTO> ProjectDTOList = memberService.projectCheck(id);
		model.addAttribute("ProjectDTOList", ProjectDTOList);
		return "mypageCompany/mypageCompany2";
	}

	@GetMapping("/mypageCompany/mypageCompany3")
	public String mypageCompany3(HttpSession session, Model model) {
		System.out.println("MemberController mypageCompany3()");
		return "project/projectWrite";
	}

	@GetMapping("/mypageCompany/mypageCompany4")
	public String mypageCompany4(HttpSession session, Model model) {
		System.out.println("MemberController mypageCompany4()");
		String id = (String) session.getAttribute("id");
		System.out.println(id);
		List<Scrap_resumeDTO> Scrap_resumeDTOList = memberService.resumeScrap(id);
		model.addAttribute("Scrap_resumeDTOList", Scrap_resumeDTOList);
		return "mypageCompany/mypageCompany4";
	}

	@GetMapping("/mypageCompany/mypageCompany5")
	public String mypageCompany5(HttpSession session, Model model) {
		System.out.println("MemberController mypageCompany5()");
		String id = (String) session.getAttribute("id");
		System.out.println(id);
		// 서비스 호출하여 데이터 가져오기
		List<ChatDTO> chattingDTOListC = chattingService.chattingBangC(id);
		model.addAttribute("chattingDTOListC", chattingDTOListC);
		return "mypageCompany/mypageCompany5";
	}

	@GetMapping("/mypageCompany/mypageCompany6")
	public String mypageCompany6() {
		return "mypageCompany/mypageCompany6";
	}
	// ============ 마이페이지(기업)

	// ============ 마이페이지(프리랜서)
	@GetMapping("/mypageFreelancer/mypageFreelancer1")
	public String mypageFreelancer1(HttpSession session, Model model) {
		System.out.println("MemberController mypageFreelancer1()");
		String id = (String) session.getAttribute("id");
		MemberDTO memberDTO = memberService.getMember(id);
		model.addAttribute("memberDTO", memberDTO);
		return "mypageFreelancer/mypageFreelancer1";
	}

	@GetMapping("/mypageFreelancer/mypageFreelancer2")
	public String mypageFreelancer2(HttpSession session, Model model) {
		System.out.println("MemberController mypageCompany2()");
		String id = (String) session.getAttribute("id");
		System.out.println(id);
		List<ResumeDTO> ResumeDTOList = memberService.resumeCheck(id);
		model.addAttribute("ResumeDTOList", ResumeDTOList);
		return "mypageFreelancer/mypageFreelancer2";
	}

	@GetMapping("/mypageFreelancer/mypageFreelancer3")
	public String mypageFreelancer3(HttpSession session, Model model) {
		System.out.println("MemberController mypageFreelancer3()");
		// 추가
		String id = (String) session.getAttribute("id");
		System.out.println(id);
		MemberDTO memberDTO = new MemberDTO();
		model.addAttribute("memberDTO", memberDTO);
		return "resume/resumeWrite";
	}

	@GetMapping("/mypageFreelancer/mypageFreelancer4")
	public String mypageFreelancer4(HttpSession session, Model model) {
		System.out.println("MemberController mypageFreelancer4()");
		String id = (String) session.getAttribute("id");
		List<Scrap_projectDTO> Scrap_projectDTOList = memberService.projectScrap(id);
		model.addAttribute("Scrap_projectDTOList", Scrap_projectDTOList);
		return "mypageFreelancer/mypageFreelancer4";
	}

	@GetMapping("mypageFreelancer/mypageFreelancer5")
	public String mypageFreelancer5(HttpSession session, Model model) {
		System.out.println("MemberController mypageCompany5()");

		String id = (String) session.getAttribute("id");
		System.out.println(id);
		List<ChatDTO> chattingDTOListF = chattingService.chattingBangF(id);
		model.addAttribute("chattingDTOListF", chattingDTOListF);
		return "mypageFreelancer/mypageFreelancer5";
	}

	@GetMapping("/mypageFreelancer/mypageFreelancer6")
	public String mypageFreelancer6() {
		return "mypageFreelancer/mypageFreelancer6";
	}

	@PostMapping("/updatePro")
	public String updatePro(MemberDTO memberDTO, HttpSession session) {
		System.out.println("MemberController updatePro()");
		System.out.println(memberDTO);
		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);
		if (memberDTO2 != null) {
			memberService.updateMember(memberDTO);
			session.setAttribute("pw", memberDTO2.getPw());
			session.setAttribute("email", memberDTO2.getEmail());
			session.setAttribute("phone", memberDTO2.getPhone());
			session.setAttribute("matching", memberDTO2.getMatching());

			session.invalidate();
			return "main/msg_change";
		} else {
			return "mypageCompany/msg";
		}
	}
	// ============ 마이페이지(프리랜서)

	// 회원 탈퇴
	@PostMapping("/deletePro")
	public String deletePro(MemberDTO memberDTO, HttpSession session) {
		System.out.println("MemberController deletePro()");
		System.out.println(memberDTO);
		memberDTO.setId((String) session.getAttribute("id"));
		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);
		System.out.println(memberDTO2);
		if (memberDTO2 != null) {
			memberService.deleteMember(memberDTO2);
			session.invalidate();
			return "redirect:/main/main";
		} else {
			JOptionPane.showMessageDialog(null, "비밀번호 불일치");
			// Java Swing 라이브러리 'JOptionPane' : 사용자에게 팝업 메시지를 표시하는 역할
			// JOptionPane : 다이얼로그 창을 생성하고 제어하는 클래스
			// showMessageDialog : 메시지를 표시하는 메서드. 사용자에게 메시지를 표시하기 위해 이 메서드를 호출
			return "redirect:/main/main";
		}
	}

	// 개인정보 처리지침
	@GetMapping("/main/privacyPolicy")
	public String privacy() {
		System.out.println("MemberController privacyPolicy()");
		return "main/privacyPolicy";
	}

}
