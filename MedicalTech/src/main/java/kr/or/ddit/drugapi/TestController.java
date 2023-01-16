package kr.or.ddit.drugapi;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

	@GetMapping("/Test/test")
	public String main() {
		return "Test/test";
	}
}
