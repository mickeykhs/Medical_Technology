package kr.or.ddit.prescription;

import java.util.HashMap;
import java.util.List;


public interface PresService {

	// 원외처방전 등록
	public int presRegedit(HashMap<String, List<PresVO>> paraMap);
	
	
}
