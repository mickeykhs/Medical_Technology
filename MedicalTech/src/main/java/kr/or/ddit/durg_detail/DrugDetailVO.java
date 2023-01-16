package kr.or.ddit.durg_detail;

import java.util.List;

import lombok.Data;

@Data
public class DrugDetailVO {
	private String diCd;
	private int ddNo;
	private int ddQty;
	private String drCd;
	
	
	List<DrugDetailVO> drugDetailVOList;
}
