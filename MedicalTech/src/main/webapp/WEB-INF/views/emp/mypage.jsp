<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- 다음 주소록 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.correct{
    color : green;
}
.incorrect{
    color : red;
}
</style>
<sec:authorize access="isAuthenticated()">
<div id="pwDiv" style="margin: 10%;">
	<div class="box bs-3 border-primary">
		<div class="box-header">
			<h4 class="box-title">마이페이지를 확인하려면 <strong style="color:red;"> 비밀번호 </strong>를 입력해주세요.</h4>
		</div>
			<div class="row ">
			<div class="box-body" style="text-align: center;">
				<%-- <p><code>비밀번호</code></p> --%>
				<label style="margin-right: 10px; font-size: large;">비밀번호</label>
				<div class="col-5" style="display: -webkit-inline-box;">
					<input type="password" class="form-control" id="pass" value="" />
					<input type="hidden" class="form-control" id="emppw" value="<sec:authentication property="principal.empVO.empPw"/>">
					<input type="hidden" class="form-control" id="empno" value="<sec:authentication property="principal.empVO.empNo"/>">
					<div style="margin-left: 15px;">
						<button type="button" id="btnmy" class="waves-effect waves-light btn btn-primary mb-5">확인</button>
					</div>
				</div>
			</div>
			</div>
	</div>
</div>
<div id="myDiv" class="">
	  <div class="box bs-3 border-primary">
		<div class="box-header with-border">
		  <h3 class="box-title text-info mb-0 mt-10"><i class="ti-user me-15" id="myNo"></i></h3>
		  <span id="sunbtn2">
			<button type="button" id="successbtn" class="btn btn-success" style="float: right;">
			  <i class="fa fa-save"></i> 수정
		    </button>
	      </span>
		</div>
		<!-- /.box-header -->
		<form class="form" id="sunju">
			<div class="box-body">
<!--////////////////////////////////// 사진 넣기 위한 div /////////////////////////////////////////////////////////////////////////////-->
					<!-- 사진 -->
					<div class="row" style="display: flex;">
					<div class="col-md-6" style="width: 20%; float: right; margin: 10px; border: solid;">
						<a href="javascript:void(0);" onclick="$('#imgupload').trigger('click')">
						<img class="empimg" src="/resources/upload/no_img.jpg" style="width: 300px; height: 400px;" >
						</a>
						<input type="file" id="imgupload" name="sunjuImg" onchange="imgChg(this)" readonly style="display: none;">
					</div>
				<div style="width: 30%;flex-grow :1; margin-top: 10px;">
				
				<div class="row">
				  <div class="col-md-4">
					<div class="form-group">
					  <label class="form-label" style="font-size: large;">이름</label>
					  <input type="text" id="myName" name="empName" class="form-control sunju" readonly value="<sec:authentication property="principal.empVO.empName"/>">
					</div>
				  </div>
					<div class="col-md-4">
						<div class="form-group">
						  <label class="form-label" style="font-size: large;">직책</label>
						  <input type="text" id="myJob" name="jobGubun" class="form-control" readonly  value="<sec:authentication property="principal.empVO.jobGubun"/>">
						</div>
				   </div>
					<div class="col-md-4">
						<div class="form-group">
						  <label class="form-label" style="font-size: large;">사번</label>
						  <input type="text" id="myJobNum" name="empNo" class="form-control" readonly  value="<sec:authentication property="principal.empVO.empNo"/>">
						</div>
				   </div>
				</div>
				
				<div class="row">
				  <div class="col-md-4">
					<div class="form-group">
					  <label class="form-label" style="font-size: large;">주민번호</label>
					  <input type="text" id="myReg"  name="empReg" class="form-control" readonly  value="<sec:authentication property="principal.empVO.empReg"/>">
					</div>
				  </div>
				   <div class="col-md-4">
					<div class="form-group">
					  <label class="form-label" style="font-size: large;">입사일</label>
					  <input type="text" id="myIn" class="form-control" readonly value="<sec:authentication property="principal.empVO.empIn"/>"/>
					</div>
				  </div>
				  <div class="col-md-4">
					<div class="form-group">
					  <label class="form-label" style="font-size: large;">전화번호</label>
					  <input type="text" id="myPhone" name="empPh" class="form-control sunju" oninput="phNumder(this)" maxlength="13" value="<sec:authentication property="principal.empVO.empPh"/>" >
					</div>
				  </div>
				</div>
				
				
				<div class="row">
				  <div class="col-md-4">
					<div class="form-group">
					  <label class="form-label" style="font-size: large;">E-mail</label>
					  <input type="text" id="myMail" name="empMail" class="form-control sunju" readonly value="<sec:authentication property="principal.empVO.empMail"/>">
					  <input type="hidden" id="onMail" value="<sec:authentication property="principal.empVO.empMail"/>">
					</div>
				  </div>
				  <div class="col-md-4" style="padding-top:5px;">
					<div class="form-group" style="margin-bottom: 0px; margin-top: 0.5rem;">
					 	<label class="form-label" style="font-size: large;"></label>
					    <input type="button" class="form-control" id="email_auth_btn" value="인증번호 받기" disabled="disabled"
					           style="font-size: large; border: 0px; height: 34px; background-color: #E4E6EF; color: black;">
				    </div>
				 </div>
				 <div class="col-md-4">
					<div class="form-group">
					  <label class="form-label" style="font-size: large;">인증번호 입력</label>
					  <input type="text" id="authNum" class="form-control sunju mail_check_input" disabled="disabled" style="">
					  <span id="mail_check_input_box_warn"></span>
					</div>
				</div>
				</div>
				
				
				<div class="row">
				 <div class="col-md-6">
					<div class="form-group">
					  <label class="form-label" style="font-size: large;">우편번호</label>
					  <input type="text" id="myZip" name="empZip" class="form-control sunju" readonly value="<sec:authentication property="principal.empVO.empZip"/>">
					</div>
				  </div>
				 <div class="col-md-6" style="padding-top:5px;">
					<div class="form-group" style="margin-bottom: 0px; margin-top: 0.5rem;">
					 	<label class="form-label" style="font-size: large;"></label>
					    <input type="button" class="form-control" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
					           style="font-size: large; border: 0px; height: 34px; background-color: #E4E6EF; color: black;">
				    </div>
				 </div>
				</div>
				<div class="row">
				 <div class="col-md-4">
					<div class="form-group">
					  <label class="form-label" style="font-size: large;">주소</label>
					  <input type="text" id="myAdd1" name="empAdd1" class="form-control sunju" readonly value="<sec:authentication property="principal.empVO.empAdd1"/>">
					</div>
				  </div>
				  <div class="col-md-4">
					<div class="form-group">
					  <label class="form-label" style="font-size: large;">도로명 상세</label>
					  <input type="text" id="sample6_extraAddress" name="empExadd" class="form-control sunju" readonly value="<sec:authentication property="principal.empVO.empExadd"/>">
					</div>
				  </div>
				  <div class="col-md-4">
					<div class="form-group">
					  <label class="form-label" style="font-size: large;">상세주소</label>
					  <input type="text" id="myAdd2" name="empAdd2" class="form-control sunju" readonly value="<sec:authentication property="principal.empVO.empAdd2"/>">
					</div>
				  </div>
				</div>
				</div>
				</div>
<!--////////////////////////////////// 사진 넣기 위한 div /////////////////////////////////////////////////////////////////////////////-->
			</div>
			<!-- /.box-body -->
			<div class="box-footer" style="padding: 0.5rem;">
				<button type="reset" class="btn btn-warning me-1 mb-10" id="fn_hide" style="float: right; display: none;">
				  <i class="fa fa-mail-reply"></i> 뒤로가기
				</button>
				
				<a href="/main/main"><button type="button" class="btn btn-danger me-1 mb-10" id="home" style="float: right;">
					  <i class="ti-home"></i> 처음으로	</button></a>
				
				<button type="button" id="infobtn" class="btn btn-info" style="display: none;">
				  <i class="fa fa-save"></i> 저장
				</button>
				
			</div>  
		</form>
	  </div>
	  
	  <!-- /.box -->			
</div>
</sec:authorize>





<script type="text/javascript">
let enterKey = document.getElementById("pass")
enterKey.addEventListener("keyup",function(e){
	if(e.keyCode === 13){
		//e.perventDefault();
		document.getElementById("btnmy").click();
	}
})
	//이미지 체인지
	const imgWin = document.querySelector(".empimg");
	function imgChg(pthis){
		let file = pthis.files[0];
		let fileReader = new FileReader();
		fileReader.onload = ()=>{
			imgWin.src = fileReader.result;
		}
		fileReader.readAsDataURL(file);
	}
	
	
	
	//주소 API
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
	                document.getElementById('myZip').value = data.zonecode;
	                document.getElementById("myAdd1").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("myAdd2").focus();
	            }
	        }).open();
	    }
	
//전화번호 하이픈(-)자동 생성
 const phNumder = (target) => {
 target.value = target.value
   .replace(/[^0-9]/g, '')
  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}
	
$(document).ready(function(){
	console.log("체킁:",$("#myDiv")[0]);
	$("#myDiv").hide();
	
	$("#myMail").change(function(){
		let newmail = $("#myMail").val();
		let oldmail = $("#onMail").val();
		console.log("new : " + newmail + "/" +"old : " + oldmail);
		let submail = newmail.split('@');
		let oldsubmail = oldmail.split('@');
		let nEmail1 = submail[0];
		let nEmail2 = submail[1];
		let oEmail1 = oldsubmail[0];
		if(nEmail1 != oEmail1 || nEmail2 != oEmail2){
			$("#email_auth_btn").attr("disabled",false);//disabled 풀리고
		}
		
	});
	
	$("#successbtn").on("click",function(){
		$("#infobtn").css("display", "block");
		$(".sunju").css("border-color", "#f7f1f1");
		$(".sunju").removeAttr("readonly");
		$("#successbtn").css("display", "none");
		$("#fn_hide").css("display", "block");
		$("#home").css("display", "none");
		$("#imgupload").removeAttr("readonly");
	});
	
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
	
/* 인증번호 이메일 전송 */
$("#email_auth_btn").click(function(){
 let newmail = $("#myMail").val();
    let oldmail = $("#onMail").val();
    let submail = newmail.split('@');
    let oldsubmail = oldmail.split('@');
    let nEmail1 = submail[0];
    let nEmail2 = submail[1];
    let oEmail1 = oldsubmail[0];
    let oEmail2 = oldsubmail[1];
 console.log("바뀐거 : " + nEmail1 + nEmail2 + " / " + "현재DB저장 : " + oEmail1 + oEmail2);

    var email = $("#myMail").val();             // 입력한 이메일
    var cehckBox = $("#authNum");     // 인증번호 입력란
    if(nEmail1 != oEmail1 || nEmail2 != oEmail2){
     $.ajax({
         type:"GET",
         url:"/emp/myEmail?email=" + email,
         beforeSend:function(xhr){
				xhr.setRequestHeader(header,token);
			},
         success:function(data){
       	  console.log("data : " + data);
       	  cehckBox.attr("disabled",false);
       	  cehckBox.css("border-color","#f7f1f1");
       	  
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
     });//ajax끝
    }//if끝
});
	
$("#fn_hide").on("click",function(){
	$("#infobtn").css("display", "none");
	$(".sunju").css("border-color", "rgba(255, 255, 255, 0.12)");
	$("#successbtn").css("display", "block");
	$("#fn_hide").css("display", "none");
	$("#home").css("display", "block");
});
 
	

	let header = "${_csrf.headerName}";
	let token  = "${_csrf.token}";
	let empno = $("#empno").val();
	let password = $("#emppw").val();
	console.log(empno);
	
	
	$("#btnmy").on("click",function(){
	
	let pw = $("#pass").val();
	console.log(pw);
	if(pw != password){
		Swal.fire({ //알트
	        icon: 'warning',
	        title: '비밀번호가 틀렸습니다.',
	        showConfirmButton: false,
	        background: '#15243e',
	        timer: 2000,
	    }).then((value) => {
	    	}); //alert끝 
	}
	let data = {"empNo":empno, "empPw":pw};
		$.ajax({
			url:"/emp/mypage",
			type:"post",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			dataType:"json",
			beforeSend:function(xhr){
				xhr.setRequestHeader(header,token);
			},
			success:function(result){
				console.log("결과 확인 : " + result);
				console.log(JSON.stringify(result));
				$("#pwDiv").hide();
				$("#myDiv").show();
				
				let myno = result.empNo;
				let myname = result.empName;
				let total =  " " + myname +"("+myno+")"+ "님의 마이페이지 입니다."
				console.log(total);
				let myjob = result.jobGubun;
				let myemail = result.empMail;
				let myzip = result.empZip;
				let myadd1 = result.empAdd1;
				let myadd2 = result.empAdd2;
				let myadd3 = result.empExadd;
				let myphone = result.empPh;
				let myreg = result.empReg;
				let myjobnum = result.empNo;
				let myin = result.empIn;
				$("#myNo").html(total);
				$("#myName").val(myname);
				$("#myJob").val(myjob);
				$("#myMail").val(myemail);
				$("#myZip").val(myzip);
				$("#myAdd1").val(myadd1);
				$("#myAdd2").val(myadd2);
				$("#sample6_extraAddress").val(myadd3);
				$("#myPhone").val(myphone);
				$("#myReg").val(myreg);
				$("#myJobNum").val(myjobnum);
				$("#myIn").val(myin);
				if(result.empWt != null || result.empWt == ""){
					$(".empimg").attr("src",result.empWt);
				}
			}
		});
	});
});
	$("#infobtn").on("click",function(){
		let header = "${_csrf.headerName}";
		let token  = "${_csrf.token}";
		let formData = new FormData(document.querySelector("#sunju"));
		
		if($("#imgupload")[0].files.length != 0){
			formData.append("sunjuImg",$("#imgupload")[0].files[0]);
		}else {
			formData.append("empWt",$(".empimg").attr("src"));			
		}		//formData.append("empWt",$(".empimg").src.value);
		
		
		$.ajax({
			type:"post",
			url:"/emp/myPageUpdate",
			data:formData,
			contentType:false,
			cache:false,
			processData:false,
			dataType:"json",
			beforeSend:function(xhr){
				xhr.setRequestHeader(header,token);
			},
			success:function(data){
				console.log(data);
				Swal.fire({ //알트
			        icon: 'success',
			        title: '수정된 내용이 저장되었습니다.',
			        showConfirmButton: false,
			        background: '#15243e',
			        timer: 2000,
			    }).then((value) => {
			    	$(".sunju").css("border-color","rgba(255, 255, 255, 0.12)");
			    	$(".sunju").attr("readonly", true);
			    	$("#successbtn").css("display","block");
			    	$("#infobtn").css("display","none");
			    	$("#home").css("display","block");
			    	$("#fn_hide").css("display","none");
			    	$("#imgupload").attr("readonly", true);
			    	}); //alert끝 
			}
			
		});
	});


//날짜 나오는 함수
function fn_Date(data){
	let dt = new Date(data);
	let dtYY = dt.getFullYear();
	let dtMM = dt.getMonth();
	if(dtMM < 10){
		dtMM = "0" + dtMM;
	}
	let dtDD = dt.getDate();
	if(dtDD < 10){
		dtDD = "0" + dtDD;
	}
	let dtResult = dtYY + "-" + dtMM + "-" + dtDD;
	console.log(dtResult);
	return dtResult;
}
</script>
