package kr.or.ddit.diagnosis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.DiagnosisMapper;

@Service
public class DiaServiceImpl implements DiaService {

	@Autowired
	DiagnosisMapper diaMapper;
	
	@Override
	public int diaRegedit(DiaVO diaVO) {
		return this.diaMapper.diaRegedit(diaVO);
	}

}
