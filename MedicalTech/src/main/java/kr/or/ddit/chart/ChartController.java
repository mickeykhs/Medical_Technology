package kr.or.ddit.chart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChartController {
	
	@Autowired
	ChartService chartService;
	
	// 차트 등록
	@ResponseBody
	@PostMapping("/chart/regedit")
	public String chartRegedit(@RequestBody ChartVO chartVO){
		log.info("chartVO : " + chartVO);
		int rs = this.chartService.chartRegedit(chartVO);
		log.info("rs : " + rs);
		return "OK";
	}
	
	@ResponseBody
	@PostMapping("/chart/edit")
	public String chartEdit(@RequestBody ChartVO chartVO) {
		log.info("chartVO : " + chartVO);
		int rs = this.chartService.chartEdit(chartVO);
		log.info("rs : " + rs);
		return "OK";
	}
}
