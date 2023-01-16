<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>

.activeMenu{
    background-color: #5156be; 
    border-radius: 10px;
    color: white;
}
.hdComclass{
	padding:10px;
	padding-left:1px;
	right:35px;
	border-radius: 10px !important;
	
}
div[name=moving] {
  animation: sample-move 35s linear infinite;
}
@keyframes sample-move{
  0% {
    transform: translate(1800px, 0); 
  }
  100%{
    transform: translate(-2400px, 0);
  }
}
</style>

<header class="main-header" style="padding-right:180px;">
	  <div class="inside-header">
		<div class="d-flex align-items-center logo-box justify-content-start" style="position:relative;z-index:99;left:-48px;width:9%;">
			<!-- Logo -->
			<a id="main_main" href="#"><span class="dark-logo"><img src="/resources/images/logo5.png" alt="logo" style="width:100%;position:relative;height:125%;top:-3px;left:56px;" /></span></a>
			  <!-- logo-->
		</div>  
		<!-- Header Navbar -->
		
		
		<sec:authorize access="isAuthenticated()">
		<nav class="navbar navbar-static-top" style="left:400px;">
		  <!-- Sidebar toggle button-->
		  <div class="app-menu" name="moving" style="width:1700px;height:60px;"><input type="text" value="병원 의료정보시스템 점검이 다음과 같이 진행될 예정입니다. -작업일시 -23년 1월 14일(토), 오후8:00~ 오후11:00 해당 시간에는 병원 업무가 원할하지 않을 수 있습니다. 병원 이용에 참고해주시길 바랍니다." style="position:relative;
		  width:124%;height:100%;background-color:#15243D;color:white;border:none;font-weight:700;font-size:1.3rem;" disabled="disabled" />
			<ul class="header-megamenu nav">
				<li class="btn-group d-lg-inline-flex d-none">
					<div class="app-menu">
						<div class="search-bx mx-5">
						</div>
					</div>
				</li>
			</ul> 
		  </div>
		  
		  <div id="r_side" class="navbar-custom-menu r-side" style="position:absolute;left:836px;top:70px;">
			<ul class="nav navbar-nav">			
				<!-- User Account-->
				<li class="dropdown user user-menu">
					<a href="#" class="waves-effect waves-light dropdown-toggle w-auto l-h-12 bg-transparent p-0 no-shadow" data-bs-toggle="dropdown" title="User">
						<div class="d-flex pt-1">
							<div class="text-end me-10">
								<p class="pt-5 fs-14 mb-0 fw-700 text-primary"><sec:authentication property="principal.empVO.empName"/> </p>
								<small class="fs-10 mb-0 text-uppercase text-mute"><sec:authentication property="principal.empVO.empNo"/></small>
							</div>
							<img id="empImg" src="<sec:authentication property="principal.empVO.empWt"/>" class="avatar rounded-10 bg-primary-light h-40 w-40" alt="" />
						</div>
					</a>
					<ul class="dropdown-menu animated flipInX">
					  <li class="user-body">
					 	<a class="dropdown-item" href="/emp/logout" style="color:white;">
					 		<i class="ti-user text-muted me-2"></i> 로그아웃</a>
					 	<a class="dropdown-item" href="/emp/mypage" style="color:white;">
					 		<i class=" ti-home text-muted me-2"></i> 마이 페이지</a>
						<button type="button" class="dropdown-item btn" data-bs-toggle="modal" data-bs-target="#modal-center2" style="color:white;">
							<i class="ti-lock text-muted me-2"></i>비밀번호 변경
				  		</button>
						<!-- <button type="button" class="dropdown-item btn" style="color:white;">
							<i class="ti-id-badge text-muted me-2"></i>나의 정보 변경
				  		</button> -->
				  </li>
					</ul>
				</li>	
				<li class="btn-group nav-item d-lg-inline-flex d-none">
					<a href="#" data-provide="fullscreen" class="waves-effect waves-light nav-link full-screen btn-warning-light" title="Full Screen">
						<i class="icon-Position"></i>
					</a>
				</li>
			  <!-- Notifications -->
			  <!-- 톱니바퀴 버튼 -->
<!-- 			  <li class="btn-group nav-item"> -->
<!-- 				  <a href="#" data-toggle="control-sidebar" title="Setting" class="waves-effect full-screen waves-light btn-danger-light"> -->
<!-- 					<i class="icon-Settings1"><span class="path1"></span><span class="path2"></span></i> -->
<!-- 				  </a> -->
<!-- 			  </li> -->
			  <!-- 로그아웃버튼 -->
			 <%--  <li class="btn-group nav-item">
				<c:if test="${login != null}">
					<a href="/emp/logout" class="waves-effect waves-light btn btn-danger" style="width:90px; font-size:1rem; background-color:red;">
						로그아웃
					</a>
				</c:if>
			 </li>
			  <li class="btn-group nav-item">
				<c:if test="${login == null}">
					<a href="/emp/login.do" class="waves-effect waves-light btn btn-success" style="width:90px; font-size:1rem; background-color:green;">
						로그인
					</a>
				</c:if>
			 </li> --%>
			   <!-- 로그아웃버튼 -->
			</ul>
		  </div>
		</nav>
		</sec:authorize>
	  </div>
  </header>
  
  <nav class="main-nav" role="navigation" style="height:70px;">
	  <!-- Mobile menu toggle button (hamburger/x icon) -->
	  <input id="main-menu-state" type="checkbox" />
	  <label class="main-menu-btn" for="main-menu-state">
		<span class="main-menu-btn-icon"></span> Toggle main menu visibility
	  </label>

	  <!-- Sample menu definition -->
	  
	  <ul id="main-menu" class="sm sm-blue" style="bottom:-18px;width:100%">
		<li style="margin-left:97px;"><a id="M1" href="#" style="color:white;padding:10px;height:41px;right:35px;font-weight:bold;padding-left:1px;border-radius:10px !important;"><i class="fa fa-fw fa-stethoscope" style="padding-left:12px;"><span class="path1"></span><span class="path2"></span></i>진료실</a></li>  
		<li style="margin-left:10px;"><a id="M3" href="#"  class="hdComclass" style="color:white;font-weight:bold;"><i class="mdi mdi-account-multiple-plus" ><span class="path1"></span><span class="path2"></span></i>접수</a></li>  
		<li style="margin-left:10px;"><a id="M4" href="#" class="hdComclass" style="color:white;font-weight:bold;"><i class="mdi mdi-email-outline" ><span class="path1"></span><span class="path2"></span><span class="path3"></span></i>SMS</a></li>
		<li style="margin-left:10px;"><a id="M5" href="#" class="hdComclass" style="color:white;font-weight:bold;"><i class="mdi mdi-medical-bag" ><span class="path1"></span><span class="path2"></span></i>발주</a></li>
		<li style="margin-left:10px;"><a id="M6" href="#" class="hdComclass" style="color:white;font-weight:bold;"><i class="mdi mdi-calculator" ><span class="path1"></span><span class="path2"></span></i>수납</a></li>
		<li style="margin-left:10px;"><a id="M7" href="#" class="hdComclass" style="color:white;font-weight:bold;"><i class="mdi mdi-camera-enhance" ><span class="path1"></span><span class="path2"></span></i>검사</a></li>
		<li style="margin-left:10px;"><a id="M8" href="#" class="hdComclass" style="color:white;font-weight:bold;"><i class="mdi mdi-pill"><span class="path1"></span><span class="path2"></span></i>약품관리</a>			</li>
		<li style="margin-left:10px;"><a id="M9" href="#"  class="hdComclass" style="color:white;font-weight:bold;height:41px;"><i class="fa fa-fw fa-medkit"><span class="path1"></span><span class="path2"></span></i>처치</a></li>
		<li style="margin-left:10px;"><a id="M10" href="#" class="hdComclass" style="color:white;font-weight:bold;"><i class="mdi mdi-calendar-check"><span class="path1"></span><span class="path2"></span></i>캘린더</a></li>
		<li style="margin-left:10px;"><a id="M11" href="#"  class="hdComclass" style="color:white;font-weight:bold;"><i class="mdi mdi-clipboard-alert"><span class="path1"></span><span class="path2"></span></i>공지사항</a></li>		  
		<li style="margin-left:10px;"><a id="M12" href="#" class="hdComclass" style="color:white;font-weight:bold;"><i class="mdi mdi-sitemap"><span class="path1"></span><span class="path2"></span></i>조직도</a></li>
		<li style="margin-left:10px;"><a id="M2" href="#"  class="hdComclass" style="color:white;font-weight:bold;"><i class="mdi mdi-account-multiple-plus" ><span class="path1"></span><span class="path2"></span></i>차트</a></li>  
		
		
		<sec:authorize access="hasRole('ROLE_MASTER')">  
		<li><a id="M13" href="#" class="hdComclass" style="color:white;font-weight:bold;"><i class="fa fa-address-book" aria-hidden="true" ><span class="path1"></span><span class="path2"></span></i>관리자</a>
		</li>
		
		
		</sec:authorize>
	  </ul>
	</nav>
<!-- 비밀번호 변경 modal 영역 -->
<div class="modal center-modal fade" id="modal-center2" tabindex="-1" style="display: block;" aria-modal="true" role="dialog">
<div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
			<h4 class="modal-title">비밀번호 변경</h4>
		  </div>
		<sec:authorize access="isAuthenticated()">
		<form class="form" id="subform" action="/emp/newpass" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		  <div class="modal-body">
    		<div class="form-group">
    			<label class="form-label">현재 비밀번호</label>
    			<div class="input-group mb-3">
    				<input type="password" class="form-control" id="empPw" value="">
    				<input type="hidden"class="form-control" id="lg" name="empFrlgYn" value='<sec:authentication property="principal.empVO.empFrlgYn"/>'>
    				<input type="hidden"class="form-control" id="user" name="empNo" value='<sec:authentication property="principal.empVO.empNo"/>'>
    			<input type="hidden"class="form-control" id="pw" value='<sec:authentication property="principal.empVO.empPw"/>'>
    				<span class="input-group-text"><i class="ti-lock"></i></span>
    			</div>
    		</div>
    	 
    		<div class="form-group">
    			<label class="form-label">새 비밀번호</label>
    			<div class="input-group mb-3">
    				<input type="password" name="empPw" class="form-control" id="newpw1" value="">
    				<span class="input-group-text"><i class="ti-lock"></i></span>
    			</div>
    		</div>
    		<div class="form-group">
				<label class="form-label">비밀번호 확인</label>
				<div class="input-group mb-3">
					<input type="password" class="form-control" id="newpw2" value="">
					<span class="input-group-text"><i class="ti-lock"></i></span>
				</div>
			</div>
			</div>
		 </form>
    		<div class="modal-footer modal-footer-uniform" style="display:flex;justify-content:space-between;">
				<button type="submit" form="subform" id="sub" class="btn btn-info float-end">변경</button>
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
		  	</div>
		 </sec:authorize>
		</div>
	  </div>
</div>
<!-- 비밀번호 변경 모달 끝 -->


<script type="text/javascript">
console.log("empImg확인 : "+$("#empImg").attr("src"));
let empImg1 = $("#empImg").attr("src");
if(empImg1 == "/resources/upload/no_img.jpg"){
	$("#empImg").attr("src","/resources/images/logo3.jpg")
}
$(function(){	
    
	$('#main_main').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			$('#loading_bar').hide();
			location.href = "/main/main";
		}, 2000)
	});
	$('#M1').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			$('#loading_bar').hide();
			location.href = "/doctor/view";
		}, 2000)
	});
	$('#M2').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			$('#loading_bar').hide();
			location.href = "/medical/chartMulti";
		}, 2000)
	});
	$('#M3').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			$('#loading_bar').hide();
			location.href = "/medical/mainPage";
		}, 2000)
	});
	$('#M4').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			$('#loading_bar').hide();
			location.href = "/sms/sms";
		}, 2000)
	});
	$('#M5').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			$('#loading_bar').hide();
			location.href = "/medical/drug";
		}, 2000)
	});
	$('#M6').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			$('#loading_bar').hide();
			location.href = "/accept/main";
		}, 2000)
	});
	$('#M7').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			$('#loading_bar').hide();
			location.href = "/exam/main";
		}, 2000)
	});
	$('#M8').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			$('#loading_bar').hide();
			location.href = "/nurse/drug";
		}, 2000)
	});
	$('#M9').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			$('#loading_bar').hide();
			location.href = "/nurse/treat";
		}, 2000)
	});
	$('#M10').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			$('#loading_bar').hide();
			location.href = "/nurse/calendar";
		}, 2000)
	});
	$('#M11').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			$('#loading_bar').hide();
			location.href = "/notice";
		}, 2000)
	});
	$('#M12').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			$('#loading_bar').hide();
			location.href = "/organization/organiTree";
		}, 2000)
	});
	$('#M13').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			$('#loading_bar').hide();
			location.href = "/admin/list";
		}, 2000)
	});
	
	$("#sub").on("click",function(e){
		e.preventDefault();
		let pw = $("#pw").val();
		let empNo = $("#user").val();
		console.log("현재 비밀번호 : " + pw);
		console.log("현재 사번 : " + empNo);
		let emppw = $("#empPw").val();
		let pw1 = $("#newpw1").val();
		let pw2 = $("#newpw2").val();
		if(pw != emppw){
			//alert("현재 비밀번호가 틀렸습니다.");
			 Swal.fire({ //알트
	              icon: 'warning',
	              title: '현재 비밀번호가 틀렸습니다.',
	              showConfirmButton: false,
	              background: '#15243e',
	              timer: 2000,
	          }).then((value) => {
	          	}); //alert끝 
			return false;
		}else if(pw1 == "" || pw2 == ""){
			Swal.fire({ //알트
	              icon: 'warning',
	              title: '비밀번호를 마저 입력하세요.',
	              showConfirmButton: false,
	              background: '#15243e',
	              timer: 2000,
	          }).then((value) => {
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
	          }).then((value) => {
	          	}); //alert끝 
			return false;
		} else {
			
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
	            	console.log("현재 비밀번호 : " + pw);
	        		console.log("현재 사번 : " + empNo);
	            	$('#subform').submit();
	            	setTimeout(()=>{
	        			location.href = "/emp/login";
	        		}, 2000)
		        }
			});
		} 
// 			Swal.fire({ //알트
// 	            icon: 'success',
// 	            title: '비밀번호가 변경되었습니다. 다시 로그인해주세요',
// 	            showConfirmButton: false,
// 	            background: '#15243e',
// 	            timer: 3000,
// 	        }).then((value) => {
// 					setTimeout(()=>{
// 				        location.href='/emp/login';
// 					},3000)
// 	        	}); //alert끝 
// 			//alert("비밀번호가 변경되었습니다. 다시 로그인해주세요");
			
	});
	
	
// 	//현재 경로 가져오기
//     var path = window.location.pathname.substr(0.9);
//     //console.log("경로 : " + path);
//     var target = $('#main-menu li a[href="'+path+'"]');
//     target.addClass('activeMenu');
//     target.css("color","white");
	
	
 	let path = window.location.pathname;

 	if(path == '/doctor/view'){
		$("#M1").addClass("activeMenu");
		$('#M1').css('color','white');
	}else if(path == '/medical/chartMulti'){
		$("#M2").addClass("activeMenu");
		$('#M2').css('color','white');
	}else if(path == '/nurse/calendar'){
		$("#M10").addClass("activeMenu");
		$('#M10').css('color','white');
	}else if(path == '/medical/mainPage'){
		$("#M3").addClass("activeMenu");
		$('#M3').css('color','white');
	}else if(path == '/sms/sms'){
		$("#M4").addClass("activeMenu");
		$('#M4').css('color','white');
	}else if(path == '/medical/drug'){
		$("#M5").addClass("activeMenu");
		$('#M5').css('color','white');
	}else if(path == '/accept/main'){
		$("#M6").addClass("activeMenu");
		$('#M6').css('color','white');
	}else if(path == '/exam/main'){
		$("#M7").addClass("activeMenu");
		$('#M7').css('color','white');
	}else if(path == '/nurse/drug'){
		$("#M8").addClass("activeMenu");
		$('#M8').css('color','white');
	}else if(path == '/nurse/treat'){
		$("#M9").addClass("activeMenu");
		$('#M9').css('color','white');
	}else if(path == '/nurse/calendar'){
		$("#M10").addClass("activeMenu");
		$('#M10').css('color','white');
	}else if(path == '/notice'){
		$("#M11").addClass("activeMenu");
		$('#M11').css('color','white');
	}else if(path == '/organization/organiTree'){
		$("#M12").addClass("activeMenu");
		$('#M12').css('color','white');
	}else if(path == '/admin/list'){
		$("#M13").addClass("activeMenu");
		$('#M13').css('color','white');
	}  
	
});

</script>