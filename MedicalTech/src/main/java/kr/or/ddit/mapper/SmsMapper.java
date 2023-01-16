package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.patient.PatientVO;
import kr.or.ddit.sms.SmsVO;


public interface SmsMapper {
     
	//문자 전송하기
	public void recordSMS(Map<String, String> map);

	// 환자 검색
	public List<PatientVO> paSearch(PatientVO patientVO);
	
	//문자 전송내역 불러오기
	public List<SmsVO> smsList();

	//날짜 선택해서 해당날짜 전송내역 불러오기
	public List<SmsVO> searchDate(SmsVO smsVO);
}
