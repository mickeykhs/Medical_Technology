package kr.or.ddit.patient;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import kr.or.ddit.chart.ChartVO;
import kr.or.ddit.diagnosis.DiaVO;
import kr.or.ddit.doc_office.DoVO;
import kr.or.ddit.drugapi.DrgVO;
import kr.or.ddit.file.FileVO;
import kr.or.ddit.note.NoteVO;
import kr.or.ddit.prescription.PresVO;
import kr.or.ddit.receipt.RcpVO;
import kr.or.ddit.test_order.ToVO;
import lombok.Data;

@Data
public class PatientVO {
	private String paNo;
	private String paReg;
	private String paName;
	private String paSex;
	private String paPh;
	private String paMail;
	private String paAdd1;
	private String paAdd2;
	private int paZip;
	private Date paEndt;
	private String paEnwt;
	private Date paUpdt;
	private String paUpwt;
	private Date paFiviDt;
	private String paTrmr;
	private String paState;
	private String paExamState;
	private Date rcpTm;
	private String paInsuYn;
	
	private List<ChartVO> chartVO;
	
	private String docNo;
	private String docuCd; 
	
	private int num;
	
	private List<DoVO> doVO;
	private List<RcpVO> rcpVO;
	private ToVO toVO;

	private String chCont;
	// 오재경 원무과 사용 컬럼 
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private Date paRes; // 예약 날짜 
	private String testDate; 
	// 제증명
		private List<DiaVO> diaVO;
		private List<NoteVO> noteVO;
		private List<PresVO> presVO;
		private List<DrgVO> drgVO;
		private List<FileVO> fileVO;
		private String fileName;
}
