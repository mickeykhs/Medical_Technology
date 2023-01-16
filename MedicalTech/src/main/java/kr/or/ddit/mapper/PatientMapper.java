package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.patient.PatientVO;

public interface PatientMapper {

	// 환자 상세
	public List<PatientVO> list();
}
