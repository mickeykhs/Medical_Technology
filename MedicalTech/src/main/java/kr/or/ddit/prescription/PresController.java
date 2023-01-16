package kr.or.ddit.prescription;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PresController {
	
	@Autowired
	PresService presService;
	
	@ResponseBody
	@PostMapping("/order/pres")
	public int presRegedit(@RequestBody List<PresVO> voList){
		
		HashMap<String, List<PresVO>> paraMap = new HashMap<>();
		paraMap.put("voList", voList);
		log.info("voList : " + voList);
		
		
		int result = this.presService.presRegedit(paraMap);
		
		return result;
	}
}
