package kr.or.ddit.emp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.chart.ChartVO;
import kr.or.ddit.file.FileVO;
import kr.or.ddit.mapper.EmpMapper;
import kr.or.ddit.patient.PatientVO;
import kr.or.ddit.receipt.RcpVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class EmpServiceimpl implements EmpService{
	
	@Autowired
	EmpMapper empMapper;
	
	// 진료환자목록
	@Override
	public List<RcpVO> treatPaList() {
		return this.empMapper.treatPaList();
	}
	// 차트에넣을 환자정보
	public PatientVO paList(String paNo){
		return this.empMapper.paList(paNo);
	}

	//회원가입
	@Override
	public int insert(EmpVO empVO) {
		return this.empMapper.insert(empVO);
	}
	
	//마이 페이지 
	@Override
	public EmpVO empMyPage(EmpVO empVO) {
		return this.empMapper.empMyPage(empVO);
		 
	}
	// 시큐리티 로그인
//	public EmpVO login(String empNo) {
//		return this.empMapper.login(empNo);
//		
//	}
	
	// 직원 리스트
	@Override
	public List<EmpVO> list(String empNo) {
		return this.empMapper.list(empNo);
	}
	
	// 환자 검색
	@Override
	public List<PatientVO> searchPa(PatientVO patientVO) {
		return this.empMapper.searchPa(patientVO);
	}


	//관리자 화면 직원 리스트
	@Override
	public List<EmpVO> empList(Map<String, String> map) {
		return empMapper.empList(map);
	}

	@Override
	public EmpVO adminDetail(String empNo) {
		return empMapper.adminDetail(empNo);
	}

	// 환자목록에서 차트쪽으로 뿌릴때
	@Override
	public List<ChartVO> chart(String paNo) {
		return this.empMapper.chart(paNo);
	}
	
	// 환자 상태 업데이트
	@Override
	public int paStateUp(PatientVO patientVO) {
		return this.empMapper.paStateUp(patientVO);
	}

	//관리자가 직원 승인시 승인여부 update
	/*@Override
	@Transactional
	public int adminUpdate(EmpVO empVO) {
		int result =0;
		result += empMapper.adminUpdate(empVO);
		log.info("업데이트 성공여부 : " + result);
	     if(result !=0 ) {
	        result += empMapper.authorityInsert(empVO.getEmpNo());
	        log.info("auth 확인 : " + result);
	     }
	     return result;
   }*/
	//관리자가 직원 승인시 승인여부 update
	@Override
	@Transactional
	public int adminUpdate(EmpVO empVO) {
		int result = 0;
		result += empMapper.adminUpdate(empVO);
		log.info("업데이트 성공여부 : " + result);
		if(result !=0 ) {
			if(empVO.getJobGubun().equals("간호사")) {
				empVO.setEmpWt("ROLE_NURSE");
			}else if(empVO.getJobGubun().equals("의사")) {
				empVO.setEmpWt("ROLE_DOCTOR");
			}else if(empVO.getJobGubun().equals("원무과")) {
				empVO.setEmpWt("ROLE_ADMINISTRATION");
			}else if(empVO.getJobGubun().equals("영상의학과")) {
				empVO.setEmpWt("ROLE_RADIOLOGY");
			}
	        result += empMapper.authorityInsert(empVO);
	        log.info("auth 확인 : " + empVO.getEmpWt());
	     }
		return result;
	}
	
	
	//비밀번호 변경
	@Override
	public int pwUpdate(EmpVO empVO) {
		log.info("check : " + empVO);
		return empMapper.pwUpdate(empVO);
	}

	//비밀번호찾기
	@Override
	public EmpVO pwSearch(EmpVO empVO) {
		log.info("pwEmpNo : " + empVO.getEmpNo());
		log.info("pwEmpMail : " + empVO.getEmpMail());
		return empMapper.pwSearch(empVO);
	}
	
	
	@Override
	public List<RcpVO> rcpList(String paNo) {
		return this.empMapper.rcpList(paNo);
	}
	
	// 환자상태 업데이트2
	@Override
	public int paStateUp2(PatientVO patientVO) {
		return this.empMapper.paStateUp2(patientVO);
	}
	
	
	// 관리자가 직원 검색
	@Override
	public List<EmpVO> adminSearch(EmpVO empVO) {
		
		return empMapper.adminSearch(empVO);
	}
	
	//관리자 직원 이미지 조회
	@Override
	public EmpVO adminImg(String empNo) {
		log.info("check : " + empNo);
		return this.empMapper.adminImg(empNo);
	}
	
	//마이 페이지 개인정보 수정
	@Override
	public int myPageUpdate(EmpVO empVO) {
		return empMapper.myPageUpdate(empVO);
	}
		
}
