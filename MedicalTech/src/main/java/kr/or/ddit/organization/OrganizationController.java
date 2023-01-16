package kr.or.ddit.organization;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.emp.EmpVO;
import kr.or.ddit.file.FileVO;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

@Slf4j
@RequestMapping("/organization")
@Controller
public class OrganizationController {

	@Autowired
	OrganizationService organizationService;
	
	@GetMapping("/organiTree")
	public String organiTree(Model model) {
		
		List<EmpVO> empVOList = this.organizationService.list();
		log.info("empVOList : " + empVOList);
		
//		request.setAttribute("empVOList", empVOList);
		model.addAttribute("empVOList", empVOList);
		
		return "organization/organiTree";
	}

	@ResponseBody
	@PostMapping("/detail")
	public EmpVO detail(@RequestBody EmpVO empVO) {
		log.info("empNo : " + empVO.getEmpNo());
		
		EmpVO empVODetail = this.organizationService.detail(empVO.getEmpNo());
		log.info("empVODetail : " + empVODetail);
		
		return empVODetail;
	}
	
	@ResponseBody
	@PostMapping("/empImg")
	public EmpVO empImg(@RequestBody EmpVO empVO) {
		log.info("empNo : " + empVO.getEmpNo());
		
		EmpVO empVOImg = this.organizationService.empImg(empVO.getEmpNo());
		log.info("empVOImg : " + empVOImg);
		
		return empVOImg;
	}
	
	@ResponseBody
	@PostMapping("/updatePost")
	public String updatePost(@RequestBody EmpVO empVO) {
		log.info("empVO : " + empVO);
		
		int result = this.organizationService.updatePost(empVO);
		log.info("result : " + result);
		
		return "redirect:/organization/organiTree";
	}
	
	@ResponseBody
	@PostMapping("/deletePost")
	public String deletePost(@RequestBody EmpVO empVO) {
		log.info("empNo : " + empVO.getEmpNo());
		
		int result = this.organizationService.deletePost(empVO.getEmpNo());
		log.info("result : " + result);
		
		return "redirect:/organization/organiTree";
	}
}
