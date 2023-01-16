package kr.or.ddit.diagnosis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DiaController {
	@Autowired
	DiaService diaService;
	
	
	@ResponseBody
	@PostMapping("/order/diagnosis")
	public int diaRegedit(@RequestBody DiaVO diaVO){
		int result = this.diaService.diaRegedit(diaVO);
		return result;
	}
}
