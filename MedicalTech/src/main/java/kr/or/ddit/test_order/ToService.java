package kr.or.ddit.test_order;

import java.util.HashMap;
import java.util.List;

public interface ToService {
	// 오더상세 등록(검사)
	public int toRegedit(ToVO toVO);
	
	// 오더상세 등록(주사)
	public int injRegedit(HashMap<String, List<ToVO>> paraMap);
}
