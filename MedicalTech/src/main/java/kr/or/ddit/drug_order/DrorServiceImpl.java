package kr.or.ddit.drug_order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.DrorMapper;

@Service
public class DrorServiceImpl implements DrorService {

	@Autowired
	DrorMapper drorMapper;
	
	@Override
	public int drOrder(DrorVO drorVO) {
		return this.drorMapper.drOrder(drorVO);
	}
	
	@Override
	public int getDrorCd() {
		return this.drorMapper.getDrorCd();
	}

	@Override
	public List<DrorVO> drorList() {
		return this.drorMapper.drorList();
	}



	

}
