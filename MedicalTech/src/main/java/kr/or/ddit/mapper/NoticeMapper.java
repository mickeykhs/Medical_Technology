package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.notice.NoticeVO;

@Mapper
public interface NoticeMapper {
	
	//공지사항 목록
	public List<NoticeVO> noticeList(Map<String, String> map);
	
	//공지사항 목록의 전체 행 수 구하기
	public int getTotal(Map<String , String> map);
	
	//공지사항 검색
	//public List<NoticeVO> list(NoticeVO noticeVO);
	
	//공지사항 상세보기
	public NoticeVO noticeDetail(String ntCd);

	//공지사항 삭제
	public int noticeDelete(String ntCd);
	
	//공지사항 수정
	public int noticeUpdate(NoticeVO noticeVO);
	
	//공지사항 추가
	public int noticeInsert(NoticeVO noticeVO);
	
	//공지사항 조회수
	public int noticeHit(String ntCd);
	
	
}
