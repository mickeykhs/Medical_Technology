package kr.or.ddit.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.or.ddit.emp.EmpVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomUser extends User {


	private static final long serialVersionUID = 1L;
	
	private EmpVO empVO;
	
	// constructor(생성자)
	// username : 사용자 아이디
	// password : 비밀번호
	// authorities : 권한 리스트
	public CustomUser(String username, String password
			, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	// 사용자가 정의한 MemberVO 타입을 스프링 시큐리티 UsersDetails 타입으로 변환
	public CustomUser(EmpVO empVO) {
		// 사용자 아아디, 비밀번호, 권한 리스트(memberVO.getMemberAuthVOList())
		super(empVO.getEmpNo(), empVO.getEmpPw(),
				empVO.getEmpAuthVOList().stream()
				.map(auth->new SimpleGrantedAuthority(auth.getAuth()))
				.collect(Collectors.toList())
				);
		this.empVO = empVO;
	}

	// 외부에서 memberVO 멤버변수를 사용하려면 getter메서드가 필요함
	public EmpVO getEmpVO() {
		log.info("empVO^^ : " + empVO.toString());
		return empVO;
	}
	
}









