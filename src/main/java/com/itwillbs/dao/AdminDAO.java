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

@Repository // 데이터 접근 객체(DAO) 역할
public class AdminDAO {

	@Inject // SqlSession 객체를 자동으로 주입
	private SqlSession sqlSession;

	// MyBatis 매퍼 파일의 네임스페이스 정의
	private static final String namesapce = "com.itwillbs.mappers.AdminMapper";

	// 공지사항 추가
	public void insertNotice(NoticeDTO noticeDTO) {
		System.out.println("AdminDAO insertNotice()");
		System.out.println(noticeDTO);
		// insertNotice SQL 쿼리를 실행
		sqlSession.insert(namesapce + ".insertNotice", noticeDTO);
	}

	// 문의사항 추가
	public void insertInquiry(InquiryDTO inquiryDTO) {
		System.out.println("AdminDAO insertInquiry()");
		System.out.println(inquiryDTO);
		// insertInquiry SQL 쿼리를 실행
		sqlSession.insert(namesapce + ".insertInquiry", inquiryDTO);
	}

	// 최대 번호를 조회
	public int getMaxnum() {
		System.out.println("AdminDAO getMaxNum()");
		// getMaxNum SQL 쿼리를 실행하여 최대 번호를 반환
		return sqlSession.selectOne(namesapce + ".getMaxNum");
	}

	// 문의사항 목록 조회
	public List<InquiryDTO> getInquiryList(PageDTO pageDTO) {
		System.out.println("AdminDAO getInquiryList()");
		// getInquiryList SQL 쿼리를 실행하여 문의사항 목록을 반환
		return sqlSession.selectList(namesapce + ".getInquiryList", pageDTO);
	}

	// 공지사항 목록 조회
	public List<NoticeDTO> getNoticeList(PageDTO pageDTO) {
		System.out.println("AdminDAO getNoticeList()");
		// getNoticeList SQL 쿼리를 실행하여 공지사항 목록을 반환
		return sqlSession.selectList(namesapce + ".getNoticeList", pageDTO);
	}

	// 공지사항의 총 개수를 구하기
	public int getNoticeCount(PageDTO pageDTO) {
		System.out.println("AdminDAO getNoticeCount()");
		// getNoticeCount SQL 쿼리를 실행하여 공지사항 개수를 반환
		return sqlSession.selectOne(namesapce + ".getNoticeCount", pageDTO);
	}

	// 문의사항의 총 개수를 구하기
	public int getInquiryCount(PageDTO pageDTO) {
		System.out.println("AdminDAO getInquiryCount()");
		// getInquiryCount SQL 쿼리를 실행하여 문의사항 개수를 반환
		return sqlSession.selectOne(namesapce + ".getInquiryCount", pageDTO);
	}

	// 특정 문의사항을 조
	public InquiryDTO getInquiry(InquiryDTO inquiryDTO) {
		System.out.println("AdminDAO getInquiry()");
		// getInquiry SQL 쿼리를 실행하여 특정 문의사항을 반환
		return sqlSession.selectOne(namesapce + ".getInquiry", inquiryDTO);
	}

	// 특정 공지사항을 조회
	public NoticeDTO getNotice(NoticeDTO noticeDTO) {
		System.out.println("AdminDAO getNotice()");
		// getNotice SQL 쿼리를 실행하여 특정 공지사항을 반환
		return sqlSession.selectOne(namesapce + ".getNotice", noticeDTO);
	}

	// 공지사항 조회수 업데이트
	public void updateReadcount(NoticeDTO noticeDTO) {
		System.out.println("AdminDAO updateReadcount");
		// updateReadcount SQL 쿼리를 실행하여 공지사항 조회수를 업데이트
		sqlSession.update(namesapce + ".updateReadcount", noticeDTO);
	}

	// 공지사항 수정
	public void updateNotice(NoticeDTO noticeDTO) {
		System.out.println("AdminDAO updateNotice");
		// updateNotice SQL 쿼리를 실행하여 공지사항을 수정
		sqlSession.update(namesapce + ".updateNotice", noticeDTO);
	}

	// 문의사항 수정
	public void updateInquiry(InquiryDTO inquiryDTO) {
		System.out.println("AdminDAO updateInquiry");
		// updateInquiry SQL 쿼리를 실행하여 문의사항을 수정
		sqlSession.update(namesapce + ".updateInquiry", inquiryDTO);
	}

	// 공지사항 삭제
	public void deleteNotice(NoticeDTO noticeDTO) {
		System.out.println("AdminDAO deleteNotice");
		// deleteNotice SQL 쿼리를 실행하여 공지사항을 삭제
		sqlSession.delete(namesapce + ".deleteNotice", noticeDTO);
	}

	// 문의사항 삭제
	public void deleteInquiry(InquiryDTO inquiryDTO) {
		System.out.println("AdminDAO deleteInquiry");
		// deleteInquiry SQL 쿼리를 실행하여 문의사항을 삭제
		sqlSession.delete(namesapce + ".deleteInquiry", inquiryDTO);
	}

	// 사용자별 문의사항 목록을 가져오기 (관리자용)
	public List<InquiryDTO> getInquiryList2(PageDTO pageDTO) {
		System.out.println("AdminDAO getInquiryList2()");
		// getInquiryList2 SQL 쿼리를 실행하여 사용자별 문의사항 목록을 반환
		return sqlSession.selectList(namesapce + ".getInquiryList2", pageDTO);
	}

	// 관리자용 회원 목록 조회
	public List<MemberDTO> amember() {
		System.out.println("AdminDAO amember()");
		// amember SQL 쿼리를 실행하여 회원 목록을 반환
		return sqlSession.selectList(namesapce + ".amember");
	}

	// 관리자용 프로젝트 목록 조회
	public List<ProjectDTO> aproject() {
		System.out.println("AdminDAO aproject()");
		// aproject SQL 쿼리를 실행하여 프로젝트 목록을 반환
		return sqlSession.selectList(namesapce + ".aproject");
	}

	// 관리자용 이력서 목록 조회
	public List<ResumeDTO> aresume() {
		System.out.println("AdminDAO aproject()");
		// aresume SQL 쿼리를 실행하여 이력서 목록을 반환
		return sqlSession.selectList(namesapce + ".aresume");
	}

	// 관리자용 공지사항 목록 조회
	public List<NoticeDTO> anotice() {
		System.out.println("AdminDAO aproject()");
		// anotice SQL 쿼리를 실행하여 공지사항 목록을 반환
		return sqlSession.selectList(namesapce + ".anotice");
	}

	// 관리자용 문의사항 목록 조회
	public List<InquiryDTO> ainquiry() {
		System.out.println("AdminDAO aproject()");
		// ainquiry SQL 쿼리를 실행하여 문의사항 목록을 반환
		return sqlSession.selectList(namesapce + ".ainquiry");
	}

	// 프로젝트 삭제
	public void deleteproject(ProjectDTO projectDTO) {
		System.out.println("AdminDAO deleteproject()");
		// deleteproject SQL 쿼리를 실행하여 프로젝트를 삭제
		sqlSession.delete(namesapce + ".deleteproject", projectDTO);
	}

	// 이력서 삭제
	public void deleteresume(ResumeDTO resumeDTO) {
		System.out.println("AdminDAO deleteresume()");
		// deleteresume SQL 쿼리를 실행하여 이력서를 삭제
		sqlSession.delete(namesapce + ".deleteresume", resumeDTO);
	}

	// 문의사항 답변 추가
	public void inquiry_answer(InquiryDTO inquiryDTO) {
		System.out.println("AdminDAO inquiry_answer");
		// inquiry_answer SQL 쿼리를 실행하여 문의사항에 답변 추가
		sqlSession.update(namesapce + ".inquiry_answer", inquiryDTO);
	}

	// 답변 삭제
	public void delete_answer(int i_num) {
		System.out.println("AdminDAO deleteresume()");
		// deleteAnswer SQL 쿼리를 실행하여 답변을 삭제
		sqlSession.update(namesapce + ".deleteAnswer", i_num);
	}

}
