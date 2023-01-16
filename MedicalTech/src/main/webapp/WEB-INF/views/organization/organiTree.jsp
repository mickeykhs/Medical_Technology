<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="/resources/js/jquery-3.6.0.js"></script>
<style>
body {
	position: relative;
	text-aglin:center;
	top: 0px;
	height: 0px;
}

#title {
	margin-left:auto; 
    margin-right:auto;
	text-align:center;
}

.space1{
	width: 220px;
}

@keyframes sample-first{
	0% {transform: translate(0, -40px);}
	100% {transform: translate(0, 0);}
}
@-webkit-keyframes sample-first{
	0% {transform: translate(0, -40px);}
	100% {transform: translate(0, 0);}
}

@keyframes sample-second{
	0% {transform: translate(0, -100px);}
	100% {transform: translate(0, 0);}
}
@-webkit-keyframes sample-second{
	0% {transform: translate(0, -100px);}
	100% {transform: translate(0, 0);}
}

@keyframes sample-third{
	0% {transform: translate(0, -160px);}
	100% {transform: translate(0, 0);}
}
@-webkit-keyframes sample-third{
	0% {transform: translate(0, -160px);}
	100% {transform: translate(0, 0);}
}

@keyframes sample-fourth{ 
 	0% { transform: translate(0, -240px);} 
	100% {transform: translate(0, 0);} 
} 
@-webkit-keyframes sample-fourth{ 
 	0% { transform: translate(0, -240px);} 
	100% {transform: translate(0, 0);} 
} 

@keyframes sample-fifth{ 
 	0% {transform: translate(0, -320px);} 
	100% {transform: translate(0, 0);} 
} 
@-webkit-keyframes sample-fifth{ 
 	0% {transform: translate(0, -320px);} 
	100% {transform: translate(0, 0);} 
} 

div[name=doc1], div[name=nur1], div[name=adm1], div[name=rad1] { 
 	animation: sample-first 5s forwards; 
}
div[name=doc2], div[name=nur2], div[name=adm2], div[name=rad2] {
	animation: sample-second 5s forwards;
}
div[name=doc3], div[name=nur3], div[name=adm3], div[name=rad3] {
	animation: sample-third 5s forwards;
}
div[name=doc4], div[name=nur4], div[name=adm4], div[name=rad4] {
	animation: sample-fourth 5s forwards;
}
div[name=doc5], div[name=nur5], div[name=adm5], div[name=rad5] {
	animation: sample-fifth 5s forwards;
}

</style>
<div class="container">
	<div id="title" class="col-md-3 col-12">
		<div class="box box-solid bg-info">
			<div class="box-header">
				<h4 class="box-title">
					<strong>Medical Technology</strong> </br> 
					<strong>조직도</strong>
				</h4>
			</div>
		</div>
	</div>
	<div class="job" style="display:flex; justify-content:space-between; padding-top:20px;">
		<div class="col-md-2 col-12">
			<div class="box box-solid bg-info">
				<div class="box-header" style="text-align:center;">
					<h4 class="box-title">
						<strong>Doctor</strong>
					</h4>
				</div>
			</div>
		</div>
		<div class="col-md-2 col-12">
			<div class="box box-solid bg-info">
				<div class="box-header" style="text-align:center;">
					<h4 class="box-title">
						<strong>Nurse</strong>
					</h4>
				</div>
			</div>
		</div>
		<div class="col-md-2 col-12">
			<div class="box box-solid bg-info">
				<div class="box-header" style="text-align:center;">
					<h4 class="box-title">
						<strong>Admininstration</strong>
					</h4>
				</div>
			</div>
		</div>
		<div class="col-md-2 col-12">
			<div class="box box-solid bg-info">
				<div class="box-header" style="text-align:center;">
					<h4 class="box-title">
						<strong>Radiology</strong>
					</h4>
				</div>
			</div>
		</div>
	</div>
	<div id="emp" style="display:flex; justify-content:space-between;">
			<div class="doc box scrollDiv" style="width:218px; max-height:516px; overflow:auto; overflow-y:scroll; border:none; background-color:#15243E;">
				<div class="col-lg-2">
					<c:forEach items="${empVOList}" var="empVO" varStatus="status">
						<c:if test="${empVO.jobGubun eq '의사'}">
						<c:set var="i" value="${i+1}" />
							<div class="box space1" name="doc${i}">
								<div class="box-body ribbon-box docc" name="modal" data-bs-toggle='modal' data-bs-target='#modal-default' style="display:flex;">
									<div class="ribbon-two ribbon-two-info"><span>${empVO.jobGubun}</span></div>
									<div>
										<p class="mb-0" style="text-align:left; margin-left:22px;">${empVO.empName}</p>
										<p class="mb-0" style="text-align:left; margin-left:22px;">${empVO.empPh}</p>
										<div style="display:none;">${empVO.empNo}</div>
									</div>
									<div>
										<img src="${empVO.empWt}" style="width:38px; height:38px; margin-left:8px; border-radius:10%"  />
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<div class="nur box scrollDiv" style="width:218px; max-height:516px; overflow:auto; overflow-y:scroll; border:none; background-color:#15243E;">
				<div class="col-lg-2">
					<c:forEach items="${empVOList}" var="empVO" varStatus="status">
						<c:if test="${empVO.jobGubun eq '간호사'}">
						<c:set var="j" value="${j+1}" />
							<div class="box space1" name="nur${j}">
								<div class="box-body ribbon-box" name="modal" data-bs-toggle='modal' data-bs-target='#modal-default' style="display:flex;">
									<div class="ribbon-two ribbon-two-info"><span>${empVO.jobGubun}</span></div>
									<div>
										<p class="mb-0" style="text-align:left; margin-left:22px;">${empVO.empName}</p>
										<p class="mb-0" style="text-align:left; margin-left:22px;">${empVO.empPh}</p>
										<div style="display:none;">${empVO.empNo}</div>
									</div>
									<div>
										<img src="${empVO.empWt}" style="width:38px; height:38px; margin-left:8px; border-radius:10%"  />
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<div class="adm box scrollDiv" style="width:218px; max-height:516px; overflow:auto; overflow-y:scroll; border:none; background-color:#15243E;">
				<div class="col-lg-2">
					<c:forEach items="${empVOList}" var="empVO" varStatus="status">
						<c:if test="${empVO.jobGubun eq '원무과'}">
						<c:set var="k" value="${k+1}" />
							<div class="box space1" name="adm${k}">
								<div class="box-body ribbon-box" name="modal" data-bs-toggle='modal' data-bs-target='#modal-default' style="display:flex;">
									<div class="ribbon-two ribbon-two-info"><span>${empVO.jobGubun}</span></div>
									<div>
										<p class="mb-0" style="text-align:left; margin-left:22px;">${empVO.empName}</p>
										<p class="mb-0" style="text-align:left; margin-left:22px;">${empVO.empPh}</p>
										<div style="display:none;">${empVO.empNo}</div>
									</div>
									<div>
										<img src="${empVO.empWt}" style="width:38px; height:38px; margin-left:8px; border-radius:10%"  />
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>	
				</div>
			</div>
			<div class="rad box scrollDiv" style="width:218px; max-height:516px; overflow:auto; overflow-y:scroll; border:none; background-color:#15243E;">
				<div class="col-lg-2">
					<c:forEach items="${empVOList}" var="empVO" varStatus="status">
						<c:if test="${empVO.jobGubun eq '영상의학과'}">
						<c:set var="l" value="${l+1}" />
							<div class="box space1" name="rad${l}">
								<div class="box-body ribbon-box" name="modal" data-bs-toggle='modal' data-bs-target='#modal-default' style="display:flex;">
									<div class="ribbon-two ribbon-two-info"><span>${empVO.jobGubun}</span></div>
									<div>
										<p class="mb-0" style="text-align:left; margin-left:22px;">${empVO.empName}</p>
										<p class="mb-0" style="text-align:left; margin-left:22px;">${empVO.empPh}</p>
										<div style="display:none;">${empVO.empNo}</div>
									</div>
									<div>
										<img src="${empVO.empWt}" style="width:38px; height:38px; margin-left:8px; border-radius:10%"  />
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
	</div>
</div>

<div class="modal fade show" id="modal-default" style="display: none;"
	aria-modal="true" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">직원 정보</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="col-xxxl-12 col-xl-12 ">
					<div class="box bg-lightgray">
						<div class="row">
							<div class="col-xxxl-12 col-xl-6 col-lg-6">
								<div style="display:flex;">
									<div class="card-body px-30">
										<div class="d-flex justify-content-between align-items-center">
											<h3 id="empName" class="card-title fw-600"></h3>
										</div>
										<h5 id="empPh" class="card-text fw-500 fs-16 pb-20 text-primary"></h5>
									</div>
									<div id="picture" class="card-body px-30">
										
									</div>
								</div>
							</div>
							<div class="col-xxxl-12 col-xl-6 col-lg-6">
								<div class="box-body px-35">
									<div>
										<h5 class="fw-500 text-primary-light bb-2 pb-10 m-0">상세정보</h5>
									</div>
									<div class="d-flex justify-content-between align-items-center pb-15 pt-30">
										<p class="m-0  fw-600 text-fade">사번</p>
										<h5 id="empNo" class="m-0  fw-700 text-lightgreen">
										</h5>
									</div>
									<div class="d-flex justify-content-between align-items-center py-15">
										<p class="m-0  fw-600 text-fade">나이</p>
										<h5 id="empAge" class="m-0  fw-700 text-lightgreen"></h5>
									</div>
									<div class="d-flex justify-content-between align-items-center py-15">
										<p class="m-0  fw-600 text-fade">e-mail</p>
										<h5 id="empMail" class="m-0  fw-700 text-lightgreen"></h5>
									</div>
									<div class="d-flex justify-content-between align-items-center py-15">
										<p class="m-0  fw-600 text-fade">직무</p>
										<h5 id="jobGubun" class="m-0  fw-700 text-lightgreen"></h5>
									</div>
									<div class="d-flex justify-content-between align-items-center py-15">
										<p class="m-0  fw-600 text-fade">기본주소</p>
										<h5 id="empAdd1" class="m-0  fw-700 text-lightgreen"></h5>
									</div>
									<div class="d-flex justify-content-between align-items-center py-15">
										<p class="m-0  fw-600 text-fade">상세주소</p>
										<h5 id="empAdd2" class="m-0  fw-700 text-lightgreen"></h5>
									</div>
									<div class="d-flex justify-content-between align-items-center py-15">
										<p class="m-0  fw-600 text-fade">입사일</p>
										<h5 id="empIn" class="m-0  fw-700 text-lightgreen"></h5>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer"
				style="display: flex; justify-content: space-between">
				<div>
					<button id="updateBtn" type="button" class="waves-effect waves-light btn btn-outline btn-secondary mb-5">수정</button>
					<button id="deleteBtn" type="button" class="waves-effect waves-light btn btn-outline btn-danger mb-5">삭제</button>
					<button id="insertBtn" style="display:none;" type="button" class="waves-effect waves-light btn btn-outline btn-secondary mb-5">등록</button>
					<button id="cancelBtn" style="display:none;" type="button" class="waves-effect waves-light btn btn-outline btn-danger mb-5">취소</button>
				</div>				
				<div>
					<button id="closeBtn" type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<script type="text/javascript">
var header = "${_csrf.headerName}";
var token  = "${_csrf.token}";

$(function() {
	
// 	div[name=doc1], div[name=nur1], div[name=adm1], div[name=rad1]
// 	var doc1 = document.querySelectorAll('.docc');
// 	doc1.style.WebkitAnimation = "sample-first 2s";
// 	doc1.style.animation = "sample-first 2s";
	

	var empName = "";
	var empPh = "";
	var empNo = "";
	var empIn = "";
	var empMail = "";
	var empAge = "";
	var jobGubun = "";
	var empAdd1 = "";
	var empAdd2 = "";

	$("div[name=modal]").on("click", function() {
		// 직원 이미지 사진 비우기
		$("#picture").empty();
		
		console.log($(this).children().children().eq(1).text());
		console.log($(this).children().children().eq(2).text());
		console.log($(this).children().children().eq(3).html());
		empName = $(this).children().children().eq(1).text();
		empPh = $(this).children().children().eq(2).text();
		empNo = $(this).children().children().eq(3).html();
// 		$("#empName").html(empName);
// 		$("#empPh").html(empPh);
		
		var data = {"empNo" : empNo};
		
		$.ajax({
			url : "/organization/detail",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(data),
			dataType : "json",
			type : "post",
			beforeSend:function(xhr) {
		           xhr.setRequestHeader(header,token);
			},
			success : function(result) {
				empNo = result.empNo;
				empPh = result.empPh;
				empName = result.empName;
				empIn = result.empIn;
				empMail = result.empMail;
				empAge = fn_getAge(result.empReg);
				jobGubun = result.jobGubun;
				empAdd1 = result.empAdd1;
				empAdd2 = result.empAdd2;
				// 입사일 날짜로 변환
				var dt = new Date(result.empIn);
				var dtYY = dt.getFullYear();
				var dtMM = dt.getMonth() + 1;
				var dtDD = leadingZeros(dt.getDate(), 2);
				var dtResult = dtYY + "-" + dtMM + "-" + dtDD;
				
				$("#empNo").html(empNo);
				$("#empPh").html(empPh);
				$("#empName").html(empName);
				$("#empIn").html(dtResult);
				$("#empMail").html(empMail);
				$("#empAge").html(empAge);
				$("#jobGubun").html(jobGubun);
				$("#empAdd1").html(empAdd1);
				$("#empAdd2").html(empAdd2);
			}
		});
		
		// 상세페이지 직원 이미지 조회
		$.ajax({
			url : "/organization/empImg",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(data),
			dataType : "json",
			type : "post",
			beforeSend:function(xhr) {
		           xhr.setRequestHeader(header,token);
			},
			success : function(result) {
				console.log(result.empWt);
				
				var str = "";
				
				str += "<div>"
				str += "<img src=" + result.empWt + " style='width:80%; height:150px; margin-left:30px; margin-bottom:10px; border-radius: 70%;' />"
				str += "</div>"
				
				$("#picture").append(str);
			}
			
		});
	});

	function fn_getAge(geta){
		let current = 122;
		let pa = geta.substr(0,2);
		
		if(geta.substr(0,1) == 0){
			pa = "1" + pa;
		}
		
		let age = (current-pa) + 1;
		
		return age;
	}
	
	function leadingZeros(n, digits) {
		var zero = '';
		n = n.toString();
	
		if (n.length < digits) {
			for (var i = 0; i < digits - n.length; i++)
				zero += '0';
		}
		return zero + n;
	}
	
	$("#updateBtn").on("click", function() {
		$("#updateBtn").css("display", "none");
		$("#deleteBtn").css("display", "none");
		$("#insertBtn").css("display", "inline");
		$("#cancelBtn").css("display", "inline");
		$("#empName").attr("contenteditable", true);
		$("#empPh").attr("contenteditable", true);
		$("#empMail").attr("contenteditable", true);
		$("#empAdd1").attr("contenteditable", true);
		$("#empAdd2").attr("contenteditable", true);
		$("#empName").css("border", "1px solid #D6D6D6");
		$("#empName").css("border-radius", "4px");
		$("#empPh").css("border", "1px solid #D6D6D6");
		$("#empPh").css("border-radius", "4px");
		$("#empMail").css("border", "1px solid #D6D6D6");
		$("#empMail").css("border-radius", "4px");
		$("#empAdd1").css("border", "1px solid #D6D6D6");
		$("#empAdd1").css("border-radius", "4px");
		$("#empAdd2").css("border", "1px solid #D6D6D6");
		$("#empAdd1").css("border-radius", "4px");
	})
	
	$("#cancelBtn").on("click", function() {
		$("#updateBtn").css("display", "inline");
		$("#deleteBtn").css("display", "inline");
		$("#insertBtn").css("display", "none");
		$("#cancelBtn").css("display", "none");
		$("#empName").attr("contenteditable", false);
		$("#empPh").attr("contenteditable", false);
		$("#empMail").attr("contenteditable", false);
		$("#empAdd1").attr("contenteditable", false);
		$("#empAdd2").attr("contenteditable", false);
		$("#empName").html(empName);
		$("#empPh").html(empPh);
		$("#empMail").html(empMail);
		$("#empAdd1").html(empAdd1);
		$("#empAdd2").html(empAdd2);
		$("#empName").css("border", "0px");
		$("#empPh").css("border", "0px");
		$("#empMail").css("border", "0px");
		$("#empAdd1").css("border", "0px");
		$("#empAdd2").css("border", "0px");
	});
	
	$("#insertBtn").on("click", function() {
		empNo = $("#empNo").html();
		empName = $("#empName").html();
		empPh = $("#empPh").html();
		empMail = $("#empMail").html();
		empAdd1 = $("#empAdd1").html();
		empAdd2 = $("#empAdd2").html();
	
		var data = {"empNo" : empNo, "empName" : empName, "empPh" : empPh, "empMail" : empMail, "empAdd1" : empAdd1, "empAdd2" : empAdd2};
		
		Swal.fire({
            title: "수정하시겠습니까?",
            icon: "question",

            showCancelButton: true,
            ConfirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "등록",
            cancelButtonText: "취소",
            background: "#15243e",

            reverseButtons: false,

        }).then(result => {
            if(result.isConfirmed) {
				$.ajax({
					url : "/organization/updatePost",
					contentType : "application/json; charset=utf-8",
					data : JSON.stringify(data),
					type : "post",
					beforeSend:function(xhr) {
				           xhr.setRequestHeader(header,token);
					},
					success : function(result) {
						Swal.fire({
					        icon: "success",
					        title: "수정이 완료되었습니다.",
					        showConfirmButton: false,
					        background: "#15243e",
					        timer: 5500,
					    }).then((value) => {
					        if(value){

					        }
					    });
						location.href = "/organization/organiTree";
					}
				});
			} else {
				Swal.fire({
			        icon: "warning",
			        title: "취소되었습니다.",
			        showConfirmButton: false,
			        background: "#15243e",
			        timer: 5500,
			    }).then((value) => {
			        if(value){

			        }
			    });	
			}
		});
	});
	
	$("#deleteBtn").on("click", function() {
		var data = {"empNo" : empNo};
		Swal.fire({
            title: "삭제 하시겠습니까?",
            icon: "question",

            showCancelButton: true,
            ConfirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "등록",
            cancelButtonText: "취소",
            background: "#15243e",

            reverseButtons: false,

        }).then(result => {
            if(result.isConfirmed) {
				$.ajax({
					url : "/organization/deletePost",
					contentType : "application/json; charset=utf-8",
					data : JSON.stringify(data),
					type : "post",
					beforeSend:function(xhr) {
				           xhr.setRequestHeader(header,token);
					},
					success : function(result) {
						Swal.fire({
					        icon: "success",
					        title: "삭제가 완료되었습니다.",
					        showConfirmButton: false,
					        background: "#15243e",
					        timer: 5500,
					    }).then((value) => {
					        if(value){
							
					        }
					    });
						location.href = "/organization/organiTree";
					}
				});
			} else {
				Swal.fire({
			        icon: "warning",
			        title: "취소되었습니다.",
			        showConfirmButton: false,
			        background: "#15243e",
			        timer: 5500,
			    }).then((value) => {
			        if(value){

			        }
			    });	
			}	
		});
	});
	
	$("#closeBtn").on("click", function() {
		$("#updateBtn").css("display", "inline");
		$("#deleteBtn").css("display", "inline");
		$("#insertBtn").css("display", "none");
		$("#cancelBtn").css("display", "none");
		$("#empName").attr("contenteditable", false);
		$("#empPh").attr("contenteditable", false);
		$("#empMail").attr("contenteditable", false);
		$("#empAdd1").attr("contenteditable", false);
		$("#empAdd2").attr("contenteditable", false);
		$("#empName").html(empName);
		$("#empPh").html(empPh);
		$("#empMail").html(empMail);
		$("#empAdd1").html(empAdd1);
		$("#empAdd2").html(empAdd2);
		$("#empName").css("border", "0px");
		$("#empPh").css("border", "0px");
		$("#empMail").css("border", "0px");
		$("#empAdd1").css("border", "0px");
		$("#empAdd2").css("border", "0px");
	})
});	
</script>