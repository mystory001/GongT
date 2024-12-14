package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.ResumeDTO;
import com.itwillbs.domain.Scrap_projectDTO;
import com.itwillbs.domain.Scrap_resumeDTO;

@Service
public class MemberService {

	@Inject
	private MemberDAO memberDAO;

	// 로그인 시 체크
	public MemberDTO userCheck(MemberDTO memberDTO) {
		System.out.println("MemberService userCheck()");
		return memberDAO.userCheck(memberDTO);
	}

	// 아이디 찾기
	public MemberDTO userCheckID(MemberDTO memberDTO) {
		System.out.println("MemberService userCheckID()");
		return memberDAO.userCheckID(memberDTO);
	}

	// 비밀번호 찾기
	public MemberDTO userCheckPW(MemberDTO memberDTO) {
		System.out.println("MemberService userCheckPW()");
		return memberDAO.userCheckPW(memberDTO);
	}

	// ============회원 가입
	public void insertMember(MemberDTO memberDTO) {
		System.out.println("MemberService insertMember()");
		memberDAO.insertMember(memberDTO);
	}

	// 아이디 확인
	public MemberDTO getMember(String id) {
		System.out.println("MemberService getMember()");
		return memberDAO.getMember(id);
	}

	// 사업자 번호 확인
	public MemberDTO getComNum(String comnum) {
		System.out.println("MemberService getComNum()");
		return memberDAO.getComNum(comnum);
	}

	// 이메일 확인
	public MemberDTO getEmail(String email) {
		System.out.println("MemberService getEmail()");
		return memberDAO.getEmail(email);
	}

	// 연락처 확인
	public MemberDTO getPhone(String phone) {
		System.out.println("MemberService getPhone()");
		return memberDAO.getPhone(phone);
	}
	// ============회원 가입

	// 전체 회사 개수
	public int getCompanyCount() {
		System.out.println("MemberService getCompanyCount()");

		return memberDAO.getCompanyCount();
	}

	// 매칭 수 조회
	public int getMatchingCount() {
		System.out.println("MemberService getMatchingCount()");

		return memberDAO.getMatchingCount();
	}

	// 회원 정보 수정
	public void updateMember(MemberDTO memberDTO) {
		System.out.println("MemberService updateMember()");

		memberDAO.updateMember(memberDTO);
	}

	// 참여한 프로젝트 조회
	public List<ProjectDTO> projectCheck(String id) {
		System.out.println("MemberService projectCheck()");

		return memberDAO.projectCheck(id);
	}

	// 찜한 이력서 조회
	public List<Scrap_resumeDTO> resumeScrap(String id) {
		System.out.println("MemberDAO resumeScrap()");

		return memberDAO.resumeScrap(id);
	}

	// 찜한 프로젝트 조회
	public List<Scrap_projectDTO> projectScrap(String id) {
		System.out.println("MemberDAO projectScrap()");

		return memberDAO.projectScrap(id);
	}

	// 회원 탈퇴
	public void deleteMember(MemberDTO memberDTO) {
		System.out.println("MemberService deleteMember()");

		// deleteMember 메서드 호출
		memberDAO.deleteMember(memberDTO);
	}

	// 이력서 조회
	public List<ResumeDTO> resumeCheck(String id) {
		System.out.println("MemberDAO resumeCheck()");

		return memberDAO.resumeCheck(id);
	}

	// 중복 확인
	public List<MemberDTO> insertCheck(MemberDTO memberDTO) {
		System.out.println("MemberDAO insertCheck()");
		return memberDAO.insertCheck(memberDTO);
	}

	// public List<ChatDTO> ChattingCheck(String id) {
	// System.out.println("MemberDAO ChattingCheck()");
	//
	// return memberDAO.ChattingCheck(id);
	// }//ChattingCheck()
}
