package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import kr.or.ddit.certificate_order.CtforVO;
import kr.or.ddit.doc_office.DoVO;
import kr.or.ddit.drug_indent.DriVO;
import kr.or.ddit.drug_order.DrorVO;
import kr.or.ddit.durg_detail.DrugDetailVO;
import kr.or.ddit.emp.EmpVO;
import kr.or.ddit.insurere.InsurereVO;
import kr.or.ddit.patient.PatientVO;
import kr.or.ddit.receipt.RcpVO;

public interface AdministrativeMapper {
	
		// 보험여부 확인
		public List<InsurereVO> inCheck(String inReg);

	// 진료실 대기 환자 보여주기
		public List<PatientVO> patientList();

		// 접수환자 검색 
		public List<PatientVO> searchPa(PatientVO patientVO);
		
		// 진료실 환자 목록
		public List<PatientVO> doSelect(PatientVO patientVO);
		
		// 진료실 등록 
		public int doInsert(RcpVO rcpVO);
		
		// 접수 등록 
		public int reInsert(RcpVO rcpVO);
		
		// 신규환자 등록
		public int paInsert(PatientVO patientVO);
		
		// 환자정보 수정
		public int paUpdate(PatientVO patientVO);
		
		// 간호사 주문 요청 내역 
		public List<DrorVO> nurOrderList();
		
		// 발주 내역 
		public List<DriVO> drugList();
		
		// 발주 주문 신청  
		public int driInsert(DriVO driVO);
		
		// 발주 상세 주문 등록 
		public int drugDetailInsert(List<DrugDetailVO> drugDetailVOList);
		
		// 발주시 약품주문 삭제 
		public int drugDelete(List<DrugDetailVO> drugDetailVOList);
		
		//발주 상세 체크 
		public List<DriVO> checkOrder(DriVO driVO);
		
		// 예약환자 날짜별 검색 
		public List<PatientVO> reservation(PatientVO patientVO);
		
		// 제증명 신청
		public int ctfInsert(CtforVO ctforVO);
		
		// 제증명 신청 내역 
		public List<CtforVO> ctfOrder(CtforVO ctforVO);
		
		// 제증명 상세 신청 내역
		public List<CtforVO> ctfDetailOrder(CtforVO ctforVO);
		
		// 환자 진단서 조회 
		public List<PatientVO> diagSelect(PatientVO patientVO);
		
		// 환자 소견서 조회
		public List<PatientVO> noteSelect(PatientVO patientVO);
		
		// 환자 처방전 조회
		public List<PatientVO> preSelect(PatientVO patientVO);
		
		// 의사 목록 
		public List<EmpVO> docList(EmpVO empVO);
		
		// 환자 예약 상태 바꾸기 
		public int paResUpdate(RcpVO rcpVO);
		
		// 의료문서 추가 
		public int mediDocuInsert(CtforVO ctforVO);
		
		// 월별 매출 차트 
		public List<Map<String,Object>> monChart();
		
		// 월별 방문환자 수 차트
		public List<Map<String,Object>> perChart();
		
		//초진 재진 차트
		public List<Map<String,Object>> paChart();
		
}
