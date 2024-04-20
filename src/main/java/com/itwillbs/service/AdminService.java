package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.AdminDAO;
import com.itwillbs.domain.AdminDTO;
import com.itwillbs.domain.InquiryDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.NoticeDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.ResumeDTO;

@Service
public class AdminService {
	
	@Inject
	private AdminDAO adminDAO;
	
	public void insertNotice(NoticeDTO noticeDTO) {
		System.out.println("AdminService insertAdmin()");
		noticeDTO.setN_num(adminDAO.getMaxnum() + 1);
		noticeDTO.setN_readcount(0);
		noticeDTO.setN_date(new Timestamp(System.currentTimeMillis()));
		adminDAO.insertNotice(noticeDTO);
	}
	public List<NoticeDTO> getNoticeList(PageDTO pageDTO){
		System.out.println("AdminService getNoticeList()");
		int currentPage = pageDTO.getCurrentPage();
		int pageSize = pageDTO.getPageSize();
		
		int startRow = (currentPage-1) * pageSize + 1;
		
		// 끝나는 행번호 구하기
		int endRow = startRow + pageSize -1;
		
		// pageDTO에 저장
		// boardMapper => limit 시작행-1,개수
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		
		return adminDAO.getNoticeList(pageDTO);
		
	}
	public void insertInquiry(InquiryDTO inquiryDTO) {
		System.out.println("AdminService insertAdmin()");
		inquiryDTO.setI_num(adminDAO.getMaxnum() + 1);
		inquiryDTO.setI_date(new Timestamp(System.currentTimeMillis()));
		adminDAO.insertInquiry(inquiryDTO);
	}
	public List<InquiryDTO> getInquiryList(PageDTO pageDTO){
		System.out.println("AdminService getInquiryList()");
		int currentPage = pageDTO.getCurrentPage();
		int pageSize = pageDTO.getPageSize();
		
		int startRow = (currentPage-1) * pageSize + 1;
		
		// 끝나는 행번호 구하기
		int endRow = startRow + pageSize -1;
		
		// pageDTO에 저장
		// boardMapper => limit 시작행-1,개수
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		
		return adminDAO.getInquiryList(pageDTO);
		
	}
	public int getNoticeCount(PageDTO pageDTO) {
		System.out.println("AdminService getNoticeCount()");
		
		return adminDAO.getNoticeCount(pageDTO);
	}
	public int getInquiryCount(PageDTO pageDTO) {
		System.out.println("AdminService getNoticeCount()");
		return adminDAO.getInquiryCount(pageDTO);
	}
	public NoticeDTO getNotice(NoticeDTO noticeDTO) {
		System.out.println("AdminService getNotice()");
		return adminDAO.getNotice(noticeDTO);
	}
	public void updateReadcount(NoticeDTO noticeDTO) {
		System.out.println("AdminService updateReadcount");
		adminDAO.updateReadcount(noticeDTO);
	}
	public void updateNotice(NoticeDTO noticeDTO) {
		System.out.println("AdminService updateNotice");
		adminDAO.updateNotice(noticeDTO);
		
	}

	public void deleteNotice(NoticeDTO noticeDTO) {
		System.out.println("AdminService deleteNotice");
		adminDAO.deleteNotice(noticeDTO);
		
	}
	public InquiryDTO getInquiry(InquiryDTO inquiryDTO) {
		System.out.println("AdminService getInquiry()");
		return adminDAO.getInquiry(inquiryDTO);
	}
	public void deleteInquiry(InquiryDTO inquiryDTO) {
		System.out.println("AdminService deleteInquiry");
		adminDAO.deleteInquiry(inquiryDTO);
	}
	public List<InquiryDTO> getInquiryList2(PageDTO pageDTO) {
		System.out.println("AdminService getInquiryList2");
		int currentPage = pageDTO.getCurrentPage();
		int pageSize = pageDTO.getPageSize();
		
		int startRow = (currentPage-1) * pageSize + 1;
		
		// 끝나는 행번호 구하기
		int endRow = startRow + pageSize -1;
		
		// pageDTO에 저장
		// boardMapper => limit 시작행-1,개수
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		return adminDAO.getInquiryList2(pageDTO);
	}
//	public void insertInquiry2(InquiryDTO inquiryDTO) {
//		System.out.println("AdminService insertAdmin()");
//		inquiryDTO.setI_num(adminDAO.getMaxnum() + 1);
//		inquiryDTO.setI_date(new Timestamp(System.currentTimeMillis()));
//		adminDAO.insertInquiry2(inquiryDTO);
//	}
	public void updateInquiry(InquiryDTO inquiryDTO) {
		System.out.println("AdminService updateInquiry()");
		adminDAO.updateInquiry(inquiryDTO); 
	}
	
	public void inquiry_answer(InquiryDTO inquiryDTO) {
		System.out.println("AdminService inquiry_answer()");
		inquiryDTO.setAsw_date(new Timestamp(System.currentTimeMillis()));
		adminDAO.inquiry_answer(inquiryDTO); 
	}
	public void delete_answer(int i_num) {
		System.out.println("AdminService delete_answer");
		adminDAO.delete_answer(i_num);
	}
	public List<MemberDTO> amember() {
		System.out.println("AdminService admincom()");
		
		return adminDAO.amember();
	}
	
	public List<ProjectDTO> aproject() {
		System.out.println("AdminService aproject()");
		
		return adminDAO.aproject();
	}
	
	public List<ResumeDTO> aresume() {
		System.out.println("AdminService aproject()");
		
		return adminDAO.aresume();
	}
	
	public List<NoticeDTO> anotice() {
		System.out.println("AdminService aproject()");
		
		return adminDAO.anotice();
	}
	
	public List<InquiryDTO> ainquiry() {
		System.out.println("AdminService aproject()");
		
		return adminDAO.ainquiry();
	}
	
	public void deleteproject(ProjectDTO projcetDTO) {
		System.out.println("AdminService deleteproject()");
		
		
		adminDAO.deleteproject(projcetDTO);
	}
	
	
	public void deleteresume(ResumeDTO resumeDTO) {
		System.out.println("AdminService deleteresume()");
		
		
		adminDAO.deleteresume(resumeDTO);
	}
	
	
}
