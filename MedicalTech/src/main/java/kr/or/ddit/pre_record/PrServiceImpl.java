package kr.or.ddit.pre_record;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.drug_stock_detail.DrsdVO;
import kr.or.ddit.mapper.PrMapper;
import kr.or.ddit.patient.PatientVO;
import kr.or.ddit.test_order.ToVO;

@Service
public class PrServiceImpl implements PrService {

	// DI(의존성 주입)
	@Autowired
	PrMapper prMapper;

	@Override
	public List<PatientVO> waitList() {
		return this.prMapper.waitList();
	}

	@Override
	public PatientVO paInfo(String paNo) {
		return this.prMapper.paInfo(paNo);
	}

	@Override
	public List<ToVO> orderList(ToVO toVO) {
		return this.prMapper.orderList(toVO);
	}

	@Override
	public int useQty(HashMap<String, List<DrsdVO>> paraMap) {
		return this.prMapper.useQty(paraMap);
	}

	@Override
	public int upState(PatientVO patientVO) {
		return this.prMapper.upState(patientVO);
	}

	//처치완료 환자 리스트
	@Override
	public List<PatientVO> finishList() {
		return this.prMapper.finishList();
	}

	//한 환자에 대한 과거 처치내역 조회
	@Override
	public List<ToVO> pastTreatList(ToVO toVO) {
		return this.prMapper.pastTreatList(toVO);
	}
}
