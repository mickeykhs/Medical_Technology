package kr.or.ddit.order_list;

import java.util.List;

import kr.or.ddit.chart.ChartVO;
import kr.or.ddit.emp.EmpVO;
import kr.or.ddit.test_order.ToVO;
import lombok.Data;

//오더상세
@Data
public class OrdVO {
	private String olCd;//olCd(P.K)
	private String olDisCd;//toDisCd
	private String olDrCd;
	private String olDisKo;
	private String olDisEng;
	private String olActCd;//olActCd
	private String olActKo;
	private String olActEng;
	private String olDrSorNo;
	private String olDrSortName;
	private String olDrComName;
	private String olDrSda;//prShot
	private String olDrUnit;//prCnt
	private int olDrePrice;
	private String olOrSort;
	private String olNe;
	private int olActFee;
	// 검사실 오더 상세
	private ToVO toVO;
	//오더상세:검사,주사,내복  = 1:N
	private List<ToVO> toVOList;
	// 수납 내역 조회
	private ChartVO chartVO; 
	// 회원 수납 등록
	private EmpVO empVO;
}
