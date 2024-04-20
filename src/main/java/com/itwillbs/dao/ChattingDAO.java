package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ChatDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.MessageDTO;

@Repository
public class ChattingDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.ChatMapper";
	
	
	public List<ChatDTO> ChattingBangC(String id) {
		System.out.println("ChattingDAO ChattingBangC()");
		
		return sqlSession.selectList(namespace + ".ChattingBangC", id);
	
	}//ChattingCheck()
	
	public List<ChatDTO> ChattingBangF(String id) {
		System.out.println("ChattingDAO ChattingBangF()");
		
		return sqlSession.selectList(namespace + ".ChattingBangF", id);
	
	}//ChattingCheck()
	

	
	public void insertMessage(MessageDTO messageDTO) {
		System.out.println("ChattingDAO insertMember()");
		System.out.println(messageDTO.getId());
	

		sqlSession.insert(namespace+".insertMessage",messageDTO);
	}//insertMessage()



	
	public void updateMatching(ChatDTO chatDTO) {
		System.out.println("ChattingDAO updateMatching()");
		
		sqlSession.update(namespace+".updateMatching", chatDTO);
		sqlSession.update(namespace+".updateMatchingF", chatDTO);
		sqlSession.update(namespace+".updateMatchingC", chatDTO);
	}



	
	public ChatDTO getChat(int c_num) {
		System.out.println("ChattingDAO getChat()");
		return sqlSession.selectOne(namespace+".getChat", c_num);
	}//getChat()

	
	public List<ChatDTO> getMessage(int c_num) {
		System.out.println("ChattingDAO getMessage()");
		return sqlSession.selectList(namespace+".getMessage", c_num);
	}//getMessage()

	
	public int insertChat(ChatDTO chatDTO) {
		System.out.println("ChattingDAO insertChat()");
		sqlSession.insert(namespace+".insertChat", chatDTO);
		ChatDTO chatDTO2 = sqlSession.selectOne(namespace+".getChatDTO", chatDTO);
		return chatDTO2.getC_num();
	}//insertChat()
	
	public List<ChatDTO> checkChat(ChatDTO chatDTO) {
		System.out.println("ChattingDAO checkChat()");
		return sqlSession.selectList(namespace+".getChatDTO", chatDTO);
	}//checkChat()

}//class ChattingDAO

