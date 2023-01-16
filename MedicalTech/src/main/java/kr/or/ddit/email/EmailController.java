package kr.or.ddit.email;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.emp.EmpVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmailController {

    @Autowired
    private JavaMailSender mailSender;

	@Inject
    EmailService emailService; // 서비스를 호출하기위한 의존성 주입
	
	@GetMapping("email")
	public String email() {
		return "/emp/admin_email";
	}
	
	@RequestMapping("write.do") // 이메일 쓰기를 누르면 이 메소드로 맵핑되어서
    public String write() {
        return "/emp/write"; // 다시 write jsp 페이지로 이동하고 jsp페이지에서 내용을 다 채운 뒤에 확인 버튼을 누르면 send.do로 넘어감
    }
/*	
	 @RequestMapping("send.do") // 확인 (메일발송) 버튼을 누르면 맵핑되는 메소드
	    public String send(@ModelAttribute EmailVO email, Model model) {
	        try {
	 
	            emailService.sendMail(email); // email (메일관련 정보)를 sendMail에 저장함
	            model.addAttribute("message", "이메일이 발송되었습니다."); // 이메일이 발송되었다는 메시지를 출력시킨다.
	 
	        } catch (Exception e) {
	            e.printStackTrace();
	            model.addAttribute("message", "이메일 발송 실패..."); // 이메일 발송이 실패되었다는 메시지를 출력
	        }
	        return "/emp/write"; // 실패했으므로 다시 write jsp 페이지로 이동함
	    }
*/	 
	  /* 회원가입시 이메일 인증 */
	    @RequestMapping(value="/emp/mailCheck", method=RequestMethod.GET)
	    @ResponseBody
	    public String mailCheckGET(String email) throws Exception{
	        
	        /* 뷰(View)로부터 넘어온 데이터 확인 */
	        log.info("이메일 데이터 전송 확인");
	        log.info("이메일 : " + email);
	        
	        /* 인증번호(난수) 생성 */
	        Random random = new Random();
	        int checkNum = random.nextInt(888888) + 111111;
	        log.info("인증번호 " + checkNum);
	        
	        /* 이메일 보내기 */
	        String setFrom = "zndntjswn24@naver.com";
	        String toMail = email;
	        String title = "메디케어 회원가입 인증 이메일 입니다.";
	        String content = 
	                "메디컬 테그놀로지 시스템 회원가입을 위한 인증번호 발송 메일입니다." +
	                "<br><br>" + 
	                "인증번호는 " + "<h1 style='color:red;'><strong>" + checkNum + "</strong></h1>" + " 입니다." + 
	                "<br><br>" + 
	                "해당 인증번호를 인증번호"+" 확인란에 기입하여 주세요.";
	        try {
	        	
	        	MimeMessage message = mailSender.createMimeMessage();
	        	MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	        	helper.setFrom(setFrom);
	        	helper.setTo(toMail);
	        	helper.setSubject(title);
	        	helper.setText(content,true);
	        	mailSender.send(message);
	        	
	        }catch(Exception e) {
	        	e.printStackTrace();
	        }
	        String num = Integer.toString(checkNum);
	        
	        return num;
	    }
	    /*비밀번호 찾기에서 이메일로 비번 발송*/
	    @RequestMapping(value="/emp/passSearch", method=RequestMethod.POST)
	    @ResponseBody
	    public String passSearch(String email, @RequestBody String pass) throws Exception{
	        
	        /* 뷰(View)로부터 넘어온 데이터 확인 */
	        log.info("이메일 데이터 전송 확인");
	        log.info("이메일 : " + email);
	        log.info("비밀번호 데이터 전송 확인");
	        log.info("비번 : " + pass);
	        
	        /* 이메일 보내기 */
	        String setFrom = "zndntjswn24@naver.com";
	        String toMail = email;
	        String title = "메디컬 테크놀로지 비밀번호 찾기 이메일 입니다.";
	        String content = 
	                "메디컬 테그놀로지 비밀번호는 " +
	                "<br><br>" + 
	                "<h1 style='color:red;'><strong>" + pass + "</strong></h1>" + " 입니다." + 
	                "<br><br>" + 
	                "해당 비밀버호는 이전에 설정한 비밀번호로, 로그인후  비밀번호를 다시 변경해주세요.";
	        try {
	        	
	        	MimeMessage message = mailSender.createMimeMessage();
	        	MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	        	helper.setFrom(setFrom);
	        	helper.setTo(toMail);
	        	helper.setSubject(title);
	        	helper.setText(content,true);
	        	mailSender.send(message);
	        	
	        }catch(Exception e) {
	        	e.printStackTrace();
	        }
	        String num = pass;
	        
	        return num;
	    }
	    
	    /*관리자 직원 승인여부 이메일*/
	    @RequestMapping(value="/admin/enabledEmail", method=RequestMethod.POST)
	    @ResponseBody
	    public EmpVO enabledEmail(String email, @RequestBody EmpVO empVO) throws Exception{
	        
	        /* 뷰(View)로부터 넘어온 데이터 확인 */
	        log.info("이메일 데이터 전송 확인-----------------------------------------------");
	        log.info("이메일 : " + email);
	        log.info("비밀번호 데이터 전송 확인----------------------------------------------");
	        log.info("비번 : " + empVO.getEmpPw());
	        log.info("사번 데이터 전송 확인-------------------------------------------------");
	        log.info("사번 : " + empVO.getEmpNo());
	        
	        /* 이메일 보내기 */
	        String setFrom = "zndntjswn24@naver.com";
	        String toMail = email;
	        String title = "메디컬 테크놀로지 승인이 완료 이메일 입니다.";
	        String content = 
	                "메디컬 테그놀로지 아이디는 사번을 사용하고 비밀번호는 임시 비밀번호 입니다. " +
	                "<br><br>" + 
	                "사번(아이디)은<h1 style='color:blue; display:inline;'><strong>"+ " " + empVO.getEmpNo() + " " +"</strong></h1> 입니다." +
	                "<br>"+
	                "비밀번호는 <h1 style='color:red; display:inline;'><strong>"+ "  " + empVO.getEmpPw() + " " +"</strong></h1>" + " 입니다." + 
	                "<br><br>" + 
	                "해당 비밀번호는 임시 비밀번호로,  최초 로그인시 비밀번호 변경 창에서 변경하여 사용해 주시기 바랍니다.";
	        try {
	        	
	        	MimeMessage message = mailSender.createMimeMessage();
	        	MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	        	helper.setFrom(setFrom);
	        	helper.setTo(toMail);
	        	helper.setSubject(title);
	        	helper.setText(content,true);
	        	mailSender.send(message);
	        	
	        }catch(Exception e) {
	        	e.printStackTrace();
	        }
	        return empVO;
	    }
	    
	    /* 개인정보 수정 이메일변경 인증 */
	    @RequestMapping(value="/emp/myEmail", method=RequestMethod.GET)
	    @ResponseBody
	    public String myEmail(String email) throws Exception{
	        
	        /* 뷰(View)로부터 넘어온 데이터 확인 */
	        log.info("이메일 데이터 전송 확인");
	        log.info("이메일 : " + email);
	        
	        /* 인증번호(난수) 생성 */
	        Random random = new Random();
	        int checkNum = random.nextInt(888888) + 111111;
	        log.info("인증번호 " + checkNum);
	        
	        /* 이메일 보내기 */
	        String setFrom = "zndntjswn24@naver.com";
	        String toMail = email;
	        String title = "메디케어 개인정보 수정 인증 이메일 입니다.";
	        String content = 
	                "메디컬 테그놀로지 시스템 개인정보 수정을 위한 인증번호 발송 메일입니다." +
	                "<br><br>" + 
	                "인증번호는 " + "<h1 style='color:red;'><strong>" + checkNum + "</strong></h1>" + " 입니다." + 
	                "<br><br>" + 
	                "해당 인증번호를 인증번호"+" 확인란에 기입하여 주세요.";
	        try {
	        	
	        	MimeMessage message = mailSender.createMimeMessage();
	        	MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	        	helper.setFrom(setFrom);
	        	helper.setTo(toMail);
	        	helper.setSubject(title);
	        	helper.setText(content,true);
	        	mailSender.send(message);
	        	
	        }catch(Exception e) {
	        	e.printStackTrace();
	        }
	        String num = Integer.toString(checkNum);
	        
	        return num;
	    }
}
