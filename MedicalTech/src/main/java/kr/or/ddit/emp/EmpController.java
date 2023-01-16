package kr.or.ddit.emp;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sun.org.apache.bcel.internal.generic.RET;

import kr.or.ddit.certificate_order.CtforService;
import kr.or.ddit.certificate_order.CtforVO;
import kr.or.ddit.chart.ChartVO;
import kr.or.ddit.email.EmailService;
import kr.or.ddit.file.FileVO;
import kr.or.ddit.patient.PatientVO;
import kr.or.ddit.receipt.RcpVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmpController {
	@Inject
    EmailService emailService; // 서비스를 호출하기위한 의존성 주입
	
	@Inject
	CtforService ctforService;

	@Autowired
	EmpService empService;
	
	// 병원 메인페이지(홈)
	@GetMapping("/main/main")
	public String main() {
		return "main/main";
	}
	
	//간호사 메인페이지
	@GetMapping("/nurse/calendar")
	public String nurse() {
		return "nurse/calendar";
	}
	
	// 의사화면에 환자,의사정보
//	@PreAuthorize("hasRole('ROLE_DOCTOR')")
	@GetMapping("/doctor/view")
	public String list(Model model, String empNo,HttpSession session) {
		List<EmpVO> empVOList = this.empService.list(empNo);
		log.info("empVOList : " + empVOList);
//		EmpVO doctor = (EmpVO) session.getAttribute("login");
//		log.info("empVO: ++++++ "+doctor.getEmpName());
//		List<RcpVO> rcpVOList = this.empService.treatPaList();
//		log.info("rcpVOList : " + rcpVOList);
		
//		List<CtforVO> ctforVOList = this.ctforService.ctfList();
		
		model.addAttribute("empVOList", empVOList);
//		model.addAttribute("rcpVOList", rcpVOList);
//		model.addAttribute("ctforVOList", ctforVOList);
//		model.addAttribute("doctor", doctor);
		
		// forwarding
		return "doctor/view";
		
	}
	// 의사 화면에 진료환자대기목록 뿌려주기
	@ResponseBody
	@PostMapping("/patient/treatStandby")
	public List<RcpVO> treatPaList() {
		List<RcpVO> rcpVOList = this.empService.treatPaList();
		return rcpVOList;
	}
	
	// 의사 화면에서 제증명 신청 환자목록 뿌려주기
	@ResponseBody
	@PostMapping("/patient/ctforStandby")
	public List<CtforVO> ctfList(){
		List<CtforVO> ctforVOList = this.ctforService.ctfList();
		
		return ctforVOList;
	}
	
	
	
	// 환자 상태 업데이트
	@ResponseBody
	@PostMapping("/patient/state")
	public String paStateUp(@RequestBody PatientVO patientVO) {
		int state = this.empService.paStateUp(patientVO);
		
		log.info("state : " + state);
		
		return "redirect:/doctor/view";
	}
	// 환자 상태 업데이트2
	@ResponseBody
	@PostMapping("/pastate/update")
	public String paStateUp2(@RequestBody PatientVO patientVO) {
		int state = this.empService.paStateUp2(patientVO);
		
		log.info("state : " + state);
		
		return "redirect:/doctor/view";
	}
	
	
	// 환자 정보 검색
	@ResponseBody
	@PostMapping("/doctor/searchPa")
	public List<PatientVO> searchPa(@RequestBody PatientVO patientVO) {

		log.info("patientVO : " + patientVO);

		List<PatientVO> patientVOList = this.empService.searchPa(patientVO);

//		log.info("patientVOList : " + patientVOList);

		return patientVOList;
	}
	// 환자 진료시작시 정보 등록
//	@ResponseBody
//	@PostMapping("/doctor/registPa")
//	public List<RcpVO> registPa(@RequestBody RcpVO rcpVO){
//		List<RcpVO> rcpVOList = this.empService.treatPaList();
//		
//		log.info("rcpVOList : " + rcpVOList);
//		return rcpVOList;
//	}
	// 진료환자목록 차트에 환자 상세정보 
	@ResponseBody
	@PostMapping("/doctor/paList")
	public PatientVO paList(Model model, @RequestBody PatientVO patientVO){
		PatientVO pavo = this.empService.paList(patientVO.getPaNo());
		
		log.info("pavo : " + pavo);
		model.addAttribute("pavo", pavo);
		return pavo;
	}
	
	// 진료환자목록 차트에 접수번호
	@ResponseBody
	@PostMapping("/doctor/chart")
	public List<ChartVO> chart(Model model, @RequestBody ChartVO chartVO) {
		List<ChartVO> chvo = this.empService.chart(chartVO.getPaNo());
		
		log.info("chvo : " + chvo);
		
		model.addAttribute("chvo", chvo);
		
		return chvo;
	}
	// 차트리스트 상세정보
	@ResponseBody
	@PostMapping("/chart/rcpList")
	public List<RcpVO> rcpList(Model model, @RequestBody RcpVO rcpVO) {
		List<RcpVO> rvo = this.empService.rcpList(rcpVO.getPaNo());
		
		log.info("rvo : " + rvo);
		
		model.addAttribute("rvo", rvo);
		
		return rvo;
	}
	
	//회원가입
	@GetMapping("/emp/join")
	public String join() {
		return "emp/join";
	}
	//회원가입
	@PostMapping("/emp/insert")
	public String insert(@ModelAttribute EmpVO empVO) {
		log.info("회원가입 VO : " + empVO.toString());
		int result = empService.insert(empVO);
		log.info("회원가입 empNO : " + empVO.getEmpNo());
		return "redirect:/emp/login";
	}
	
	//마이 페이지 화면
	@GetMapping("/emp/mypage")
	public String MyPage() {
		return "emp/mypage";
	}
	
	//마이 페이지 
	@PostMapping("/emp/mypage")
	@ResponseBody
	public EmpVO empMyPage(@RequestBody EmpVO empVO) {
		EmpVO result = empService.empMyPage(empVO);
		log.info("이것이 날짜 확인 : " + result);
		return result;
	}
	
	//마이페이지 개인정보 수정(Update)
	@PostMapping("/emp/myPageUpdate")
	@ResponseBody
	public int myPageUpdate(EmpVO empVO) throws Exception, Exception {
	
		String uploadFolder = 
	            "C:\\eGovFrameDev-3.10.0-64bit\\workspace\\MedicalTech\\src\\main\\webapp\\resources\\upload";
		log.info("이거야:" + empVO.getSunjuImg().getOriginalFilename() + "pppp");
		//문자열 비교 주의 equals 사용!!!!
		if(!empVO.getSunjuImg().getOriginalFilename().equals("")) {
			File saveFile = new File(uploadFolder + "/" + empVO.getSunjuImg().getOriginalFilename());
			log.info("----------------------------------------------------");
			log.info(empVO.getSunjuImg().getOriginalFilename());
			log.info("----------------------------------------------------");
			empVO.getSunjuImg().transferTo(saveFile);	
			empVO.setEmpWt("/resources/upload/"+ empVO.getSunjuImg().getOriginalFilename());
		}
		
		log.info("확인 : " + empVO);
		
		int result = empService.myPageUpdate(empVO);
		return result;
	}
	
	//로그아웃
	@GetMapping("/emp/logout")
	public String logout(HttpSession session) {
//		session.invalidate();
		return "security/loginForm"; 
	}
	
	//관리자 화면
	@GetMapping("/emp/admin")
	public String admin() {
		return "emp/admin";
	}
	// 로그인 실패시
	@GetMapping("/emp/loginForm")
	public String empLoginForm(@RequestParam(value="error", required = false) String error, 
			 				   @RequestParam(value = "exception", required = false) String exception, Model model) {
		model.addAttribute("error", error);
		model.addAttribute("exception", exception);
        return "security/loginForm";
	}
	
	//관리자화면 직원 리스트
	@GetMapping("/admin/list")
	public String empList(Model model, @RequestParam Map<String, String> map) {
		List<EmpVO> emplist = empService.empList(map);
		model.addAttribute("emplist", emplist);
		log.info("empList : " + emplist);
		return "emp/admin";
	}
	
	//관리자화면 직원 detail
	@PostMapping("/admin/detail")
	@ResponseBody
	public EmpVO adminDetail(@RequestBody EmpVO empVO) {
		log.info("empNo : " + empVO.getEmpNo());
		EmpVO result = empService.adminDetail(empVO.getEmpNo());
		log.info("result : " + result);
		return result;
		
	}
	
	//관리자가 승인하면 승인여부 N -> Y
	@PostMapping("/admin/update")
	@ResponseBody
	public String adminUpdate(@RequestBody EmpVO empVO) {
		log.info("--------------------------------------------------------------");
		log.info("admin Update : " + empVO.toString());
		int update = empService.adminUpdate(empVO);
		
		if(update == 1) {
			return "OK";
		}
		return "NO";
	}
	
    //비밀번호 변경 화면
    @GetMapping("/emp/pass")
    public String pass() {
	    return"emp/password";
    }
    
    
    //비밀번호 변경
    @PostMapping("/emp/newpass")
    public String newpass(HttpSession session, @ModelAttribute EmpVO empVO, Model model) {
	    int pass = empService.pwUpdate(empVO);
	   
	    session.getAttribute("login"); 
	    model.addAttribute("login", session.getAttribute("login"));
	    log.info("-------------------------------------");
	    log.info("확인 : " + empVO);
	    log.info("-------------------------------------");
	    if(pass == 1) {
	    	log.info("확인 : " + pass);
		    return "redirect:/emp/login";
	    }
	    return "redirect:/emp/login";
    }
    
   
    //비밀번호 찾기
    @GetMapping("/emp/pwSearch")
    public String pwSearchGet() {
    	return "emp/login";
    }
	
	//비밀번호 찾기
	@PostMapping("/emp/pwSearch")
	@ResponseBody 
	public String pwSearch(@RequestBody EmpVO empVO) {
		EmpVO VO = this.empService.pwSearch(empVO); 
		 log.info("비밀버호 찾기!! : " + VO.getEmpPw()); 
		String pw = VO.getEmpPw();
		return pw;
	}
	
	//관리자가 직원 검색하기
	@PostMapping("/admin/adminSearch")
	@ResponseBody
	public List<EmpVO> adminSearch(@RequestBody EmpVO empVO) {
		List<EmpVO> empVOList = this.empService.adminSearch(empVO);
		return empVOList;
	}
	
	//관리자 직원 이미지 검색
	@PostMapping("/admin/adminImg")
	@ResponseBody
	public EmpVO adminImg(@RequestBody EmpVO empVO) {
		log.info("사번 : " + empVO.getEmpNo());
		
		EmpVO emp = empService.adminImg(empVO.getEmpNo());
		
		return emp;
	}
	
 }