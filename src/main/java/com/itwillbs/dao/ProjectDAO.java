package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.Scrap_projectDTO;

@Repository
public class ProjectDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.itwillbs.mappers.ProjectMapper";

	// 프로젝트 전체 개수를 조회
	public int getProjectCount() {
		System.out.println("ProjectDAO getProjectCount()");

		// SQL 쿼리에서 프로젝트의 총 개수를 조회하여 반환
		return sqlSession.selectOne(namespace + ".getProjectCount");
	}

	// 프로젝트 번호(p_num)에 해당하는 프로젝트 정보를 조회
	public ProjectDTO getProject(int p_num) {
		System.out.println("ProjectDAO getProject()");

		 // p_num을 이용해 해당 프로젝트의 상세 정보를 반환
		return sqlSession.selectOne(namespace + ".getProject", p_num);
	}

	// 프로젝트 번호(p_num)에 해당하는 작성자 정보를 조회
	public MemberDTO getMember(int p_num) {
		System.out.println("ProjectDAO getMember()");

		// p_num을 통해 해당 프로젝트의 작성자 정보를 반환
		return sqlSession.selectOne(namespace + ".getMember", p_num);
	}
	
	 // 프로젝트 번호의 최대값을 조회
	public int getProjectMaxNum() {
		System.out.println("ProjectDAO getProjectMaxNum()");
		
		// SQL 쿼리에서 현재 가장 큰 프로젝트 번호를 반환
		return sqlSession.selectOne(namespace + ".getProjectMaxNum");
	}

	// 페이징 처리된 프로젝트 게시판 목록 조회
	public List<ProjectDTO> getProjectBoardList(PageDTO pageDTO) {
		System.out.println("ProjectDAO getProjectBoardList()");
		
		// PageDTO에 포함된 페이징 정보를 사용하여 프로젝트 게시글 목록을 조회
		return sqlSession.selectList(namespace + ".getProjectBoardList", pageDTO);
	}

	// 프로젝트 게시판의 전체 글 개수 조회
	public int getProjectBoardCount(PageDTO pageDTO) {
		System.out.println("ProjectDAO getProjectBoardCount()");
		
		// SQL 쿼리에서 전체 프로젝트 게시글 개수를 반환
		return sqlSession.selectOne(namespace + ".getProjectBoardCount", pageDTO);
	}

	// 특정 프로젝트의 게시글을 조회
	public ProjectDTO getProjectBoard(ProjectDTO projectDTO) {
		System.out.println("ProjectDAO getProjectBoard()");
		
		// 프로젝트 DTO를 사용하여 해당 프로젝트 게시글을 조회
		return sqlSession.selectOne(namespace + ".getProjectBoard", projectDTO);
	}

	// 프로젝트 조회수 증가
	public void updateProjectReadcount(ProjectDTO projectDTO) {
		System.out.println("ProjectDAO updateProjectReadcount()");
		sqlSession.update(namespace + ".updateProjectReadcount", projectDTO);
	}

	// 특정 프로젝트가 스크랩 되었는지 확인
	public Scrap_projectDTO scrap(Scrap_projectDTO scrap_projectDTO) {
		System.out.println("ProjectDAO scrap()");
		return sqlSession.selectOne(namespace + ".scrap", scrap_projectDTO);
	}

	// 프로젝트 스크랩 정보 추가
	public void insertScrap(Scrap_projectDTO scrap_projectDTO) {
		System.out.println("ProjectDAO insertScrap()");
		sqlSession.insert(namespace + ".insertScrap", scrap_projectDTO);
	}

	// 프로젝트 삭제
	public void projectDelete(ProjectDTO projectDTO) {
		System.out.println("ProjectDAO projectDelete()");
		sqlSession.delete(namespace + ".projectDelete", projectDTO);
	}

	// 프로젝트 작성
	public void insertProject(ProjectDTO projectDTO) {
		System.out.println("ProjectDAO insertProject()");
		System.out.println("projectDTO" + projectDTO);
		sqlSession.insert(namespace + ".insertProject", projectDTO);
	}

	// 프로젝트 수정
	public void projectUpdate(ProjectDTO projectDTO) {
		System.out.println("ProjectDAO projectUpdate()");
		sqlSession.update(namespace + ".projectUpdate", projectDTO);
	}

}
