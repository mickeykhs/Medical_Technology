package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.emp.EmpVO;
import kr.or.ddit.nur_schedule.NurVO;

public interface NurMapper {
	
	//db 간호사 스케줄 목록 가져오기
	public List<NurVO> findAll();
	
	// 스케줄 등록하기
	public int insert(NurVO schedule);

	// 스케쥴 삭제하기
	public int delete(String startDate);
	
	// 스케줄 수정하기
	public int update(NurVO nurVO);

	// 간호사 검색
	public List<EmpVO> nurSearch(EmpVO empVO);
	
	// 모달로 전체 업데이트
	public int upModal(NurVO nurVO);

}
