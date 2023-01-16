package kr.or.ddit.re_sms;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ResMapper;

@Service
public class ResServiceImpl implements ResService{
	
	@Autowired
	ResMapper resMapper;
	
	@Override
	public int saveMent(ResVO resVO) {
		return this.resMapper.saveMent(resVO);
	}

	@Override
	public List<ResVO> getMent() {
		return this.resMapper.getMent();
	}

	@Override
	public int deleteMent(ResVO resVO) {
		return this.resMapper.deleteMent(resVO);
	}

	@Override
	public int updateMent(ResVO resVO) {
		return this.resMapper.updateMent(resVO);
	}

}
