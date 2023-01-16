package kr.or.ddit.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	@GetMapping("/chat")
	public String chat() {
		return "chat/chat";
	}
	
	@ResponseBody
	@PostMapping("/cntUpt")
	public int cntUpt(@RequestBody ChatVO chatVO) {
		log.info("chatCnt : " + chatVO.getChatCnt());
		
		int result = this.chatService.chatCntUdt(chatVO.getChatCnt());
		log.info("result : " + result);		
		
		return result;
	}
	
	@ResponseBody
	@GetMapping("/cntSel")
	public int cntSel() {
		
		int result = this.chatService.chatCntSel();
		
		return result;
	}
}	
