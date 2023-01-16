package kr.or.ddit.nur_schedule;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.doc_schedule.DsVO;
import kr.or.ddit.emp.EmpVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
//@RequestMapping("/nurse")
public class NurController {
   
   @Inject
   NurService nurservice;
   
//   @RequestMapping("/nurse/calendar/calendar")
//   public String main() {
//      return "nurse/calendar/calendar";
//   }
   
   @RequestMapping("/nurse/calendar/loadingPage")
   public String zjkzjk2() {
	   return "nurse/calendar/loadingPage";
   }
   
   @RequestMapping("/nurse/calendar2")
   public String main2() {
      return "nurse/calendar2";
   }
   @RequestMapping("/nurse/calendar")
   public String main() {
	   return "nurse/calendar";
   }
   
   
   // 전체스케줄 조회
   @GetMapping("/nurse/calendar/calendar-admin-update")
   @ResponseBody
   public List<Map<String, Object>> showAllEventInUpdate() throws Exception{
      
	  SimpleDateFormat sdf = new SimpleDateFormat("a HH:mm");
	   
      JSONObject jsonObj = new JSONObject();
      JSONArray jsonArr = new JSONArray();
      
      HashMap<String, Object> hash = new HashMap<>();
      
      List<NurVO> list = nurservice.findAll();
      
      for(NurVO nur : list) {
         hash.put("id", nur.getNurCd());
         hash.put("title", "~ " + nur.getNurFiTm().substring(11)  + " " +  nur.getEmpName() + " " + nur.getNurComments());
         //hash.put("title", "~ " + str + nur.getNurFiTm().substring(13)  + " " +  nur.getEmpName() + " " + nur.getNurComments());
         hash.put("start", nur.getNurStTm());
         hash.put("end", nur.getNurFiTm());
         hash.put("comments", nur.getNurComments()); //증상메모
         hash.put("empNo",nur.getEmpNo()); //근무자 사번
         hash.put("empName", nur.getEmpName()); //근무자이름
         hash.put("nurEnwt", nur.getNurEnwt()); //직원 사번
         hash.put("nurEnnm", nur.getNurEnnm()); //직원 이름
         
         
         jsonObj = new JSONObject(hash);
         jsonArr.add(jsonObj);
      }
      log.info("jsonArrCheck:{}",jsonArr);
      return jsonArr;
   }
   
   // 스케줄 등록
   @PostMapping("/nurse/calendar/calendar-admin-update")
   @ResponseBody
   public String addEvent(@RequestBody List<Map<String, Object>> param) {
	   log.info("param : " + param);
      
       DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.KOREA);
       
        for (Map<String, Object> list : param) {
 
            String eventName = (String) list.get("title"); // 사번으로 등록
            String startDateString = (String) list.get("start");
            String endDateString = (String) list.get("end");
            String nurComments = (String) list.get("nurComments");
            String nurEnwt = (String)list.get("nurEnwt");
            String nurEnnm = (String)list.get("nurEnnm");

            LocalDateTime startDateUTC = LocalDateTime.parse(startDateString, dateTimeFormatter);
            LocalDateTime endDateUTC = LocalDateTime.parse(endDateString, dateTimeFormatter);
            
            LocalDateTime startDate = startDateUTC.plusHours(9);
            LocalDateTime endDate = endDateUTC.plusHours(9);
            
            NurVO nvo = new NurVO();
            
            nvo.setEmpNo(eventName);
            nvo.setNurStTm(String.valueOf(startDate));
            nvo.setNurFiTm(String.valueOf(endDate));
            nvo.setNurComments(nurComments);
            nvo.setNurEnwt(nurEnwt);
            nvo.setNurEnnm(nurEnnm);
            
            this.nurservice.insert(nvo);
          }
        return "nurse/calendar";
   }
   
   // 스케줄 삭제
   @DeleteMapping("/nurse/calendar/calendar-admin-update")
   @ResponseBody
   public String deleteEvent(@RequestBody List<Map<String, Object>> param) {
      int result = 0;
      DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.KOREA);
      for (Map<String, Object> list : param) {
         String startDateString = (String) list.get("start");
         log.info("startDate : " + startDateString);
         LocalDateTime startDate = LocalDateTime.parse(startDateString, dateTimeFormatter);
         log.info("startDateUTC : " + startDate);
         result = this.nurservice.delete(String.valueOf(startDate));
      }
      if (result > 0) {
         return "nurse/calendar";
      } else {
         return "nurse/calendar/calendar-admin-update";
      }
   }
   
   // 스케줄 수정
   @PatchMapping("/nurse/calendar/calendar-admin-update")
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
         LocalDateTime modifiedStartDate = LocalDateTime.parse(startDateString, dateTimeFormatter);
         LocalDateTime modifiedEndDate = LocalDateTime.parse(endDateString, dateTimeFormatter);
         LocalDateTime oldStart = LocalDateTime.parse(oldStartString, dateTimeFormatter);
         LocalDateTime oldEnd = LocalDateTime.parse(oldEndString, dateTimeFormatter);
         NurVO nurVO = new NurVO();
         nurVO.setEmpName(eventName);
         nurVO.setNurStTm(String.valueOf(modifiedStartDate));
         nurVO.setNurFiTm(String.valueOf(modifiedEndDate));
         nurVO.setNurOldStTm(String.valueOf(oldStart));
         nurVO.setNurOldFiTm(String.valueOf(oldEnd));
         log.info("update : " + nurVO.toString());
         result = this.nurservice.update(nurVO);
      }
      if (result > 0) {
         return "nurse/calendar";
      } else {
         return "nurse/calendar/calendar-admin-update";
      }
   }
   
	// 간호사 검색
   @PostMapping("/nurse/nurSearch")
   @ResponseBody
	public List<EmpVO> nurSearch(@RequestBody EmpVO empVO){
		log.info("empVO : " + empVO);
		
		List<EmpVO> nurVOList = this.nurservice.nurSearch(empVO);
		
		log.info("nurVOList :" + nurVOList);
		
		return nurVOList;
	}
   
   
	@PatchMapping("/nurse/calendarupdate")
	@ResponseBody
	// 모달로 전체 업데이트
	public String upModal(@RequestBody List<Map<String, Object>> param) {
		int result = 0;
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.KOREA);
		
		for (Map<String, Object> list : param) {
			String eventName = (String) list.get("title"); // 근무자 사번
			String startDateString = (String) list.get("start"); // 시작 시간
			String endDateString = (String) list.get("end"); // 끝나는 시간
			String nurEnwt = (String)list.get("nurEnwt"); //등록자 사번
			String nurEnnm = (String)list.get("nurEnnm");  //등록자 이름
			String comments = (String)list.get("comments");  //근무 구분
			String nurCd = (String)list.get("id"); //PK , 시퀀스
            LocalDateTime startDateUTC = LocalDateTime.parse(startDateString, dateTimeFormatter);
            LocalDateTime endDateUTC = LocalDateTime.parse(endDateString, dateTimeFormatter);
           
            LocalDateTime startDate = startDateUTC.plusHours(9);
            LocalDateTime endDate = endDateUTC.plusHours(9);
           			
            NurVO nurVO = new NurVO();
            
            nurVO.setEmpNo(eventName); //근무자 사번
            nurVO.setNurStTm(String.valueOf(startDate)); //시작
            nurVO.setNurFiTm(String.valueOf(endDate)); //끝
            nurVO.setNurComments(comments); //근무구분
            nurVO.setNurEnwt(nurEnwt); //작성자 사번
            nurVO.setNurEnnm(nurEnnm); //작성자 이름
            nurVO.setNurCd(nurCd); //PK
			
			
			log.info("update : " + nurVO.toString());
			result = this.nurservice.upModal(nurVO);
		}
		if (result > 0) {
			return "nurse/calendar";
		} else {
			return "nurse/calendar/calendar-admin-update";
		}
	}

}