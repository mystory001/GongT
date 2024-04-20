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
	
	public List<ChatDTO> ChattingBangC(String id) {
		System.out.println("ChattingService ChattingBangC()");
		
		return chattingDAO.ChattingBangC(id);
	}//ChattingBang()
	
	public List<ChatDTO> ChattingBangF(String id) {
		System.out.println("ChattingService ChattingBangF()");
		
		return chattingDAO.ChattingBangF(id);
	}//ChattingBang()
	

	public void insertMessage(MessageDTO messageDTO) {
		System.out.println("ChattingService insertMessage()");
		chattingDAO.insertMessage(messageDTO);
	}//insertMessage()


	public void updateMatching(ChatDTO chatDTO) {
		System.out.println("BoardService updateBoard()");
		
		chattingDAO.updateMatching(chatDTO);
	}
	
	public ChatDTO getChat(int c_num) {
		System.out.println("ChattingService getChat()");
		return chattingDAO.getChat(c_num);
	}//getChat()

	
	public List<ChatDTO> getMessage(int c_num) {
		System.out.println("ChattingService getMessage()");
		return chattingDAO.getMessage(c_num);

	}//getMessage()

	public int insertChat(ChatDTO chatDTO) {
		System.out.println("ChattingService insertChat()");
		return chattingDAO.insertChat(chatDTO);
	}//insertChat()

	public List<ChatDTO> checkChat(ChatDTO chatDTO) {
		System.out.println("ChattingService checkChat()");
		return chattingDAO.checkChat(chatDTO);
	}//checkChat()
	
}
