<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>\
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
<div class="limiter" style="height:77vh; width:34%; display:flex; justify-content:center;align-items:center;">
<div class="box">
	<div class="box-header with-border" >
	  <h4 class="box-title">비밀번호 변경</h4>
	</div>
	<!-- /.box-header -->
	<form class="form" action="newpass" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<div class="box-body">
			<%-- <div class="form-group">
				<label class="form-label">사번</label>
				<div class="input-group mb-3">
					<input type="text"class="form-control" placeholder="Username"  value="김현석">
					<input type="hidden"class="form-control" value="${pw.empPw}">
					<span class="input-group-text"><i class="ti-user"></i></span>
				</div>
			</div> --%>
			<div class="form-group">
				<label class="form-label">현재 비밀번호</label>
				<div class="input-group mb-3">
					<input type="password" class="form-control" placeholder="Password" id="empPw" value="8888">
					<input type="hidden"class="form-control" id="pw" value="${login.empPw}">
					<input type="hidden"class="form-control" name="empNo" value="${login.empNo}">
					<span class="input-group-text"><i class="ti-lock"></i></span>
				</div>
			</div>
			<div class="form-group">
				<label class="form-label">새 비밀번호</label>
				<div class="input-group mb-3">
					<input type="password" name="empPw" class="form-control" placeholder="Confirm Password" id="newpw1" value="1234">
					<span class="input-group-text"><i class="ti-lock"></i></span>
				</div>
			</div>
			<div class="form-group">
				<label class="form-label">비밀번호 확인</label>
				<div class="input-group mb-3">
					<input type="password" class="form-control" placeholder="Confirm Password" id="newpw2" value="1234">
					<span class="input-group-text"><i class="ti-lock"></i></span>
				</div>
			</div>
		</div>
		<!-- /.box-body -->
		<div class="box-footer text-end">
			<button type="submit" class="btn btn-primary" id="sub">
			  <i class="ti-save-alt"></i> Save
			</button>
		</div>  
	</form>
	 </div>
</div>
<script type="text/javascript">
$(function(){
	$("#sub").on("click",function(){
		let pw = $("#pw").val();
		let emppw = $("#empPw").val();
		let pw1 = $("#newpw1").val();
		let pw2 = $("#newpw2").val();
		if(pw != emppw){
			alert("현재 비밀번호가 틀렸습니다.");
			return false;
		}else if(pw1 != pw2){
			alert("새 비밀번호가 불일치합니다.");
			return false;
		}
		alert("비밀번호가 변경되었습니다. 다시 로그인해주세요");
	});
});



</script>