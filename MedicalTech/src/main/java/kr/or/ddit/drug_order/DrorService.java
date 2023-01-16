package kr.or.ddit.drug_order;

import java.util.List;

public interface DrorService {

	//약품주문
	public int drOrder(DrorVO drorVO);

	public int getDrorCd();
	
	//약품 요청 목록
	public List<DrorVO> drorList();
}
