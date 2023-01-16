package kr.or.ddit.test_order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.order_list.OrdVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ToController {
	
	@Autowired
	ToService toService;
	
	// 오더상세 등록 (검사)
	@ResponseBody
	@PostMapping("/order/regedit")
	public String toRegedit(@RequestBody ToVO toVO){
		log.info("toVO : " + toVO);
		int rs = this.toService.toRegedit(toVO);
		log.info("rs : " + rs);
		return "redirect:/doctor/view";
	}
	
	// 오더상세 등록 (주사)
//	@ResponseBody
//	@PostMapping("/order/injregedit")
//	public int injRegedit(OrdVO ordVO, String[] group5, String[] prShot, String[] prCnt
//			){
//		log.info("ordVO : " + ordVO);
//		for(int i=0; i<prShot.length; i++){
//			log.info("확인 : " + i + " : " + prShot[i]); 
//		}
//		log.info("group5 : " + group5);
//		log.info("prShot : " + prShot);
//		log.info("prCnt : " + prCnt);
//		int result = 0;
//		int result = this.toService.injRegedit(toVO);
//		log.info("result : " + result);
//		return result;
//	}
	
	// 오더 등록test
	@ResponseBody
	@PostMapping("/order/injregedit")
	public int injRegedit(@RequestBody List<ToVO> voList){
		HashMap<String, List<ToVO>> paraMap = new HashMap<String, List<ToVO>>();
		paraMap.put("voList", voList);	
		log.info("ToVOList : " + voList);
		int result = this.toService.injRegedit(paraMap);
		
		return result;
		
	}
	
}
