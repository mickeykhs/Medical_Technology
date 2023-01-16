package kr.or.ddit.sms;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.drug_order.DrorVO;
import kr.or.ddit.patient.PatientVO;
import kr.or.ddit.re_sms.ResService;
import kr.or.ddit.re_sms.ResVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SmsController {

	@Autowired
	SmsService smsService;
	@Inject
	ResService resService;
	
	@GetMapping("/sms/sms")
	public String drorList(Model model) {
		//예약문구
		List<ResVO> resVOList = this.resService.getMent();
		log.info("resVOList : " + resVOList);
		model.addAttribute("resVOList", resVOList);
		//문자 전송내역
		List<SmsVO> smsVOList = this.smsService.smsList();
		log.info("smsVOList : " + smsVOList);
		model.addAttribute("smsVOList",smsVOList);
		
		return "sms/sms";
	}
	
	// 전달된 휴대폰 번호로 문자 전송(content : 문자보낼 내용)
	@PostMapping("/sms/sendSMS")
	@ResponseBody
	public String sendSMS(@RequestBody Map<String, String> map) {
		log.info("map : " + map);
		this.smsService.recordSMS(map);
		return "Ok";
	}
	
	// 환자검색
	@PostMapping("/sms/searchPa")
	@ResponseBody
	public List<PatientVO> paSearch(@RequestBody PatientVO patientVO){
		log.info("patientVO :" + patientVO);
		
		List<PatientVO> patientVOList = this.smsService.paSearch(patientVO);
		
		log.info("patientVOList :" + patientVOList);
		
		return patientVOList;
	}
	
	//문자전송내역 ajax로 처리해줌
	@ResponseBody
	@PostMapping("/sms/pastSms")
	public List<SmsVO> pastSms(@RequestBody SmsVO smsVO){
		log.info("smsVO : " + smsVO);
		List<SmsVO> psmsList = this.smsService.smsList();
		log.info("psmsList : " + psmsList);
		return psmsList;
	}
	
	//날짜 선택해서 해당날짜 전송내역 불러오기
	@ResponseBody
	@PostMapping("/sms/searchDate")
	public List<SmsVO> searchDate(@RequestBody SmsVO smsVO){
		log.info("smsVO : " + smsVO);
		List<SmsVO> searchDateList = this.smsService.searchDate(smsVO);
		log.info("searchDateList : " + searchDateList);
		return searchDateList;
	}
}
