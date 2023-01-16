package kr.or.ddit.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.mapper.NoticeMapper;

@Service
public class NoticeServiceimpl implements NoticeService{
	
	@Autowired
	NoticeMapper noticeMapper;


	
	@Override
	public List<NoticeVO> noticeList(Map<String, String> map) {
		return noticeMapper.noticeList(map);
	}//공지사항 목록


	@Override
	public int getTotal(Map<String, String> map) {
		return noticeMapper.getTotal(map);
	}//공지사항의 전체 행 수 구하기

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public NoticeVO noticeDetail(String ntCd) {
			noticeMapper.noticeHit(ntCd);
		return noticeMapper.noticeDetail(ntCd);
	}//공지사항 상세


	@Override
	public int noticeDelete(String ntCd) {
		
		return noticeMapper.noticeDelete(ntCd);
	}//공지사항 삭제


	@Override
	public int noticeUpdate(NoticeVO noticeVO) {
		
		return noticeMapper.noticeUpdate(noticeVO);
	}//공지사항 수정


	@Override
	public int noticeInsert(NoticeVO noticeVO) {
		
		return noticeMapper.noticeInsert(noticeVO);
	}//공지사항 추가


	//@Override
	//public List<NoticeVO> list(NoticeVO noticeVO) {
	//	return noticeMapper.list(noticeVO);
	//}//공지사항 검색


	@Override
	public int noticeHit(String ntCd) {
		
		return noticeMapper.noticeHit(ntCd);
	}//공지사항 조회수

}
