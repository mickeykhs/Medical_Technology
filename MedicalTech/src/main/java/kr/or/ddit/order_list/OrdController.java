package kr.or.ddit.order_list;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class OrdController {
	
	@Autowired
	OrdService ordService;
	
	
	// 오더의 리스트
	@ResponseBody
	@PostMapping("/doctor/ordList")
	public List<OrdVO> ordList(@RequestBody OrdVO ordVO){
		
		log.info("ordVO : " + ordVO);
		
		List<OrdVO> ordVOList = this.ordService.ordList();
//		log.info("ordVOList : " + ordVOList);
		
		return ordVOList;
	}
	
	
	// 오더리스트 검색
	@ResponseBody
	@PostMapping("/doctor/searchOrd")
	public List<OrdVO> searchOrd(@RequestBody OrdVO ordVO){
		log.info("ordVO : " + ordVO);
		
		List<OrdVO> ordVOList = this.ordService.searchOrd(ordVO);
		
//		log.info("ordVOList : " + ordVOList);
		
		return ordVOList;
	}
}
