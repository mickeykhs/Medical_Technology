package kr.or.ddit.diagnosis;

import java.util.Date;

import kr.or.ddit.certificate_order.CtforVO;
import lombok.Data;

@Data
public class DiaVO {
	private String diaCd;	// 진단서코드 (PK)
	private String chDocnm;	// 담당의사명
	private Date diaDt;		// 발병일
	private String paNo;	// 환자번호
	private String disCd;	// 질병코드
	private String docuCd;	// 문서코드
	private int ctfNo;		// 발행번호
	private int diaPmtPrice;  // 납부금액
	private String diaCont; // 진단서내용
	private String diaUse; // 진단서 용도
	private Date diaEndt;  // 작성날짜
	// 수납에서 진단서 조회
	private CtforVO ctforVO;
	
	private String ctfGubun;
	private String paAdd1;
	private String paSex;
	private String paName;
	private String paReg;
}
