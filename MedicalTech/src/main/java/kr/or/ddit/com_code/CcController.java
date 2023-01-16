package kr.or.ddit.com_code;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CcController {
	@Autowired
	CcServiceImpl Ccservice;
	
	@GetMapping("/docu/docuTest")
	public String docuTest(){
		return "document/note";
	}
}
