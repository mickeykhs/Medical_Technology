package kr.or.ddit.drug_stock_detail;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.drug_order.DrorService;
import kr.or.ddit.drug_order.DrorVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class DrsdController {

	@Autowired 
	DrsdService drsdService;
	@Inject
	DrorService drorService;
	
	//약물리스트 목록
	@GetMapping("/nurse/drug")
	public String drugList(Model model){
		
		//약품 재고 리스트 목록
		List<DrsdVO> drsdVOList = this.drsdService.list();
		log.info("drsdVOList : " + drsdVOList);
		model.addAttribute("drsdVOList", drsdVOList);
		
		//약품 요청내역
		List<DrorVO> drorVOList = this.drorService.drorList();
		log.info("drorVOList : " + drorVOList);
		model.addAttribute("drorVOList",drorVOList);
		
		return "nurse/drug";
	}
	
	//카테고리별로 볼수 있도록 리스트 조회
	@ResponseBody
	@PostMapping("/nurse/drCarte")
	public List<DrsdVO> drCarte(@RequestBody DrsdVO drsdVO){
		log.info("drsdVO : " + drsdVO);
		
		List<DrsdVO> drList = this.drsdService.list();
		log.info("drList : "+ drList);
		
		return drList;
	}
	
	//약품 재고 목록 검사
	@ResponseBody
	@PostMapping("/nurse/searchDrsd")
	public List<DrsdVO> searchDrsd(@RequestBody DrsdVO drsdVO){
		log.info("searchDrsd : " + drsdVO);
		
		List<DrsdVO> sDrList = this.drsdService.searchDrsd(drsdVO);
		log.info("sDrList :" + sDrList );
		
		return sDrList;
	}
	
	//약품 재고 요청시 약품 재고 늘려주기
	@ResponseBody
	@PostMapping("/nurse/updateDrsd")
	public int updateDrsd(@RequestBody List<DrsdVO> voList) {
		log.info("voList : " + voList);
		
//		HashMap<String, List<DrsdVO>> paraMap = new HashMap<String, List<DrsdVO>>();
		
		int result = this.drsdService.updateDrsd(voList);
		log.info("result : " + result);
		return result;
	}
	
}
