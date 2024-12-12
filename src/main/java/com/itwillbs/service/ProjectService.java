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

	public int getProjectCount() {
		System.out.println("ProjectService getProjectCount()");

		return projectDAO.getProjectCount();
	}

	public ProjectDTO getProject(int p_num) {
		System.out.println("ProjectService getProject()");

		return projectDAO.getProject(p_num);
	}

	public MemberDTO getMember(int p_num) {
		System.out.println("ProjectService getMember()");
		
		return projectDAO.getMember(p_num);
	}

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

	public int getProjectBoardCount(PageDTO pageDTO) {
		System.out.println("ProjectService getProjectBoardCount()");
		
		return projectDAO.getProjectBoardCount(pageDTO);
	}

	public ProjectDTO getProjectBoard(ProjectDTO projectDTO) {
		System.out.println("ProjectService getProjectBoard()");
		
		return projectDAO.getProjectBoard(projectDTO);
	}

	public void updateProjectReadcount(ProjectDTO projectDTO) {
		System.out.println("ProjectService updateProjectReadcount()");
		projectDAO.updateProjectReadcount(projectDTO);
	}

	public Scrap_projectDTO scrap(Scrap_projectDTO scrap_projectDTO) {
		System.out.println("ProjectService scrap()");
		
		return projectDAO.scrap(scrap_projectDTO);
	}

	public void insertScrap(Scrap_projectDTO scrap_projectDTO) {
		System.out.println("ProjectService insertScrap()");
		projectDAO.insertScrap(scrap_projectDTO);
	}

	// 글 삭제
	public void projectDelete(ProjectDTO projectDTO) {
		System.out.println("ProjectService insertScrap()");
		projectDAO.projectDelete(projectDTO);
	}

	public void insertProject(ProjectDTO projectDTO) {
		System.out.println("ProjectService insertProject()");
		projectDTO.setP_num(projectDAO.getProjectMaxNum() + 1);
		projectDAO.insertProject(projectDTO);
	}

	public void projectUpdate(ProjectDTO projectDTO) {
		System.out.println("ProjectService projectUpdate()");
		projectDAO.projectUpdate(projectDTO);
	}

}
