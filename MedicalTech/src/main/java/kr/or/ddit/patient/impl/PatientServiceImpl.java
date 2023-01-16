package kr.or.ddit.patient.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.PatientMapper;
import kr.or.ddit.patient.PatientService;

@Service
public class PatientServiceImpl implements PatientService {
	
	@Autowired
	PatientMapper patientMapper;

	// 환자 목록
	
}
