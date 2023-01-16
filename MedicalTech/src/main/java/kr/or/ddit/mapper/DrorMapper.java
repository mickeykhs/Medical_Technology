package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.drug_order.DrorVO;

//약품주문
public interface DrorMapper {
	
	//약품주문
	public int drOrder(DrorVO drorVO);
	
	//약품주문할때 PK인 DRORCD를 같게 해주기 위해 생성
	public int getDrorCd();
	
	//약품 재고 목록
	public List<DrorVO> drorList();
	
	//날짜선택으로 약품 신청목록 보기
	public List<DrorVO> dateList(String drorDate);
}
