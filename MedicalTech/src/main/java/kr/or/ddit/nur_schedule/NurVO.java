package kr.or.ddit.nur_schedule;

import java.util.Date;

import lombok.Data;

@Data
public class NurVO {
	private String nurCd;   // 출근일정코드
	private Date nurEndt;   // 등록일자
	private String nurEnwt; // 등록자 사번
	private String nurEnnm; //등록자 이름
	private Date nurUpdt;   // 수정일자
	private String empNo;   // 사번
	private String nurUpwt; // 수정자
	private String nurStTm;   // 근무시작시간
	private String nurFiTm;   // 근무 종료시간
	private String empName; //간호사 이름
	private String nurOldStTm; //수정 전 근무 시작 시간
	private String nurOldFiTm; //수정 전 근무  종료 시간
	private String nurTitle; //제목
	private String nurComments; //메모

}
