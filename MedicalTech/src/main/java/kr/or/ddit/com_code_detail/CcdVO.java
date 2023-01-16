package kr.or.ddit.com_code_detail;

import java.util.Date;

public class CcdVO {
	private String ccdCd;
	private String ccdName;
	private String ccdCont;
	private String ccdYn;
	private int ccdSeq;
	private Date ccdIndt;
	private String ccdInid;
	private Date ccdUpdt;
	private String ccdUpid;
	private String ccCd;

	public CcdVO() {
	}

	public String getCcdCd() {
		return ccdCd;
	}

	public void setCcdCd(String ccdCd) {
		this.ccdCd = ccdCd;
	}

	public String getCcdName() {
		return ccdName;
	}

	public void setCcdName(String ccdName) {
		this.ccdName = ccdName;
	}

	public String getCcdCont() {
		return ccdCont;
	}

	public void setCcdCont(String ccdCont) {
		this.ccdCont = ccdCont;
	}

	public String getCcdYn() {
		return ccdYn;
	}

	public void setCcdYn(String ccdYn) {
		this.ccdYn = ccdYn;
	}

	public int getCcdSeq() {
		return ccdSeq;
	}

	public void setCcdSeq(int ccdSeq) {
		this.ccdSeq = ccdSeq;
	}

	public Date getCcdIndt() {
		return ccdIndt;
	}

	public void setCcdIndt(Date ccdIndt) {
		this.ccdIndt = ccdIndt;
	}

	public String getCcdInid() {
		return ccdInid;
	}

	public void setCcdInid(String ccdInid) {
		this.ccdInid = ccdInid;
	}

	public Date getCcdUpdt() {
		return ccdUpdt;
	}

	public void setCcdUpdt(Date ccdUpdt) {
		this.ccdUpdt = ccdUpdt;
	}

	public String getCcdUpid() {
		return ccdUpid;
	}

	public void setCcdUpid(String ccdUpid) {
		this.ccdUpid = ccdUpid;
	}

	public String getCcCd() {
		return ccCd;
	}

	public void setCcCd(String ccCd) {
		this.ccCd = ccCd;
	}

	@Override
	public String toString() {
		return "CcdVO [ccdCd=" + ccdCd + ", ccdName=" + ccdName + ", ccdCont=" + ccdCont + ", ccdYn=" + ccdYn
				+ ", ccdSeq=" + ccdSeq + ", ccdInid=" + ccdInid + ", ccdUpid=" + ccdUpid + ", ccCd=" + ccCd + "]";
	}
}
