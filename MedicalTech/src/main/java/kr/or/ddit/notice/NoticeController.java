package kr.or.ddit.notice;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import kr.or.ddit.file.FileVO;
import kr.or.ddit.util.ArticlePage;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Slf4j
@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	//공지사항 리스트
	// /notice?currentPage=1&show=10&keyword=keyword																		
	@GetMapping("/notice")
	public String noticeInsert(Model model, @RequestParam(defaultValue = "1",required = false) int currentPage, 
								@RequestParam(value="keyword", required=false) String keyword, @RequestParam Map<String, String> map){
		String cPage = map.get("currentPage");
		String show = map.get("show");
		if(cPage == null) {
			map.put("currentPage", "1");
		}
		if(show == null) {
			map.put("show","10");
		}
		log.info("map : " + map);
		//페이징처리 필요
		List<NoticeVO> noticeList = noticeService.noticeList(map);
		map.put("keyword", keyword);
		//select count(*) from notice 요거로 처리를 해줘야 함
		int total = noticeService.getTotal(map);
		log.info("keyword map : " + map);
		log.info("검색후  total : " + total);
		
		//한 화면에 보여질 행 수
		int size = Integer.parseInt(map.get("show"));
		model.addAttribute("keyword", keyword);
		model.addAttribute("data", new ArticlePage<NoticeVO>(total, currentPage, size, noticeList));
		return "notice/list";
	}
	
	
	//공지사항 리스트 검색기능 포함
	//@PostMapping("/notice/list")
	//@ResponseBody
	//public List<NoticeVO> list(@RequestBody NoticeVO noticeVO) {
	//	List<NoticeVO> noticeVOList = this.noticeService.list(noticeVO);
	//	return noticeVOList;
	//}
	
	
	//공지사항 상세
	@GetMapping("/notice/detail")
	public String noticeDetail(@RequestParam String ntCd, Model model) {
		log.info("noCd : " + ntCd);
		
		NoticeVO noticeVO = noticeService.noticeDetail(ntCd);
		log.info("noticeVO : " + noticeVO);
		
		List<MultipartFile> sunjuList= noticeVO.getUploads();
		
		model.addAttribute("noticeVO", noticeVO);
		model.addAttribute("file", sunjuList);
		log.info("파일 확인 : " + sunjuList);
		return "notice/detail";
	}
	
	
	//공지사항 삭제
	@PostMapping("/notice/delete")
	@ResponseBody
	public String noticeDelete(@RequestBody Map<String, String> sunju) {
		log.info("ntCd : " + sunju.get("ntCd"));
		int result = noticeService.noticeDelete(sunju.get("ntCd"));
		log.info("noticeDelete : " + result);
		return  Integer.toString(result);
	}
	
	
	//공지사항 수정
	@PostMapping("/notice/update")
	@ResponseBody
	public ResponseEntity<String> noticeUpdate(NoticeVO noticeVO) throws IOException {
		log.info("noticeUpdate : " + noticeVO);
		
		String uploadFolder = 
	            "C:\\eGovFrameDev-3.10.0-64bit\\workspace\\MedicalTech\\src\\main\\webapp\\resources\\upload";
		
		List<MultipartFile> noticeList= noticeVO.getUploads();
		if(noticeList != null) {
	    	   for (MultipartFile multipartFile : noticeList) {
	 	          File saveFile = new File(uploadFolder,multipartFile.getOriginalFilename());
	 	          	
	 	        log.info("-------------------------------");
	 			log.info("upload File Name : " + multipartFile.getOriginalFilename());
	 			log.info("upload File Size : " + multipartFile.getSize());
	 			log.info("파일 이름확인 : " + saveFile);
	 			noticeVO.setFileCd(multipartFile.getOriginalFilename());
	 			
	 			multipartFile.transferTo(saveFile);
	 	          
	 	       }
	       }else if(noticeList == null) {
	    	   log.info("파일 업로드 안함");
	       }
	       
		int result = noticeService.noticeUpdate(noticeVO);
		log.info("noticeUpdate : " + result);
		return  new ResponseEntity<String>(noticeVO+"",null,HttpStatus.OK);
	}
	
	
	//공지사항 추가 GET
	@GetMapping("/notice/insert")
	public String insert() {
		return "notice/insert";
	}
	
	//공지사항 파일 첨부 insert
	@ResponseBody
	@PostMapping("/notice/insertPost")
    public ResponseEntity<String> noticeInsert(NoticeVO noticeVO) throws IOException {
		
		log.info("noticeInsert : " + noticeVO);
	       
	       String uploadFolder = 
	             "C:\\eGovFrameDev-3.10.0-64bit\\workspace\\MedicalTech\\src\\main\\webapp\\resources\\upload";
	             
	       List<MultipartFile> sunjuList= noticeVO.getUploads();
	       if(sunjuList != null) {
	    	   for (MultipartFile multipartFile : sunjuList) {
	 	          File saveFile = new File(uploadFolder,multipartFile.getOriginalFilename());
	 	          	
	 	        log.info("-------------------------------");
	 			log.info("upload File Name : " + multipartFile.getOriginalFilename());
	 			log.info("upload File Size : " + multipartFile.getSize());
	 			log.info("파일 이름확인 : " + saveFile);
	 			noticeVO.setFileCd(multipartFile.getOriginalFilename());
	 			
	 			multipartFile.transferTo(saveFile);
	 	          
	 	       }
	       }else if(sunjuList == null) {
	    	   log.info("파일 업로드 안함");
	       }
	       
	       int result = noticeService.noticeInsert(noticeVO);
	       log.info("noticeInsert result : " + result);
	       return new ResponseEntity<String>(result+"",null,HttpStatus.OK);
	    }
	
}
	

