package kr.or.ddit.examination;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.com_code_detail.CcdVO;
import kr.or.ddit.file.FileVO;
import kr.or.ddit.mapper.ExaminationMapper;
import kr.or.ddit.order_list.OrdVO;
import kr.or.ddit.patient.PatientVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ExaminationServiceImpl implements ExaminationService {

	@Autowired
	ExaminationMapper examinationMapper;
	
	// 대기목록 환자 조회
	@Override
	public List<PatientVO> main() {
		return this.examinationMapper.main();
	}
	
	// 검색한 환자정보 조회
	@Override
	public List<PatientVO> paSearch(String paName) {
		return this.examinationMapper.paSearch(paName);
	}
	
	// 환자 상태 Update
	@Override
	public int patiUdp(String paNo) {
		return this.examinationMapper.patiUdp(paNo);
	}
	
	// 환자 검사상태 Update
	@Override
	public int stateUpd(String paNo) {
		return this.examinationMapper.stateUpd(paNo);
	}
	
	// 환자 검사상태 Cancle
	@Override
	public int stateCancle(String paNo) {
		return this.examinationMapper.stateCancle(paNo);
	}
	
	// 대기목록에서 선택한 환자정보 조회
	@Override
	public PatientVO patiInfo(String paNo) {
		return this.examinationMapper.patiInfo(paNo);
	}
	
	// 공통코드 selected
	@Override
	public List<CcdVO> comSelect() {
		return this.examinationMapper.comSelect();
	}
	
	// 오더 목록 조회 
	@Override
	public List<OrdVO> order(String paNo) {
		return this.examinationMapper.order(paNo);
	}
	
	@Override
	// 오더 목록 카운트
 	public int orderCnt(String paNo) {
		return this.examinationMapper.orderCnt(paNo);
	}
	
	// 검사 내역 조회
	@Override
	public List<ExaminationVO> examList(String paNo) {
		return this.examinationMapper.examList(paNo);
	}
	
	// 파일 업로드
	@Override
	@Transactional
	public int uploadAjaxAction(List<FileVO> fileVOList, ExaminationVO examinationVO) {
		int result = this.examinationMapper.uploadAjaxAction(fileVOList);
		
		if(result > 0) {
			// 오더 상태 update
			result = result + this.examinationMapper.orderUpd(examinationVO.getToOrNo());
		} else {
			return 0;
		}
		
		return result;
	}
	
	// 파일 업로드 seq
	@Override
	public int getSeq(String examCd) {
		return this.examinationMapper.getSeq(examCd);
	}
	
	// 검사 내역 입력
	@Override
	public int examInsert(ExaminationVO examinationVO) {
		int result = 0;
		result = this.examinationMapper.examInsert(examinationVO);
			
		// 카운트 조회
		int cnt = this.examinationMapper.orderCnt(examinationVO.getPaNo());
		log.info("cnt : " + cnt);
		if(cnt == 1) {
			// 대기환자 상태업데이트
			examinationMapper.stateComplete(examinationVO.getPaNo());
		}
		
		return result;
	}
	
	// 검사 내역 사진 보기 
	@Override
	public List<FileVO> searchImg(String examCd) {
		return this.examinationMapper.searchImg(examCd);
	}
	
	// 다운로드 파일명 조회
	@Override
	public ExaminationVO downloadName(String anyCd) {
		return this.examinationMapper.downloadName(anyCd);
	}
}
