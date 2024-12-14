package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProjectDAO;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.Scrap_projectDTO;

@Service
public class ProjectService {

	@Inject
	private ProjectDAO projectDAO;

	// 프로젝트 전체 개수
	public int getProjectCount() {
		System.out.println("ProjectService getProjectCount()");

		return projectDAO.getProjectCount();
	}

	// 특정 프로젝트 정보 조회
	public ProjectDTO getProject(int p_num) {
		System.out.println("ProjectService getProject()");

		return projectDAO.getProject(p_num);
	}

	// 특정 프로젝트의 작성자 정보 조회
	public MemberDTO getMember(int p_num) {
		System.out.println("ProjectService getMember()");
		
		return projectDAO.getMember(p_num);
	}

	// 프로젝트 게시판 목록 조회
	public List<ProjectDTO> getProjectBoardList(PageDTO pageDTO) {
		System.out.println("ProjectService getProjectBoardList()");
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

		return projectDAO.getProjectBoardList(pageDTO);
	}

	// 프로젝트 게시판의 전체 글 개수 조회
	public int getProjectBoardCount(PageDTO pageDTO) {
		System.out.println("ProjectService getProjectBoardCount()");
		
		return projectDAO.getProjectBoardCount(pageDTO);
	}

	// 특정 프로젝트 게시글 조회
	public ProjectDTO getProjectBoard(ProjectDTO projectDTO) {
		System.out.println("ProjectService getProjectBoard()");
		
		return projectDAO.getProjectBoard(projectDTO);
	}

	// 프로젝트 조회수 증가
	public void updateProjectReadcount(ProjectDTO projectDTO) {
		System.out.println("ProjectService updateProjectReadcount()");
		projectDAO.updateProjectReadcount(projectDTO);
	}

	// 프로젝트의 찜(스크랩) 상태 확인
	public Scrap_projectDTO scrap(Scrap_projectDTO scrap_projectDTO) {
		System.out.println("ProjectService scrap()");
		
		return projectDAO.scrap(scrap_projectDTO);
	}

	// 프로젝트 찜(스크랩) 정보 추가
	public void insertScrap(Scrap_projectDTO scrap_projectDTO) {
		System.out.println("ProjectService insertScrap()");
		projectDAO.insertScrap(scrap_projectDTO);
	}

	// 프로젝트 삭제
	public void projectDelete(ProjectDTO projectDTO) {
		System.out.println("ProjectService insertScrap()");
		projectDAO.projectDelete(projectDTO);
	}

	// 프로젝트 추가
	public void insertProject(ProjectDTO projectDTO) {
		System.out.println("ProjectService insertProject()");
		projectDTO.setP_num(projectDAO.getProjectMaxNum() + 1);
		projectDAO.insertProject(projectDTO);
	}

	// 프로젝트 수정
	public void projectUpdate(ProjectDTO projectDTO) {
		System.out.println("ProjectService projectUpdate()");
		projectDAO.projectUpdate(projectDTO);
	}

}
