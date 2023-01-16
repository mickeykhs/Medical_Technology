package kr.or.ddit.mapper;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.prescription.PresVO;

public interface PrescriptionMapper {
	
	// 원외처방전 등록
	public int presRegedit(HashMap<String, List<PresVO>> paraMap);
	
}
