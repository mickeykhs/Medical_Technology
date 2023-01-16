package kr.or.ddit.pre_record;
import java.util.Date;

import lombok.Data;

@Data
public class PrVO {
	private String prCd; //처방내역코드
	private String prMemo; //진료메모
	private Date prEndt; //등록일자
	private Date prUpdt; //수정일자
	private String chNo; //차트번호
	private String drCd; //약품코드
	private String prShot; //1회 투여량
	private int prCnt; //1회 투여횟수
	private Date prDays; //투약 일수
	private String prUse; //용법
	private int useQty;
}
