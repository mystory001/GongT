package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ResumeDAO;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ResumeDTO;
import com.itwillbs.domain.Scrap_resumeDTO;

@Service
public class ResumeService {

	@Inject
	private ResumeDAO resumeDAO;

	// 이력서 개수 조회
	public int getResumeCount() {
		System.out.println("ResumeService getResumeCount()");

		return resumeDAO.getResumeCount();
	}

	// 이력서 번호로 회원 정보 조회
	public MemberDTO getMember(int r_num) {
		System.out.println("ResumeService getMember()");
		return resumeDAO.getMember(r_num);
	}

	// 이력서 번호 가져오기
	public ResumeDTO getResume(int r_num) {
		System.out.println("ResumeService getResume()");
		return resumeDAO.getResume(r_num);
	}

	// 이력서 목록 조회
	public List<ResumeDTO> getResumeBoardList(PageDTO pageDTO) {
		System.out.println("ResumeService getResumeBoardList()");
		// 시작하는 행번호 구하기
		int currentPage = pageDTO.getCurrentPage();
		int pageSize = pageDTO.getPageSize();

		int startRow = (currentPage - 1) * pageSize + 1;

		// 끝나는 행번호 구하기
		int endRow = startRow + pageSize - 1;

		// pageDTO에 저장
		// boardMapper => limit 시작행-1,개수
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);

		return resumeDAO.getResumeBoardList(pageDTO);
	}

	// 이력서 게시판 전체 게시글 조회
	public int getResumeBoardCount(PageDTO pageDTO) {
		System.out.println("ResumeService getResumeBoardCount()");
		return resumeDAO.getResumeBoardCount(pageDTO);
	}

	// 특정 이력서 조회
	public ResumeDTO getResumeBoard(ResumeDTO resumeDTO) {
		System.out.println("ResumeService getResumeBoard()");
		return resumeDAO.getResumeBoard(resumeDTO);
	}

	// 이력서 찜하기 상태 확인
	public Scrap_resumeDTO scrap(Scrap_resumeDTO scrap_resumeDTO) {
		System.out.println("ResumeService scrap()");
		return resumeDAO.scrap(scrap_resumeDTO);
	}

	// 이력서 스크랩 추가
	public void insertScrap(Scrap_resumeDTO scrap_resumeDTO) {
		System.out.println("ResumeService insertScrap()");
		resumeDAO.insertScrap(scrap_resumeDTO);
	}

	// 이력서 등록
	public void insertResume(ResumeDTO resumeDTO) {
		System.out.println("ResumeService insertResume()");
		resumeDTO.setR_num(resumeDAO.getResumeMaxNum() + 1);

		resumeDAO.insertResume(resumeDTO);
	}

	// 이력서 수정
	public void resumeUpdate(ResumeDTO resumeDTO) {
		System.out.println("ResumeService resumeUpdate()");
		resumeDAO.resumeUpdate(resumeDTO);
	}

	// 이력서 삭제
	public void resumeDelete(ResumeDTO resumeDTO) {
		System.out.println("ResumeService resumeDelete()");
		resumeDAO.resumeDelete(resumeDTO);
	}

}
