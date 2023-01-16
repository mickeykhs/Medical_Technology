package kr.or.ddit.prescription;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.PrescriptionMapper;

@Service
public class PresServiceImpl implements PresService {

	@Autowired
	PrescriptionMapper presMapper;
	
	// 원외처방전 등록
	@Override
	public int presRegedit(HashMap<String, List<PresVO>> paraMap) {
		int result = this.presMapper.presRegedit(paraMap);
		
		return result;
	}

}
