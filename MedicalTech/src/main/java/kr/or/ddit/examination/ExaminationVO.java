package kr.or.ddit.examination;

import java.util.Date;
import java.util.List;

import kr.or.ddit.file.FileVO;
import kr.or.ddit.patient.PatientVO;

public class ExaminationVO {
	private String examCd;
	private int examFee;
	private Date examDt;
	private String examName;
	private String fileCd;
	private String examBodpt;
	private String toOrNo;
	private List<FileVO> fileVOList;
	private String paNo;
	private PatientVO patientVO;
	
	public String getExamCd() {
		return examCd;
	}
	public void setExamCd(String examCd) {
		this.examCd = examCd;
	}
	public int getExamFee() {
		return examFee;
	}
	public void setExamFee(int examFee) {
		this.examFee = examFee;
	}
	public Date getExamDt() {
		return examDt;
	}
	public void setExamDt(Date examDt) {
		this.examDt = examDt;
	}
	public String getExamName() {
		return examName;
	}
	public void setExamName(String examName) {
		this.examName = examName;
	}
	public String getFileCd() {
		return fileCd;
	}
	public void setFileCd(String fileCd) {
		this.fileCd = fileCd;
	}
	public String getExamBodpt() {
		return examBodpt;
	}
	public void setExamBodpt(String examBodpt) {
		this.examBodpt = examBodpt;
	}
	public String getToOrNo() {
		return toOrNo;
	}
	public void setToOrNo(String toOrNo) {
		this.toOrNo = toOrNo;
	}
	public List<FileVO> getFileVOList() {
		return fileVOList;
	}
	public void setFileVOList(List<FileVO> fileVOList) {
		this.fileVOList = fileVOList;
	}
	public String getPaNo() {
		return paNo;
	}
	public void setPaNo(String paNo) {
		this.paNo = paNo;
	}
	public PatientVO getPatientVO() {
		return patientVO;
	}
	public void setPatientVO(PatientVO patientVO) {
		this.patientVO = patientVO;
	}
	@Override
	public String toString() {
		return "ExaminationVO [examCd=" + examCd + ", examFee=" + examFee + ", examDt=" + examDt + ", examName="
				+ examName + ", fileCd=" + fileCd + ", examBodpt=" + examBodpt + ", toOrNo=" + toOrNo + ", fileVOList="
				+ fileVOList + ", paNo=" + paNo + ", patientVO=" + patientVO + "]";
	}
}
