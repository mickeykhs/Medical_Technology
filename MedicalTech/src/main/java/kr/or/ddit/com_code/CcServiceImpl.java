package kr.or.ddit.com_code;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.EmpMapper;

@Service
public class CcServiceImpl {
	@Autowired
	EmpMapper empMapper;
}
