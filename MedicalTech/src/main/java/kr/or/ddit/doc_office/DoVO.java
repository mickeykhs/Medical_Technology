package kr.or.ddit.doc_office;

import kr.or.ddit.emp.EmpVO;
import kr.or.ddit.patient.PatientVO;
import kr.or.ddit.receipt.RcpVO;
import lombok.Data;

@Data
public class DoVO {
	private String docCd;
	private String empNo;
	private String docNo;
	private RcpVO rcpVO;
	private PatientVO patientVO;
	private int num;
	// 수납 영수증에 진료실 조회
	private EmpVO empVO;
}
