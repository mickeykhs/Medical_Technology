package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.doc_schedule.DsVO;
import kr.or.ddit.nur_schedule.NurVO;
import kr.or.ddit.patient.PatientVO;


public interface DsMapper {
	
	//의사 스케줄 전체 불러오기
	public List<DsVO> findAll();

	// 스케줄 등록하기
	public int insert(DsVO schedule);
	
	// 스케쥴 삭제하기
	public int delete(String startDate);
	
	// 스케줄 수정하기
	public int update(DsVO dsVO);
	
	// 환자 검색
	public List<PatientVO> paSer(PatientVO patientVO);
	
	// 모달로 전체 업데이트
	public int upModal(DsVO dsVO);
	
	/*
	 * // 환자 검색 public List<PatientVO> paSearch(PatientVO patientVO);
	 */
}
