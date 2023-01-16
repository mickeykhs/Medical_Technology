<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <meta name="description" content="Responsive Admin Template">
    <meta name="author" content="RedstarHospital">
    <title>로그인폼</title>
     <!-- google font -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet" type="text/css">
	<!-- icons -->
    <link href="fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://www.einfosoft.com/templates/admin/sunray/source/assets/plugins/iconic/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
    <!-- bootstrap -->
	<link href="https://www.einfosoft.com/templates/admin/sunray/source/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <!-- style -->
    <link rel="stylesheet" href="https://www.einfosoft.com/templates/admin/sunray/source/assets/css/pages/extra_pages.css">
	<!-- favicon -->
	<link rel="shortcut icon" href="/resources/images/logo3.jpg">
<style>
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
		<div class="container-login100" style="z-index:auto;">
			<div class="wrap-login100" style="background:RGB(21,36,62);"> 
				<form class="login100-form validate-form" action="/login" method="post" id="formId">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<span class="login100-form-logo">
						<img alt="" src="/resources/images/logo3.jpg">
					</span>
					<span class="login100-form-title p-b-34 p-t-27">
						로그인
					</span> 
					<div class="wrap-input100" data-validate="Enter username">
						<input class="input100" id="no" type="text" name="empNo" placeholder="사번">
						<span class="focus-input100" data-placeholder=""></span>
					</div>
					<div class="wrap-input100 " data-validate="Enter password">
						<input class="input100" type="password" id="pass" name="empPw" placeholder="비밀번호">
						<span class="focus-input100" data-placeholder=""></span>
					</div>
					<div class="contact100-form-checkbox">
						<input type="checkbox" id="md_checkbox_24" class="filled-in chk-col-info">
						<label for="md_checkbox_24">사번 기억하기</label>
					</div> 
					<div class="container-login100-form-btn">
						<button type="submit" id="btn"  class="login100-form-btn">
							로그인
						</button>
					</div>
					<div class="text-center p-t-30">
						<a href="/emp/join"><button type="button" class="waves-effect waves-light btn btn-default mb-5 mt-10" style="border: none; background:RGB(21,36,62);">회원가입</button></a>
						<button type="button" class="waves-effect waves-light btn btn-default mb-5 mt-10" data-bs-toggle="modal" data-bs-target="#modal-center3" style="border: none; background:RGB(21,36,62);">비밀번호 찾기</button>
					</div>
					<sec:csrfInput />
				</form>
			</div>
		</div>
	</div>
<!-- modal 영역 -->
<div class="modal center-modal fade" id="modal-center3" tabindex="-1" style="display: block;" aria-modal="true" role="dialog">
  <div class="modal-dialog">
	<div class="modal-content">
	  <div class="modal-header">
		<h4 class="box-title">비밀번호 찾기</h4>
		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	  </div>
<!-- 		  <form class="form" action="pwSearch" method="post" name="findform" id="findform"> -->
			  <div class="modal-body">
				<div class="form-group">
					<label class="form-label">사번</label>
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="사번" id="empNo" name="empNo" value="">
						<span class="input-group-text"><i class="fa fa-user" style="padding-left:3px;"></i></span>
					</div>
				</div>
				<div class="form-group">
					<label class="form-label" id="aa">이메일</label>
					<div class="input-group mb-3">
						<input type="text" id="empMail" name="empMail" class="form-control" placeholder="이메일" value="">
						<span class="input-group-text"><i class="fa fa-envelope"></i></span>
					</div>
				</div>
			  </div>
			  <div class="modal-footer modal-footer-uniform">
				<button type="submit" class="btn btn-primary float-end" id="findBtn">확인</button>
			  </div>
<!-- 	  	</form> -->
	</div>
  </div>
</div>

<script type="text/javascript">
//로그인 실패시 alert띄우기
$(function(){
	
	if('${ERRORMSG}' == '1') {
    	Swal.fire({
            icon: 'warning',
            title: '아이디 또는 비밀번호를 잘못 입력했습니다',
            showConfirmButton: false,
            background: '#15243e',
            timer: 5500,
        }).then((value) => {
            if(value){
            }
        });
	} 
	if('${ERRORMSG}' == '2') {
    	Swal.fire({
            icon: 'warning',
            title: '계정이 존재하지 않습니다',
            showConfirmButton: false,
            background: '#15243e',
            timer: 5500,
        }).then((value) => {
            if(value){
            }
        });
	} 
	if('${ERRORMSG}' == '3') {
    	Swal.fire({
            icon: 'warning',
            title: '이메일 인증을 해주세요',
            showConfirmButton: false,
            background: '#15243e',
            timer: 5500,
        }).then((value) => {
            if(value){
            }
        });
	}
	if('${ERRORMSG}' == '4') {
    	Swal.fire({
            icon: 'warning',
            title: '이미 로그인 중입니다',
            showConfirmButton: false,
            background: '#15243e',
            timer: 5500,
        }).then((value) => {
            if(value){
            }
        });
	} 
});





let header = "${_csrf.headerName}";
let token  = "${_csrf.token}";
// 비밀번호 찾기
$("#findBtn").on("click",function(){  
	let id = $("#empNo").val();
	let email = $("#empMail").val();
	
	if(id == null || id == ""){
		Swal.fire({
            icon: 'warning',
            title: '사번을 입력해주세요.',
            showConfirmButton: false,
            background: '#15243e',
            timer: 5500,
        });
		$("#empNo").focus();
		return false;
	}else if(email == null || email == ""){
		Swal.fire({
            icon: 'warning',
            title: '이메일을 입력해주세요.',
            showConfirmButton: false,
            background: '#15243e',
            timer: 5500,
        });
		$("#empMail").focus();
		return false;
	}
	
	let empNo = $("#empNo").val();
	let empMail = $("#empMail").val();
	let data = {"empNo":empNo, "empMail":empMail};
	
	//console.log(data);
	
//흐름이 이상해 리팩토링 필요해 서버에서 보내는게 났다.
	//ajax 안에 ajax 들어가지 말로 서버로 처리
	$.ajax({
		type:"post",
		url:"/emp/pwSearch",

		data: JSON.stringify(data),
		contentType:"application/json;charset=utf-8",
		dataType: 'json',
		beforeSend:function(xhr){
			xhr.setRequestHeader(header,token);
		},
		success:function(data){
			console.log("비밀번호는 : " + data);
			//alert("원래 비밀번호는 : " + data);
			
			let newPw = data;
			
		/*이메일로 비밀번호 보내기*/
		$.ajax({
	         type:"POST",
	         url:"/emp/passSearch?email=" + empMail,
	         data: JSON.stringify(newPw),
	 		 contentType:"application/json;charset=utf-8",
	 		 dataType: 'text',
	 		beforeSend:function(xhr){
				xhr.setRequestHeader(header,token);
			},
	         success:function(data){
				console.log("인증메일 비번 : " + data);
				code = data;
				Swal.fire({
		            icon: 'success',
		            title: '이메일로 비밀번호가 발송되었습니다.',
		            showConfirmButton: false,
		            background: '#15243e',
		            timer: 5500,
		        }).then((value) => {
		            if(value){
		            	window.location.reload();
		            }
		        });
				//$('#modal-center3').modal('hide');
				
	         }
	     });
		},
		error: function() {
			Swal.fire({
	            icon: 'warning',
	            title: '아이디나 이메일을 다시 확인해 주세요.',
	            showConfirmButton: false,
	            background: '#15243e',
	            timer: 5500,
	        });
	      }
	});
});

/* function pw(){
	$.ajax({
		method:"post",
		url:"/emp/pwSearch",
		data:JSON.stringify{(
			id:$("#empNo").val(),
			email:$("#mail").val()
		)},
		success:function(data){
			console.log(data);
		}
	});
} */
</script>
<!-- 아이디 저장 시작 -->
<script type="text/javascript">
$(function(){
	let Cno = getCookie("coockie_no");
	if(Cno){
		$("#no").val(Cno);
		$("#md_checkbox_24").attr("checked",true);
	}
});
	
	$("#btn").on("click",function(){
		let empNO = $("#no").val();
		let ch = $("#md_checkbox_24").is(':checked');
		console.log(ch);
		if ($("#no").val() == null || $("#no").val() == "") {
			Swal.fire({
	            icon: 'warning',
	            title: '사번을 입력해주세요.',
	            showConfirmButton: false,
	            background: '#15243e',
	            timer: 5500,
	        });
	 		$("#no").focus();
	 		 
	 		return false;
	 		
	 	}else if($("#pass").val() == null || $("#pass").val() == ""){
			Swal.fire({
	            icon: 'warning',
	            title: '비밀번호를 입력해주세요.',
	            showConfirmButton: false,
	            background: '#15243e',
	            timer: 5500,
	        });
			$("#pass").focus();
			return false;
		}else if(ch == true){
			setCookie("coockie_no",empNO,7);
		}else{
			deleteCookie("coockie_no");
		}
		
	});
	
	//쿠기 값 저장하는 이벤트
	function setCookie(cookieName, value, exdays){
		  var exdate = new Date();
		  exdate.setDate(exdate.getDate() + exdays);	// 쿠키 저장 기간
		  var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
		  document.cookie = cookieName + "=" + cookieValue;
		}
	
	//쿠키 값 조회하는이벤트
	function getCookie(cookieName) {
		  cookieName = cookieName + '=';
		  var cookieData = document.cookie;
		  var start = cookieData.indexOf(cookieName);
		  var cookieValue = '';
		  
		  if(start != -1){
		    start += cookieName.length;
		    var end = cookieData.indexOf(';', start);
		  if(end == -1)end = cookieData.length;
		  	cookieValue = cookieData.substring(start, end);
		  }
		  return unescape(cookieValue);
		}
	
	//쿠키값 지우는 이벤트
	function deleteCookie(cookieName){
		  var expireDate = new Date();
		  expireDate.setDate(expireDate.getDate() - 1);
		  document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
</script>
<!-- 아이디 저장 끝 -->
<!-- start js include path -->
<script src="https://www.einfosoft.com/templates/admin/sunray/source/assets/plugins/jquery/jquery.min.js"></script>
<!-- bootstrap -->
<script src="https://www.einfosoft.com/templates/admin/sunray/source/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="https://www.einfosoft.com/templates/admin/sunray/source/assets/js/pages/extra_pages/extra_pages.js"></script>
<!-- end js include path -->

