package kr.or.ddit.drugapi;

import lombok.Data;

@Data
public class DrgVO {
	private String drCd;
	private String drAmt;
	private int drCnt;
	private String drCom;
	private String drName;
	private String drUse;
	private int drQty;
	private int drPrice;
}
