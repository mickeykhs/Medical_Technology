package kr.or.ddit.note;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.NoteMapper;

@Service
public class NoteServiceImpl implements NoteService{

	@Autowired
	NoteMapper noteMapper;
	
	// 소견서 등록
	@Override
	public int noteRegedit(NoteVO noteVO) {
		return this.noteMapper.noteRegedit(noteVO);
	}
	
}
