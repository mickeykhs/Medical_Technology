package kr.or.ddit.drug_stock_detail;

import java.util.Date;

import lombok.Data;


@Data
public class DrsdVO { //약품재고상세
	private String drCd; 	  //NN 약품코드
	private int dsdQty;	     //재고수량
	private int dsdPrice; 	 //단가
	private String dsdGubun; //구분
	private String dsdName;  //약품명
	private Date dsdOrdt;    //주문일자
	private Date dsdIndt;    //입고일자
	private Date dsdEndt;    //등록일자
	private Date dsdUpdt;    //수정일자
	private String dsdCom;   //제조업체
	private String dsdStkNur; //NN
	private int dsdMsQty;
}
