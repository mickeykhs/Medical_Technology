package kr.or.ddit.mapper;

public interface ChatMapper {

	// 채팅 알림수 Update
	public int chatCntUdt(int chatCnt);
	
	// 채팅 알림수 Select
	public int chatCntSel();
}
