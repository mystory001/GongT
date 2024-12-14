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

	@Inject // ChattingService 객체를 자동으로 주입
	ChattingService chattingService;

	// 채팅 방
	@GetMapping("/inc/chatting")
	public String chattingbang(HttpServletRequest request, Model model) {
		System.out.println("ChattingController chattingbang()");
		// URL에서 채팅방 번호(c_num)를 받아옴
		int c_num = Integer.parseInt(request.getParameter("c_num"));

		// 해당 채팅방에 속한 메시지 목록을 가져옴
		List<ChatDTO> messageList = chattingService.getMessage(c_num);

		// 채팅방 정보와 메시지 목록을 모델에 추가하여 JSP로 전달
		model.addAttribute("chatDTO", chattingService.getChat(c_num));
		model.addAttribute("messageList", messageList);

		// 채팅 화면으로 이동
		return "/inc/chatting";
	}

	// 채팅 메시지
	@PostMapping("/inc/insertMessagePro")
	public String insertMessagePro(MessageDTO messageDTO) {
		System.out.println("ChattingController insertMessagePro()");
		// 메시지 전송 서비스 호출
		chattingService.insertMessage(messageDTO);
		// 메시지를 보낸 후 다시 채팅방으로 리디렉션
		return "redirect:/inc/chatting?c_num=" + messageDTO.getC_num();
	}

	// 새로운 채팅방을 생성
	@PostMapping("/inc/insertChatPro")
	public String insertChattingPro(ChatDTO chatDTO) {
		System.out.println("ChattingController insertChatPro()");
		// 채팅방이 이미 존재하는지 확인
		List<ChatDTO> chatDTOList = chattingService.checkChat(chatDTO);
		// 채팅방이 없으면 새로운 채팅방을 생성
		if (chatDTOList.isEmpty()) {
			// 새로운 채팅방 생성 후, 해당 채팅방 번호(c_num)를 받아옴
			int c_num = chattingService.insertChat(chatDTO);
			// 채팅방으로 리디렉션
			return "redirect:/inc/chatting?c_num=" + c_num;
		} else {
			// 이미 채팅방이 존재하면 해당 채팅방으로 리디렉션
			ChatDTO chatDTO2 = chatDTOList.get(0);
			return "redirect:/inc/chatting?c_num=" + chatDTO2.getC_num();
		}
	}

	// 매칭이 완료된 후, 매칭 상태를 업데이트
	@PostMapping("/inc/updateMatching")
	public String updateMatching(ChatDTO chatDTO) {
		System.out.println("BoardController updatePro()");
		System.out.println(chatDTO);

		// 매칭 상태를 업데이트하는 서비스 호출
		chattingService.updateMatching(chatDTO);

		// 매칭 완료 후, 종료 화면으로 리디렉션
		return "redirect:/inc/close";
	}

	// 채팅 종료 후 창을 닫는 처리
	@GetMapping("/inc/close")
	public String close() {
		System.out.println("close()");
		// 종료 화면을 반환
		return "/inc/close";
	}

	// 주석 처리된 AJAX 채팅 메시지 전송 처리
	// 이 메소드는 실제 사용되지 않음, AJAX를 통해 메시지를 보내는 방법을 보여줌
//	@PostMapping("/inc/chat")
//	@ResponseBody
//	public String chatMessage(@RequestBody MessageDTO messageDTO) {
//		System.out.println("ChattingController chatMessage()");
//		try {
//			// 메시지를 데이터베이스에 저장
//			chattingService.insertMessage(messageDTO);
//			System.out.println("메시지 보내기 성공");
//			// 성공 메시지 반환
//			return "success";
//		} catch (Exception e) {
//			e.printStackTrace();
//			System.out.println("메시지 보내기 실패");
//			// 실패 메시지 반환
//			return "error";
//		}
//	}
}
