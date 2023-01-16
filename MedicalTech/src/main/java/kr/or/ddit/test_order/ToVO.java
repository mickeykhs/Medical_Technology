package kr.or.ddit.test_order;

import java.util.Date;

import lombok.Data;

//검사, 주사, 내복
@Data
public class ToVO {
	private String olCd;
	private String toDisCd;
	private String olActCd;
	private String chNo;
	private String toOrNo;
	private String toGubun;
	private String paNo;
	private String prShot;
	private String prCnt;
	private String toState;
	private String toExamArea; // 검사부위
	private String drName; //약품이름 
	private int drQty; //약품수량
	private Date paFiviDt; //마지막 방문일
}
