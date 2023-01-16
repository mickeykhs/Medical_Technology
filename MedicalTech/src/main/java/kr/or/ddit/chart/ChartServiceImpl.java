package kr.or.ddit.chart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ChartMapper;

@Service
public class ChartServiceImpl implements ChartService {

	@Autowired
	ChartMapper chartMapper;
	
	// 차트 등록
	@Override
	public int chartRegedit(ChartVO chartVO) {
		return this.chartMapper.chartRegedit(chartVO);
	}

	// 차트 수정
	@Override
	public int chartEdit(ChartVO chartVO) {
		return this.chartMapper.chartEdit(chartVO);
	}
	

}
