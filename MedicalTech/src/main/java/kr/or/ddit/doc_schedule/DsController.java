package kr.or.ddit.doc_schedule;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.patient.PatientVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class DsController {
	
	@Autowired
	DsService dsService;
	
	@RequestMapping("/doc/calendar")
	public String calendar() {
		return "doc/calendar";
	}
	
   @RequestMapping("/doc/calendar2")
   public String main2() {
      return "doc/calendar2";
   }
	
	// 전체스케줄 조회
	@GetMapping("/doc/calendar-admin-update")
	@ResponseBody
	public List<Map<String, Object>> showAllEventInUpdate() throws Exception{
		
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		
		HashMap<String, Object> hash = new HashMap<>();
		
		List<DsVO> list = dsService.findAll();
		
		log.info("list 리스트 : " + list);
	      for(DsVO ds : list) {
	          hash.put("id", ds.getDsNo());
	          hash.put("title","~"+ ds.getDsFiTm().substring(11) +" "+ ds.getPaName()+" "+ ds.getDsMemo());
	          hash.put("start", ds.getDsStTm()); //시작시간
	          hash.put("end", ds.getDsFiTm()); //끝시간
	          hash.put("dsMemo", ds.getDsMemo()); //증상메모
	          hash.put("paNo",ds.getPaNo()); //환자번호
	          hash.put("paName", ds.getPaName()); //환자이름
	          hash.put("empNo", ds.getEmpNo()); //직원 사번
	          hash.put("empName", ds.getEmpName()); //직원 이름
	          
	          jsonObj = new JSONObject(hash);
	          jsonArr.add(jsonObj);
	       }
	      
		
		log.info("jsonArrCheck:{}",jsonArr);
		return jsonArr;
	}
	
	// 스케줄 등록
	@PostMapping("/doc/calendar-admin-update")
	@ResponseBody
	public String addEvent(@RequestBody List<Map<String, Object>> param) {
		log.info("param : " + param);
		
		 DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.KOREA);
		 
        for (Map<String, Object> list : param) {
            String eventName = (String) list.get("title"); 
            String dsMemo = (String) list.get("dsMemo");
            String startDateString = (String) list.get("start");
            String endDateString = (String) list.get("end");
            String empNo = (String)list.get("empNo"); 
            
            LocalDateTime startDateUTC = LocalDateTime.parse(startDateString, dateTimeFormatter);
            LocalDateTime endDateUTC = LocalDateTime.parse(endDateString, dateTimeFormatter);
            
            LocalDateTime startDate = startDateUTC.plusHours(9);
            LocalDateTime endDate = endDateUTC.plusHours(9);
            
            DsVO dvo = new DsVO();
            dvo.setPaNo(eventName);
            dvo.setDsMemo(dsMemo);
            dvo.setDsStTm(String.valueOf(startDate));
            dvo.setDsFiTm(String.valueOf(endDate));
            dvo.setEmpNo(empNo);
            
            log.info("dvo : " + dvo);
            
            this.dsService.insert(dvo);
          }
        return "/doc/calendar";
	}
		
	// 스케줄 삭제
	@DeleteMapping("/doc/calendar-admin-update")
	@ResponseBody
	public String deleteEvent(@RequestBody List<Map<String, Object>> param) {
		int result = 0;
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.KOREA);
		for (Map<String, Object> list : param) {
			String startDateString = (String) list.get("start");
			log.info("startDate : " + startDateString);
			LocalDateTime startDate = LocalDateTime.parse(startDateString, dateTimeFormatter);
			log.info("startDateUTC : " + startDate);
			result = this.dsService.delete(String.valueOf(startDate));
		}
		if (result > 0) {
			return "/doc/calendar";
		} else {
			return "/doc/calendar-admin-update";
		}
	}
	
	// 스케줄 수정
	@PatchMapping("/doc/calendar-admin-update")
	@ResponseBody
	public String modifyEvent(@RequestBody List<Map<String, Object>> param) {
		int result = 0;
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.KOREA);
		for (Map<String, Object> list : param) {
			String eventName = (String) list.get("title"); // 이름 받아오기
			String startDateString = (String) list.get("start"); // 시작 시간
			String endDateString = (String) list.get("end"); // 끝나는 시간
			String oldStartString = (String) list.get("oldStart");
			String oldEndString = (String) list.get("oldEnd");
			String empNo = (String)list.get("empNo"); 
			LocalDateTime modifiedStartDate = LocalDateTime.parse(startDateString, dateTimeFormatter);
			LocalDateTime modifiedEndDate = LocalDateTime.parse(endDateString, dateTimeFormatter);
			LocalDateTime oldStart = LocalDateTime.parse(oldStartString, dateTimeFormatter);
			LocalDateTime oldEnd = LocalDateTime.parse(oldEndString, dateTimeFormatter);
			DsVO dsVO = new DsVO();
			dsVO.setPaNo(eventName);
			dsVO.setEmpNo(empNo);
			dsVO.setDsStTm(String.valueOf(modifiedStartDate));
			dsVO.setDsFiTm(String.valueOf(modifiedEndDate));
			dsVO.setDsOldStTm(String.valueOf(oldStart));
			dsVO.setDsOldFiTm(String.valueOf(oldEnd));
			log.info("update : " + dsVO.toString());
			result = this.dsService.update(dsVO);
		}
		if (result > 0) {
			return "/doc/calendar";
		} else {
			return "/doc/calendar-admin-update";
		}
	}
	
	// 환자검색
	@PostMapping("/doc/paSer")
	@ResponseBody
	public List<PatientVO> paSer(@RequestBody PatientVO patientVO){
		log.info("patientVO :" + patientVO);
		
		List<PatientVO> patientVOList = this.dsService.paSer(patientVO);
		
		log.info("patientVOList :" + patientVOList);
		
		return patientVOList;
	}
	
	
	@PatchMapping("/doc/calendarupdate")
	@ResponseBody
	// 모달로 전체 업데이트
	public String upModal(@RequestBody List<Map<String, Object>> param) {
		int result = 0;
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.KOREA);
		
		for (Map<String, Object> list : param) {
			String eventName = (String) list.get("title"); // 이름 받아오기
			String startDateString = (String) list.get("start"); // 시작 시간
			String endDateString = (String) list.get("end"); // 끝나는 시간
			String empNo = (String)list.get("empNo"); 
			String dsMemo = (String)list.get("dsMemo"); 
			String dsNo = (String)list.get("id");
            LocalDateTime startDateUTC = LocalDateTime.parse(startDateString, dateTimeFormatter);
            LocalDateTime endDateUTC = LocalDateTime.parse(endDateString, dateTimeFormatter);
            
            LocalDateTime startDate = startDateUTC.plusHours(9);
            LocalDateTime endDate = endDateUTC.plusHours(9);
            
			DsVO dsVO = new DsVO();
			dsVO.setPaNo(eventName);
			dsVO.setEmpNo(empNo);
			dsVO.setDsStTm(String.valueOf(startDate));
			dsVO.setDsFiTm(String.valueOf(endDate));
			dsVO.setDsMemo(String.valueOf(dsMemo));
			dsVO.setDsNo(String.valueOf(dsNo));
			
			log.info("update : " + dsVO.toString());
			result = this.dsService.upModal(dsVO);
		}
		if (result > 0) {
			return "/doc/calendar";
		} else {
			return "/doc/calendar-admin-update";
		}
	}
	
	
}
