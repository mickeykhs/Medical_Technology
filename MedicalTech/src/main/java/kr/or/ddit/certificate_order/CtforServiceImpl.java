package kr.or.ddit.certificate_order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.CtforMapper;

@Service

public class CtforServiceImpl implements CtforService {

	
	@Autowired
	CtforMapper ctforMapper;
	
	// 제증명 신청목록 리스트
	@Override
	public List<CtforVO> ctfList() {
		return this.ctforMapper.ctfList();
	}

	// 제증명 상태 업데이트
	@Override
	public int stateUp(CtforVO ctforVO) {
		return this.ctforMapper.stateUp(ctforVO);
	}

}
