package kr.or.ddit.doc_schedule;

import java.util.List;

import kr.or.ddit.patient.PatientVO;

public interface DsService {

	// 의사 스케줄 전체 가져오기
	public List<DsVO> findAll();
	
	// 스케줄 등록
	public int insert(DsVO dsVO);
	
	// 스케줄 삭제
	public int delete(String startDate);
	
	// 스케줄 수정하기
	public int update(DsVO dsVO);
	
	// 환자 검색
	public List<PatientVO> paSer(PatientVO patientVO);
	
	// 모달로 전체 업데이트
	public int upModal(DsVO dsVO);

}
