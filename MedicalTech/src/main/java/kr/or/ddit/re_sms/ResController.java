package kr.or.ddit.re_sms;

import java.util.List;

import javax.sound.midi.MidiDevice.Info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ResController {

	@Autowired
	ResService resService;
	
	@PostMapping("/sms/saveMent")
	@ResponseBody
	public String saveMent(@RequestBody ResVO resVO) {
		log.info("resVO : " + resVO);
		int result = resService.saveMent(resVO);
		log.info("result : " + result);
		if(result == 1) {
			return "OK";
		}
		return "NO";
	}
	
	@ResponseBody
	@PostMapping("/sms/getMent")
	 public List<ResVO> getMent(@RequestBody ResVO resVO){
		log.info("resVO : " + resVO);
		List<ResVO> resVOList = this.resService.getMent();
		log.info("resVOList : " + resVOList); 
		return resVOList; 
	 }
	 
	@ResponseBody
	@PostMapping("/sms/deleteMent")
	public int deleteMent(@RequestBody ResVO resVO) {
		log.info("resVO : " + resVO);
		int result = resService.deleteMent(resVO);
		log.info("result : " + result);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/sms/updateMent")
	public int updateMent(@RequestBody ResVO resVO) {
		log.info("resVO : " + resVO);
		int result = resService.updateMent(resVO);
		log.info("result : " + result);
		return result;
	}
}
