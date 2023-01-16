package kr.or.ddit.drug_order;

import java.util.Date;

import lombok.Data;

@Data
public class DrorVO { //약품주문
	private int drorSeq;		//주문 순서
	private String drorCd;		//NN 주문요청번호
	private int drorPrice;		//단가
	private int drorQty;		//주문수량
	private String drorGubun;	//구분
	private Date drorOrdt;		//주문일자
	private String idtReqNur;	//NN 주문요청간호사
	private String drCd;		//NN 약품코드
								
	/////
	private String empName; //직원 이름
	private String dsdName; //약품명
	private String dsdCom; //제조업체
}
