package kr.or.ddit.organization;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.emp.EmpVO;
import kr.or.ddit.file.FileVO;
import kr.or.ddit.mapper.OrganizationMapper;

@Service
public class OrganizationServiceImpl implements OrganizationService {

	@Autowired
	OrganizationMapper organizationMapper;
	
	// 직원 조회
	@Override
	public List<EmpVO> list() {
		return this.organizationMapper.list();
	}
	
	// 직원 상세 정보조회
	@Override
	public EmpVO detail(String empNo) {
		return this.organizationMapper.detail(empNo);
	}
	
	// 직원 이미지 조회
	@Override
	public EmpVO empImg(String empNo) {
		return this.organizationMapper.empImg(empNo);
	}
	
	// 직원 정보수정
	@Override
	public int updatePost(EmpVO empVO) {
		return this.organizationMapper.updatePost(empVO);
	}
	
	// 직원 정보삭제
	@Override
	public int deletePost(String empNo) {
		return this.organizationMapper.deletePost(empNo);
	}
}
