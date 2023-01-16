package kr.or.ddit.acceptance;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.diagnosis.DiaVO;
import kr.or.ddit.doc_office.DoVO;
import kr.or.ddit.emp.EmpVO;
import kr.or.ddit.note.NoteVO;
import kr.or.ddit.order_list.OrdVO;
import kr.or.ddit.patient.PatientVO;
import kr.or.ddit.receipt.RcpVO;
import kr.or.ddit.receiption.RecVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/accept")
@Controller
public class AcceptanceController {

	@Autowired
	AcceptanceService acceptanceService;
	
	@GetMapping("/main")
	public String main() {
		return "acceptance/acceptance";
	}
	
	// 대기 목록 환자 조회
	@ResponseBody
	@GetMapping("/waitList")
	public List<PatientVO> patiWait() {
		
		List<PatientVO> patientVOList = this.acceptanceService.patiWait();
		log.info("patientVOList : " + patientVOList);
		
		return patientVOList;
	}
	
	
	@ResponseBody
	@PostMapping("/paSearch")
	public List<PatientVO> paSearch(@RequestBody PatientVO patientVO) {
		log.info("paName : " + patientVO.getPaName());
		
		List<PatientVO> patientVOList = this.acceptanceService.paSearch(patientVO.getPaName());		
		log.info("patientVOList : " + patientVOList);
		
		return patientVOList;
	}
	
	// 오더리스트 금액 조회
	@ResponseBody
	@PostMapping("/orderFee")
	public List<OrdVO> orderFee(@RequestBody PatientVO patientVO) {
		log.info("paNo : " + patientVO.getPaNo());
		
		List<OrdVO> OrdVOList = this.acceptanceService.orderFee(patientVO.getPaNo());		
		log.info("OrdVOList : " + OrdVOList);
		
		return OrdVOList;
	}

	// 진단서 금액 조회
	@ResponseBody
	@PostMapping("/diaFee")
	public List<DiaVO> diaFee(@RequestBody PatientVO patientVO) {
		log.info("paNo : " + patientVO.getPaNo());
		
		List<DiaVO> diaVOList = this.acceptanceService.diaFee(patientVO.getPaNo());		
		log.info("diaVOList : " + diaVOList);
		
		return diaVOList;
	}
	
	// 소견서 금액 조회
	@ResponseBody
	@PostMapping("/noteFee")
	public List<NoteVO> noteFee(@RequestBody PatientVO patientVO) {
		log.info("paNo : " + patientVO.getPaNo());
		
		List<NoteVO> noteVOList = this.acceptanceService.noteFee(patientVO.getPaNo());		
		log.info("noteVOList : " + noteVOList);
		
		return noteVOList;
	}
	
	@GetMapping("/receipt")
	public String receipt() {
		return "acceptance/receipt";
	}
	
	// 수납 내역 등록
	@ResponseBody
	@PostMapping("/insertRec")
	public int insertRec(@RequestBody RecVO recVO) {
		log.info("recVO : " + recVO);
		
		int result = this.acceptanceService.insertRec(recVO);		
		log.info("result : " + result);
		
		return result;
	}
	
	// 환자별 수납이력 조회
	@ResponseBody
	@PostMapping("/recList")
	public List<RecVO> recList(@RequestBody PatientVO patientVO) {
		log.info("paNo : " + patientVO.getPaNo());
		
		List<RecVO> recVOList = this.acceptanceService.recList(patientVO.getPaNo());		
		log.info("recVOList : " + recVOList);
		
		return recVOList;
	}
	
	// 날짜별 수납이력 조회
	@ResponseBody
	@PostMapping("/recDate")
	public List<RecVO> recDt(@RequestBody RecVO recVO) {
		log.info("recDt : " + recVO.getRecDt());
		
		List<RecVO> recVOList = this.acceptanceService.recDt(recVO.getRecDt());
		log.info("recVOList : " + recVOList);
		
		return recVOList;
	}
	
	// 금일 수납이력 조회
	@ResponseBody
	@GetMapping("recToday")
	public List<RecVO> recToday() {
		
		List<RecVO> recVOList = this.acceptanceService.recToday();
		log.info("recVOList : " + recVOList);
	
		return recVOList;
	}
	
	@ResponseBody
	@PostMapping("/receipt")
	public RecVO reciept() {
		
		RecVO recVO = this.acceptanceService.reciept();
		log.info("+++++++++++++recVO : " +  recVO);
		
		return recVO;
	}
	
	@ResponseBody
	@PostMapping("/docOff")
	public DoVO docOff(@RequestBody Map<String, String> empVO) {
		log.info("empName ++++++: " + empVO.get("empName"));
		log.info("paNo -------: " + empVO.get("paNo"));
		
		String empName = empVO.get("empName");
		String paNo = empVO.get("paNo");
		
		DoVO doVO = this.acceptanceService.docOff(empName, paNo);		
		log.info("doVO : " + doVO);
		
		return doVO;
	}
}
