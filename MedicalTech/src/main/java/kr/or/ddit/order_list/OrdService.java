package kr.or.ddit.order_list;

import java.util.List;

public interface OrdService {
	
	// 오더의 리스트
	public List<OrdVO> ordList();
	
	// 오더리스트 검색
	public List<OrdVO> searchOrd(OrdVO ordVO);
}
