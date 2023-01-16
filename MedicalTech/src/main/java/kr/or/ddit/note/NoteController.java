package kr.or.ddit.note;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class NoteController {
	
	@Autowired
	NoteService noteService;
	
	@ResponseBody
	@PostMapping("/order/note")
	public int noteRegedit(@RequestBody NoteVO noteVO){
		log.info("noteVO : " + noteVO);
		int result = this.noteService.noteRegedit(noteVO);
		
		return result;
	}
	
}
