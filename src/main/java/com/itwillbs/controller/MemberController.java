package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	@Inject
	private ProjectService projectService;
	
	@Inject
	private ResumeService resumeService;
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private ChattingService chattingService;
	
	@GetMapping("/main/login")
	public String login() {
		System.out.println("MemberController login()");
		return "main/login";
	}
	
	//개인정보 처리지침
	@GetMapping("/main/privacyPolicy")
	public String privacy() {
		System.out.println("MemberController privacyPolicy()");
		return "main/privacyPolicy";
	}
	
	@PostMapping("/main/loginPro")
	public String loginPro(MemberDTO memberDTO, HttpSession session) {
		System.out.println("MemberController loginPro()");
		System.out.println(memberDTO.getType());
		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);
		
		if(memberDTO2 != null) {
			session.setAttribute("id",memberDTO2.getId());
			session.setAttribute("type",memberDTO2.getType());
			session.setAttribute("name",memberDTO2.getName());
			session.setAttribute("email",memberDTO2.getEmail());
			session.setAttribute("phone",memberDTO2.getPhone());
			session.setAttribute("matching",memberDTO2.getMatching());
			
			return "redirect:/main/main";
		} else {
			return "main/msg";
		}
	}
	
	@GetMapping("/main/join")
	public String insert() {
		System.out.println("MemberController insert()");
		return "main/join";
	}
	
	@PostMapping("/main/joinPro")
	public String insertPro(MemberDTO memberDTO) {
		System.out.println("MemberController insertPro()");
//		memberService.insertMember(memberDTO);
		return "redirect:/main/login";
	}
	
	
	@GetMapping("/main/logout")
	public String logout(HttpSession session) {
		System.out.println("MemberController logout()");
		session.invalidate();
		return "redirect:/main/main";
	}
	
	@GetMapping("/main/insertFreelancer")
	public String insertFreelance() {
		System.out.println("MemberController insertFreelancer()");
		return "/main/insertFreelancer";
	}
	
	@PostMapping("/main/insertFreelancerPro")
	public String insertFreelancerPro(MemberDTO memberDTO) {
		System.out.println("MemberController insertFreelancerPro()");
		
		List<MemberDTO> memberDTOList = memberService.insertCheck(memberDTO);
		if(memberDTOList.isEmpty()) {
			memberService.insertMember(memberDTO);
			return "redirect:/main/main";
		} else {
			return "main/msg_error";
		}
		
	}
	
	//아이디 중복확인
	
	@GetMapping("/main/insertCompany")
	public String insertCompany() {
		System.out.println("MemberController insertCompany()");
		return "/main/insertCompany";
	}
	
	@PostMapping("/main/insertCompanyPro")
	public String insertCompanyPro(MemberDTO memberDTO) {
		System.out.println("MemberController insertCompanyPro()");
		
		List<MemberDTO> memberDTOList = memberService.insertCheck(memberDTO);
		if(memberDTOList.isEmpty()) {
			memberService.insertMember(memberDTO);
			return "redirect:/main/main";
		} else {
			return "main/msg_error";
		}
	}
	
	@GetMapping("/main/searchID")
	public String searchID() {
		System.out.println("MemberController searchID()");
		return "/main/searchID";
	}
	
	@PostMapping("/main/searchIDPro")
	public String searchIDPro(MemberDTO memberDTO, Model model) {
		System.out.println("MemberController searchIDPro()");
		MemberDTO memberDTO2 = new MemberDTO();
		memberDTO2 = memberService.userCheckID(memberDTO);
		if(memberDTO2!=null) {
			model.addAttribute("memberDTO2", memberDTO2);
			return "/main/findID";
		} else {
			return "/main/msg_search";
		}
	}
	
	@PostMapping("/main/findID")
	public String findID(MemberDTO memberDTO, HttpSession session) {
		System.out.println("MemberController findID()");
		session.getAttribute(memberDTO.getId());
		return "redirect:/main/findID";
	}

	
	@GetMapping("/main/searchPW")
	public String searchPW() {
		System.out.println("MemberController searchPW()");
		return "/main/searchPW";
	}
	
	@PostMapping("/main/searchPWPro")
	public String searchPWPro(MemberDTO memberDTO, Model model) {
		System.out.println("MemberController searchPWPro()");
		MemberDTO memberDTO2 = new MemberDTO();
		memberDTO2 = memberService.userCheckPW(memberDTO);
		if(memberDTO2!=null) {
			model.addAttribute("memberDTO2", memberDTO2);
			return "/main/findPW";
		} else {
			return "/main/msg_search";
		}
	}
	
	//아이디 중복확인
		@GetMapping("/main/idCheck")
		@ResponseBody
		public String idCheck(MemberDTO memberDTO, HttpServletResponse response) {
			System.out.println("MemberController idCheck()");
			System.out.println(memberDTO);
			MemberDTO memberDTO1 = memberService.getMember(memberDTO.getId());
			System.out.println(memberDTO1);
			String result ="";
			if(memberDTO1 != null) {
				result = "iddup";
			}else {
				result = "idok";
			}
			System.out.println(result);
			return result;
		}
		
		//사업자 번호 중복확인
		@GetMapping("/main/comnumCheck")
		@ResponseBody
		public String comnumCheck(MemberDTO memberDTO, HttpServletResponse response) {
			System.out.println("MemberController comnumCheck()");
			System.out.println(memberDTO);
			MemberDTO memberDTO1 = memberService.getComNum(memberDTO.getComnum());
			System.out.println(memberDTO1);
			String result ="";
			if(memberDTO1 != null) {
				result = "comnumdup";
			}else {
				result = "comnumok";
			}
			System.out.println(result);
			return result;
		}
		
		//이메일 중복확인
		@GetMapping("/main/emailCheck")
		@ResponseBody
		public String emailCheck(MemberDTO memberDTO, HttpServletResponse response) {
			System.out.println("MemberController emailCheck()");
			System.out.println(memberDTO);
			MemberDTO memberDTO1 = memberService.getEmail(memberDTO.getEmail());
			System.out.println(memberDTO1);
			String result ="";
			if(memberDTO1 != null) {
				result = "emaildup";
			}else {
				result = "emailok";
			}
			System.out.println(result);
			return result;
		}
		
		//전화번호 중복확인
		@GetMapping("/main/phoneCheck")
		@ResponseBody
		public String phoneCheck(MemberDTO memberDTO, HttpServletResponse response) {
			System.out.println("MemberController phoneCheck()");
			System.out.println(memberDTO);
			MemberDTO memberDTO1 = memberService.getPhone(memberDTO.getPhone());
			System.out.println(memberDTO1);
			String result ="";
			if(memberDTO1 != null) {
				result = "phonedup";
			}else {
				result = "phoneok";
			}
			System.out.println(result);
			return result;
		}
		
	
	@RequestMapping(value = "/main/main", method = RequestMethod.GET)
	public String main(Model model) {
		
		model.addAttribute("projectcount", projectService.getProjectCount());
		model.addAttribute("resumecount", resumeService.getResumeCount());
		model.addAttribute("companycount", memberService.getCompanyCount());
		model.addAttribute("matchingcount", memberService.getMatchingCount());
		return "main/main";
	}//main
	
	
	
	@RequestMapping(value = "/mypageCompany/mypageCompany1", method = RequestMethod.GET)
	public String mypageCompany1(HttpSession session, Model model) {
		System.out.println("MemberController mypageCompany1()");
		
		String id = (String)session.getAttribute("id");
		
		MemberDTO memberDTO = memberService.getMember(id);
		
		model.addAttribute("memberDTO", memberDTO);
		return "mypageCompany/mypageCompany1";
	}//mypageCompany1
	
	
	@GetMapping("/mypageCompany/mypageCompany2")
	public String mypageCompany2(HttpSession session, Model model) {
		System.out.println("MemberController mypageCompany2()");
		
		String id = (String)session.getAttribute("id");
		System.out.println(id);
		List<ProjectDTO>ProjectDTOList = memberService.projectCheck(id);
		
		model.addAttribute("ProjectDTOList",ProjectDTOList);
		
		return "mypageCompany/mypageCompany2";
	}//mypageCompany2
	
	
	
	@GetMapping("/mypageCompany/mypageCompany3")
	public String mypageCompany3(HttpSession session, Model model) {
		System.out.println("MemberController mypageCompany3()");
		
		return "project/projectWrite";
	}
	
	
	@GetMapping("/mypageCompany/mypageCompany4")
	public String mypageCompany4(HttpSession session, Model model) {
		System.out.println("MemberController mypageCompany4()");
		
		String id = (String)session.getAttribute("id");
		System.out.println(id);
		List<Scrap_resumeDTO> Scrap_resumeDTOList = memberService.resumeScrap(id);
		
		model.addAttribute("Scrap_resumeDTOList",Scrap_resumeDTOList);
		
		return "mypageCompany/mypageCompany4";
	}//mypageCompany4
	

	@GetMapping("/mypageCompany/mypageCompany5")
	public String mypageCompany5(HttpSession session, Model model) {
		System.out.println("MemberController mypageCompany5()");
		
		String id = (String)session.getAttribute("id");
		System.out.println(id);
		
//		List<ChatDTO> ChattingDTOList = memberService.ChattingCheck(id);
		
//		model.addAttribute("ChattingDTOList",ChattingDTOList);
		
		List<ChatDTO> ChattingDTOListC = chattingService.ChattingBangC(id);
		
		model.addAttribute("ChattingDTOListC",ChattingDTOListC);
		
		return "mypageCompany/mypageCompany5";
	}//mypageCompany5
	
	@GetMapping("/mypageCompany/mypageCompany6")
	public String mypageCompany6() {
		return "mypageCompany/mypageCompany6";
	}//mypageCompany6()
	
	@PostMapping("/deletePro")
	public String deletePro(MemberDTO memberDTO, HttpSession session) {

		System.out.println("MemberController deletePro()");
		System.out.println(memberDTO); 

		memberDTO.setId((String)session.getAttribute("id"));
		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);
		
		System.out.println(memberDTO2);

		
		if(memberDTO2 != null) {
				 memberService.deleteMember(memberDTO2);
				 session.invalidate();
				 
				//메인 가상주소 /member/main 주소변경 이동
				return "redirect:/main/main";
		}else {
				JOptionPane.showMessageDialog(null, "비밀번호 불일치");
				return "redirect:/main/main";
		}
	}//deletePro()
	
	
	@RequestMapping(value = "/mypageFreelancer/mypageFreelancer1", method = RequestMethod.GET)
	public String mypageFreelancer1(HttpSession session, Model model) {
		System.out.println("MemberController mypageFreelancer1()");
		String id = (String)session.getAttribute("id");
		MemberDTO memberDTO = memberService.getMember(id);
		model.addAttribute("memberDTO", memberDTO);
		return "mypageFreelancer/mypageFreelancer1";
	}//mypageFreelancer1
	
	@GetMapping("/mypageFreelancer/mypageFreelancer2")
	public String mypageFreelancer2(HttpSession session, Model model) {
		System.out.println("MemberController mypageCompany2()");
		
		String id = (String)session.getAttribute("id");
		System.out.println(id);
		List<ResumeDTO> ResumeDTOList = memberService.resumeCheck(id);
		
		model.addAttribute("ResumeDTOList",ResumeDTOList);
		
		return "mypageFreelancer/mypageFreelancer2";
	}//mypageFreelancer2
	
	@GetMapping("/mypageFreelancer/mypageFreelancer3")
	public String mypageFreelancer3(HttpSession session, Model model) {
		System.out.println("MemberController mypageFreelancer3()");
		//추가
		String id = (String)session.getAttribute("id");
		System.out.println(id);
		MemberDTO memberDTO = new MemberDTO();
		model.addAttribute("memberDTO", memberDTO);
		return "resume/resumeWrite";
	}
	
	@GetMapping("/mypageFreelancer/mypageFreelancer4")
	public String mypageFreelancer4(HttpSession session, Model model) {
		System.out.println("MemberController mypageFreelancer4()");
		
		String id = (String)session.getAttribute("id");
	
		List<Scrap_projectDTO> Scrap_projectDTOList = memberService.projectScrap(id);
		
		model.addAttribute("Scrap_projectDTOList",Scrap_projectDTOList);
		
		return "mypageFreelancer/mypageFreelancer4";
	}//mypageFreelancer4
	
	
	@GetMapping("mypageFreelancer/mypageFreelancer5")
	public String mypageFreelancer5(HttpSession session, Model model) {
		System.out.println("MemberController mypageCompany5()");
		
		String id = (String)session.getAttribute("id");
		System.out.println(id);
		List<ChatDTO> ChattingDTOListF = chattingService.ChattingBangF(id);
		
		model.addAttribute("ChattingDTOListF",ChattingDTOListF);
		
		return "mypageFreelancer/mypageFreelancer5";
	}//mypageFreelancer5
	
	
	@GetMapping("/mypageFreelancer/mypageFreelancer6")
	public String mypageFreelancer6() {
		return "mypageFreelancer/mypageFreelancer6";
	}//mypageFreelancer6()
	
	
	@PostMapping("/updatePro")
	public String updatePro(MemberDTO memberDTO, HttpSession session) {
		System.out.println("MemberController updatePro()");
		System.out.println(memberDTO);
		
		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);
		
		if(memberDTO2 != null) {
		memberService.updateMember(memberDTO);
		session.setAttribute("pw",memberDTO2.getPw());
		session.setAttribute("email", memberDTO2.getEmail());
		session.setAttribute("phone", memberDTO2.getPhone());
		session.setAttribute("matching", memberDTO2.getMatching());
		
		session.invalidate();
		return "main/msg_change";
		}else {
			return "mypageCompany/msg";
		}
	}//updatePro()

	
	
}
