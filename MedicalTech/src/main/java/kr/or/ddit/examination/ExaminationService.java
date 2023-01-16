package kr.or.ddit.examination;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.com_code_detail.CcdVO;
import kr.or.ddit.file.FileVO;
import kr.or.ddit.order_list.OrdVO;
import kr.or.ddit.patient.PatientVO;

public interface ExaminationService {
	
	// 대기목록 환자 조회
	public List<PatientVO> main();
	
	// 검색한 환자 조회
	public List<PatientVO> paSearch(String paName);
	
	// 환자 상태 Update
	public int patiUdp(String paNo);
	
	// 환자 검사상태 Update
	public int stateUpd(String paNo);
	
	// 환자 검사상태 Cancle
	public int stateCancle(String paNo);
	
	// 대기목록에서 선택한 환자정보 조회
	public PatientVO patiInfo(String paNo);
	
	// 공통코드 selected
	public List<CcdVO> comSelect();
	
	// 오더 목록 조회 
	public List<OrdVO> order(String paNo);
	
	// 오더 카운트 
	public int orderCnt(String paNo);
	
	// 검사 내역 조회
	public List<ExaminationVO> examList(String examCd);
	
	// 파일 업로드
	public int uploadAjaxAction(List<FileVO> fileVOList, ExaminationVO examinationVO);
	
	// 파일 업로드 seq
	public int getSeq(String fileCd);
	
	// 검사 내역 입력
	public int examInsert(ExaminationVO examinationVO);
	
	// 검사 내역 사진보기
	public List<FileVO> searchImg(String examCd);
	
	// 다운로드 파일명 조회
	public ExaminationVO downloadName(String anyCd);
}
