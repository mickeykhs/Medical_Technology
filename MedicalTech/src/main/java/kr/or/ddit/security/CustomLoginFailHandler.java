package kr.or.ddit.security;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.session.SessionAuthenticationException;

public class CustomLoginFailHandler implements AuthenticationFailureHandler {

	private String loginidname;
	private String loginpwdname;
	private String errormsgname;
	private String defaultFailureUrl;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
//		log.info("실패에왓다");
//		
//		
//		String uri = "/emp/login";
//		
//		response.sendRedirect(uri);
		
		String empNo = request.getParameter(loginidname);
		String empPw = request.getParameter(loginpwdname);
		String errormsg = null;
		defaultFailureUrl = "/emp/login";
		
		if (exception instanceof BadCredentialsException) {
			errormsg = "1"; // 비밀번호를 잘못 입력했습니다.
		}
		if (exception instanceof InternalAuthenticationServiceException) {
			errormsg = "2"; // 계정이 존재하지 않습니다.
		} 
		if (exception instanceof DisabledException) {
			errormsg = "3"; // 이메일 인증을 해주세요.
		}
		if (exception instanceof SessionAuthenticationException) {
			errormsg = "4"; // 중복 로그인
		}
		
		request.setAttribute(loginidname, empNo);
		request.setAttribute(loginpwdname, empPw);
		request.setAttribute(errormsgname, errormsg);
		
		request.getRequestDispatcher(this.defaultFailureUrl).forward(request, response);
		
	}

	public String getLoginidname() {
		return loginidname;
	}

	public void setLoginidname(String loginidname) {
		this.loginidname = loginidname;
	}

	public String getLoginpwdname() {
		return loginpwdname;
	}

	public void setLoginpwdname(String loginpwdname) {
		this.loginpwdname = loginpwdname;
	}

	public String getErrormsgname() {
		return errormsgname;
	}

	public void setErrormsgname(String errormsgname) {
		this.errormsgname = errormsgname;
	}

	public String getDefaultFailureUrl() {
		return defaultFailureUrl;
	}

	public void setDefaultFailureUrl(String defaultFailureUrl) {
		this.defaultFailureUrl = defaultFailureUrl;
	}
	
	
	
}




