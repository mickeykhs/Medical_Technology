package kr.or.ddit.certificate_order;

import java.util.List;

public interface CtforService {

	
	// 제증명 신청 내역 
	public List<CtforVO> ctfList();
	
	// 제증명 상태 업데이트
	public int stateUp(CtforVO ctforVO);
}
