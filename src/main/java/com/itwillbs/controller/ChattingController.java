package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwillbs.domain.ChatDTO;

import com.itwillbs.domain.MessageDTO;
import com.itwillbs.service.ChattingService;

@Controller
public class ChattingController {

	@Inject
	ChattingService chattingService;

	// 채팅 방
	@GetMapping("/inc/chatting")
	public String chattingbang(HttpServletRequest request, Model model) {
		System.out.println("ChattingController chattingbang()");
		int c_num = Integer.parseInt(request.getParameter("c_num"));
		List<ChatDTO> messageList = chattingService.getMessage(c_num);

		model.addAttribute("chatDTO", chattingService.getChat(c_num));
		model.addAttribute("messageList", messageList);

		return "/inc/chatting";
	}

	// 채팅 메세지
	@PostMapping("/inc/insertMessagePro")
	public String insertMessagePro(MessageDTO messageDTO) {
		System.out.println("ChattingController insertMessagePro()");
		chattingService.insertMessage(messageDTO);
		return "redirect:/inc/chatting?c_num=" + messageDTO.getC_num();
	}

	@PostMapping("/inc/insertChatPro")
	public String insertChattingPro(ChatDTO chatDTO) {
		System.out.println("ChattingController insertChatPro()");
		List<ChatDTO> chatDTOList = chattingService.checkChat(chatDTO);
		if (chatDTOList.isEmpty()) {
			int c_num = chattingService.insertChat(chatDTO);
			return "redirect:/inc/chatting?c_num=" + c_num;
		} else {
			ChatDTO chatDTO2 = chatDTOList.get(0);
			return "redirect:/inc/chatting?c_num=" + chatDTO2.getC_num();
		}

	}

	// 매칭 완료
	@PostMapping("/inc/updateMatching")
	public String updateMatching(ChatDTO chatDTO) {
		System.out.println("BoardController updatePro()");
		System.out.println(chatDTO);

		chattingService.updateMatching(chatDTO);

		return "redirect:/inc/close";
	}

	// 창닫기
	@GetMapping("/inc/close")
	public String close() {
		System.out.println("close()");
		return "/inc/close";
	}

}