package kr.or.ddit.sms;

import lombok.Data;

@Data
public class SmsVO { 
	private int smsCd; //문자번호
	private String smsCont; //문자내용
	private String smsSdDate;  //문자발송일
	private String paNo;  //환자번호
	private String paPh; //환자 연락처
	private String paName; //환자이름
}
