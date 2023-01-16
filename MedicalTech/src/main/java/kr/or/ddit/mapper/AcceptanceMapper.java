package kr.or.ddit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.diagnosis.DiaVO;
import kr.or.ddit.doc_office.DoVO;
import kr.or.ddit.note.NoteVO;
import kr.or.ddit.order_list.OrdVO;
import kr.or.ddit.patient.PatientVO;
import kr.or.ddit.receiption.RecVO;

public interface AcceptanceMapper {
	
	// 대기 목록 환자 조회
	public List<PatientVO> patiWait();
	
	// 검색으로 환자 조회
	public List<PatientVO> paSearch(String paName);
	
	// 수납내역에 오더에 대한 금액 조회
	public List<OrdVO> orderFee(String paNo);

	// 진단서 금액 조회
	public List<DiaVO> diaFee(String paNo);

	// 소견서 금액 조회
	public List<NoteVO> noteFee(String paNo);
	
	// 수납내역 등록
	public int insertRec(RecVO recVO);
	
	// 수납시 환자 상태 업데이트 
	public int updateRec(RecVO recVO);
	
	// 환자별 수납이력 조회
	public List<RecVO> recList(String paNo);
	
	// 날짜별 수납이력 조회
	public List<RecVO> recDt(String recDt);
	
	// 금일 수납이력 조회
	public List<RecVO> recToday();
	
	// 결제 영수증에 들어갈 Data 조회
	public RecVO reciept();
	
	// 진료실 조회
	public DoVO docOff(@Param("empName") String empName, @Param("paNo") String paNo);
}