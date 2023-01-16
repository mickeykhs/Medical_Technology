package kr.or.ddit.receiption;

import kr.or.ddit.patient.PatientVO;
import lombok.Data;

@Data
public class RecVO {

	private String recCd;
	private String recYn;
	private String recMt;
	private int recTotal;
	private String recDt;
	private String recEmpNo;
	private String diaCd;
	private String ntCd;
	private String paNo;
	private String paInsuYn;
	
	// 수납 이력 조회
	private PatientVO patientVO;
}
