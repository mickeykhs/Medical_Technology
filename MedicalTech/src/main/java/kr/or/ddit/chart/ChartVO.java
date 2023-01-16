package kr.or.ddit.chart;

import java.util.Date;

import lombok.Data;

@Data
public class ChartVO {
	private String chNo;		// 차트번호
	private Date chEndt;		// 작성날짜
	private String chDisCd;		// 질병코드
	private String chCont;		// 차트내용
	private Date chDt;			// 진료날짜
	private int rcpNo;			// 접수번호
	private String paNo;		// 환자번호
	private String empNo;		// 사번
}
