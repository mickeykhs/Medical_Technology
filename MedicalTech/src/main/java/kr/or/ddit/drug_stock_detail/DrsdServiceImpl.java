package kr.or.ddit.drug_stock_detail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.DrsdMapper;

@Service
public class DrsdServiceImpl implements DrsdService {

	@Autowired
	DrsdMapper drsdMapper;
	
	@Override
	public List<DrsdVO> list() {
		return this.drsdMapper.list();
	}

	@Override
	public List<DrsdVO> searchDrsd(DrsdVO drsdVO) {
		return this.drsdMapper.searchDrsd(drsdVO);
	}

	@Override
	public int updateDrsd(List<DrsdVO> voList) {
		return this.drsdMapper.updateDrsd(voList);
	}
	

}
