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

	// 채팅방 기업 리스트 가져오기
	public List<ChatDTO> chattingBangC(String id) {
		System.out.println("ChattingService ChattingBangC()");

		return chattingDAO.chattingBangC(id);
	}

	// 채팅방 프리랜서 리스트 가져오기
	public List<ChatDTO> chattingBangF(String id) {
		System.out.println("ChattingService ChattingBangF()");

		return chattingDAO.chattingBangF(id);
	}

	// 메시지 저장
	public void insertMessage(MessageDTO messageDTO) {
		System.out.println("ChattingService insertMessage()");
		chattingDAO.insertMessage(messageDTO);
	}

	// 매칭 업데이트
	public void updateMatching(ChatDTO chatDTO) {
		System.out.println("BoardService updateBoard()");

		chattingDAO.updateMatching(chatDTO);
	}

	// 채팅 정보 가져오기
	public ChatDTO getChat(int c_num) {
		System.out.println("ChattingService getChat()");

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