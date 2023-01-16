package kr.or.ddit.emp;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.authority.EmpAuthVO;
import kr.or.ddit.file.FileVO;
import lombok.Data;

@Data
public class EmpVO {
	private int rnum;
	private String empNo;
	private String empPh;
	private String empName;
	private String empEnabled;
	private String empPw;
	
	private String empIn;
	private Date empOut;
	private String empMail;
	private String empReg;
	private String jobCd;
	private Date empEndt;
	private String empWt;
	private Date empUpdt;
	private int empZip;
	private String empAdd1;
	private String empAdd2;
	private String empFrlgYn;
	private String empExadd;
	private String jobGubun;
	private FileVO fileVO;
	private String img = "/resources/upload/no_img.jpg";
	private MultipartFile sunjuImg;
	// 1:N
	private List<EmpAuthVO> empAuthVOList;
}
