package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ChattingDAO;

import com.itwillbs.domain.ChatDTO;

import com.itwillbs.domain.MessageDTO;
@Service
public class ChattingService {

	@Inject
	private ChattingDAO chattingDAO;
	
	// 채팅방 C 리스트 가져오기
	public List<ChatDTO> chattingBangC(String id) {
		System.out.println("ChattingService ChattingBangC()");
		return chattingDAO.chattingBangC(id);
	}
	
	// 채팅방 F 리스트 가져오기
	public List<ChatDTO> chattingBangF(String id) {
		System.out.println("ChattingService chattingBangF()");
		return chattingDAO.chattingBangF(id);
	}

	// 메시지 저장
	public void insertMessage(MessageDTO messageDTO) {
		System.out.println("ChattingService insertMessage()");
		// 유효성 검사
	    if (messageDTO == null || messageDTO.getC_num() <= 0 || messageDTO.getId() == null || messageDTO.getC_content().isEmpty()) {
	        throw new IllegalArgumentException("유효하지 않은 데이터");
	    }
	    
	    try {
	    	chattingDAO.insertMessage(messageDTO); // 메시지를 데이터베이스에 저장
	    	messagingTemplate.convertAndSend("/topic/messages/"+messageDTO.getC_num(), messageDTO); // WebSocket을 통해 실시간으로 메시지를 해당 채팅방에 전송
		} catch (Exception e) {
			throw new RuntimeException();
		}
		
		// 메시지를 데이터베이스에 저장한 후, messaginTemplate.convertAndSend() 메소드를 호출하여 특정 채팅방에 대한 메시지를 실시간으로 WebSocket을 통해 전송
		// 메시지는 /topic/messages/{c_num} 경로로 전송. 이 경로는 클라이언트에서 해당 채팅방을 구독하도록 설정한 경로와 일치해야 함.
	}

	// 매칭 업데이트
	public void updateMatching(ChatDTO chatDTO) {
		System.out.println("BoardService updateBoard()");
		chattingDAO.updateMatching(chatDTO);
	}
	
	// 채팅 정보 가져오기
	public ChatDTO getChat(int c_num) {
		System.out.println("ChattingService getChat()");
		ChatDTO chatDTO = chattingDAO.getChat(c_num);
		// 유효성 검사
		if (chatDTO == null) { 
	        throw new IllegalStateException("Chat room not found for c_num: " + c_num);
	    }
		return chattingDAO.getChat(c_num);
	}

	// 메시지 리스트 가져오기
	public List<ChatDTO> getMessage(int c_num) {
		System.out.println("ChattingService getMessage()");
		return chattingDAO.getMessage(c_num);

	}

	// 채팅방 생성
	public int insertChat(ChatDTO chatDTO) {
		System.out.println("ChattingService insertChat()");
		return chattingDAO.insertChat(chatDTO);
	}

	// 채팅방 존재 여부 확인
	public List<ChatDTO> checkChat(ChatDTO chatDTO) {
		System.out.println("ChattingService checkChat()");
		return chattingDAO.checkChat(chatDTO);
	}
	
}