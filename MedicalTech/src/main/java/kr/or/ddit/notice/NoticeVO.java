package kr.or.ddit.notice;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;



@Data
public class NoticeVO {
	private int rnum;
	private String ntCd;
	private String ntTitle;
	private String ntCont;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ntEndt;
	private int ntHit;
	private String ntWt;
	private String fileCd;
	private List<MultipartFile> uploads;
	
}
