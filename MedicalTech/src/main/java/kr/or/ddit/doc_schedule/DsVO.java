package kr.or.ddit.doc_schedule;

import java.util.Date;

import lombok.Data;



@Data
public class DsVO {
	private String dsNo;  //진료일정번호 PK
	private Date dsDt;  //진료일
	private String docCd; //진료실코드 FK
	private String dsStTm; //진료시작
	private String dsFiTm; //진료종료
	private String dsMemo; //증상메모
	private String dsUpwt; //수정자
	private Date dsUpdt; //수정일자
	private String dsWt; //등록자
	private Date dsEndt; //등록일자
	private String empNo; //사번
	private String paNo; //환자번호 FK
	private String paName; // 환자이름
	private String DsOldStTm;
	private String DsOldFiTm;
	private String dsAllday;
	private String empName; //직원 이름ㄴ
}
