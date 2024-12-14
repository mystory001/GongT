package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.AdminDAO;
import com.itwillbs.domain.InquiryDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.NoticeDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.ResumeDTO;

@Service // 서비스 컴포넌트
public class AdminService {

	@Inject // AdminDAO를 자동으로 주입
	private AdminDAO adminDAO;

	// 공지사항 추가
	public void insertNotice(NoticeDTO noticeDTO) {
		System.out.println("AdminService insertAdmin()");

		// 공지사항 번호를 자동 증가하도록 설정
		noticeDTO.setN_num(adminDAO.getMaxnum() + 1);
		noticeDTO.setN_readcount(0); // 조회수 초기화
		noticeDTO.setN_date(new Timestamp(System.currentTimeMillis())); // 현재 시간으로 날짜 설정

		// 공지사항을 DB에 추가
		adminDAO.insertNotice(noticeDTO);
	}

	// 공지사항 목록을 가져오기
	public List<NoticeDTO> getNoticeList(PageDTO pageDTO) {
		System.out.println("AdminService getNoticeList()");

		int currentPage = pageDTO.getCurrentPage();
		int pageSize = pageDTO.getPageSize();

		// 시작 행 번호 계산
		int startRow = (currentPage - 1) * pageSize + 1;

		// 끝나는 행 번호 계산
		int endRow = startRow + pageSize - 1;

		// PageDTO에 시작과 끝 행 번호 설정
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);

		// DB에서 공지사항 목록을 가져옴
		return adminDAO.getNoticeList(pageDTO);
	}

	// 문의사항 추가
	public void insertInquiry(InquiryDTO inquiryDTO) {
		System.out.println("AdminService insertAdmin()");

		// 문의 번호를 자동 증가하도록 설정
		inquiryDTO.setI_num(adminDAO.getMaxnum() + 1);
		inquiryDTO.setI_date(new Timestamp(System.currentTimeMillis())); // 현재 시간으로 날짜 설정

		// 문의사항을 DB에 추가
		adminDAO.insertInquiry(inquiryDTO);
	}

	// 문의사항 목록을 가져오기
	public List<InquiryDTO> getInquiryList(PageDTO pageDTO) {
		System.out.println("AdminService getInquiryList()");

		int currentPage = pageDTO.getCurrentPage();
		int pageSize = pageDTO.getPageSize();

		// 시작 행 번호 계산
		int startRow = (currentPage - 1) * pageSize + 1;

		// 끝나는 행 번호 계산
		int endRow = startRow + pageSize - 1;

		// PageDTO에 시작과 끝 행 번호 설정
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);

		// DB에서 문의사항 목록을 가져옴
		return adminDAO.getInquiryList(pageDTO);
	}

	// 공지사항의 총 개수 구하는
	public int getNoticeCount(PageDTO pageDTO) {
		System.out.println("AdminService getNoticeCount()");

		return adminDAO.getNoticeCount(pageDTO);
	}

	// 문의사항의 총 개수 구하는
	public int getInquiryCount(PageDTO pageDTO) {
		System.out.println("AdminService getNoticeCount()");

		return adminDAO.getInquiryCount(pageDTO);
	}

	// 특정 공지사항을 가져오기
	public NoticeDTO getNotice(NoticeDTO noticeDTO) {
		System.out.println("AdminService getNotice()");

		return adminDAO.getNotice(noticeDTO);
	}

	// 공지사항 조회수 증가
	public void updateReadcount(NoticeDTO noticeDTO) {
		System.out.println("AdminService updateReadcount");

		adminDAO.updateReadcount(noticeDTO);
	}

	// 공지사항 수정
	public void updateNotice(NoticeDTO noticeDTO) {
		System.out.println("AdminService updateNotice");

		adminDAO.updateNotice(noticeDTO);
	}

	// 공지사항 삭제
	public void deleteNotice(NoticeDTO noticeDTO) {
		System.out.println("AdminService deleteNotice");

		adminDAO.deleteNotice(noticeDTO);
	}

	// 특정 문의사항을 가져오기
	public InquiryDTO getInquiry(InquiryDTO inquiryDTO) {
		System.out.println("AdminService getInquiry()");

		return adminDAO.getInquiry(inquiryDTO);
	}

	// 문의사항 삭제
	public void deleteInquiry(InquiryDTO inquiryDTO) {
		System.out.println("AdminService deleteInquiry");

		adminDAO.deleteInquiry(inquiryDTO);
	}

	// 사용자별 문의사항 목록을 가져오기 (관리자와 일반 사용자의 목록을 구분)
	public List<InquiryDTO> getInquiryList2(PageDTO pageDTO) {
		System.out.println("AdminService getInquiryList2");

		int currentPage = pageDTO.getCurrentPage();
		int pageSize = pageDTO.getPageSize();

		int startRow = (currentPage - 1) * pageSize + 1;

		int endRow = startRow + pageSize - 1;

		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);

		return adminDAO.getInquiryList2(pageDTO);
	}

	// 문의사항 수정
	public void updateInquiry(InquiryDTO inquiryDTO) {
		System.out.println("AdminService updateInquiry()");

		adminDAO.updateInquiry(inquiryDTO);
	}

	// 문의사항 답변 추가
	public void inquiry_answer(InquiryDTO inquiryDTO) {
		System.out.println("AdminService inquiry_answer()");

		inquiryDTO.setAsw_date(new Timestamp(System.currentTimeMillis())); // 답변 날짜 설정
		adminDAO.inquiry_answer(inquiryDTO);
	}

	// 답변 삭제
	public void delete_answer(int i_num) {
		System.out.println("AdminService delete_answer");

		adminDAO.delete_answer(i_num);
	}

	// 회원 목록을 가져오기
	public List<MemberDTO> amember() {
		System.out.println("AdminService admincom()");

		return adminDAO.amember();
	}

	// 프로젝트 목록을 가져오기
	public List<ProjectDTO> aproject() {
		System.out.println("AdminService aproject()");

		return adminDAO.aproject();
	}

	// 이력서 목록을 가져오기
	public List<ResumeDTO> aresume() {
		System.out.println("AdminService aproject()");

		return adminDAO.aresume();
	}

	// 공지사항 목록을 가져오기 (관리자용)
	public List<NoticeDTO> anotice() {
		System.out.println("AdminService aproject()");

		return adminDAO.anotice();
	}

	// 문의사항 목록을 가져오기(관리자용)
	public List<InquiryDTO> ainquiry() {
		System.out.println("AdminService aproject()");

		return adminDAO.ainquiry();
	}

	// 프로젝트 삭제
	public void deleteproject(ProjectDTO projcetDTO) {
		System.out.println("AdminService deleteproject()");

		adminDAO.deleteproject(projcetDTO);
	}

	// 이력서 삭제
	public void deleteresume(ResumeDTO resumeDTO) {
		System.out.println("AdminService deleteresume()");

		adminDAO.deleteresume(resumeDTO);
	}

}
