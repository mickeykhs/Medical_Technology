package kr.or.ddit.drug_indent;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import kr.or.ddit.durg_detail.DrugDetailVO;
import lombok.Data;

@Data
public class DriVO {
	private String diCd;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date diDt;
	private String idtAplAst;
	
	private int num;
	private String empPh;
	private String empNo;

		
	private String empName;
	private String dsdName;
	private int ddQty;
	private String dsdCom;
	
//	private int ddNo;
	private String drCd;
	
	List<DrugDetailVO> drugDetailVOList;
}
