package kr.or.ddit.order_list;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.OrdMapper;

@Service
public class OrdServiceImpl implements OrdService {

	@Autowired
	OrdMapper ordMapper;
	
	// 오더의 리스트
	@Override
	public List<OrdVO> ordList() {
		return this.ordMapper.ordList();
	}

	// 오더리스트 검색
	@Override
	public List<OrdVO> searchOrd(OrdVO ordVO) {
		return this.ordMapper.searchOrd(ordVO);
	}


}
