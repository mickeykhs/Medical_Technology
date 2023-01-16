package kr.or.ddit.certificate_order;

import java.util.Date;

import lombok.Data;


@Data
public class CtforVO {
	private String ctfState;
	private String ctfName;
	private int ctfNo;
	private String prCd;
	private String ctfDname;
	private Date ctfDisdt;
	private Date ctfDiadt;
	private String ctfPast;
	private String ctfGubun;
	private String ctfTestemr;
	private String ctfEndt;
	private String ctfWt;
	private Date ctfUpdt;

	private String empName;
	private String paNo;
	
}
