package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.Scrap_projectDTO;
import com.itwillbs.domain.Scrap_resumeDTO;

@Repository
public class ProjectDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.ProjectMapper";
	
	public int getProjectCount() {
		System.out.println("ProjectDAO getProjectCount()");
		
		return sqlSession.selectOne(namespace + ".getProjectCount");
	}//getProjectCount()
	
	public ProjectDTO getProject(int p_num) {
		System.out.println("ProjectDAO getProject()");
		
		return sqlSession.selectOne(namespace+".getProject", p_num);
	}//getProject()


	public MemberDTO getMember(int p_num) {
		System.out.println("ProjectDAO getMember()");
		
		return sqlSession.selectOne(namespace+".getMember", p_num);
	}//getMember()
	
	public int getProjectMaxNum() {
		System.out.println("ProjectDAO getProjectMaxNum()");
		return sqlSession.selectOne(namespace + ".getProjectMaxNum");
	}//getProjectMaxNum()

	public List<ProjectDTO> getProjectBoardList(PageDTO pageDTO) {
		System.out.println("ProjectDAO getProjectBoardList()");
		return sqlSession.selectList(namespace + ".getProjectBoardList", pageDTO);
	}//getProjectBoardList()
	
	public int getProjectBoardCount(PageDTO pageDTO) {
		System.out.println("ProjectDAO getProjectBoardCount()");
		return sqlSession.selectOne(namespace + ".getProjectBoardCount", pageDTO);
	}//getProjectBoardCount()
	
	public ProjectDTO getProjectBoard(ProjectDTO projectDTO) {
		System.out.println("ProjectDAO getProjectBoard()");
		return sqlSession.selectOne(namespace + ".getProjectBoard", projectDTO);
	}//getProjectBoard()
	
	public void updateProjectReadcount(ProjectDTO projectDTO) {
		System.out.println("ProjectDAO updateProjectReadcount()");
		sqlSession.update(namespace + ".updateProjectReadcount", projectDTO);
	}//updateProjectReadcount()

	public Scrap_projectDTO scrap(Scrap_projectDTO scrap_projectDTO) {
		System.out.println("ProjectDAO scrap()");
		return sqlSession.selectOne(namespace+".scrap", scrap_projectDTO);
	}

	public void insertScrap(Scrap_projectDTO scrap_projectDTO) {
		System.out.println("ProjectDAO insertScrap()");
		sqlSession.insert(namespace+".insertScrap", scrap_projectDTO);

	}

	//글 삭제
	public void projectDelete(ProjectDTO projectDTO) {
		System.out.println("ProjectDAO projectDelete()");
		sqlSession.delete(namespace+".projectDelete", projectDTO);
	}

	public void insertProject(ProjectDTO projectDTO) {
		System.out.println("ProjectDAO insertProject()");
		System.out.println("projectDTO" + projectDTO);
		sqlSession.insert(namespace+".insertProject", projectDTO);
	}

	public void projectUpdate(ProjectDTO projectDTO) {
		System.out.println("ProjectDAO projectUpdate()");
		sqlSession.update(namespace+".projectUpdate", projectDTO);
	}
	
	
	

	
}//class ProjectDAO
