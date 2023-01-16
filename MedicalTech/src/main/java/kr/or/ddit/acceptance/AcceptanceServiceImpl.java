package kr.or.ddit.acceptance;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.diagnosis.DiaVO;
import kr.or.ddit.doc_office.DoVO;
import kr.or.ddit.mapper.AcceptanceMapper;
import kr.or.ddit.note.NoteVO;
import kr.or.ddit.order_list.OrdVO;
import kr.or.ddit.patient.PatientVO;
import kr.or.ddit.receiption.RecVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AcceptanceServiceImpl implements AcceptanceService {

	@Autowired
	AcceptanceMapper acceptanceMapper;
	
	// 대기 목록 환자 조회
	@Override
	public List<PatientVO> patiWait() {
		return this.acceptanceMapper.patiWait();
	}
	
	// 검색으로 환자 조회
	@Override
	public List<PatientVO> paSearch(String paName) {
		return this.acceptanceMapper.paSearch(paName);
	}
	
	// 수납내역에 오더에 대한 금액 조회
	@Override
	public List<OrdVO> orderFee(String paNo) {
		return this.acceptanceMapper.orderFee(paNo);
	}
	
	// 진단서 금액 조회
	@Override
	public List<DiaVO> diaFee(String paNo) {
		return this.acceptanceMapper.diaFee(paNo);
	}
	
	// 소견서 금액 조회
	@Override
	public List<NoteVO> noteFee(String paNo) {
		return this.acceptanceMapper.noteFee(paNo);
	}
	
	// 수납 내역 등록
	@Transactional
	@Override
	public int insertRec(RecVO recVO) {
		int result = this.acceptanceMapper.insertRec(recVO);
		log.info("수납내역 등록 성공여부. : "+result);
		if(result != 0) {
			result +=  acceptanceMapper.updateRec(recVO);
			log.info("환자 상태 업데이트 성공여부" + result);
		}else {
			return 0;
		}
		
		return result;
		
	}
	
	// 환자 상태 결제완료로 업데이트 
	@Override
	public int updateRec(RecVO recVO) {
		return acceptanceMapper.updateRec(recVO);
	}
	
	// 환자별 수납이력 조회
	@Override
	public List<RecVO> recList(String paNo) {
		return this.acceptanceMapper.recList(paNo);
	}
	
	// 날짜별 수납이력 조회
	@Override
	public List<RecVO> recDt(String recDt) {
		return this.acceptanceMapper.recDt(recDt);
	}
	
	// 금일 수납이력 조회
	@Override
	public List<RecVO> recToday() {
		return this.acceptanceMapper.recToday();
	}
		
	// 결제 영수증에 들어갈 Data 조회
	@Override
	public RecVO reciept() {
		return this.acceptanceMapper.reciept();
	}
	
	// 진료실 조회
	@Override
	public DoVO docOff(String empName, String paNo) {
		return this.acceptanceMapper.docOff(empName, paNo);
	}
}
