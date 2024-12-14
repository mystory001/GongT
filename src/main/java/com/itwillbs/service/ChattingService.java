package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ChattingDAO;

import com.itwillbs.domain.ChatDTO;

import com.itwillbs.domain.MessageDTO;

@Service
public class ChattingService {

	@Inject // ChattingDAO 객체를 자동으로 주입
	private ChattingDAO chattingDAO;

	// 채팅방 기업 리스트 가져오기
	public List<ChatDTO> chattingBangC(String id) {
		System.out.println("ChattingService ChattingBangC()");
		// 기업 ID에 해당하는 채팅방 리스트를 데이터베이스에서 가져옴
		return chattingDAO.chattingBangC(id);
	}

	// 채팅방 프리랜서 리스트 가져오기
	public List<ChatDTO> chattingBangF(String id) {
		System.out.println("ChattingService ChattingBangF()");
		// 프리랜서 ID에 해당하는 채팅방 리스트를 데이터베이스에서 가져옴
		return chattingDAO.chattingBangF(id);
	}

	// 메시지 저장
	public void insertMessage(MessageDTO messageDTO) {
		System.out.println("ChattingService insertMessage()");
		// 메시지를 데이터베이스에 저장
		chattingDAO.insertMessage(messageDTO);
	}

	// 매칭 상태 업데이트
	public void updateMatching(ChatDTO chatDTO) {
		System.out.println("BoardService updateBoard()");
		// 채팅방의 매칭 상태를 업데이트
		chattingDAO.updateMatching(chatDTO);
	}

	// 채팅방 정보 가져오기
	public ChatDTO getChat(int c_num) {
		System.out.println("ChattingService getChat()");
		// 채팅방 번호(c_num)에 해당하는 채팅방 정보를 데이터베이스에서 가져옴
		return chattingDAO.getChat(c_num);
	}

	// 채팅방 메시지 리스트 가져오기
	public List<ChatDTO> getMessage(int c_num) {
		System.out.println("ChattingService getMessage()");
		// 채팅방 번호(c_num)에 해당하는 메시지 리스트를 데이터베이스에서 가져옴
		return chattingDAO.getMessage(c_num);
	}

	// 채팅방 생성
	public int insertChat(ChatDTO chatDTO) {
		System.out.println("ChattingService insertChat()");
		// 새로운 채팅방을 생성하고 해당 채팅방 번호를 반환
		return chattingDAO.insertChat(chatDTO);
	}

	// 채팅방 존재 여부 확인
	public List<ChatDTO> checkChat(ChatDTO chatDTO) {
		System.out.println("ChattingService checkChat()");
		// 주어진 채팅방 정보에 해당하는 채팅방이 존재하는지 확인
		return chattingDAO.checkChat(chatDTO);
	}

}