package kr.or.ddit.re_sms;

import lombok.Data;

@Data
public class ResVO {
	private int reNo; //예약문구 seq
	private String reTitle; //예약문구 제목
	private String reCont;  //예약문구 내용
}
