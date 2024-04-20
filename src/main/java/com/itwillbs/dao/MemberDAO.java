package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ChatDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.ResumeDTO;
import com.itwillbs.domain.Scrap_projectDTO;
import com.itwillbs.domain.Scrap_resumeDTO;

@Repository
public class MemberDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.MemberMapper";
	

	//회원가입
		public void insertMember(MemberDTO memberDTO) {
			System.out.println("MemberDAO insertMember()");
			System.out.println(memberDTO.getId());
			//Company_num의 값이 null이 아니면 Member_type을 1로 지정하여 기업회원으로 구분
			if(memberDTO.getComnum() != null) {
				memberDTO.setType(1);
			} else {
				memberDTO.setType(0);
			}
			System.out.println(memberDTO.getComnum());
			sqlSession.insert(namespace+".insertMember",memberDTO);
		}

		//아이디 찾기
		public MemberDTO userCheckID(MemberDTO memberDTO) {
			System.out.println("MemberDAO userCheckID()");
			return sqlSession.selectOne(namespace+".userCheckID", memberDTO);
		}

		public MemberDTO userCheckPW(MemberDTO memberDTO) {
			System.out.println("MemberDAO userCheckPW()");
			return sqlSession.selectOne(namespace+".userCheckPW", memberDTO);
		}

		public MemberDTO getMember(String id) {
			System.out.println("MemberDAO  getMember()");
			return sqlSession.selectOne(namespace+".getMember", id);
		}
		
		//사업자번호 중복 확인
		public MemberDTO getComNum(String comnum) {
			System.out.println("MemberDAO getComNum()");
			return sqlSession.selectOne(namespace+".getComNum", comnum);
		}

		//이메일 중복 확인
		public MemberDTO getEmail(String email) {
			System.out.println("MemberDAO getEmail()");
			return sqlSession.selectOne(namespace+".getEmail", email);
		}

		//전화번호 중복확인
		public MemberDTO getPhone(String phone) {
			System.out.println("MemberDAO getPhone()");
			return sqlSession.selectOne(namespace+".getPhone", phone);
		}
		
		
	
	public int getCompanyCount() {
		System.out.println("CompanyDAO getCompanyCount()");
		
		return sqlSession.selectOne(namespace + ".getCompanyCount");
	}//getCompanyCount()
	
	public int getMatchingCount() {
		System.out.println("MemberDAO getMatchingCount()");
		
		return sqlSession.selectOne(namespace + ".getMatchingCount");
	}//getMatchingCount()
	

	
	public MemberDTO userCheck(MemberDTO memberDTO) {
		System.out.println("MemberDAO userCheck()");
		
		return sqlSession.selectOne(namespace + ".userCheck", memberDTO);
	}//userCheck()
	
	
	public void updateMember(MemberDTO memberDTO) {
		System.out.println("MemberDAO updateMember()");
		
		sqlSession.update(namespace + ".updateMember", memberDTO);
	}//updateMember()
	

	public List<ProjectDTO> projectCheck(String id) {
		System.out.println("MemberDAO projectCheck()");
		
		return sqlSession.selectList(namespace + ".projectCheck", id);
	}//projectCheck()
	
	public List<Scrap_resumeDTO> resumeScrap(String id) {
		System.out.println("MemberDAO resumeScrap()");
		
		return sqlSession.selectList(namespace + ".resumeScrap", id);
	}//resumeScrap()
	
	
	public List<Scrap_projectDTO> projectScrap(String id) {
		System.out.println("MemberDAO projectScrap()");
		
		return sqlSession.selectList(namespace + ".projectScrap", id);
	}//projectScrap()
	
	public void deleteMember(MemberDTO memberDTO) {
		System.out.println("MemberService deleteMember()");
		
		sqlSession.delete(namespace+".deleteMember" , memberDTO);
	}//deleteMember()
	
	public List<ResumeDTO> resumeCheck(String id) {
		System.out.println("MemberDAO resumeCheck()");
		
		return sqlSession.selectList(namespace + ".resumeCheck", id);
	}//resumeCheck()

	public List<MemberDTO> insertCheck(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".insertCheck", memberDTO);
	}//insertCheck()
	
//	public List<ChatDTO> ChattingCheck(String id) {
//		System.out.println("MemberDAO ChattingCheck()");
//		
//		return sqlSession.selectList(namespace + ".ChattingCheck", id);
//	}//ChattingCheck()
	
}
