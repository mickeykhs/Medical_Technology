package kr.or.ddit.mapper;

import kr.or.ddit.chart.ChartVO;

public interface ChartMapper {
	
	// 차트 등록
	public int chartRegedit(ChartVO chartVO);
	
	// 차트 수정
	public int chartEdit(ChartVO chartVO);
}
