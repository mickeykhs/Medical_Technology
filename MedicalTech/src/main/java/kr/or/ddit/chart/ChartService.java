package kr.or.ddit.chart;

public interface ChartService {
	// 차트 등록
	public int chartRegedit(ChartVO chartVO);
	
	// 차트 수정
	public int chartEdit(ChartVO chartVO);
}
