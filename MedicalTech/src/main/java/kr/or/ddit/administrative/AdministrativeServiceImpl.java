package kr.or.ddit.administrative;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.certificate_order.CtforVO;
import kr.or.ddit.doc_office.DoVO;
import kr.or.ddit.drug_indent.DriVO;
import kr.or.ddit.drug_order.DrorVO;
import kr.or.ddit.durg_detail.DrugDetailVO;
import kr.or.ddit.emp.EmpVO;
import kr.or.ddit.insurere.InsurereVO;
import kr.or.ddit.mapper.AdministrativeMapper;
import kr.or.ddit.patient.PatientVO;
import kr.or.ddit.receipt.RcpVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdministrativeServiceImpl implements AdministrativeService{

	@Autowired
	AdministrativeMapper patientMapper;
	
	/**
	 * 환자 조회
	 */
	@Override
	public List<PatientVO> patientList() throws Exception{
		return patientMapper.patientList();
	}
	
	/**
	 * 환자 검색 
	 */
	@Override
	public List<PatientVO> searchPa(PatientVO patientVO) {
		return this.patientMapper.searchPa(patientVO);
	}

	/**
	 * 진료실 조회
	 */
	@Override
	public List<PatientVO> doSelect(PatientVO patientVO) {
		log.info("진료실 조회 쿼리값 :" +patientVO);
		return this.patientMapper.doSelect(patientVO);
	}

	/**
	 * 접수 등록 서비스
	 */
	@Override
	@Transactional
	public int doInsert(RcpVO rcpVO) {
		log.info(" 접수 등록 왔다0");
		//rcpVO : RcpVO(paNo=P002, doNo=1진료실, rcpMemo=목디스크
		//			  , rcpTm=null, empNo=n101001)
		log.info("rcpVO : " + rcpVO);
		int result = this.patientMapper.doInsert(rcpVO);
		log.info("왔다1, result : " + result);
		if(result ==0) {
			return 0;
		}else if(result ==1){
		  result = result + this.patientMapper.reInsert(rcpVO);
		  log.info("왔다2, result : " + result);
		  
		}
		
		if(result==2) {
			result = result + this.patientMapper.paResUpdate(rcpVO);
			  log.info("왔다3, result : " + result);
		}else {
			return 0;
		}
		
		return result;
	}


	@Override
	public int reInsert(RcpVO rcpVO) {
		return this.patientMapper.reInsert(rcpVO);
	}

	
	/**
	 * 신규 환자 등록 
	 */
	@Override
	public int paInsert(PatientVO patientVO) {
		log.info("서비스 : 신규환자 등록 왔다.");
		log.info("신규환자 정보 : "+patientVO);
		return this.patientMapper.paInsert(patientVO);
	}

	/**
	 * 환자 정보 수정
	 */
	@Override
	public int paUpdate(PatientVO patientVO) {
		log.info("서비스 : 환자 정보수정 왔다.");
		log.info("업데이트 정보 : "+patientVO);
		return this.patientMapper.paUpdate(patientVO);
	}

	/**
	 * 간호사 주문요청 내역
	 */
	@Override
	public List<DrorVO> nurOrderList() {
		log.info("서비스 : 간호사 주문요청 내역 왔다  ");
		return this.patientMapper.nurOrderList();
	}

	/**
	 * 발주 내역
	 */
	@Override
	public List<DriVO> drugList() {
		log.info("서비스 : 발주 내역 왔다. ");
		return this.patientMapper.drugList();
	}

	/**
	 * 발주 테이블  등록
	 */
	@Override
	@Transactional
	public int driInsert(DriVO driVO) {
		log.info("ServiceImpl] 발주 테이블 등록 값 : " + driVO);
		log.info("ServiceImpl] ======: "+driVO.getDrugDetailVOList());
		
		//old => 데이터에 문제가 있음
		List<DrugDetailVO> drugDetailVOList = driVO.getDrugDetailVOList();
		//new => 데이터를 보정용
		List<DrugDetailVO> drugDetailVOListNew = new ArrayList<DrugDetailVO>();
		
		//처음 driVO.diCd값은 Z001,Z001,Z001,Z001 => insert 후에는 Z003
		int result = this.patientMapper.driInsert(driVO);
		int cnt = 1;	
		for(DrugDetailVO vo : drugDetailVOList) {
			//insert 후에는 Z003
			vo.setDiCd(driVO.getDiCd());
			vo.setDdNo(cnt++);
			
			drugDetailVOListNew.add(vo);
		}
		if(result ==0) {
			return 0;
		}else if(result==1){
			log.info("발주테이블 상세 왔다 :  ============");
		  result = result + this.patientMapper.drugDetailInsert(drugDetailVOListNew);
		  log.info("발주테이블 상세, result : " + result);

		  log.info("삭제 왔다.");
		  result = result + this.patientMapper.drugDelete(drugDetailVOListNew);
		  log.info("삭제 , result : "+result);
		}
		
		return result;
	}
	
	/**
	 * 발주상세 테이블 등록 
	 */
	@Override
	public int drugDetailInsert(List<DrugDetailVO> drugDetailVOList) {
		return this.patientMapper.drugDetailInsert(drugDetailVOList);
	}
	
	/**
	 * 발주시 약품주문 삭제 
	 */
	@Override
	public int drugDelete(List<DrugDetailVO> drugDetailVOList) {
		return this.patientMapper.drugDelete(drugDetailVOList);
	}

	/**
	 * 발주 상세 체크 
	 */
	@Override
	public List<DriVO> checkOrder(DriVO driVO) {
		return patientMapper.checkOrder(driVO);
	}
	
	/**
	 * 예약환자 날짜별 검색 
	 */
	@Override
	public List<PatientVO> reservation(PatientVO patientVO) {
		log.info("서비스 ] 예약환자 넘어온 데이터  :"+patientVO);
		return this.patientMapper.reservation(patientVO);
	}

	
	/**
	 * 제증명 신청 
	 */
	@Override
	@Transactional
	public int ctfInsert(CtforVO ctforVO) {
		int result = patientMapper.ctfInsert(ctforVO);
		log.info("왔1. : "+result);
		if(result != 0) {
			result += patientMapper.mediDocuInsert(ctforVO);
			log.info("왔2 : "+ result);
		}else {
			return 0;
		}
		
		return result;
	}

	/**
	 * 제증명 신청내역 
	 */
	@Override
	public List<CtforVO> ctfOrder(CtforVO ctforVO) {
		return patientMapper.ctfOrder(ctforVO);
	}

	/**
	 * 제증명 상세내역
	 */
	@Override
	public List<CtforVO> ctfDetailOrder(CtforVO ctforVO) {
		
		return patientMapper.ctfDetailOrder(ctforVO);
	}

	/**
	 *  특정 환자 진단서 조회 
	 */
	@Override
	public List<PatientVO> diagSelect(PatientVO patientVO) {
		return patientMapper.diagSelect(patientVO);
	}
	
	/**
	 *  특정 환자 소견서 조회 
	 */
	@Override
	public List<PatientVO> noteSelect(PatientVO patientVO) {
		return patientMapper.noteSelect(patientVO);
	}

	/**
	 * 환자 처방전 조회
	 */
	@Override
	public List<PatientVO> preSelect(PatientVO patientVO) {
		return patientMapper.preSelect(patientVO);
	}

	/**
	 * 의사 조회
	 */
	@Override
	public List<EmpVO> docList(EmpVO empVO) {
		return this.patientMapper.docList(empVO);
	}

	/**
	 * 예약 환자 상태 바꾸기
	 */
	@Override
	public int paResUpdate(RcpVO rcpVO) {
		return this.patientMapper.paResUpdate(rcpVO);
	}

	@Override
	public int mediDocuInsert(CtforVO ctforVO) {
		return patientMapper.mediDocuInsert(ctforVO);
	}

	/**
	 * 월별 차트
	 */
	@Override
	public JSONObject monChart() {
		List<Map<String,Object>> list = this.patientMapper.monChart();
		
		for(int i=0; i<list.size(); i++) {
			Map<String, Object> map =list.get(i);
			log.info("앙앙"+map.toString());
		}
		
		JSONObject data = new JSONObject();
		
		JSONObject col1 = new JSONObject(); // 월(속성명)
		JSONObject col2 = new JSONObject(); // 금액(속성명)
		
		JSONArray title = new JSONArray();
		col1.put("lable", "월");
		col1.put("type", "number");
		col2.put("label", "금액");
		col2.put("type", "number");
		title.add(col1);
		title.add(col2);
		
		data.put("cols", title);
		
		JSONArray body = new JSONArray();
		for(Map<String, Object> map :list) {
			JSONObject prodName = new JSONObject();
			prodName.put("v", map.get("EXTRACT(MONTHFROMREC_DT)"));
			
			JSONObject money = new JSONObject();
			money.put("v", map.get("SUM(REC_TOTAL)"));
			
			JSONArray row = new JSONArray();
			row.add(prodName);
			row.add(money);
			
			JSONObject cell = new JSONObject();
			cell.put("c", row);
			
			body.add(cell);
			
			
		}
		data.put("rows", body);
		
		return data;
	}

	@Override
	public JSONObject perChart() {
		List<Map<String,Object>> list = this.patientMapper.perChart();
		
		for(int i=0; i<list.size(); i++) {
			Map<String, Object> map =list.get(i);
			log.info("화화"+map.toString());
		}
		
		JSONObject data = new JSONObject();
		
		JSONObject col1 = new JSONObject(); // 월(속성명)
		JSONObject col2 = new JSONObject(); // 금액(속성명)
		
		JSONArray title = new JSONArray();
		col1.put("lable", "월");
		col1.put("type", "number");
		col2.put("label", "환자수");
		col2.put("type", "number");
		title.add(col1);
		title.add(col2);
		
		data.put("cols", title);
		
		JSONArray body = new JSONArray();
		for(Map<String, Object> map :list) {
			JSONObject prodName = new JSONObject();
			prodName.put("v", map.get("EXTRACT(MONTHFROMPD_TM)"));
			
			JSONObject money = new JSONObject();
			money.put("v", map.get("COUNT(PD_NUM)"));
			
			JSONArray row = new JSONArray();
			row.add(prodName);
			row.add(money);
			
			JSONObject cell = new JSONObject();
			cell.put("c", row);
			
			body.add(cell);
			
			
		}
		data.put("rows", body);
		
		return data;
	}
	
	
	@Override
	public List<Map<String,Object>> paChart() {
		List<Map<String,Object>> list = this.patientMapper.paChart();
		
		for(int i=0; i<list.size(); i++) {
			Map<String, Object> map =list.get(i);
			log.info("paChart"+map.toString());
		}
		
		JSONObject data = new JSONObject();
		
		JSONObject col1 = new JSONObject(); // 월(속성명)
		JSONObject col2 = new JSONObject(); // 금액(속성명)
		
		JSONArray title = new JSONArray();
		col1.put("lable", "초진");
		col1.put("type", "string");
		col2.put("label", "재진");
		col2.put("type", "number");
		title.add(col1);
		title.add(col2);
		
		data.put("cols", title);
		
		JSONArray body = new JSONArray();
		for(Map<String, Object> map :list) {
			JSONObject fVpa = new JSONObject();
			fVpa.put("v", map.get("MAX(RCP_ME)"));
			
			JSONObject paMe = new JSONObject();
			paMe.put("v", map.get("MAX(RCP_FV)"));
			
			JSONArray row = new JSONArray();
			row.add(fVpa);
			row.add(paMe);
			
			JSONObject cell = new JSONObject();
			cell.put("c", row);
			
			body.add(cell);
			
			
		}
		data.put("rows", body);
		
		return list;
	}

	@Override
	public List<InsurereVO> inCheck(String inReg) {
		log.info("서비스 보험체크 : "+inReg);
		return patientMapper.inCheck(inReg);
	}




}
