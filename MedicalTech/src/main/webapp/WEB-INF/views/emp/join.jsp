<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&amp;display=fallback">
<link rel="stylesheet" href="/resources/adminlte/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="/resources/adminlte/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- style -->
<link rel="stylesheet" href="https://www.einfosoft.com/templates/admin/sunray/source/assets/css/pages/extra_pages.css">
<link rel="stylesheet" href="/resources/adminlte/dist/css/adminlte.min.css?v=3.2.0">
<!-- favicon -->
<link rel="shortcut icon" href="/resources/images/logo3.jpg">
<style type="text/css">
#im{
	z-index:auto;
}
.form-control{
	border-color: 0;
}
.btn{
	border: 0px;
}
.correct{
    color : green;
}
.incorrect{
    color : red;
}
.hospitalBack{
	height:100vh;
}
 .hospitalBack:before{ 
 	content:'';
 	background-image : url(https://www.einfosoft.com/templates/admin/sunray/source/assets/img/bg-01.jpg);
	background-size : cover;
	opacity:0.7;
 	position:absolute; 
 	left:0; 
 	height:100%; 
 	width:100%; 
	
 } 

</style>
	<div class="limiter hospitalBack">
		<div class="container-login100" id="im" >
			<div class="wrap-login100" style="background:RGB(21,36,62);">
				<form class="login100-form validate-form" id="btn" action="/emp/insert" method="POST">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<span class="login100-form-logo">
						<img alt="" src="/resources/images/logo3.jpg" />
					</span>
					<span class="login100-form-title p-b-34 p-t-27">
						회원가입
					</span>
					<!-- 
					 <div class="input-group mb-3">
						<input type="hidden" class="form-control" name="empNo" id="no" />
					</div>
					 -->
					<div class="input-group mb-3">
						<input type="text" class="form-control" name="empName"  id="memberName" placeholder="이름" />
						<input type="hidden" name="empPw" id="pass" value="">
						<!-- <input type="hidden" name="empWt" id="empImg" value="/resources/upload/no_img.jpg"> -->
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fa fa-user"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="email" class="form-control" id="email" name="empMail" placeholder="Email">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fa fa-envelope"></span>
							</div>
						</div>
					</div>
					<div class="card-body" style="padding: 0rem; margin-bottom: 1rem;">
						 <div class="row">
							<div class="col-8 mail_check_input">
								<input type="text" class="form-control mail_check_input" name="authNumber" id="authNum" value="" disabled="disabled" placeholder="인증번호 입력">
								<span id="mail_check_input_box_warn"></span>
							</div>
							<div class="col-4" style="padding-left:0px;">
								<input type="button" class="form-control btn btn-block btn-secondary btn-sm" id="email_auth_btn" value="인증번호 받기"
								style="border: 0px;  height: 33px; width:125px; background-color: #E4E6EF; color: black;">
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="text" class="form-control" id="reg" onkeyup="setJumin(this)" oninput="regNumder(this)" maxlength="14" name="empReg" placeholder="주민번호">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fa fa-vcard"></span>
							</div>
						</div>
					</div>
					 <div class="card-body" style="padding: 0rem; margin-bottom: 1rem;">
						 <div class="row">
							 <div class="col-6">
								<input type="text" class="form-control" name="empZip" id="empZip" value="" placeholder="우편번호">
							</div>
							<div class="col-6" style="padding-left:0px;">
								<input type="button" class="form-control btn btn-block btn-secondary btn-sm" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
								style="border: 0px; height: 33px; background-color: #E4E6EF; color: black;">
							</div>
						</div>
					</div>
					<div class="card-body" style="padding: 0rem; margin-bottom: 1rem;">
						<div class="row">
							<div class="col-6">
								<input type="text" class="form-control" name="empAdd1" id="empAdd1" value="" placeholder="주소">
							</div>
							<div class="col-6" style="padding-left:0px;">
								<input type="text" class="form-control" name="empExadd" id="sample6_extraAddress" value="" placeholder="참고항목">
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="text" class="form-control" name="empAdd2" id="empAdd2" value="" placeholder="상세주소">
					</div>
					<div class="input-group mb-3">
						<input type="text" class="form-control" id="phon" name="empPh" oninput="phNumder(this)" maxlength="13" placeholder="전화번호">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fa fa-phone"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<select class="form-control" name="empNo" id="job">
							<option value="no" >직책선택</option>
							<option data-no="d001" value="D10000">의사</option>
							<option data-no="n001" value="N10000">간호사</option>
							<option data-no="a001" value="A10000">원무과</option>
							<option data-no="r001" value="R10000">영상의학과</option>
						</select>
						<input type="hidden" id="position" name="jobCd" value="">
						<input type="hidden" id="jobgubun" name="jobGubun" value="">
						<input type="hidden" name="empEnabled" value="N">
						<input type="hidden" name="empFrlgYn" value="Y" id="frlgYN">
					</div>
					<div class="container-login100-form-btn">
						<button type="submit" class="login100-form-btn">
							회원가입
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
<script src="/resources/adminlte/plugins/jquery/jquery.min.js"></script>
<script	src="/resources/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/adminlte/dist/js/adminlte.min.js?v=3.2.0"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script>
let header = "${_csrf.headerName}";
let token  = "${_csrf.token}";

var code = "";//이메일전송 인증번호 저장위한 코드

  //전화번호 하이픈(-)자동 생성
  const phNumder = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}
  //주민번호 하이픈(-)자동 생성
  const regNumder = (target) => {
	 target.value = target.value
	   //.replace(/[^0-9]/g, '') 숫자를 제외한 모든 문자 제거
	  .replace(/^(\d{0,6})(\d{0,7})$/g, "$1-$2").replace(/(\-{1,2})$/g, "");
	}
  
  
  //주민번호 뒷자리 마스킹
  function setJumin(obj){
	  ju = obj.value;
	    ju = ju.replace("-","");
	    if(ju.length > 6) {
	    	ju1 = ju.substring(0,6);
	        ju2 = ju.substring(6,7);
	        console.log(ju2);
		  for(i=1; i<ju.substring(6).length && i < 7; i++){
			  ju2 = ju2 + "*";
		  }
		  obj.value = ju1+"-"+ju2;
		  console.log(obj.value);
		
	  }
  }
  
  /* 인증번호 비교 */
  $(".mail_check_input").focusout(function(){ //마우스가 다음칸 클릭했을 경우 일치 불일치 여부 뜸
 	 var inputCode = $("#authNum").val();// 입력코드    
 	 var checkResult = $("#mail_check_input_box_warn");// 비교 결과   
  	
 	 if(inputCode == code){// 일치할 경우
 	        checkResult.html("인증번호가 일치합니다.");
 	        checkResult.attr("class", "correct");        
 	    } else {// 일치하지 않을 경우
 	        checkResult.html("인증번호를 다시 확인해주세요.");
 	        checkResult.attr("class", "incorrect");
 	    }    
  
  });

  $("#btn").on("submit",function() {
	 // event.preventDefault();//submit 버트을 누르면 전송 직전에 onsubmit 이벤트가 발생,전송하기마
	  //e.preventDefult();
	var pos = $("#job").find("option:selected").data("no");
	var jcd = $("#position").val(pos);
	var memberjobcd = $("#job option:selected").val();
	var jod = $("#job option:selected").text();
	var juminRule=/^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4]$/;
	let reg1 = $("#reg").val();
	let reg2 = reg1.substring(0,8);
	console.log("주민번호 확인"+$("#reg").val());
	console.log("주민번호 자른거 확인"+reg2);
	
	$("#jobgubun").val(jod);
 	
 	temp_pw_issuance() 
 	
 	//주민번호 체크
 	if(!juminRule.test(reg2)) {
	  	 Swal.fire({ //알트
		         icon: 'warning',
		         title: '주민등록번호를 확인 후 다시 입력해주세요.',
		         showConfirmButton: false,
		         background: '#15243e',
		         timer: 2000,
		     }); //alert끝       
  		return false;
    }
 	
 	if ($("#memberName").val() == null || $("#memberName").val() == "") {
 		 Swal.fire({ //알트
 	         icon: 'warning',
 	         title: '이름을 입력해주세요.',
 	         showConfirmButton: false,
 	         background: '#15243e',
 	         timer: 2000,
 	     }).then((value) => {
 	         if(value){}
 	     }); //alert끝       
 		$("#memberName").focus();
 		 
 		return false;
 		}
 	
 	if ($("#email").val() == null || $("#email").val() == "") {
 		 Swal.fire({ //알트
 	         icon: 'warning',
 	         title: '이메일을 입력해주세요.',
 	         showConfirmButton: false,
 	         background: '#15243e',
 	         timer: 2000,
 	     }).then((value) => {
 	         if(value){}
 	     }); //alert끝       
 		$("#email").focus();
 		 
 		return false;
 		}
 	
 	if ($("#authNum").val() == "") {
 		 Swal.fire({ //알트
 	         icon: 'warning',
 	         title: '인증번호를 입력해주세요.',
 	         showConfirmButton: false,
 	         background: '#15243e',
 	         timer: 2000,
 	     }).then((value) => {
 	         if(value){}
 	     }); //alert끝       
 		$("#authNum").focus();
 		 
 		return false;
 		}
 	
 	if ($("#reg").val() == null || $("#reg").val() == "") {
 		 Swal.fire({ //알트
 	         icon: 'warning',
 	         title: '주민번호를 입력해주세요.',
 	         showConfirmButton: false,
 	         background: '#15243e',
 	         timer: 2000,
 	     }).then((value) => {
 	         if(value){}
 	     }); //alert끝       
 		$("#reg").focus();
 		 
 		return false;
 		}

 	if ($("#phon").val() == "") {
 		 Swal.fire({ //알트
 	         icon: 'warning',
 	         title: '전화번호를 입력해주세요.',
 	         showConfirmButton: false,
 	         background: '#15243e',
 	         timer: 2000,
 	     }).then((value) => {
 	         if(value){}
 	     }); //alert끝       
 		$("#phon").focus();
 		 
 		return false;
 		}
 	
 	if ($("#job option:selected").val() == null || $("#job option:selected").val() == "" || $("#job option:selected").val() == "no") {
 		//alert("직책을 선택해주세요.");
 		 Swal.fire({ //알트
 	         icon: 'warning',
 	         title: '직책을 선택해주세요.',
 	         showConfirmButton: false,
 	         background: '#15243e',
 	         timer: 2000,
 	     }).then((value) => {
 	         if(value){}
 	     }); //alert끝       
 		$("#job").focus();
 		 
 		return false;
 		}
 	//alert("회원가입이 완료되었습니다.");
 	 Swal.fire({ //알트
         icon: 'success',
         title: '회원가입이 완료되었습니다.',
         showConfirmButton: false,
         background: '#15243e',
         timer: 2000,
     }).then((value) => {
         if(value){
 			location.href='/emp/login';
         }
     }); //alert끝         
}); 
  /* 인증번호 이메일 전송 */
 $("#email_auth_btn").click(function(){
     
     var email = $("#email").val();             // 입력한 이메일
     var cehckBox = $("#authNum");     // 인증번호 입력란
     
     $.ajax({
         
         type:"GET",
         url:"/emp/mailCheck?email=" + email,
         beforeSend:function(xhr){
				xhr.setRequestHeader(header,token);
			},
         success:function(data){
       	  console.log("data : " + data);
       	  cehckBox.attr("disabled",false);
       	  //cehckBox.css("border-color","red");
       	  code = data;
       	  //alert("인증번호가 발송되었습니다.");
       	  Swal.fire({ //알트
              icon: 'success',
              title: '인증번호가 발송되었습니다.',
              showConfirmButton: false,
              background: '#15243e',
              timer: 2000,
          }).then((value) => {
          	}); //alert끝     
       	  
         }
     });
 });

</script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('empZip').value = data.zonecode;
                document.getElementById("empAdd1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("empAdd2").focus();
            }
        }).open();
    }
    
    function temp_pw_issuance() {
    	let ranValue1 = ['1','2','3','4','5','6','7','8','9','0'];
    	let ranValue2 = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
    	let ranValue3 = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
    	
    	var temp_pw = ""; //임시비밀번호 
    	
    	for(i=0 ; i<2; i++) {
    		let ranPick1 = Math.floor(Math.random() * ranValue1.length);
    		let ranPick2 = Math.floor(Math.random() * ranValue2.length);
    		let ranPick3 = Math.floor(Math.random() * ranValue3.length);
    		temp_pw = temp_pw + ranValue1[ranPick1] + ranValue2[ranPick2] + ranValue3[ranPick3];
    	}
    	
    	$("#pass").val(temp_pw);
    	console.log($("#pass").val());
    }
</script>