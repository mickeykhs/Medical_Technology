<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="/resources/js/jquery-3.6.0.js"></script>
<style>
body {
	position: relative;
	top: 0px;
	height: 0px;
}
.test {
	text-align: center;
	font-size: 20px;
	height:7vh;
	width:10vw;	
}
.aa {
	text-align: center;
	font-size: 12px;
	height:5vh;
	width:5vw;
}
</style>

<div id="chart_div"></div>
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
								<div class="card-body px-30">
									<div class="d-flex justify-content-between align-items-center">
										<h3 id="empName" class="card-title fw-600"></h3>
									</div>
									<h5 id="empPh" class="card-text fw-500 fs-16 pb-20 text-primary"></h5>
								</div>
							</div>
							<div class="col-xxxl-12 col-xl-6 col-lg-6">
								<div class="box-body px-35">
									<div>
										<h5 class="fw-500 text-primary-light bb-2 pb-10 m-0">상세정보</h5>
									</div>
									<div
										class="d-flex justify-content-between align-items-center pb-15 pt-30">
										<p class="m-0  fw-600 text-fade">사번</p>
										<h5 id="empNo" class="m-0  fw-700 text-lightgreen">
										</h5>
									</div>
									<div
										class="d-flex justify-content-between align-items-center py-15">
										<p class="m-0  fw-600 text-fade">나이</p>
										<h5 id="empAge" class="m-0  fw-700 text-lightgreen"></h5>
									</div>
									<div
										class="d-flex justify-content-between align-items-center py-15">
										<p class="m-0  fw-600 text-fade">e-mail</p>
										<h5 id="empMail" class="m-0  fw-700 text-lightgreen"></h5>
									</div>
									<div
										class="d-flex justify-content-between align-items-center py-15">
										<p class="m-0  fw-600 text-fade">직무</p>
										<h5 id="jobGubun" class="m-0  fw-700 text-lightgreen"></h5>
									</div>
									<div
										class="d-flex justify-content-between align-items-center py-15">
										<p class="m-0  fw-600 text-fade">기본주소</p>
										<h5 id="empAdd1" class="m-0  fw-700 text-lightgreen"></h5>
									</div>
									<div
										class="d-flex justify-content-between align-items-center py-15">
										<p class="m-0  fw-600 text-fade">상세주소</p>
										<h5 id="empAdd2" class="m-0  fw-700 text-lightgreen"></h5>
									</div>
									<div
										class="d-flex justify-content-between align-items-center py-15">
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
					<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<script type="text/javascript">
$(function() {

	google.load("visualization", "1", {packages:["orgchart"]});
	google.setOnLoadCallback(drawChart);
	var empName = "";
	var empPh = "";
	var empNo = "";
	var empIn = "";
	var empMail = "";
	var empAge = "";
	var jobGubun = "";
	var empAdd1 = "";
	var empAdd2 = "";
	function drawChart() {
	    var data = new google.visualization.DataTable();
	    data.addColumn("string", "Name");
	    data.addColumn("string", "Manager");
	    data.addColumn("string", "ToolTip");
	    data.addRows([
	          [{v:"job", f:"<div class='test'><div>Medical</div><div>Technology</div></div>"}, "", ""],
	          [{v:"의사", f:"<div class='test'><div>Doctor</div><div>의사</div></div>"}, "job", ""],
	          [{v:"간호사", f:"<div class='test'><div>Nurse</div><div>간호사</div></div>"}, "job", ""],
	          [{v:"원무과", f:"<div class='test'><div>Admininstration</div><div>원무과</div></div>"}, "job", ""],
	          [{v:"영상의학과", f:"<div class='test'><div>Radiology</div><div>영상의학과</div></div>"}, "job", ""],
	//           [for(var i = 0; i < empVOList.length; i++) {
	//         	  {v:"empi", f:"<div class="test">${empVOList[i].empName}</br>${empVOList[i].empPh}</div>"}, "${empVOList[i].jobCd}", ""
	//           }],
	          [{v:"emp1", f:"<div id='emp1' class='aa' data-bs-toggle='modal' data-bs-target='#modal-default'><div>${empVOList[0].empName}</div><div>${empVOList[0].empPh}</div><div style='display:none;'>${empVOList[0].empNo}</div></div>"}, "${empVOList[0].jobGubun}", ""],
	          [{v:"emp2", f:"<div id='emp2' class='aa' data-bs-toggle='modal' data-bs-target='#modal-default'><div>${empVOList[1].empName}</div><div>${empVOList[1].empPh}</div><div style='display:none;'>${empVOList[1].empNo}</div></div>"}, "${empVOList[1].jobGubun}", ""],
	          [{v:"emp3", f:"<div id='emp3' class='aa' data-bs-toggle='modal' data-bs-target='#modal-default'><div>${empVOList[2].empName}</div><div>${empVOList[2].empPh}</div><div style='display:none;'>${empVOList[2].empNo}</div></div>"}, "${empVOList[2].jobGubun}", ""],
	          [{v:"emp4", f:"<div id='emp4' class='aa' data-bs-toggle='modal' data-bs-target='#modal-default'><div>${empVOList[3].empName}</div><div>${empVOList[3].empPh}</div><div style='display:none;'>${empVOList[3].empNo}</div></div>"}, "${empVOList[3].jobGubun}", ""],
	          [{v:"emp5", f:"<div id='emp5' class='aa' data-bs-toggle='modal' data-bs-target='#modal-default'><div>${empVOList[4].empName}</div><div>${empVOList[4].empPh}</div><div style='display:none;'>${empVOList[4].empNo}</div></div>"}, "${empVOList[4].jobGubun}", ""],
	          [{v:"emp6", f:"<div id='emp6' class='aa' data-bs-toggle='modal' data-bs-target='#modal-default'><div>${empVOList[5].empName}</div><div>${empVOList[5].empPh}</div><div style='display:none;'>${empVOList[5].empNo}</div></div>"}, "${empVOList[5].jobGubun}", ""],
	          [{v:"emp7", f:"<div id='emp7' class='aa' data-bs-toggle='modal' data-bs-target='#modal-default'><div>${empVOList[6].empName}</div><div>${empVOList[6].empPh}</div><div style='display:none;'>${empVOList[6].empNo}</div></div>"}, "${empVOList[6].jobGubun}", ""],
	          [{v:"emp8", f:"<div id='emp8' class='aa' data-bs-toggle='modal' data-bs-target='#modal-default'><div>${empVOList[7].empName}</div><div>${empVOList[7].empPh}</div><div style='display:none;'>${empVOList[7].empNo}</div></div>"}, "${empVOList[7].jobGubun}", ""],
	          [{v:"emp9", f:"<div id='emp9' class='aa' data-bs-toggle='modal' data-bs-target='#modal-default'><div>${empVOList[8].empName}</div><div>${empVOList[8].empPh}</div><div style='display:none;'>${empVOList[8].empNo}</div></div>"}, "${empVOList[8].jobGubun}", ""]
			]);
			var chart = new google.visualization.OrgChart(document
					.getElementById("chart_div"));
			    chart.draw(data, {
				allowHtml : true
			});
			for (var i = 0; i < data.getNumberOfRows(); i++) {
				chart.collapse(i, true);
			}
	
			google.visualization.events.addListener(chart, "select", function() {
				$(".test").click(function() {
					var selection = chart.getSelection();
					var row = selection[0].row;
					var collapsed = chart.getCollapsedNodes();
					var collapse = (collapsed.indexOf(row) == -1);
					chart.collapse(row, collapse);
					chart.setSelection();
				});
				$(".aa").on("click", function() {
					empName = $(this).children().eq(0).text();
					empPh = $(this).children().eq(1).text();
					empNo = $(this).children().eq(2).text();
	// 				$("#empName").html(empName);
	// 				$("#empPh").html(empPh);
					
					var data = {"empNo" : empNo};
					
					$.ajax({
						url : "/organization/detail",
						contentType : "application/json; charset=utf-8",
						data : JSON.stringify(data),
						dataType : "json",
						type : "post",
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
				});
			});
		}
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
	})
	$("#insertBtn").on("click", function() {
		empNo = $("#empNo").html();
		empName = $("#empName").html();
		empPh = $("#empPh").html();
		empMail = $("#empMail").html();
		empAdd1 = $("#empAdd1").html();
		empAdd2 = $("#empAdd2").html();
	
		var data = {"empNo" : empNo, "empName" : empName, "empPh" : empPh, "empMail" : empMail, "empAdd1" : empAdd1, "empAdd2" : empAdd2};
		
		if(confirm("수정 하시겠습니까?")) {
			$.ajax({
				url : "/organization/updatePost",
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(data),
				type : "post",
				success : function(result) {
					alert("수정 성공!");
					
					location.href = "/organization/organiTree";
				}
			});
		} else {
			alert("취소되었습니다.");		
		}
	});
	
	$("#deleteBtn").on("click", function() {
		var data = {"empNo" : empNo};
		if(confirm("삭제 하시겠습니까?")) {
			$.ajax({
				url : "/organization/deletePost",
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(data),
				type : "post",
				success : function(result) {
					alert("삭제 성공!");
					location.href = "/organization/organiTree";
				}
			});
		} else {
			alert("취소되었습니다.");
		}	
	});
});
</script>
