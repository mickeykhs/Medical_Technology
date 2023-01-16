package kr.or.ddit.sms;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.List;
import java.util.Map;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.DrorMapper;
import kr.or.ddit.mapper.SmsMapper;
import kr.or.ddit.patient.PatientVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class SmsServiceImpl implements SmsService {

	@Autowired
	SmsMapper smsMapper;
	
	
	// 전달된 휴대폰 번호로 문자 전송(content : 문자보낼 내용)
	public void sendSMS(Map<String, String> map) {
		  //String temp = map.get("smsCont"); 
		
	      String hostNameUrl = "https://sens.apigw.ntruss.com"; // 호스트 URL
	      String requestUrl = "/sms/v2/services/"; // 요청 URL
	      String requestUrlType = "/messages"; // 요청 URL
	      String accessKey = "1q8Jf6vY66C2kK7ipLV6"; // 네이버 클라우드 플랫폼 회원에게 발급되는 개인 인증키
	      String secretKey = "ZpJmrVbZQ9NOMA4ID4ufyNe7DFLdYORWgAPRNcIY"; // 2차 인증을 위해 서비스마다 할당되는 service secret
	      String serviceId = "ncp:sms:kr:298036443155:medicaltech"; // 프로젝트에 할당된 SMS 서비스 ID
	      String method = "POST"; // 요청 method
	      String timestamp = Long.toString(System.currentTimeMillis()); // current timestamp (epoch)
	      requestUrl += serviceId + requestUrlType;
	      String apiUrl = hostNameUrl + requestUrl;

	      // JSON 을 활용한 body data 생성
	      JSONObject bodyJson = new JSONObject();
	      JSONObject toJson = new JSONObject();
	      JSONArray toArr = new JSONArray();

	      
	      String paPh = map.get("paPh"); //전화번호
	      String smsCont = map.get("smsCont"); //내용
	      
	      toJson.put("content",smsCont); // 메시지 내용 * Type별로 최대 byte 제한이 다릅니다.* SMS: 80byte/ LMS: 2000byte
	      toJson.put("to", paPh); // 수신번호 목록 * 최대 50개까지 한번에 전송할 수 있습니다.
	      toArr.add(toJson);

	      bodyJson.put("type", "sms"); // 메시지 Type (sms | lms)
	      bodyJson.put("contentType", "COMM"); // 메시지 내용 Type (AD | COMM) * AD: 광고용, COMM: 일반용 (default: COMM) * 광고용 메시지 발송 시 불법 스팸 방지를 위한 정보통신망법 (제 50조)가 적용됩니다.
	      bodyJson.put("countryCode", "82"); // 국가 전화번호
	      bodyJson.put("from", "01053587073"); // 발신번호 * 사전에 인증/등록된 번호만 사용할 수 있습니다.
	      bodyJson.put("content", smsCont); // 메시지 내용 * Type별로 최대 byte 제한이 다릅니다.* SMS: 80byte / LMS: 2000byte
	      bodyJson.put("messages", toArr);

	      String body = bodyJson.toJSONString();

	      System.out.println(body);

	      try {

	         URL url = new URL(apiUrl);

	         HttpURLConnection con = (HttpURLConnection) url.openConnection();
	         con.setUseCaches(false);
	         con.setDoOutput(true);
	         con.setDoInput(true);
	         con.setRequestProperty("content-type", "application/json");
	         con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
	         con.setRequestProperty("x-ncp-iam-access-key", accessKey);
	         con.setRequestProperty("x-ncp-apigw-signature-v2",
	               makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
	         con.setRequestMethod(method);
	         con.setDoOutput(true);
	         DataOutputStream wr = new DataOutputStream(con.getOutputStream());

	         wr.write(body.getBytes());
	         wr.flush();
	         wr.close();

	         int responseCode = con.getResponseCode();
	         BufferedReader br;
	         System.out.println("responseCode" + " " + responseCode);
	         if (responseCode == 202) { // 정상 호출
	            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	         } else { // 에러 발생
	            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	         }

	         String inputLine;
	         StringBuffer response = new StringBuffer();
	         while ((inputLine = br.readLine()) != null) {
	            response.append(inputLine);
	         }
	         br.close();

	         System.out.println(response);

	         
	      } catch (Exception e) {
	         System.out.println(e);
	      }
	   }

	   // encodeBase64String 생성
	   public static String makeSignature(String url, String timestamp, String method, String accessKey, String secretKey)
	         throws NoSuchAlgorithmException, InvalidKeyException {
	      String space = " "; // one space
	      String newLine = "\n"; // new line

	      String message = method + space + url + newLine + timestamp +
	                newLine + accessKey;

	      SecretKeySpec signingKey;
	      String encodeBase64String;

	        signingKey = new SecretKeySpec(secretKey.getBytes(StandardCharsets.UTF_8), "HmacSHA256");
	        Mac mac = Mac.getInstance("HmacSHA256");
	        mac.init(signingKey);
	        byte[] rawHmac = mac.doFinal(message.getBytes(StandardCharsets.UTF_8));
	        encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);

	        return encodeBase64String;
	}

	@Override
	public void recordSMS(Map<String, String> map) {
	    //문자 전송
		sendSMS(map);
		
	    map.put("smsCont", map.get("smsCont"));
	    map.put("paNo", map.get("paNo"));
	    log.info("map(완료) : " + map);
	    
	    this.smsMapper.recordSMS(map);
		
	}

	//환자 검색
	@Override
	public List<PatientVO> paSearch(PatientVO patientVO) {
		return this.smsMapper.paSearch(patientVO);
	}

	//문자 전송내역 불러오기
	@Override
	public List<SmsVO> smsList() {
		return this.smsMapper.smsList();
	}

	@Override
	public List<SmsVO> searchDate(SmsVO smsVO) {
		return this.smsMapper.searchDate(smsVO);
	}

}
