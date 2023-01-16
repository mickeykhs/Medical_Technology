<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

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

<style>
.btn-white{
background-color: white;
width: 100px;
height: 80px;
margin-bottom: 20px;
margin-right: 5px;
}

/*첫번째 아이콘만 위치 깨져서 마진으로 조절함 */
.fa-stethoscope , .fa-medkit{
    margin-left: 24px;
    margin-top: 7px;
    margin-bottom: 5px;
}

/*아이콘 사이즈 조절*/
.medi{
 
}

.hospitalBack{
	background-image : url(https://www.einfosoft.com/templates/admin/sunray/source/assets/img/bg-01.jpg);
	background-size : cover;
	height:100vh;
}
/* .hospitalBack:before{  */
/*  	content:'';  */
/*  	background: linear-gradient(45deg, #15243E, transparent);  */
/*  	position:absolute;  */
/*  	left:0;  */
/*  	height:100%;  */
/*  	width:100%;  */
/* }  */

</style>
<sec:authorize access="isAuthenticated()">
<!-- 시작 빵구대장 뿡뿡이 -->

 <div class="limiter hospitalBack">
	<div class="container-login100 " style="z-index:auto;">
		<!-- 배경 속 -->
		<div class="wrap-login100" style="background:RGB(21,36,62);width:850px;height:500px;"> 
			<div style="display: flex">
				<!-- 안녕하세요 div -->
				<div style="width: 48%;">
					<span class="login100-form-logo"  style="margin-top:53px;width: 180px;height:180px;">
						<img alt="" src="/resources/images/logo3.jpg" style="width: 180px;">
					</span>
					<span class="login100-form-title p-b-34 p-t-27" style="margin-top: 22px;">
						<sec:authentication property="principal.empVO.empName"/>님 환영합니다<br><br>
						직책 : <sec:authentication property="principal.empVO.jobGubun"/>
						<!-- <input class="input100" id="name" type="text" name="name" value="면석님 출근하셨쎕니깡~!" readonly /> -->
					</span>
				</div>
				<input type="hidden" id="firstLg" value="<sec:authentication property="principal.empVO.empFrlgYn"/>" />
				
				<!-- 의사 -->
				<sec:authorize access="hasRole('ROLE_DOCTOR')">
					<div style="width: 52%;">
						<div style="">
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D1" style="color:#15243e; background-color:#29AAE0; ">
								<i class="fa fa-fw fa-stethoscope medi"></i> 진료실
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D2" style="color:#15243e; background-color:#29AAE0;">
								<i class="mdi mdi-clipboard-alert medi"></i> 공지사항
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D3" style="color:#15243e;background-color:#29AAE0;">
								<i class="mdi mdi-sitemap medi"></i> 조직도
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D4" style="color:#15243e;background-color:#29AAE0;">
								<i class="mdi mdi-calendar-clock medi"></i> 캘린더
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D5" style="color:#15243e;">
								<i class="mdi mdi-account-multiple-plus medi"></i> 접수
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D6" style="color:#15243e;">
								<i class="mdi mdi-email-outline medi"></i> SMS
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D7" style="color:#15243e;">
								<i class="mdi mdi-medical-bag medi"></i> 발주
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D8" style="color:#15243e;">
								<i class="mdi mdi-calculator medi"></i> 수납
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D9" style="color:#15243e;">
								<i class="mdi mdi-camera-enhance medi"></i> 검사
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D10" style="color:#15243e;">
								<i class="mdi mdi-pill medi"></i> 약품관리
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D11" style="color:#15243e;">
								<i class="fa fa-fw fa-medkit medi"></i> 처치
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D12" style="color:#15243e;">
								<i class="fa fa-address-book" aria-hidden="true" style="margin-top: 7px;margin-bottom: 5px;"></i>차트
							</a>
							
						</div>
					</div>
				</sec:authorize>
				<!-- 의사 끝 -->
				
				<!-- 간호사 -->
				<sec:authorize access="hasRole('ROLE_NURSE')">
					<div style="width: 52%;">
						<div style="">
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D10" style="color:#15243e;background-color:#29AAE0; ">
								<i class="mdi mdi-pill medi"></i> 약품관리
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D11" style="color:#15243e;background-color:#29AAE0; ">
								<i class="fa fa-fw fa-medkit medi"></i> 처치
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D4" style="color:#15243e;background-color:#29AAE0;">
								<i class="mdi mdi-calendar-clock medi"></i> 캘린더
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D2" style="color:#15243e; background-color:#29AAE0;">
								<i class="mdi mdi-clipboard-alert medi"></i> 공지사항
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D3" style="color:#15243e;background-color:#29AAE0;">
								<i class="mdi mdi-sitemap medi"></i> 조직도
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D1" style="color:#15243e;">
								<i class="fa fa-fw fa-stethoscope medi"></i> 진료실
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D5" style="color:#15243e;">
								<i class="mdi mdi-account-multiple-plus medi"></i> 접수
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D6" style="color:#15243e;">
								<i class="mdi mdi-email-outline medi"></i> SMS
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D7" style="color:#15243e;">
								<i class="mdi mdi-medical-bag medi"></i> 발주
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D8" style="color:#15243e;">
								<i class="mdi mdi-calculator medi"></i> 수납
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D9" style="color:#15243e;">
								<i class="mdi mdi-camera-enhance medi"></i> 검사
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D12" style="color:#15243e;">
								<i class="fa fa-address-book" aria-hidden="true" style="margin-top: 7px;margin-bottom: 5px;"></i>차트
							</a>
						</div>
					</div>
				</sec:authorize>
				<!-- 간호사 끝-->
				
				<!-- 원무과  -->
				<sec:authorize access="hasRole('ROLE_ADMINISTRATION')">
					<div style="width: 52%;">
						<div style="">
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D5" style="color:#15243e;background-color:#29AAE0;">
								<i class="mdi mdi-account-multiple-plus medi"></i> 접수
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D8" style="color:#15243e;background-color:#29AAE0;">
								<i class="mdi mdi-calculator medi"></i> 수납
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D7" style="color:#15243e;background-color:#29AAE0;" >
								<i class="mdi mdi-medical-bag medi"></i> 발주
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D6" style="color:#15243e;background-color:#29AAE0;">
								<i class="mdi mdi-email-outline medi"></i> SMS
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D2" style="color:#15243e; background-color:#29AAE0;">
								<i class="mdi mdi-clipboard-alert medi"></i> 공지사항
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D3" style="color:#15243e;background-color:#29AAE0;">
								<i class="mdi mdi-sitemap medi"></i> 조직도
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D4" style="color:#15243e;background-color:#29AAE0;">
								<i class="mdi mdi-calendar-clock medi"></i> 캘린더
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D1" style="color:#15243e;">
								<i class="fa fa-fw fa-stethoscope medi"></i> 진료실
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D9" style="color:#15243e;">
								<i class="mdi mdi-camera-enhance medi"></i> 검사
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D10" style="color:#15243e;">
								<i class="mdi mdi-pill medi"></i> 약품관리
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D11" style="color:#15243e;">
								<i class="fa fa-fw fa-medkit medi"></i> 처치
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D12" style="color:#15243e;">
								<i class="fa fa-address-book" aria-hidden="true" style="margin-top: 7px;margin-bottom: 5px;"></i>차트
							</a>
						</div>
					</div>
				</sec:authorize>
				<!-- 원무과 끝 -->
				
				<!-- 영상의학과  -->
				<sec:authorize access="hasRole('ROLE_RADIOLOGY')">
					<div style="width: 52%;">
						<div style="">
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D9" style="color:#15243e; background-color:#29AAE0; ">
								<i class="mdi mdi-camera-enhance medi"></i> 검사
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D2" style="color:#15243e; background-color:#29AAE0;">
								<i class="mdi mdi-clipboard-alert medi"></i> 공지사항
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D3" style="color:#15243e;background-color:#29AAE0;">
								<i class="mdi mdi-sitemap medi"></i> 조직도
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D4" style="color:#15243e;">
								<i class="mdi mdi-calendar-clock medi"></i> 캘린더
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D1" style="color:#15243e;">
								<i class="fa fa-fw fa-stethoscope medi"></i> 진료실
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D5" style="color:#15243e;">
								<i class="mdi mdi-account-multiple-plus medi"></i> 접수
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D6" style="color:#15243e;">
								<i class="mdi mdi-email-outline medi"></i> SMS
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D7" style="color:#15243e;">
								<i class="mdi mdi-medical-bag medi"></i> 발주
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D8" style="color:#15243e;">
								<i class="mdi mdi-calculator medi"></i> 수납
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D10" style="color:#15243e;">
								<i class="mdi mdi-pill medi"></i> 약품관리
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D11" style="color:#15243e;">
								<i class="fa fa-fw fa-medkit medi"></i> 처치
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D12" style="color:#15243e;">
								<i class="fa fa-address-book" aria-hidden="true" style="margin-top: 7px;margin-bottom: 5px;"></i>차트
							</a>
						</div>
					</div>
				</sec:authorize>
				<!-- 영상의학과 끝 -->
				
				<!-- 관리자 -->
				<sec:authorize access="hasRole('ROLE_MASTER')">
					<div style="width: 52%;">
						<div style="">
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D1" style="color:#15243e;">
								<i class="fa fa-fw fa-stethoscope medi"></i> 진료실
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D4" style="color:#15243e;">
								<i class="mdi mdi-calendar-clock medi"></i> 캘린더
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D5" style="color:#15243e;">
								<i class="mdi mdi-account-multiple-plus medi"></i> 접수
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D6" style="color:#15243e;">
								<i class="mdi mdi-email-outline medi"></i> SMS
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D7" style="color:#15243e;">
								<i class="mdi mdi-medical-bag medi"></i> 발주
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D8" style="color:#15243e;">
								<i class="mdi mdi-calculator medi"></i> 수납
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D9" style="color:#15243e;">
								<i class="mdi mdi-camera-enhance medi"></i> 검사
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D10" style="color:#15243e;">
								<i class="mdi mdi-pill medi"></i> 약품관리
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D11" style="color:#15243e;">
								<i class="fa fa-fw fa-medkit medi"></i> 처치
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D2" style="color:#15243e;">
								<i class="mdi mdi-clipboard-alert medi"></i> 공지사항
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D3" style="color:#15243e;">
								<i class="mdi mdi-sitemap medi"></i> 조직도
							</a>
							<a href="#" class="waves-effect waves-light btn btn-app btn-white D13" style="color:#15243e;">
								<i class="fa fa-address-book" aria-hidden="true" style="margin-top: 7px;margin-bottom: 5px;"></i>관리자
							</a>
							
						</div>
					</div>
				</sec:authorize>
				<!-- 관리자 끝-->
				
				
				
				
				
			</div>
		</div>
		<!-- 배경 속 -->	
	</div>
</div>
</sec:authorize>

<!-- 나의 정보 병경 modal 시작 영역 -->
<div class="modal center-modal fade" id="modal-center3" tabindex="-1" style="display: block;" aria-modal="true" role="dialog">
<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<h4 class="modal-title">최초로그인</h4>
		</div>
			<sec:authorize access="isAuthenticated()">
			<form class="form" id="subform3" action="/emp/newpass" method="post">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
		  <div class="modal-body">
    		<div class="form-group">
    			<label class="form-label">현재 비밀번호</label>
    			<div class="input-group mb-3">
    				<input type="password" class="form-control" id="empPw" value="">
    				<input type="hidden"class="form-control" id="lg1" name="empFrlgYn" value='<sec:authentication property="principal.empVO.empFrlgYn"/>'>
    				<input type="hidden"class="form-control" id="user2" name="empNo" value='<sec:authentication property="principal.empVO.empNo"/>'>
    			<input type="hidden"class="form-control" id="pw" value='<sec:authentication property="principal.empVO.empPw"/>'>
    				<span class="input-group-text"><i class="ti-lock"></i></span>
    			</div>
    		</div>
    	 
    		<div class="form-group">
    			<label class="form-label">새 비밀번호</label>
    			<div class="input-group mb-3">
    				<input type="password" name="empPw" class="form-control" id="newpw4" value="">
    				<span class="input-group-text"><i class="ti-lock"></i></span>
    			</div>
    		</div>
    		<div class="form-group">
				<label class="form-label">비밀번호 확인</label>
				<div class="input-group mb-3">
					<input type="password" class="form-control" id="newpw3" value="">
					<span class="input-group-text"><i class="ti-lock"></i></span>
				</div>
			</div>
			</div>
			</form>
			<div class="modal-footer modal-footer-uniform" style="display:flex;justify-content:space-between;">
				<button type="submit" form="subform3" id="sub3" class="btn btn-info float-end">변경</button>
		  	</div>
			</sec:authorize>
	</div>
</div>
</div>
<!-- 나의 정보 변경 모달 끝 -->


<!-- start js include path -->
<script src="https://www.einfosoft.com/templates/admin/sunray/source/assets/plugins/jquery/jquery.min.js"></script>
<!-- bootstrap -->
<script src="https://www.einfosoft.com/templates/admin/sunray/source/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="https://www.einfosoft.com/templates/admin/sunray/source/assets/js/pages/extra_pages/extra_pages.js"></script>
<!-- end js include path -->

<script type="text/javascript">
$(function() {
	$('.D1').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			location.href = "/doctor/view";
			$('#loading_bar').hide();
		}, 2000)
	});
	$('.D2').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			$('#loading_bar').hide();
			location.href = "/notice";
		}, 2000)
	});
	$('.D3').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			$('#loading_bar').hide();
			location.href = "/organization/organiTree";
		}, 2000)
	});
	$('.D4').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			$('#loading_bar').hide();
			location.href = "/nurse/calendar";
		}, 2000)
	});
	$('.D5').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			$('#loading_bar').hide();
			location.href = "/medical/mainPage";
		}, 2000)
	});
	$('.D6').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			$('#loading_bar').hide();
			location.href = "/sms/sms";
		}, 2000)
	});
	$('.D7').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			$('#loading_bar').hide();
			location.href = "/medical/drug";
		}, 2000)
	});
	$('.D8').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			$('#loading_bar').hide();
			location.href = "/accept/main";
		}, 2000)
	});
	$('.D9').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			$('#loading_bar').hide();
			location.href = "/exam/main";
		}, 2000)
	});
	$('.D10').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			$('#loading_bar').hide();
			location.href = "/nurse/drug";
		}, 2000)
	});
	$('.D11').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			$('#loading_bar').hide();
			location.href = "/nurse/treat";
		}, 2000)
	});
	$('.D12').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			$('#loading_bar').hide();
			location.href = "/medical/chartMult";
		}, 2000)
	});
	$('.D13').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			$('#loading_bar').hide();
			location.href = "/admin/list";
		}, 2000)
	});
	
	
	
	
	if($('#firstLg').val() == 'Y'){
		Swal.fire({ 
            icon: 'success',
            title: '최초 로그인 입니다.',
            text: '반드시 비밀번호를 변경해야 합니다.',
            showConfirmButton: false,
            background: '#15243e',
            timer: 2000,
        }).then((value) => {
			$("#modal-center3").modal("show");
        }); //alert끝 
		//모달 밖 영역 클릭시 모달 닫힘 막기
        $('#modal-center3').modal({backdrop: 'static', keyboard: false});  
	}

	$("#sub3").on("click",function(event){
		event.preventDefault();
		let pw = $("#pw").val();
		let empNo = $("#user2").val();
		let emppw = $("#empPw").val();
		let pw1 = $("#newpw3").val();
		let pw2 = $("#newpw4").val();
	    $("#lg1").val('N');
		if(pw != emppw){
			//alert("현재 비밀번호가 틀렸습니다.");
			 Swal.fire({ //알트
	              icon: 'warning',
	              title: '현재 비밀번호가 틀렸습니다.',
	              showConfirmButton: false,
	              background: '#15243e',
	              timer: 2000,
	          }); //alert끝 
			return false;
		}else if(pw1 == "" || pw2 == ""){
			Swal.fire({ //알트
	              icon: 'warning',
	              title: '비밀번호를 마저 입력하세요.',
	              showConfirmButton: false,
	              background: '#15243e',
	              timer: 2000,
	          });
			return false;
		}else if(pw1 != pw2){
			//alert("새 비밀번호가 불일치합니다.");
			 Swal.fire({ //알트
	              icon: 'warning',
	              title: '새 비밀번호가 불일치합니다.',
	              showConfirmButton: false,
	              background: '#15243e',
	              timer: 2000,
	          }); //alert끝 
			return false;
		}
		Swal.fire({
            title: '비밀번호가 변경되었습니다. 다시 로그인해주세요',
            icon: 'success',

            showCancelButton: true,
            ConfirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '확인',
            cancelButtonText: '취소',
            background: '#15243e',

            reverseButtons: false,

        }).then(result => {
            if(result.isConfirmed){
            	$('#subform3').submit();
            	setTimeout(()=>{
        			location.href = "/emp/login";
        		}, 2000)
                
           }
      });//swal끝

		//alert("비밀번호가 변경되었습니다. 다시 로그인해주세요");
	});
});

</script>
