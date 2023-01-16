package kr.or.ddit.drug_stock_detail;

import java.util.List;

public interface DrsdService {
	
	//약품 재고 목록
	public List<DrsdVO> list();
	
	//약품 재고 목록 검사
	public List<DrsdVO> searchDrsd(DrsdVO drsdVO);
	
	//약품 재고 요청시 약품 재고 늘려주기
	public int updateDrsd(List<DrsdVO> voList);
}
