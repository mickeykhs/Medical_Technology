package kr.or.ddit.doc_schedule;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.DsMapper;
import kr.or.ddit.patient.PatientVO;

@Service
public class DsServiceImpl implements DsService {

	@Autowired
	DsMapper dsMapper;
	
	//의사 스케줄 전체 불러오기
	@Override
	public List<DsVO> findAll() {
		return this.dsMapper.findAll();
	}

	@Override
	public int insert(DsVO scheduel) {
		return this.dsMapper.insert(scheduel);
	}

	@Override
	public int delete(String startDate) {
		return this.dsMapper.delete(startDate);
	}

	@Override
	public int update(DsVO dsVO) {
		return this.dsMapper.update(dsVO);
	}

	@Override
	public List<PatientVO> paSer(PatientVO patientVO) {
		return this.dsMapper.paSer(patientVO);
	}

	@Override
	public int upModal(DsVO dsVO) {
		return this.dsMapper.upModal(dsVO);
	}

}
