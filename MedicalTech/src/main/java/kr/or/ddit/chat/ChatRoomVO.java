package kr.or.ddit.chat;

import java.util.Date;

import lombok.Data;

@Data
public class ChatRoomVO {

	private int no;
	private String name;
	private String chatuser1;
	private String chatuser2;
	private Date chatroomdate;
	private int user1alert;
	private int user2alert;
	private int user1join;
	private int user2join;
	private String username1;
	private String username2;
}
