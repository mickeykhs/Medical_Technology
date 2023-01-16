package kr.or.ddit.certificate_order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CtforController {

	@Autowired
	CtforService ctforService;
	
	@ResponseBody
	@PostMapping("/ctfor/stateUp")
	public String stateUp(@RequestBody CtforVO ctforVO) {
		log.info("ctforVO : " + ctforVO);
		
		int result = this.ctforService.stateUp(ctforVO);
		log.info("result : " + result);
		
		return "redirect:/doctor/view";
	}
}
