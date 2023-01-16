package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.order_list.OrdVO;

public interface OrdMapper {
	
	// 오더의 리스트
	public List<OrdVO> ordList();
	
	// 오더리스트 검색
	public List<OrdVO> searchOrd(OrdVO ordVO);
	
}
