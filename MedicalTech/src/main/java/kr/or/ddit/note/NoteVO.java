package kr.or.ddit.note;

import java.util.Date;

import kr.or.ddit.certificate_order.CtforVO;
import lombok.Data;

@Data
public class NoteVO {
	private String ntCd;	// 소견서 코드
	private Date ntDt;		// 작성 날짜
	private String paNo;	// 환자번호
	private String disCd;	// 질병코드
	private String fileAtchNo; // 통합첨부파일번호
	private String docuCd;	// 문서코드
	private int ctfNo;		// 발행번호
	private int ntPmtPrice;		//납부금액
	private String ntUse;	// 용도
	private String ntView; // 의료소견
	
	// 수납에서 진단서 조회
	private CtforVO ctforVO;
	
	private String ctfGubun;
	private String paAdd1;
	private String paSex;
	private String paName;
	private String paReg;
}
