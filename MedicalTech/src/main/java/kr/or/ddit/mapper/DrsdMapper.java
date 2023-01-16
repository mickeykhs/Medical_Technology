package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.drug_stock_detail.DrsdVO;

//약물 재고 상세
public interface DrsdMapper {
	
	//약품 재고 목록
	public List<DrsdVO> list();
	
	//약품 재고 목록 검색
	public List<DrsdVO> searchDrsd(DrsdVO drsdVO);
	
	//약품 재고 요청시 약품 재고 늘려주기
	public int updateDrsd(List<DrsdVO> voList);
}
