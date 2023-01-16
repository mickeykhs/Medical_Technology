package kr.or.ddit.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.or.ddit.emp.EmpVO;
import kr.or.ddit.mapper.EmpMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomUserDetailsService implements UserDetailsService {

	// DI(의존성 주입)
	@Autowired
	private EmpMapper empMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) 
			throws UsernameNotFoundException {
		
		if(username == null) {
			throw new InternalAuthenticationServiceException(username);
		}
		
		// username은 사용자 아이디. 로그인 화면에서 입력된 아이디의 값을 말함
		log.warn("Load User By UserName : " + username);
		
		// 사용자 아이디를 통해 MEMBER테이블의 1행 데이터를 받아서 MemberVO에 넣자
		EmpVO empVO = empMapper.read(username);
		
		log.warn("queried by emp mapper : " + 
				empVO.toString());
		
		return empVO==null?null:new CustomUser(empVO);
	}
}
