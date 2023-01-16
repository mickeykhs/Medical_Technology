package kr.or.ddit.chat;

public interface ChatService {

	// 채팅 알림수 Update
	public int chatCntUdt(int chatCnt);

	// 채팅 알림수 Select
	public int chatCntSel();
}
