package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.InquiryDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.NoticeDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.ResumeDTO;

@Repository
public class AdminDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String namesapce = "com.itwillbs.mappers.AdminMapper";

	public void insertNotice(NoticeDTO noticeDTO) {
		System.out.println("AdminDAO insertNotice()");
		System.out.println(noticeDTO);
		sqlSession.insert(namesapce + ".insertNotice", noticeDTO);
	}

	public void insertInquiry(InquiryDTO inquiryDTO) {
		System.out.println("AdminDAO insertInquiry()");
		System.out.println(inquiryDTO);
		sqlSession.insert(namesapce + ".insertInquiry", inquiryDTO);
	}

	public int getMaxnum() {
		System.out.println("AdminDAO getMaxNum()");
		return sqlSession.selectOne(namesapce + ".getMaxNum");
	}

	public List<InquiryDTO> getInquiryList(PageDTO pageDTO) {
		System.out.println("AdminDAO getInquiryList()");
		return sqlSession.selectList(namesapce + ".getInquiryList", pageDTO);
	}

	public List<NoticeDTO> getNoticeList(PageDTO pageDTO) {
		System.out.println("AdminDAO getNoticeList()");
		return sqlSession.selectList(namesapce + ".getNoticeList", pageDTO);
	}

	public int getNoticeCount(PageDTO pageDTO) {
		System.out.println("AdminDAO getNoticeCount()");
		return sqlSession.selectOne(namesapce + ".getNoticeCount", pageDTO);
	}

	public int getInquiryCount(PageDTO pageDTO) {
		System.out.println("AdminDAO getInquiryCount()");
		return sqlSession.selectOne(namesapce + ".getInquiryCount", pageDTO);
	}

	public InquiryDTO getInquiry(InquiryDTO inquiryDTO) {
		System.out.println("AdminDAO getInquiry()");
		return sqlSession.selectOne(namesapce + ".getInquiry", inquiryDTO);
	}

	public NoticeDTO getNotice(NoticeDTO noticeDTO) {
		System.out.println("AdminDAO getNotice()");
		return sqlSession.selectOne(namesapce + ".getNotice", noticeDTO);
	}

	public void updateReadcount(NoticeDTO noticeDTO) {
		System.out.println("AdminDAO updateReadcount");
		sqlSession.update(namesapce + ".updateReadcount", noticeDTO);
	}

	public void updateNotice(NoticeDTO noticeDTO) {
		System.out.println("AdminDAO updateNotice");
		sqlSession.update(namesapce + ".updateNotice", noticeDTO);
	}

	public void updateInquiry(InquiryDTO inquiryDTO) {
		System.out.println("AdminDAO updateInquiry");
		sqlSession.update(namesapce + ".updateInquiry", inquiryDTO);
	}

	public void deleteNotice(NoticeDTO noticeDTO) {
		System.out.println("AdminDAO deleteNotice");
		sqlSession.delete(namesapce + ".deleteNotice", noticeDTO);
	}

	public void deleteInquiry(InquiryDTO inquiryDTO) {
		System.out.println("AdminDAO deleteInquiry");
		sqlSession.delete(namesapce + ".deleteInquiry", inquiryDTO);
	}

	public List<InquiryDTO> getInquiryList2(PageDTO pageDTO) {
		System.out.println("AdminDAO getInquiryList2()");
		return sqlSession.selectList(namesapce + ".getInquiryList2", pageDTO);
	}

	public List<MemberDTO> amember() {
		System.out.println("AdminDAO amember()");

		return sqlSession.selectList(namesapce + ".amember");
	}

	public List<ProjectDTO> aproject() {
		System.out.println("AdminDAO aproject()");

		return sqlSession.selectList(namesapce + ".aproject");
	}

	public List<ResumeDTO> aresume() {
		System.out.println("AdminDAO aproject()");

		return sqlSession.selectList(namesapce + ".aresume");
	}

	public List<NoticeDTO> anotice() {
		System.out.println("AdminDAO aproject()");

		return sqlSession.selectList(namesapce + ".anotice");
	}

	public List<InquiryDTO> ainquiry() {
		System.out.println("AdminDAO aproject()");

		return sqlSession.selectList(namesapce + ".ainquiry");
	}

	public void deleteproject(ProjectDTO projectDTO) {
		System.out.println("AdminDAO deleteproject()");

		sqlSession.delete(namesapce + ".deleteproject", projectDTO);
	}

	public void deleteresume(ResumeDTO resumeDTO) {
		System.out.println("AdminDAO deleteresume()");

		sqlSession.delete(namesapce + ".deleteresume", resumeDTO);
	}

	public void inquiry_answer(InquiryDTO inquiryDTO) {
		System.out.println("AdminDAO inquiry_answer");
		sqlSession.update(namesapce + ".inquiry_answer", inquiryDTO);
	}

	public void delete_answer(int i_num) {
		System.out.println("AdminDAO deleteresume()");

		sqlSession.update(namesapce + ".deleteAnswer", i_num);
	}

}
