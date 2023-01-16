package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.certificate_order.CtforVO;

public interface CtforMapper {

	// 제증명 신청 내역 
	public List<CtforVO> ctfList();
	
	// 제증명 상태 업데이트
	public int stateUp(CtforVO ctforVO);
	
}
