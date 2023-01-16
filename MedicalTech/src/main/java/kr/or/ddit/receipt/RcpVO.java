package kr.or.ddit.receipt;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class RcpVO {
	private String paNo;
	private String docCd;
	private String rcpMemo;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private String rcpTm;
	
	private int rcpNo;
	
	private String rcpFv;
	private String rcpMe;
	
	private int num;
	private String docNo;
	private String empNo;
	private String paName;
	private String paReg;
	private String paTrmr;
	
	private String Y;
	private String N;
	
	
}
