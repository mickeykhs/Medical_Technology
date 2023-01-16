package kr.or.ddit.emp;

import java.util.List;
import java.util.Map;

import kr.or.ddit.authority.EmpAuthVO;
import kr.or.ddit.chart.ChartVO;
import kr.or.ddit.file.FileVO;
import kr.or.ddit.patient.PatientVO;
import kr.or.ddit.receipt.RcpVO;

public interface EmpService {
	// 메서드 시그니쳐
	// 진료환자목록
	public List<RcpVO> treatPaList();
	// 직원 목록
	public List<EmpVO> list(String empNo);
	// 직원 상세
	
	// 직원 수정
	
	// 직원 추가
	
	// 직원 삭제
	
	// 환자 검색
	public List<PatientVO> searchPa(PatientVO patientVO);
	// 차트에 넣을 환자정보
	public PatientVO paList(String paNo);
	public List<ChartVO> chart(String paNo);
	public List<RcpVO> rcpList(String paNo);
	// 환자상태 업데이트
	public int paStateUp(PatientVO patientVO);
	
	// 회원가입 insert
	public int insert(EmpVO empVO);
	
	//마이 페이지 
	public EmpVO empMyPage(EmpVO empVO);

	//마이 페이지 개인정보 수정
	public int myPageUpdate(EmpVO empVO);

	// 시큐리티 로그인
//	public EmpVO login(String empNo);
	
	// 관리자화면 직원 리스트
	public List<EmpVO> empList(Map<String, String> map);
	
	// 관리자화면 직원 상세보기
	public EmpVO adminDetail(String empNo);
	
	//관리자가 직원 승인시 승인여부 update
	public int adminUpdate(EmpVO empVO);
	
	//비밀번호 변경
	public int pwUpdate(EmpVO empVO);
	
	//비밀번호 찾기
	public EmpVO pwSearch(EmpVO empVO);
	
	public int paStateUp2(PatientVO patientVO);
	
	//관리자가 직원 검색
	public List<EmpVO> adminSearch(EmpVO empVO);	
	
	//관리자 직원 이미지 조회
	public EmpVO adminImg(String empNo);
	

	
}
