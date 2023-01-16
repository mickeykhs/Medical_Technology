package kr.or.ddit.nur_schedule;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.emp.EmpVO;
import kr.or.ddit.mapper.NurMapper;

@Service
public class NurServiceImpl implements NurService{
	
	// DI(의존성 주입)
	@Autowired
	NurMapper nurMapper;

	// 간호사 스케줄 전체 조회
	@Override
	public List<NurVO> findAll() {
		return this.nurMapper.findAll();
	}

	// 간호사 스케줄 등록
	@Override
	public int insert(NurVO scheduel) {
		return this.nurMapper.insert(scheduel);
	}

	// 간호사 스케줄 삭제
	@Override
	public int delete(String startDate) {
		return this.nurMapper.delete(startDate);
	}

	// 간호사 스케줄 수정
	@Override
	public int update(NurVO nurVO) {
		return this.nurMapper.update(nurVO);
	}

	// 간호사 검색
	@Override
	public List<EmpVO> nurSearch(EmpVO empVO) {
		return this.nurMapper.nurSearch(empVO);
	}

	// 모달 사용 전체 수정
	@Override
	public int upModal(NurVO nurVO) {
		return this.nurMapper.upModal(nurVO);
	}
	
	



	
	
	
}
