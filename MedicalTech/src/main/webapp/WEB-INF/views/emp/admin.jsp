<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.d-flex{
	padding: 0px;
}
.form-control{
	text-align: right;
}
#tablehd thead th{
	position: sticky;
	top: 0px;
}
</style>
<div class="container-full">
<!--
<div class="content-header">
	<div class="d-flex align-items-center">
		<div class="me-auto">
			<h3 class="page-title"><a href="/main/main">관리자 페이지</a></h3>
			<div class="d-inline-block align-items-center">
				<nav>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/admin/list"><i class="mdi mdi-home-outline"></i></a></li>
					</ol>
				</nav>
			</div>
		</div>
		
	</div>
</div>
 -->
	<section class="content">
		<div class="row">
			<div class="col-lg-6 col-12">
				<!-- <div class="box scrollDiv" style="overflow:auto; overflow-y:scroll; max-height:708px;"> -->
				<div class="box">
				<div class="box-header with-border">
				  <h2 class="box-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><a href="/admin/list">직원 정보</a></font></font></h2>
				  <div class="box-controls pull-right">
					<div class="input-group">
			<!-- 검색부분 ///////////////////////////////////////////////////////////////////////-->
					  <input type="text" class="form-control" name="s" id="search">
					  <button type="button" id="btnSearch" class="waves-effect waves-light btn btn-social-icon btn-primary"><i class="fa fa-search"></i></button>
					</div>
				  </div>
				</div>
				
				<!-- /.box-header -->
				<!-- <div class="box-body no-padding"> -->
				<div class="box-body no-padding scrollDiv" style="overflow:auto;overflow-y:scroll;max-height:626px;">
					<div class="table-responsive">
					  <table class="table table-hover">
						<thead>
						<tr>
						  <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">순번</font></font></th> 
						  <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">사번</font></font></th>
						  <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">직책</font></font></th>
						  <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">이름</font></font></th>
						  <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">주민번호</font></font></th>
						  <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">입사일</font></font></th>
						  <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">승인여부</font></font></th>
						</tr>
						</thead>
						<tbody id="update">
						<c:forEach items="${emplist}" var="emp">
						<tr class="tabtn" id="${emp.empNo}">
						  <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${emp.rnum}</font></font></td>
						  <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${emp.empNo}</font></font></td>
						  <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${emp.jobGubun}</font></font></td>
						  <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${emp.empName}</font></font></td>
						  <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${emp.empReg}</font></font></td>
						  <td><span class="text-muted"><i class="fa fa-clock-o"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${emp.empIn}</font></font></span></td>
						<c:if test="${emp.empEnabled == 'N'}">
						  <td><button type="button" name="${emp.empNo}" id="${emp.empNo}" class="sunju waves-effect waves-circle btn btn-circle btn-danger btn-xs mb-5">${emp.empEnabled}</button></td>
						</c:if>
						<c:if test="${emp.empEnabled == 'Y'}">
						  <td><button type="button" name="${emp.empNo}" id="${emp.empNo}" class="sunju waves-effect waves-circle btn btn-circle btn-info btn-xs mb-5">${emp.empEnabled}</button></td>
						</c:if>
						</tr>
						</c:forEach>
					  </tbody>
					  </table>
					</div>
				</div>
				<!-- /.box-body -->
				 </div>
				 <!-- /.box -->
			</div>
<!-- 직원상세 시작 ---------------------------------------------------------------------------------------------------->
			<div class="col-lg-6 col-12">
				<div class="box box-body px-35 scrollDiv" style="overflow:auto;overflow-y:scroll;max-height:708px;">
			<form action="admin/detail" method="get">
				<div>
					<h4 class="fw-500 text-primary-light bb-2 pb-10 m-0">직원 상세정보</h4>
				</div>
		<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
				<div style="display: flex;">
					<!-- 사진 -->
					<div style="width: 24%;">
						<img class="empimg" style="width: 250px; height: 250px; display: none; border: solid;">
					</div>
					<!-- 이름부터 핸드폰 번호까지 -->
					<div style="width: 30%; padding-left: 16%; flex-grow :1;">
						<div class="d-flex justify-content-between align-items-center mt-10 box-body form-element">
							<p class="m-0  fw-600 text-fade">이름</p>
							<div class="col-4">
								<input type="hidden" class="form-control">
							</div>
							<div style="width:18%;">
								<input type="text" class="form-control rounded-0" id="name" readonly>
							</div>
						</div>
			
						<div class="d-flex justify-content-between align-items-center mt-10 box-body form-element">
								<p class="m-0  fw-600 text-fade">사번</p>
							<div class="col-sm-4">
								<input type="hidden" class="form-control">
							</div>
							<div class="col-sm-2">
								<input type="text" name="jcd" class="form-control" id="jobCd" readonly>
							</div>
						</div>
						<div class="d-flex justify-content-between align-items-center mt-10 box-body form-element"><!-- box-body form-element 네모박스 없에는 class안에 넣어주면 border생김 -->
								<p class="m-0  fw-600 text-fade">직책</p>
							<div class="col-sm-4">
						  		<input type="hidden" class="form-control">
							</div>
							<div class="col-sm-3">
							 	<input type="text" class="form-control" id="Gubun" readonly>
							</div>
					    </div>
						<div class="d-flex justify-content-between align-items-center mt-10 box-body form-element">
								<p class="m-0  fw-600 text-fade">주민번호</p>
							<div class="col-sm-4">
							 	<input type="hidden" class="form-control">
							</div>
							<div class="col-sm-4">
							 	<input type="text" class="form-control" id="reg" readonly>
							</div>						
						</div>
						<div class="d-flex justify-content-between align-items-center mt-10 box-body form-element">
								<p class="m-0  fw-600 text-fade">핸드폰번호</p>
							<div class="col-sm-4">
							 	<input type="hidden" class="form-control">
							</div>
							<div style="width:30%;">
							 	<input type="text" class="form-control rounded-0" id="phon"  oninput="phNumder(this)" maxlength="13" readonly>
							</div>						
						</div>
					</div>
				</div>
		<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
				<div class="d-flex justify-content-between align-items-center mt-10 box-body form-element">
						<p class="m-0  fw-600 text-fade">주소</p>
					<div style="width:60%;">
					 	<input type="text" class="form-control rounded-0" id="add" readonly>
					</div>							
				</div>
				<div class="d-flex justify-content-between align-items-center mt-10 box-body form-element">
						<p class="m-0  fw-600 text-fade">이메일</p>
					<div style="width:35%;">
					 	<input type="text" class="form-control rounded-0" id="mail" readonly>
					</div>							
				</div>
				<div class="d-flex justify-content-between align-items-center mt-10 box-body form-element">
						<p class="m-0  fw-600 text-fade">비밀번호</p>
					<div class="col-sm-4">
					 	<input type="hidden" class="form-control">
					</div>
					<div class="col-sm-3">
					 	<input type="text" class="form-control" id="pass" readonly>
					</div>							
				</div>
				<div class="d-flex justify-content-between align-items-center mt-10 box-body form-element">
						<p class="m-0  fw-600 text-fade">입사일</p>
					<div class="col-sm-4">
					 	<input type="hidden" class="form-control">
					</div>
					<div class="col-sm-3">
					 	<input type="text" class="form-control" id="in" readonly>
					</div>						
				</div>
				<div class="d-flex justify-content-between align-items-center mt-10 box-body form-element">
						<p class="m-0  fw-600 text-fade">퇴사일</p>
					<div class="col-sm-4">
						<input type="hidden" class="form-control">
					</div>
					<div class="col-sm-1">
						<input type="text" class="form-control" id="out" readonly>
					</div>						
				</div>
				<div class="d-flex justify-content-between align-items-center mt-10 box-body form-element">
						<p class="m-0  fw-600 text-fade">승인여부</p>
					<div class="col-sm-4">
						<input type="hidden" class="form-control">
					</div>
					<div class="col-sm-1">
						<input type="text" class="form-control" id="enabled" readonly>
						<input type="hidden" class="form-control" id="auth" readonly>
					</div>						
				</div>
<!-- 직원상세 끝 ----------------------------------------------------------------------------------------------------->
				<div id="spn1" style="float: right">
					<!-- <button type="button" id="en" onclick="$('.send').trigger('click');" class="btn btn-info mt-20 mb-5" disabled>승인</button> -->
					<button type="button" id="en" class="btn btn-info mt-20 mb-5" disabled>승인</button>
				</div>
			</form>
				</div><!-- /.box -->
			</div><!-- /.col -->
		</div><!-- section밑에 <div class="row"> -->
	</section>
</div><!-- title container-full 끝 -->	

<script type="text/javascript">
$(document).ready(function(){
	

let enterKey = document.getElementById("search");
enterKey.addEventListener("keyup", function(event){
	if(event.keyCode === 13){
		event.preventDefault();
		document.getElementById("btnSearch").click();
	}
});

//전화번호 하이픈(-)자동 생성
const phNumder = (target) => {
	target.value = target.value.replace(/[^0-9]/g, '')//숫자 아닌거는 공백으로 바꿔라
   .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3");
}

let header = "${_csrf.headerName}";
let token  = "${_csrf.token}";

/*이메일 통일해서 제대로 보내기*/ 
$("#en").on('click',function(){
	let email = $("#mail").val();
	$.ajax({
		type:"POST",
		url:"/admin/enabledEmail?email=" + email,
		data:JSON.stringify({
			empPw:$("#pass").val(),
			empNo:$("#jobCd").val()
		}),
		contentType:"application/json;charset=utf-8",
		dataType:"json",
		beforeSend:function(xhr){
			xhr.setRequestHeader(header,token);
		},
		success:function(data){
			console.log("승인여부 이메일 보내기" + JSON.stringify(data));
			update();
			Swal.fire({ //알트
	 	         icon: 'success',
	 	         title: '회원가입 승인이 완료 되었습니다.',
	 	         showConfirmButton: false,
	 	         background: '#15243e',
	 	         timer: 2000,
	 	     }).then((value) => {
	 	         if(value){
	 	        	location.href="/admin/list";
	 	         }
	 	     }); //alert끝       
		}
	});
});



$("#btnSearch").on("click",function(){
	$('#update').empty();
	let str = $("#search").val();
	
	let data = {"empName":str, "jobGubun":str}
	//console.log("data값 확인 : " + JSON.stringify(data));

	$.ajax({
		url:"/admin/adminSearch",
		type:"post",
		data:JSON.stringify(data),
		dataType:"json",
		contentType:"application/json;charset=utf-8",
		beforeSend:function(xhr){
			xhr.setRequestHeader(header,token);
		},
		success:function(result){
			console.log("success확인 : " + JSON.stringify(result));

			
			$.each(result,function(index,item){
				console.log("success확인 : " + item.empNo);
				let content = "";
				content += '<tr>';
				content += '<td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">'+ (index + 1) +'</font></font></td>';
				content += '<td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">'+ item.empNo +'</font></font></td>';
				content += '<td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">'+ item.jobGubun +'</font></font></td>';
				content += '<td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">'+ item.empName +'</font></font></td>';
				content += '<td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">'+ item.empReg +'</font></font></td>';
				content += '<td><span class="text-muted"><i class="fa fa-clock-o"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">'+ fn_getInsertDate(item.empIn) +'</font></font></span></td>';
				if(item.empEnabled == 'N'){
					content += '<td><button type="button" name="'+item.empNo+'" id="'+item.empNo+'" class="sunju waves-effect waves-circle btn btn-circle btn-danger btn-xs mb-5">'+ item.empEnabled +'</button></td>';
				}else{
					content += '<td><button type="button" name="'+item.empNo+'" id="'+item.empNo+'" class="sunju waves-effect waves-circle btn btn-circle btn-info btn-xs mb-5">'+ item.empEnabled +'</button></td>';	
				}
				
				content += '</tr>';
				
				$("#update").append(content);
			})
		}
	});
});
$(document).on("click",".sunju",function(event){
	console.log("check",event.currentTarget.id);
	adminDetail(event.currentTarget.id);
	adminImg(event.currentTarget.id);
});
$(".tabtn").on("click",function(){
	//alert("확인");
	$(".empimg").css("display","block");
	console.log("check",event.currentTarget.id);
	adminDetail(event.currentTarget.id);
	adminImg(event.currentTarget.id);
});

//직원 이미지 조회
function adminImg(eNo){
	$.ajax({
		url:"/admin/adminImg",
		type:"post",
		data: JSON.stringify({
			empNo:eNo
		}),
		contentType:"application/json;charset=utf-8",
		dataType:"json",
		beforeSend:function(xhr){
			xhr.setRequestHeader(header,token);
		},
		success:function(result){
			console.log("파일 결과 : " + JSON.stringify(result));
			//console.log("파일 결과 : " + result.fileName);
			let uploadFolder = "/resources/upload";
			let url = result.empWt;
			let noimg = "/resources/upload/no-img.jpg";
			
			if(result.empWt == null){
				$(".empimg").attr("src", noimg);
				alert("확인");
			}
			$(".empimg").attr("src", url);
		}
	});
	
}

//날짜 생성 함수
function fn_getInsertDate(geta){
	  let dt = new Date(geta);
	  let dtYY = dt.getFullYear();
	  let dtMM = dt.getMonth()+1;
	  let dtDD = dt.getDate();
	  let dtResult = dtYY + "-" + (dtMM < 10 ? "0" + dtMM : dtMM) + "-" + (dtDD < 10 ? "0" + dtDD : dtDD);
	   
	  return dtResult;
} 

function adminDetail(pNo) {
	$.ajax({
		url:"/admin/detail",
		type:"post",
		data: JSON.stringify({
			empNo:pNo
		}),
		contentType:"application/json;charset=utf-8",
		dataType:"json",
		beforeSend:function(xhr){
			xhr.setRequestHeader(header,token);
		},
		success:function(data){
			console.log(data);
			var empName = data.empName;
			var jobcd = data.empNo;
			var job = data.jobGubun;
			var empReg = data.empReg;
			var empPh = data.empPh;
			var add1 = data.empAdd1;
			var add2 = data.empAdd2;
			var add3 = data.empExadd;
			var empMail = data.empMail;
			var empPw = data.empPw;
			var empIn = fn_getInsertDate(data.empIn);
			var empOut = data.empOut;
			var empEnabled = data.empEnabled;
			$('#name').val(empName);
			$('#jobCd').val(jobcd);
			$('#Gubun').val(job);
			$('#reg').val(empReg);
			$('#phon').val(empPh);
			if(add3 == null){
				add3 = "";
			}
			if(add1 == null){
				add1 = " ";
			}
			if(add2 == null){
				add2 = " ";
			}
			$('#add').val(add1 + " " + add2 + " " + add3);
			$('#mail').val(empMail);
			$('#pass').val(empPw);
			$('#in').val(empIn);
			$('#enabled').val(empEnabled);
			if(empOut == null){
				$('#out').val("N");
			}else {
				$('#out').val("Y");
			}
			if(empEnabled == "N"){
				$("#en").removeAttr("disabled");
			}else {
				$("#en").attr("disabled",true);
			}
		}
	});
}
//승인여부 N에서 Y로 변경
function update(){
	let empNo=$("#jobCd").val();
	let gubun=$("#Gubun").val();
	let data={"empNo":empNo, "jobGubun":gubun};
	$.ajax({
		type:"POST",
		url:"/admin/update",
		data: JSON.stringify(data),
		contentType:"application/json;charset=utf-8",
		dataType:"json",
		beforeSend:function(xhr){
			xhr.setRequestHeader(header,token);
		},
		success:function(data){
			console.log(data);
			//alert("회원가입 승인이 완료 되었습니다.");
		}
	});
}
});


</script>