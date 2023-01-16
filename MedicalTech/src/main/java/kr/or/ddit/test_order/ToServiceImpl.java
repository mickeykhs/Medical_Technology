package kr.or.ddit.test_order;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.TestOrderMapper;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class ToServiceImpl implements ToService {

	@Autowired
	TestOrderMapper toMapper;
	@Override
	public int toRegedit(ToVO toVO) {
		return this.toMapper.toRegedit(toVO);
	}
	
	@Override
	public int injRegedit(HashMap<String, List<ToVO>> paraMap) {
		log.info("paraMap : " + paraMap);
		int result = this.toMapper.injRegedit(paraMap);
		
		return result;
	}

}
