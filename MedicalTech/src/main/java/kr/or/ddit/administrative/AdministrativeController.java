package kr.or.ddit.administrative;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.certificate_order.CtforVO;
import kr.or.ddit.doc_office.DoVO;
import kr.or.ddit.drug_indent.DriVO;
import kr.or.ddit.drug_order.DrorVO;
import kr.or.ddit.emp.EmpVO;
import kr.or.ddit.insurere.InsurereVO;
import kr.or.ddit.mapper.AdministrativeMapper;
import kr.or.ddit.patient.PatientVO;
import kr.or.ddit.receipt.RcpVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/medical")
@Controller
public class AdministrativeController {

	@Autowired
	AdministrativeService patientService;
	
	
	
	@ResponseBody
	@PostMapping("inCheck")
	public List<InsurereVO> inCheck(@RequestBody InsurereVO insurereVO){
		log.info("==체크 왔다.:"+insurereVO.getInReg());
		List<InsurereVO> inList = this.patientService.inCheck(insurereVO.getInReg());
		log.info("성공여부 : "+inList);
		return  inList;
	}
	
	/**
	 * 차트 통계
	 * @return
	 */
	@GetMapping("/chartMulti")
	public String note() {
		return "Administrative/chartMulti";
	}
	
	@ResponseBody
	@GetMapping("chart01")
	public JSONObject chart01() {
		JSONObject jsonObject =  this.patientService.monChart();
		// forwarding
		return jsonObject;
	}
	
	@ResponseBody
	@GetMapping("chart02")
	public JSONObject chart02() {
		JSONObject jsonObject =  this.patientService.perChart();
		// forwarding
		return jsonObject;
	}
	
	@ResponseBody
	@GetMapping("chart03")
	public List<Map<String, Object>> chart03() {
		List<Map<String, Object>> jsonObject =  this.patientService.paChart();
		// forwarding
		return jsonObject;
	}
	
	
	
	/**
	 * 의사 목록 확인
	 * @param empVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("docList")
	public List<EmpVO> docList(@RequestBody  EmpVO empVO){
		log.info("의사 확인" + empVO);
		List<EmpVO> docVOList =  this.patientService.docList(empVO);
		log.info("의사 목록 :"+docVOList);
		
		return docVOList;
	}

	/**
	 * 제증명 환자 디테일 -> 진단서
	 * @param ctforVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/diagnosis")
	public List<PatientVO> diagnosis(@RequestBody PatientVO patientVO){
		log.info("환자 제증명 진단서 디테일 내역 왔다."+patientVO);
		
		List<PatientVO> diagVOList = this.patientService.diagSelect(patientVO);
		log.info("diagVOList :" +diagVOList);
		
		return diagVOList;
	}
	
	/**
	 * 제증명 환자 디테일 -> 소견서
	 * @param ctforVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/note")
	public List<PatientVO> note(@RequestBody PatientVO patientVO){
		log.info("환자 제증명 소견서 디테일 내역 왔다."+patientVO);
		
		List<PatientVO> noteVOList = this.patientService.noteSelect(patientVO);
		log.info("noteVOList :" +noteVOList);
		
		return noteVOList;
	}
	
	/**
	 * 제증명 환자 디테일 -> 처방전
	 * @param ctforVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/prescription")
	public List<PatientVO> prescription(@RequestBody PatientVO patientVO){
		log.info("환자 제증명 처방전 디테일 내역 왔다."+patientVO);
		
		List<PatientVO> preVOList = this.patientService.preSelect(patientVO);
		log.info("diagVOList :" + preVOList);
		
		return preVOList;
	}
	
		
	/**
	 * 제증명 신청 내역 
	 * @return
	 */
	@ResponseBody
	@PostMapping("/ctfOrder")
	public List<CtforVO> ctfOrder(@RequestBody CtforVO ctforVO){
		log.info("제증명 신청 내역 왔다.");
		List<CtforVO> ctforVOList = this.patientService.ctfOrder(ctforVO);
		
	
		return ctforVOList;
	}
	
	/**
	 * 제증명 날짜별 신청 내역
	 * @param ctforVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/ctfDetailOrder")
	public List<CtforVO> ctfDetailOrder(@RequestBody CtforVO ctforVO){
		log.info("제증명 날짜별 내역 왔다.");
		List<CtforVO> ctfDetailVOList = this.patientService.ctfDetailOrder(ctforVO);
		log.info("ctfDetailVOList :" + ctfDetailVOList);
		return ctfDetailVOList;
	}
	
	/**
	 * 제증명 신청 
	 * @param ctforVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/ctfInsert")
	public Map<String,String> ctfInsert(@RequestBody CtforVO ctforVO){
		log.info("ctfInsert 왔다 : "+ctforVO);
		Map<String,String> map = new HashMap<String, String>();
		int result =this.patientService.ctfInsert(ctforVO);
		log.info("result : "+ result);
		if(result >0) {
			log.info("성공");
			map.put("result", "완료");
			return map;
		}else {
			map.put("result", "실패");
			return map;
		}
		
	}
	
	/**
	 * 예약 환자 날짜
	 * @param rcpVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/reservation")
	public List<PatientVO> reservation(@RequestBody PatientVO patientVO) {
		log.info("예약환자 왔다. : "+patientVO);
		
		List<PatientVO> patientVOList= this.patientService.reservation(patientVO);
		log.info("예약환자 정보 : "+ patientVOList);
		return patientVOList;
	} 
	/**
	 * 원무과 수납 페이지
	 * @return
	 */
	@GetMapping("/payment")
	public String payment() {
		
		return "Administrative/payment";
	}
	/**
	 * 영수증 페이지
	 * @return
	 */
	@GetMapping("/receipt")
	public String receipt() {
		
		return "Administrative/payment";
	}
	
	/**
	 * 발주서 페이지
	 * @return
	 */
	@GetMapping("/drug")
	public String drug() {
		
		return "Administrative/drug";
	}
	
	
	
	/**
	 * 간호사 주문요청내역 컨트롤 
	 * @return
	 */
	@ResponseBody
	@GetMapping("/nurOrderList")
	public List<DrorVO> nurOrderList(){
		log.info("주문내역 왔따.");
		List<DrorVO> drorVOList = this.patientService.nurOrderList();
		log.info("간호사 주문요청 : "+drorVOList);
		return drorVOList;
	}
	
	/**
	 * 발주내역 
	 * @return
	 */
	@ResponseBody
	@GetMapping("/adOrder")
	public List<DriVO> adOrder(){
		log.info("발주 내역 왔다.");
		List<DriVO> drugList = this.patientService.drugList();
		log.info("발주내역 목록 : "+drugList);
		return drugList;
	}
	
	/**
	 * 발주  등록
	 * @return
	 */
	@ResponseBody
	@PostMapping("/orderInsert")
	public Map<String,String> orderInsert(DriVO driVO){
		log.info("발주 신청 왔다.");
		log.info("durgDetailListVO 넘어온 값 : "+ driVO);
		
		//idtAplAst=A10001,A10001,A10001,A10001 -> idtAplAst=A10001 처리
		String[] idtAplAstArr = driVO.getIdtAplAst().split(",");
		driVO.setIdtAplAst(idtAplAstArr[0]);
		
		Map<String,String> map = new HashMap<String, String>();
		
		int result = 0;
		
		result = this.patientService.driInsert(driVO);
		
		log.info("발주 등록 테이블 성공여부 : "+result);
		if(result>0) {
			log.info("성공");
			map.put("result", "완료");
			return map;
		}else {
			map.put("result", "실패");
			return map;
		}
		
	}
	
	
	/**
	 * 원무과 메인 페이지
	 * @param model
	 * @return
	 */
	@GetMapping("/mainPage")
	public String mainPage() {
		
		
		return "Administrative/mainPage";
	}
	
	/**
	 * 대기환자 보여주기 
	 * @return
	 * @throws Exception 
	 */
	@ResponseBody
	@GetMapping("holdOffice")
	public List<PatientVO> holdOffice() throws Exception {
		
		List<PatientVO> pateintVOList = this.patientService.patientList();
		
		log.info("pateintVOList 대기 환자 보여주기 : "+pateintVOList);
		
		return pateintVOList; 
	}
	
	@ResponseBody
	@PostMapping("/checkOrder")
	public List<DriVO> checkOrder(@RequestBody DriVO driVO){
		log.info("발주상세체크 :"+driVO);
		List<DriVO> driVOList = this.patientService.checkOrder(driVO);
		log.info("발주상세체크 driVOList : "+driVOList);
		return  driVOList;
	}
	/**
	 * 1진료실 보여주기 
	 * @param patientVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/OnelistOffice")
	public List<PatientVO> OnelistOffice(@RequestBody PatientVO patientVO) {
		log.info("1진료실 왔다. : ");
//		log.info("진료실1 왔다."+patientVO);
		List<PatientVO> doVOList= this.patientService.doSelect(patientVO);
		log.info("1진료실정보 : "+ doVOList);
//		return doVOList;
		return doVOList;
	}
	
	/**
	 * 2진료실 보여주기 
	 * @param patientVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/TwolistOffice")
	public List<PatientVO> TwolistOffice(@RequestBody PatientVO patientVO) {
		log.info("2진료실 왔다. : ");
//		log.info("진료실1 왔다."+patientVO);
		List<PatientVO> doVOList= this.patientService.doSelect(patientVO);
		log.info("2진료실정보 : "+ doVOList);
//		return doVOList;
		return doVOList;
	}
	/**
	 * 신규 환자 접수 
	 * @param patientVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/paInsert")
	public Map<String,String>  paInsert(@RequestBody PatientVO patientVO) {
		log.info("컨트롤러 신규환자 등록 왔따 ");
		log.info("신규환자 등록 VO :"+patientVO);
		int Painsert = this.patientService.paInsert(patientVO);
		log.info("쿼리문 실행결과 :" + Painsert);
		Map<String,String> map = new HashMap<String, String>();
		if(Painsert>0) {
			map.put("result", "완료");
			return map;
		}else {
			map.put("result", "실패");
			return map;
		}
		
	}
	/**
	 * 환자 정보 수정
	 * @param patientVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/paUpdate")
	public Map<String,String>  paUpdate(@RequestBody PatientVO patientVO) {
		log.info("환자 업데이트 왔다."+patientVO);
		Map<String,String> map = new HashMap<String, String>();
		int update = this.patientService.paUpdate(patientVO);
		if(update >0) {
			map.put("result", "완료");
			return map;
		}else {
			map.put("result", "실패");
			return map;
		}
	}
	
	
	/**
	 * 원무과 접수 컨트롤 
	 * @param patientVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/insertDo")
	public Map<String,String> insertDo(@RequestBody RcpVO rcpVO) {
		//rcpVO : RcpVO(paNo=P002, doNo=1진료실, rcpMemo=목디스크
		//			  , rcpTm=null, empNo=n101001)
		log.info("rcpVO : " + rcpVO);
		log.info("접수 들어왔다.");
		int result = this.patientService.doInsert(rcpVO);
		log.info("============= : "+result);
		
		Map<String,String> map = new HashMap<String, String>();
		
		if(result !=0 ) {
			map.put("result", "OK");
			return map;
		}else {
			map.put("result", "X");
			return map;
		}
		
	}
	
	/**
	 * 접수 환자 검색
	 * @param patientVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/searchPa")
	public List<PatientVO> searchpa(@RequestBody PatientVO patientVO) {
		log.info("검색 들어왔다.");
		
		List<PatientVO> patientVOList = this.patientService.searchPa(patientVO);
		log.info("검색 patientVOList : " +patientVOList);
		return patientVOList;
	}
	
	/**
	 * 카카오페이 결제
	 * @return
	 */
	@GetMapping("/kakaopay")
	@ResponseBody
	public String kakaopay() {
		try {
			// 보내는 부분
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection connection = (HttpURLConnection) address.openConnection(); // 서버연결
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Authorization", "KakaoAK 018c2b8e70a2215d82f2abc50be2fced"); // 어드민 키
			connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			connection.setDoOutput(true); // 서버한테 전달할게 있는지 없는지
			String parameter = "cid=TC0ONETIME" // 가맹점 코드
					+ "&partner_order_id=partner_order_id" // 가맹점 주문번호
					+ "&partner_user_id=partner_user_id" // 가맹점 회원 id
					+ "&item_name=초코파이" // 상품명
					+ "&quantity=1" // 상품 수량
					+ "&total_amount=5000" // 총 금액
					+ "&vat_amount=200" // 부가세
					+ "&tax_free_amount=0" // 상품 비과세 금액
					+ "&approval_url=http://localhost/medi/session-over" // 결제 성공 시
					+ "&fail_url=http://localhost/medi/session-error" // 결제 실패 시
					+ "&cancel_url=http://localhost/medi/session-error"; // 결제 취소 시
			OutputStream send = connection.getOutputStream(); // 이제 뭔가를 를 줄 수 있다.
			DataOutputStream dataSend = new DataOutputStream(send); // 이제 데이터를 줄 수 있다.
			dataSend.writeBytes(parameter); // OutputStream은 데이터를 바이트 형식으로 주고 받기로 약속되어 있다. (형변환)
			dataSend.close(); // flush가 자동으로 호출이 되고 닫는다. (보내고 비우고 닫다)
			
			int result = connection.getResponseCode(); // 전송 잘 됐나 안됐나 번호를 받는다.
			InputStream receive; // 받다
			
			if(result == 200) {
				receive = connection.getInputStream();
				
			}else {
				receive = connection.getErrorStream(); 
			}
			// 읽는 부분
			InputStreamReader read = new InputStreamReader(receive); // 받은걸 읽는다.
			BufferedReader change = new BufferedReader(read); // 바이트를 읽기 위해 형변환 버퍼리더는 실제로 형변환을 위해 존제하는 클레스는 아니다.
			log.info("======:"+read+"");
			// 받는 부분
			return change.readLine(); // 문자열로 형변환을 알아서 해주고 찍어낸다 그리고 본인은 비워진다.
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	@RequestMapping(value = "/session-over", method = { RequestMethod.POST, RequestMethod.GET })
	public void sessionOver(HttpServletResponse response, HttpServletRequest request) throws Exception {
		String name = "홍길동";
	    ScriptUtils.alertAndMovePage(response, name+"님 결제완료", "home");
	}
	@RequestMapping(value = "/session-error", method = { RequestMethod.POST, RequestMethod.GET })
	public void sessionOver2(HttpServletResponse response, HttpServletRequest request) throws Exception {
		ScriptUtils.alert(response, "결제실패");
	}
	
	@GetMapping("/abc")
	public String abc() {
		return "Administrative/receipt";
	}
}
