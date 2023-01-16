package kr.or.ddit.examination;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.com_code_detail.CcdVO;
import kr.or.ddit.file.FileVO;
import kr.or.ddit.order_list.OrdVO;
import kr.or.ddit.patient.PatientVO;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Slf4j
@RequestMapping("/exam")
@Controller
public class ExaminationController {

	@Autowired
	ExaminationService examinationService;
	
	@GetMapping("/main")
	public String exam(Model model) {
		
		List<PatientVO> patientVOList = this.examinationService.main();
		List<CcdVO> ccdVOList = this.examinationService.comSelect();
		log.info("patientVOList : " + patientVOList);
		log.info("ccdVOList : " + ccdVOList);
		
		model.addAttribute("patientVOList", patientVOList);
		model.addAttribute("ccdVOList", ccdVOList);
		
		return "examination/exam";
	}
	
	@ResponseBody
	@PostMapping("/patientList")
	public List<PatientVO> patientList() {
		
		List<PatientVO> patientVOList = this.examinationService.main();
		List<CcdVO> ccdVOList = this.examinationService.comSelect();
		log.info("patientVOList : ++++++++++" + patientVOList);
		log.info("ccdVOList : " + ccdVOList);
		
		return patientVOList;
	}
	
	@ResponseBody
	@PostMapping("/paSearch")
	public List<PatientVO> paSearch(@RequestBody PatientVO patientVO) {
		
		log.info("paName : " + patientVO.getPaName());
		
		List<PatientVO> patiVOList = this.examinationService.paSearch(patientVO.getPaName());
		log.info("patiVOList : " + patiVOList);
		
		return patiVOList;
	}
	
	@ResponseBody
	@PostMapping("/patiInfo")
	public PatientVO info(@RequestBody PatientVO patientVO) {
		
		log.info("paNo : " + patientVO.getPaNo());
		
		PatientVO patiVO = this.examinationService.patiInfo(patientVO.getPaNo());
		log.info("patiVO : " + patiVO);
		
		return patiVO;
	}
	
	@ResponseBody
	@PostMapping("/patiUdp")
	public int patiUdp(@RequestBody PatientVO patientVO) {
		
		log.info("paNo : " + patientVO.getPaNo());
		
		int result = this.examinationService.patiUdp(patientVO.getPaNo());
		log.info("result : " + result);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/stateUpd")
	public String stateUpd(@RequestBody PatientVO patientVO) {
		
		log.info("paNo : " + patientVO.getPaNo());
		
		int result = this.examinationService.stateUpd(patientVO.getPaNo());
		log.info("result : " + result);
		
		return "redirect:/exam/main";
	}

	@ResponseBody
	@PostMapping("/stateCancle")
	public String stateCancle(@RequestBody PatientVO patientVO) {
		
		log.info("paNo : " + patientVO.getPaNo());
		
		int result = this.examinationService.stateCancle(patientVO.getPaNo());
		log.info("result : " + result);
		
		return "redirect:/exam/main";
	}
	
	@ResponseBody
	@PostMapping("/order")
	public List<OrdVO> order(@RequestBody PatientVO patientVO) {
		
		log.info("paNo : " + patientVO.getPaNo());
		
		List<OrdVO> ordtVOList = this.examinationService.order(patientVO.getPaNo());
		log.info("ordtVOList" + ordtVOList);
		
		return ordtVOList;
	}
	
	@ResponseBody
	@PostMapping("/orderCnt")
	public String orderCnt(@RequestBody PatientVO patientVO) {
		
		log.info("paNo : " + patientVO.getPaNo());
		
		int result = this.examinationService.orderCnt(patientVO.getPaNo());
		log.info("result" + result);
		
		return "redirect:/exam/main";
	}
	
	@ResponseBody
	@PostMapping("/examList")
	public List<ExaminationVO> examList(@RequestBody PatientVO patientVO) {
		
		log.info("paNo : " + patientVO.getPaNo());
		
		List<ExaminationVO> examVOList = this.examinationService.examList(patientVO.getPaNo());
		log.info("examVOList : " + examVOList);
		
		return examVOList;
	}
	
	// 연/월/일 폴더 생성
	public String getFolder() {
		// 2022-11-16 형식(format) 지정
		// 간단한 날짜 형식
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 날짜 객체 생성(java.util 패키지)
		Date date = new Date();
		// 2022-11-16
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	// 이미지인지 판단. 썸네일은 이미지만 가능하므로..
	public boolean checkImageType(File file) {
		// MIME 타입 알아냄. .jpeg / .jpg의 MIME타입 : image/jpeg
		String contentType;
		try {
			contentType = Files.probeContentType(file.toPath());
			log.info("contentType : " + contentType);
			// image/jpeg는 image로 시작함 -> true
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 이 파일의 이미지가 아닐 경우
		return false;
	}
	
	
	@ResponseBody
	@PostMapping("/uploadAjaxAction")
	public Map<String, String> uploadAjaxAction(MultipartFile[] uploadFile
			, PatientVO patientVO, ExaminationVO examinationVO) {
		// log.info("fileCd : " + fileCd);
		log.info("uploadFile : " + uploadFile);
		//PatientVO [paNo=20220002, paReg=900920, paName=김말자, paSex=여, 
		//paPh=null, paMail=null, paAdd1=null, paAdd2=null, paZip=0, 
		//paEndt=null, paWt=null, paUpdt=null, paUpwt=null, paFiviDt=null]
		log.info("patientVO : " + patientVO);
		log.info("examinationVO : " + examinationVO);
		
		// 업로드 폴더 설정
		String uploadFolder = 
				"C:\\eGovFrameDev-3.10.0-64bit\\workspace\\MedicalTech\\src\\main\\webapp\\resources\\upload";

		List<FileVO> fileVOList = new ArrayList<FileVO>();
		
		// 파일업로드 + 썸네일 이미지
		// 만약 연/월/일 폴더 없다면? 
		// ...upload\\2022\\11\\18
		File uploadPath = new File(uploadFolder, getFolder());  // 설계
		// 생성하자
		if(uploadPath.exists() == false) {
			// make directories
			uploadPath.mkdirs();
		}
		
		String uploadFileName = "";
		
		// 파일 다루기
		// MultipartFile[] uploadFile 배열
		for(MultipartFile multipartFile : uploadFile) {
			FileVO fileVO = new FileVO();
			log.info("-------------------------------");
			log.info("upload File Name : " + multipartFile.getOriginalFilename());
			log.info("upload File Size : " + multipartFile.getSize());
			// ...upload\\2022\\11\\18\\rndniifidiaied_파일명.jpg
			uploadFileName = multipartFile.getOriginalFilename();
			// 같은 날 같은 이미지 업로드 시 파일 중복 방지 시작 ----------
			// java.util.UUID => 랜덤값 생성
			UUID uuid = UUID.randomUUID();
			// 원래의 파일 이름과 구분하기 위해 _를 붙임
			uploadFileName = uuid.toString() + "-" + uploadFileName;
			log.info("uploadFileName: " + uploadFileName);
			// 같은 날 같은 이미지 업로드 시 파일 중복 방지 끝 ------------
			
			// File객체 설계(복사할 대상 경로, 파일명)
			// uploadPath : C:\\eGovFrameDev-3.10.0-64bit\\workspace\\egovProj\\src\\main\\webapp\\resources\\upload
			File saveFile = new File(uploadPath, uploadFileName);
			
			try {
				// 설계도대로 파일 복사
				multipartFile.transferTo(saveFile);
				
				// 썸네일 처리
				// 이미지인지 체킹
				if(checkImageType(saveFile)) {  // 이미지라면
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					// 썸네일 생성
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
				}
				String filename = "/" + getFolder().replace("\\", "/") + "/" + uploadFileName;
				log.info("filename : " + filename);
				
				fileVO.setFileName(filename);
				fileVO.setFileSize(Long.valueOf(multipartFile.getSize()).intValue());
				// 목표 달성!!
				fileVOList.add(fileVO);
			} catch (IllegalStateException e) {
				log.error(e.getMessage());
				return null;
			} catch (IOException e) {
				log.error(e.getMessage());
				return null;
			}  // end try
		}  // end for  
		
		log.info("fileVOList : " + fileVOList);
		
		//검사 내역 입력
		int rslt =this.examinationService.examInsert(examinationVO); 
		log.info("rslt : " + rslt);

		// ------------- ATTACH_FILE 테이블에 List<FileVO>를 다중 insert 시작------------------------------
		// SELECT NVL(MAX(SEQ), 0) + 1 FROM ATTACH WHERE USER_NO = #{bookId}
		// ATTACH 테이블의 bookId에 해당하는 MAX(SEQ) + 1을 가져와보자(이미 첨부된 이미지가 있을 때..)
		int fileCd = this.examinationService.getSeq(examinationVO.getExamCd());
		log.info("fileCd : " + fileCd);
		
		List<FileVO> fileVOList2 = new ArrayList<FileVO>();
		
		for(FileVO fileVO : fileVOList) {
			fileVO.setAnyCd(examinationVO.getExamCd());
			fileVO.setFileCd(fileCd++ + "");
			
			fileVOList2.add(fileVO);
		}
		
		log.info("fileVOList2 : " + fileVOList2);
		
		int rsut = this.examinationService.uploadAjaxAction(fileVOList2, examinationVO);
//		log.info("rslt : " + rslt);
		
		// ------------- ATTACH_FILE 테이블에 List<FileVO>를 다중 insert 끝------------------------------
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("fileCd", fileCd + "");
		map.put("status", rsut + "");
		
		return map;
	}  // end uploadAjaxAction	
	
	@ResponseBody
	@PostMapping("/searchImg")
	public List<FileVO> searchImg(@RequestBody ExaminationVO examinationVO) {
		
		log.info("examCd : " + examinationVO.getExamCd());
		
		List<FileVO> fileVOList = this.examinationService.searchImg(examinationVO.getExamCd());
		log.info("fileVOList : " + fileVOList);
		
		return fileVOList;
	}
	
	@ResponseBody
	@PostMapping("/downloadName")
	public ExaminationVO downloadName(@RequestBody FileVO fileVO) {
		log.info("anyCd : " + fileVO.getAnyCd());
		
		ExaminationVO examinationVO = this.examinationService.downloadName(fileVO.getAnyCd());
		log.info("examinationVO : " + examinationVO);
				
		return examinationVO;
	}
}
