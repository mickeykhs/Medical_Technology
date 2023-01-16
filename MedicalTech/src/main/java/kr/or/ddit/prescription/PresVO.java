package kr.or.ddit.prescription;

import java.util.Date;

import lombok.Data;

@Data
public class PresVO {
	private String preCd;	// 원외처방전코드
	private String paNo;	// 환자번호
	private int ctfNo;		// 발행번호
	private String docuCd;	// 문서코드
	private Date resDt;		// 작성날짜
	private String preShot;
	private String preCnt;
	private String preDays;
	private String drCd;
	
	private String ctfGubun;
	private String paName;
	private String paReg;
	private String drName;
}
