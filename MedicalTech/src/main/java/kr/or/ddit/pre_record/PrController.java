package kr.or.ddit.pre_record;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.drug_stock_detail.DrsdVO;
import kr.or.ddit.patient.PatientVO;
import kr.or.ddit.test_order.ToVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PrController {

	@Inject
	PrService prService;
	
	@GetMapping("/nurse/treat")
	public String waitList(Model model) {
		
		//처치대기 목록 환자 리스트
		List<PatientVO> waitList = this.prService.waitList();
		log.info("waitList : " + waitList);
		model.addAttribute("waitList", waitList);
		
		//처치완료 환자 리스트
		List<PatientVO> finishList = this.prService.finishList();
		log.info("finishList : " + finishList);
		model.addAttribute("finishList", finishList);
		
		return "nurse/treat";
	}

	//처치대기 환자 선택시 환자 정보 가져오기
	@ResponseBody
	@PostMapping("/nurse/paInfo")
	public PatientVO paInfo(@RequestBody Map<String,String> paNoMap) {
		log.info("patientVO : "+ paNoMap.get("paNo") );
		PatientVO paInfo = this.prService.paInfo(paNoMap.get("paNo"));
		log.info("paInfo : " + paInfo);
		return paInfo;
	}
	
	//처치환자 오더 리스트 조회
	@ResponseBody
	@PostMapping("/nurse/oderList")
	public List<ToVO> orderList(@RequestBody ToVO toVO){
		log.info("toVO : "+ toVO );
		List<ToVO> oderList= this.prService.orderList(toVO);
		log.info("oderList : "+ oderList );
		return oderList;
	}
	
	// 재고수량 빼기
	@ResponseBody
	@PostMapping("/nurse/useQty")
	public int useQty(@RequestBody List<DrsdVO> voList) {
		HashMap<String, List<DrsdVO>> paraMap = new HashMap<String, List<DrsdVO>>();
		paraMap.put("voList", voList);
		log.info("voList : " + voList);
		int result = this.prService.useQty(paraMap);
		return result;
	}
	
	//환자 처치완료 처리
	@ResponseBody
	@PostMapping("/nurse/upState")
	public int upState(@RequestBody PatientVO patientVO) {
		log.info("patientVO : " + patientVO);
		int result = this.prService.upState(patientVO);
		log.info("result : " + result);
		return result;
	}
	
	//한 환자에 대한 과거 처치내역 조회
	@ResponseBody
	@PostMapping("/nurse/pastTreatList")
	public List<ToVO>pastTreatList(@RequestBody ToVO toVO){
		log.info("toVO : " + toVO);
		List<ToVO>pastTreatList = this.prService.pastTreatList(toVO);
		log.info("pastTreatList : " + pastTreatList);
		return pastTreatList;
	}
}
