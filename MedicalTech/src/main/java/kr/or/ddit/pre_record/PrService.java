package kr.or.ddit.pre_record;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.drug_stock_detail.DrsdVO;
import kr.or.ddit.patient.PatientVO;
import kr.or.ddit.test_order.ToVO;

public interface PrService {

	//처치 대기환자 리스트
	public List<PatientVO> waitList();
	
	//처치환자 선택시 환자 정보 조회
	public PatientVO paInfo(String paNo);
	
	//처치환자 오더 리스트 조회
	public List<ToVO> orderList(ToVO toVO);
	
	// 재고 수량 계산
	public int useQty(HashMap<String, List<DrsdVO>> paraMap);
	
	//환자 처치완료 처리
	public int upState(PatientVO patientVO);
	
	//처치완료 환자 리스트
	public List<PatientVO> finishList();
	
	//한 환자에 대한 과거 처치내역 조회
	public List<ToVO>pastTreatList(ToVO toVO);
}
