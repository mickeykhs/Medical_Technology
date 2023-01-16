package kr.or.ddit.nur_schedule;

import java.util.List;

import kr.or.ddit.emp.EmpVO;

public interface NurService {

	// 스케줄 목록가져오기
	public List<NurVO> findAll();

	// 스케줄 등록
	public int insert(NurVO nurVO);
	
	// 스케줄 삭제
	public int delete(String startDate);
	
	// 스케줄 수정
	public int update(NurVO nurVO);
	
	// 간호사 검색
	public List<EmpVO> nurSearch(EmpVO empVO);
	
	// 모달로 전체 업데이트
	public int upModal(NurVO nurVO);

}
