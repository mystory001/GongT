package com.itwillbs.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.converter.MappingJackson2MessageConverter;
import org.springframework.messaging.converter.MessageConverter;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.invocation.HandlerMethodArgumentResolver;
import org.springframework.messaging.handler.invocation.HandlerMethodReturnValueHandler;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.config.ChannelRegistration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketTransportRegistration;

import com.itwillbs.domain.ChatDTO;

import com.itwillbs.domain.MessageDTO;
import com.itwillbs.service.ChattingService;


@Controller
public class ChattingController {
	
	/* 241209 WebSocket
	 * 1. WebSocket 설정 : WebSocket 설정을 포함하여 STOMP 메시징을 사용할 수 있도록 @EnableWebSocketMessageBroker와 관련 설정을 추가
	 * 2. WebSocket 엔드 포인트 추가 : 클라이언트와 연결되는 엔드포인트(/chatting)을 설정
	 * 3. 실시간 메시지 전송 : SimpMessaginTemplate을 사용하여 클라이언트에게 실시간으로 메시지를 전달하는 기능 추가
	 */
	

	// 채팅 서비스 객체를 주입받음(채팅과 관련된 비즈니스 로직 처리)
	@Inject
	ChattingService chattingService;
	
	// 메시지 전송을 위한 SimpMessagingTemplate 객체(WebSocket 메시지 전송)
	@Inject // @Autowired를 사용해도 됨
	private SimpMessagingTemplate messagingTemplate; // WebSocket 메시지 송수신을 위한 객체. 클라이언트에게 실시간으로 메시지를 전달하는 데 사용
	
	// 채팅방
	@GetMapping("/inc/chatting")
	public String chattingbang(HttpServletRequest request, Model model) {
		System.out.println("ChattingController chatting()");
		int c_num = Integer.parseInt(request.getParameter("c_num")); // URL 파라미터로 전달된 c_num(채팅방 번호) 추출
		List<ChatDTO> messageList = chattingService.getMessage(c_num); // 채팅방의 메시지 목록을 조회
		
		// 채팅방 정보를 모델에 추가
		model.addAttribute("chatDTO", chattingService.getChat(c_num));
		model.addAttribute("messageList",messageList);
		
		return "/inc/chatting";
	}

	
	// 채팅 메세지
//	@PostMapping("/inc/insertMessagePro")
//	public String insertMessagePro(MessageDTO messageDTO) {
//		System.out.println("ChattingController insertMessagePro()");
//		chattingService.insertMessage(messageDTO);
//		return "redirect:/inc/chatting?c_num="+messageDTO.getC_num();
//	}//insertMessagePro()
	
	// 채팅 메시지를 DB에 저장하고, 실시간으로 WebSocket을 통해 전송
	이 부분을 수정해야함
	@PostMapping("/inc/insertMessagePro")
	public String insertMessagePro(MessageDTO messageDTO) {
	    System.out.println("ChattingController insertMessagePro()");

	    chattingService.insertMessage(messageDTO); // 메시지 DB에 저장

	    messagingTemplate.convertAndSend("/topic/messages/" + messageDTO.getC_num(), messageDTO); // 실시간 메시지 전송(WebSocket으로 전송)
	    
	    //응답 데이터를 Map 형태로 변환
	    Map<String, Object> response = new HashMap<>();
	    response.put("status", "success");  // 상태
	    response.put("message", "Message sent successfully");  // 응답 메시지
	    response.put("c_num", messageDTO.getC_num());  // 채팅 번호 (추후에 사용할 수 있도록 반환)
	    
	    System.out.println(response);
	    return "redirect:/inc/chatting?c_num" + messageDTO.getC_num();  // JSON 형태로 반환
	}

	// 채팅방을 생성
	@PostMapping("/inc/insertChatPro")
	public String insertChattingPro(ChatDTO chatDTO) {
		System.out.println("ChattingController insertChatPro()");
		List<ChatDTO> chatDTOList = chattingService.checkChat(chatDTO);
		
		// 새로운 채팅방 생성
		if(chatDTOList.isEmpty()) {
		int c_num = chattingService.insertChat(chatDTO);
		return "redirect:/inc/chatting?c_num=" + c_num; // 생성된 채팅방으로 리다이렉트
		} else {
			ChatDTO chatDTO2 =  chatDTOList.get(0);
			return "redirect:/inc/chatting?c_num="+chatDTO2.getC_num(); // 이미 생성된 채팅방으로 리다이렉트
		}
	}
	
	// 특정 채팅방의 메시지 목록을 가져오는 메소드
	@GetMapping("/getMessage")
	@ResponseBody
	public List<MessageDTO> getMessage(@RequestParam("c_num") int c_num) {
		System.out.println("ChattingController getMessage()"); 
	    try {
	    	// 채팅방 번호에 해당하는 메시지 목록 조회
	        List<ChatDTO> chatDTOList = chattingService.getMessage(c_num); // 메시지 조회
	        
	        // 메시지 DTO로 변환
	        List<MessageDTO> messageDTOList = new ArrayList<>();
	        for (ChatDTO chatDTO : chatDTOList) {
	            MessageDTO messageDTO = new MessageDTO();
	            messageDTO.setC_num(chatDTO.getC_num());
	            messageDTO.setId(chatDTO.getId());
	            messageDTO.setC_content(chatDTO.getC_content());
	            messageDTO.setC_time(chatDTO.getC_time());
	            messageDTOList.add(messageDTO);
	        }
	        return messageDTOList; // 메시지 목록 반환
	    } catch (Exception e) {
	        e.printStackTrace();
	        return new ArrayList<>();  // 예외 발생 시 빈 리스트 반환
	    } 
	}
	
	// 매칭 완료 후 상태 업데이트
	@PostMapping("/inc/updateMatching")
	public String updateMatching(ChatDTO chatDTO) {
		System.out.println("BoardController updatePro()");
		System.out.println(chatDTO);
		
		chattingService.updateMatching(chatDTO); // 매칭 완료 상태로 업데이트
		
		return "redirect:/inc/close"; // 매칭 완료 후 리다이렉트
	}
	
	//채팅 종료(채팅 종료 후 페이지 이동)
	@GetMapping("/inc/close")
	public String close() {
		System.out.println("close()");
		
		return "/inc/close";
	}

	//WebSocket을 통해 메시지를 수신하고 처리하는 메소드
	@MessageMapping("/chat")
	public void sendMessage(MessageDTO messageDTO) { // WebSocket을 통해 클라이언트가 보낸 메시지를 다른 클라이언트에게 실시간을 전송
		System.out.println("받은 메시지 : " + messageDTO);
		messagingTemplate.convertAndSend("topic/messages/" + messageDTO.getC_num(), messageDTO); // 메시지를 해당 채팅방에 구독 중인 모든 클라이언트에게 전송
	}
	
	// WebSocket 관련 설정을 담당하는 클래스
	@Configuration
	@EnableWebSocketMessageBroker
	public static class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

	    // 메시지 브로커 설정
	    @Override
	    public void configureMessageBroker(MessageBrokerRegistry config) {
	        config.enableSimpleBroker("/topic", "/queue");  // "/topic"과 "/queue"를 메시지 브로커로 전달
	        config.setApplicationDestinationPrefixes("/app");  // 클라이언트에서 요청하는 접두사 설정 ("/app"으로 시작하는 요청은 애플리케이션 처리)
	    }

	    // WebSocket 엔드포인트 등록
	    @Override
	    public void registerStompEndpoints(StompEndpointRegistry registry) {
	        registry.addEndpoint("/chatting").withSockJS();  // "/chatting" 엔드포인트로 WebSocket 연결을 허용 (SockJS 사용)
	    }
	    
	    // 메시지 변환기 설정 (기본 메시지 변환기 설정)
	    @Override
	    public boolean configureMessageConverters(List<MessageConverter> messageConverters) {
	        messageConverters.add(new MappingJackson2MessageConverter()); // Jackson을 사용하여 JSON 메시지 변환
	        return true; // true를 반환하여 변환기가 추가되었음을 알림
	    }
	    
	    // 아래 메소드 (빈 메서드로 구현)
		@Override
		public void configureWebSocketTransport(WebSocketTransportRegistration registry) {
			// TODO Auto-generated method stub
			
		}

		@Override
		public void configureClientInboundChannel(ChannelRegistration registration) {
			// TODO Auto-generated method stub
			
		}

		@Override
		public void configureClientOutboundChannel(ChannelRegistration registration) {
			// TODO Auto-generated method stub
			
		}

		@Override
		public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
			// TODO Auto-generated method stub
			
		}

		@Override
		public void addReturnValueHandlers(List<HandlerMethodReturnValueHandler> returnValueHandlers) {
			// TODO Auto-generated method stub
			
		}
		// 아래 끝
	}
	
}

