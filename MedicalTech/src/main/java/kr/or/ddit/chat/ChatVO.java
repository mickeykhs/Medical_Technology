package kr.or.ddit.chat;

import java.util.Date;

import lombok.Data;

@Data
public class ChatVO {
	
	private int chaNo;
	private String chaCont;
	private Date chaDt;
	private String empNo;
	private int crNo;
	private int chatCnt;
}
