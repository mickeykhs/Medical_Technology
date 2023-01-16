package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.re_sms.ResVO;

//문자 문구 저장소
public interface ResMapper {
	
	//문자 문구 저장하기
	public int saveMent(ResVO resVO);
	
	//문구 번호, 제목 불러오기
	public List<ResVO> getMent();

	//문구 삭제
	public int deleteMent(ResVO resVO);
	
	//문구 수정
	public int updateMent(ResVO resVO);
}
