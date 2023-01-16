package kr.or.ddit.organization;

import java.util.List;

import kr.or.ddit.emp.EmpVO;
import kr.or.ddit.file.FileVO;

public interface OrganizationService {
	
	// 직원 조회
	public List<EmpVO> list();
	
	// 직원 상세 정보조회
	public EmpVO detail(String empNo);
	
	// 직원 이미지 조회
	public EmpVO empImg(String empNo);
	
	// 직원 정보수정
	public int updatePost(EmpVO empVO);
	
	// 직원 정보삭제
	public int deletePost(String empNo);
}
