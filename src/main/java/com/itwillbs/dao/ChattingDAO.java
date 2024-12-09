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
	
	// 채팅방 C 리스트 가져오기
	public List<ChatDTO> chattingBangC(String id) {
		System.out.println("ChattingDAO chattingBangC()");
		
		return sqlSession.selectList(namespace + ".chattingBangC", id);
	}
	
	// 채팅방 F 리스트 가져오기
	public List<ChatDTO> chattingBangF(String id) {
		System.out.println("ChattingDAO chattingBangF()");
		
		return sqlSession.selectList(namespace + ".chattingBangF", id);
	}

	// 메시지 저장(DB에 메시지 삽입)
	public void insertMessage(MessageDTO messageDTO) {
		System.out.println("ChattingDAO insertMember()");
		System.out.println(messageDTO.getId());
		sqlSession.insert(namespace+".insertMessage",messageDTO); // MessageDTO 객체를 DB에 삽입
	}

	// 매칭 업데이트
	public void updateMatching(ChatDTO chatDTO) {
		System.out.println("ChattingDAO updateMatching()");
		// 매칭 정보를 DB에 업데이트
		sqlSession.update(namespace+".updateMatching", chatDTO);
		sqlSession.update(namespace+".updateMatchingF", chatDTO);
		sqlSession.update(namespace+".updateMatchingC", chatDTO);
	}

	// 특정 채팅방 정보 가져오기
	public ChatDTO getChat(int c_num) {
		System.out.println("ChattingDAO getChat()");
		
		return sqlSession.selectOne(namespace+".getChat", c_num);
	}

	// 채팅방에 포함된 메시지들 가져오기
	public List<ChatDTO> getMessage(int c_num) {
		System.out.println("ChattingDAO getMessage()");
		
		return sqlSession.selectList(namespace+".getMessage", c_num);
	}

	// 채팅방 생성(새로운 채팅방 삽입)
	public int insertChat(ChatDTO chatDTO) {
		System.out.println("ChattingDAO insertChat()");
		sqlSession.insert(namespace+".insertChat", chatDTO);
		ChatDTO chatDTO2 = sqlSession.selectOne(namespace+".getChatDTO", chatDTO);
		
		return chatDTO2.getC_num();
	}
	
	// 채팅방 존재 여부 확인
	public List<ChatDTO> checkChat(ChatDTO chatDTO) {
		System.out.println("ChattingDAO checkChat()");
		
		return sqlSession.selectList(namespace+".getChatDTO", chatDTO);
	}

}