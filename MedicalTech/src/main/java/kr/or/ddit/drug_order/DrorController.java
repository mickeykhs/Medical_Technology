package kr.or.ddit.drug_order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class DrorController {

	@Autowired 
	DrorService drorService;
	
	@RequestMapping("/nurse/drug")
	public String main() {
		return "nurse/drug";
	}
	
	
	@ResponseBody
	@PostMapping("/nurse/drOrder")
	public String drOrder(@RequestBody List<DrorVO> voList){
		log.info("drorVOList : " + voList);

		//drorCd 마지막번호 + 1
		int drorCd = this.drorService.getDrorCd();
		
		for (DrorVO drorVO : voList) {
			drorVO.setDrorCd(drorCd+"");
			int result = this.drorService.drOrder(drorVO);	
		}
						
		return "OK";
	}
	
	@ResponseBody
	@PostMapping("/nurse/drorList")
	public List<DrorVO> drorList(@RequestBody DrorVO drorVO){
		log.info("drorVO : " + drorVO);
		List<DrorVO> drorVOList = this.drorService.drorList();
		log.info("drorVOList : " + drorVOList);
		return drorVOList;
	}
	
	
}
