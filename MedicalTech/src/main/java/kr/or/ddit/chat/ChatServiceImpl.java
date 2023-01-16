package kr.or.ddit.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ChatMapper;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	ChatMapper chatMapper;

	// 채팅 알림수 Update
	@Override
	public int chatCntUdt(int chatCnt) {
		return this.chatMapper.chatCntUdt(chatCnt);
	}
	
	// 채팅 알림수 Select
	@Override
	public int chatCntSel() {
		return this.chatMapper.chatCntSel();
	};
}
