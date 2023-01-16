<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="/resources/js/jquery-3.6.0.js"></script>
<script src="/resources/mediTemple/html/assets/vendor_components/dropzone/dropzone.js"></script>
<div style="display:flex;">
	<div class="col-12 col-lg-3" style="margin-right:20px;">
		<div class="box" style="height:41.5vh;">
			<div class="box-header with-border">
				<div style="margin-bottom:10px;">
					<button type="button" id="searchModal" class="waves-effect waves-light btn btn-primary mb-5" data-bs-toggle="modal" data-bs-target="#modal-center" style="float:right;">
						<i class="fa fa-search" aria-hidden="true"></i>&nbsp;&nbsp;환자검색
					</button>
			<!-- 		<button type="button" id="" class="waves-effect waves-light btn mb-5 bg-gradient-primary" data-bs-toggle="modal" data-bs-target="#modal-center" style="float:right;">
						<i class="fa fa-search" aria-hidden="true"></i>&nbsp;&nbsp;환자검색
					</button> -->
				</div>
				<h4 class="box-title text-info mb-0"><i class="ti-user me-15"></i>검사실 대기목록</h4>
			</div>
			<!-- /.box-header -->
			<div class="box-body scrollDiv" style="overflow:auto; overflow-y:scroll;">
				<div class="table-responsive">
					<table class="table table-sm mb-0">
						<tbody>
							<tr>
								<th scope="col">대기번호</th>
<!-- 								<th scope="col">환자번호</th> -->
								<th scope="col">이름</th>
<!-- 								<th scope="col">상태</th> -->
								<th scope="col">검사</th>
							</tr>
						</tbody>
						<tbody id="waiting" >

						</tbody>
					</table>
				</div>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->
		<div class="box" style="height:38vh;">
			<div class="box-header with-border">
				<h4 class="box-title text-info mb-0"><i class="ti-save me-15"></i>검사완료 이력</h4>
			</div>
			<!-- /.box-header -->
			<div class="box-body scrollDiv" style="overflow:auto; overflow-y:scroll;">
				<div class="table-responsive">
					<table class="table table-sm mb-0">
						<tbody>
							<tr>
								<th scope="col">#</th>
								<th scope="col" id="insertDate">검사한날짜</th>
								<th scope="col">검사부위</th>
								<th scope="col">첨부파일</th>
							</tr>
						</tbody>
						<tbody id="examList">

						</tbody>
					</table>
				</div>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->
	</div>
	<div class="col-12 col-lg-5">
		<div class="box" style="height:28vh">
			<div class="box-header with-border">
				<h4 class="box-title text-info mb-0"><i class="ti-user me-15"></i>환자 정보</h4>
			</div>
			<!-- /.box-header -->
			<div class="box-body scrollDiv" style="overflow:auto; overflow-y:scroll;">   
				<div class="table-responsive">
					<table class="table table-sm mb-0">
						<tbody>
							<tr>
								<th scope="col">환자번호</th>
								<th scope="col">성별</th>
								<th scope="col">나이</th>
								<th scope="col">마지막 내원일</th>
								<th scope="col">이름</th>
							</tr>
						</tbody>
						<tbody id="patiInfo">

						</tbody>
					</table>
				</div>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->
		<div class="box" style="height:51.5vh;">
			<div class="box-header with-border">
				<h4 class="box-title text-info mb-0"><i class="fa fa-camera-retro"></i>&nbsp;&nbsp;&nbsp;오더 목록</h4>						
			</div>
			<!-- /.box-header -->
			<div class="box-body scrollDiv" style="height:34vh; overflow:auto; overflow-y:scroll;">
				<div class="table-responsive">
					<table class="table table-sm mb-0">
						<tbody>
							<tr>
								<th scope="col">오더번호</th>
								<th scope="col">질병명</th>
								<th scope="col">오더명</th>
								<th scope="col" style="width:100px;">검사부위</th>
								<th scope="col">기   능</th>
							</tr>
						</tbody>
						<tbody id="examOrder">
<!-- 							<tr> -->
<!-- 								<th scope="row">1</th> -->
<!-- 								<td>Mark</td> -->
<!-- 								<td>Otto</td> -->
<!-- 								<td>@mdo</td> -->
<!-- 							</tr> -->
						</tbody>
					</table>
				</div>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->
	</div>
	 <!-- Basic Forms -->
	<div class="box" style="margin-left:20px; max-height: 814px;"> <!-- max-height 추가함 -->
		<div class="box-header with-border">
			<h4 class="box-title text-info mb-0"><i class="glyphicon glyphicon-film"></i>&nbsp;&nbsp;&nbsp;검사이미지</h4>
		</div>
		<!-- /.box-header -->
		<div class="box-body" style="max-height:500px; min-height:500px;">
			<div class="row">
				<div class="col">
					<form name="frm" id="frm">
						<div class="row">
							<div class="col-12">            <!-- card-images 원래 height:500px 길이 맞추느라 445 로 수정 -->
								<div class="card-body scrollDiv" id="card-images" style="height:510px; overflow:auto; overflow-y:scroll;">
								
								</div>
								<div class="form-group" style="margin-top:20px;">
									<h5>
										검사이미지 첨부<span class="text-danger">*</span>
									</h5>
									<div class="controls">
										<input id="input_imgs" type="file" name="file" 
											class="form-control" multiple="multiple" disabled>
										<div class="help-block"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="text-xs-right">
							<button type="button" id="uploadBtn" class="waves-effect waves-light btn btn-info mb-5" disabled>등록</button>
							<button type="button" id="deleteBtn" class="waves-effect waves-light btn btn-danger mb-5" style="float:right;">취소</button>
							<!-- <button type="button" id="uploadBtn" class="waves-effect waves-light btn mb-5 bg-gradient-success" disabled>등록</button>
							<button type="button" id="deleteBtn" class="waves-effect waves-light btn mb-5 bg-gradient-danger" style="float:right;">비우기</button> -->
						</div>
					</form>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.box-body -->
	</div>
	<!-- /.box -->
</div>
<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">검사 이미지</h4>
<!-- 				<button type="button" class="btn-close" data-bs-dismiss="modal" -->
<!-- 					aria-label="Close"></button> -->
			</div>
			<div id="modalImg" class="modal-body scrollDiv" style="max-height:800px; overflow:auto; overflow-y:scroll;">
			
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal" style="float:right;">닫기</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<div class="modal center-modal fade" id="modal-center" tabindex="-1" style="display:none;" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content">
	  <div class="modal-header">
		<input type="search" id="paSearch" class="form-control form-control-sm" placeholder="이름을 입력해주세요" 
			style="width:30%; margin-right:50px;">
			
			
			<button type="button" id="btnSearch" class="waves-effect waves-light btn btn-primary mb-5" style="right:180px;top:2px;">
				<i class="fa fa-search" aria-hidden="true"></i>&nbsp;&nbsp;검색
			</button>
			
			
	<!-- 	<button type="button" id="btnSearch" class="waves-effect waves-light btn mb-5 bg-gradient-primary" style="right:180px;top:2px;">
				<i class="fa fa-search" aria-hidden="true"></i>&nbsp;&nbsp;검색</button>
			<button type="button" class="btn-close btn btn-rounded btn-danger" data-bs-dismiss="modal" aria-label="Close"></button> -->
	  </div>
	  <div class="modal-body scrollDiv" style="max-height:400px; overflow:auto;">
	  	<div class="table-responsive">
		    <table id="mainTable" class="table editable-table table-bordered mb-0" style="cursor: pointer; text-align:center">
		        <thead>
				    <tr>
				        <th>환자번호</th>
				        <th>주민번호</th>
				        <th>수진자</th>
				        <th>전화번호</th>
				    </tr>
				</thead>
				    <tbody id="paData">
				    
				    </tbody>
		    </table>
		    <input style="position:absolute; top:166.297px; left:490.061px; padding:14px; text-align:start; font:400 14px / 21px &quot;IBM Plex Sans&quot;, sans-serif; border:1px solid rgba(255, 255, 255, 0.12); width:353.562px; height:50px; display:none;" class="">
		</div>
	  </div>
	  <div class="modal-footer modal-footer-uniform">
		<button type="button" class="btn btn-danger" data-bs-dismiss="modal" style="float:right;">닫기</button>
	  </div>
	</div>
  </div>
</div>

<div id="myModalImg" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document" style="width:100%; height:100%; margin:0; padding:0;">
		<div class="modal-content" style="width:100vw; height:100%;">
			<div class="modal-header" style="dispalye:flex; justify-content:space-between;">
				<div>
					<h4 class="modal-title" id="myModalLabel">확대 이미지</h4>
				</div>
				<div style="margin-right: 60px;">
					<h4><a id="imgDownload" href="" download><i class="ti-save me-15"></i></a></h4>
<!-- 					<button style="background-color:white; float:right; margin-right:20px;" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
				</div>
			</div>
			<div id="modal-fill" class="modal-body" style="text-align: center;">
			
			</div>
			<div class="modal-footer modal-footer-uniform">
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal" style="float:right; margin-right:80px;">닫기</button>
			  </div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<script>
var paNo = "";  // 전역변수 선언
var header = "${_csrf.headerName}";
var token  = "${_csrf.token}";

function fn_patientList(){

	$.ajax({
		url : "/exam/patientList",
		contentType : "application/json; charset=utf-8",
		async : false,
		type : "post",
		dataType : "json",
		beforeSend:function(xhr) {
	           xhr.setRequestHeader(header,token);
		},
		success : function(result) {
			console.log(result);
			$("#waiting").empty();
			
			var str = "";
			
			if(result.length == 0) {
				
// 				str += "<tr>"; 
				str += "<td colspan='3' style='text-align:center;'><h3>대기 환자가 없습니다.</h3></td>"; 
// 				str += "</tr>"; 
				
			} else {
				
				for (var i = 0; i < result.length; i++) { 
					str += "<tr>"
					str += "<td scope='row' id='waitingNum'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + (i+1) + "</td>"
					str += "<td style='display:none'>" + result[i].paNo + "</td>"
					str += "<td id='paName'>" + result[i].paName + "</td>"
					str += "<td><button type='button' class='waves-effect waves-light btn mb-5 bg-gradient-success'>" + result[i].paExamState + "</button></td>"
					str += "</tr>";
				}
			}
			$("#waiting").append(str);
		}
	});
}

$(function() {
	
	// 대기환자 목록조회
	fn_patientList();
	
	// 검사 부위를 담을 전역변수 선언
	var examBodpt = "";
	var dp = "";
	var state = "";
	var btn = "";  // 버튼에 보여지는 html값 핸들링 하기 위해 선언
	

	// var paNo = "";
	// var paName = "";
	// var paSex = "";
	// var paReg = "";
	
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
	
	// 환자검색 버튼 누를때마다 목록 초기화
	$(document).on("click", "#searchModal", function() {
		$("#paData").empty();
		$("#paSearch").val("");
	});
	
	$("#btnSearch").on("click", function(){
		$("#uploadBtn").attr("disabled", true);
		$("#input_imgs").attr("disabled", true);
		
		$("#patiInfo").empty();
		$("#examOrder").empty();
		$("#examList").empty();
		$("#paData").empty();
		
		var paName = $("#paSearch").val();
		
		var data = {"paName" : paName};
		
		$.ajax({
			url : "/exam/paSearch",
			contentType : "application/json; charset=utf-8",
			async : false,
			data : JSON.stringify(data),
			type : "post",
			dataType : "json",
			beforeSend:function(xhr) {
		           xhr.setRequestHeader(header,token);
			},
			success : function(result) {
				
				var str = "";
				
				if(result.length == 0) {
					
// 					str += "<tr>"; 
					str += "<td colspan='4' style='text-align:center;'><h3>검색 결과가 없습니다.</h3></td>"; 
// 					str += "</tr>"; 
					
				} else {
					
					for (var i = 0; i < result.length; i++) { 
						var dt = new Date(result[i].paFiviDt);
						var dtYY = dt.getFullYear();
						var dtMM = leadingZeros(dt.getMonth() + 1, 2);
						var dtDD = leadingZeros(dt.getDate(), 2);
						var dtResult = dtYY + "-" + dtMM + "-" + dtDD;
						
						str += "<tr>";
						str += "<td>" + result[i].paNo + "</td>";
						str += "<td>" + result[i].paReg + "</td>";
						str += "<td>" + result[i].paName + "</td>";
						str += "<td>" + result[i].paPh + "</td>";
						str += "<td style='display:none;'>" + result[i].paSex + "</td>";
						str += "<td style='display:none;'>" + result[i].paState + "</td>";
						str += "<td style='display:none;'>" + dtResult + "</td>";
						str += "</tr>";
					}
				}
				$("#paData").append(str);
				
			}
		});
	});
	$(document).on("click", "#paData tr", function() {
		$("#uploadBtn").attr("disabled", true);
		$("#input_imgs").attr("disabled", true);
		
		$("#patiInfo").empty();
		$("#examOrder").empty();
		$("#examList").empty();
		
		paNo = $(this).children().eq(0).text();
		
		var data = {"paNo" : paNo};
		
		$.ajax({
			url : "/exam/patiInfo",
			contentType : "application/json; charset=utf-8",
			async : false,
			data : JSON.stringify(data),
			type : "post",
			dataType : "json",
			beforeSend:function(xhr) {
		           xhr.setRequestHeader(header,token);
			},
			success : function(result) {
				// 	alert("result : " + JSON.stringify(result.paNo));
				// 	var aa = ${"#patiInfo tr"}.children().eq(0).text();
				var dt = new Date(result.paFiviDt);
				var dtYY = dt.getFullYear();
				var dtMM = leadingZeros(dt.getMonth() + 1, 2);
				var dtDD = leadingZeros(dt.getDate(), 2);
				var dtResult = dtYY + "-" + dtMM + "-" + dtDD;
					
				var paNo = result.paNo;
				var paName = result.paName;
				var paSex = result.paSex;
				var paReg = fn_getAge(result.paReg);

				var str = "";

				str += "<tr>"
				str += "<th scope='col'>" + paNo + "</th>"
				str += "<td scope='col'>" + paSex + "</td>"
				str += "<td scope='col'>" + paReg + "</td>"
				str += "<td scope='col'>" + dtResult + "</td>"
				str += "<td scope='col'>" + paName + "</td>"
				str += "</tr>"

				$("#patiInfo").append(str);
			}
		});

		$.ajax({
			url : "/exam/order",
			contentType : "application/json; charset=utf-8",
			async : false,
			data : JSON.stringify(data),
			type : "post",
			dataType : "json",
			beforeSend:function(xhr) {
		           xhr.setRequestHeader(header,token);
			},
			success : function(result) {
				console.log("olCd result : " + result[0].toVO.olCd);
				consoel.log("++++++++ " + reuslt[0].toExamArea);	
				
				var str = "";
				var count = 1;
				for (var i = 0; i < result.length; i++) { 
					str += "<tr>"
					str += "<td>" + result[i].toVO.olCd + "</td>"
					str += "<td>" + result[i].olDisKo + "</td>"
					str += "<td>" + result[i].olActEng + "</td>"
					str += "<td style='display:none;'>" + result[i].olActFee + "</td>"
					str += "<td>" + result[i].toVO.toExamArea + "</td>"
					str += "<td id='radioBtn'>"
					str += "<input class='radio' id='radio_" + count + "' name='rdoOlCd' type='radio' value='" + result[i].toVO.olCd + "'data-toOrNo='" + result[i].toVO.toOrNo + "'data-olActEng='" + result[i].olActEng + "' data-olActFee='" + result[i].olActFee + " 'checked' />";
					str += "<label for='radio_" + count + "'></label></td>";
					str += "</tr>"
					count++;
				}
				$("#examOrder").append(str);
				
				$("#uploadBtn").attr("disabled", false);
				$("#input_imgs").attr("disabled", false);
			}
		});

		$.ajax({
			url : "/exam/examList",
			contentType : "application/json; charset=utf-8",
			async : false,
			data : JSON.stringify(data),
			type : "post",
			dataType : "json",
			beforeSend:function(xhr) {
		           xhr.setRequestHeader(header,token);
			},
			success : function(result) {
				console.log("result : " + result[0].examCd);

				var str = "";
				var count = 1;
				
				if(result.length == 0) {
					
// 					str += "<tr>"; 
					str += "<td colspan='4' style='text-align:center;'><h3>검사 결과가 없습니다.</h3></td>"; 
// 					str += "</tr>"; 
					
				} else {
					
					for (var i = 0; i < result.length; i++) {
						var dt = new Date(result[i].examDt);
						var dtYY = dt.getFullYear();
						var dtMM = leadingZeros(dt.getMonth() + 1, 2);
						var dtDD = leadingZeros(dt.getDate(), 2);
						var dtResult = dtYY + "-" + dtMM + "-" + dtDD;
	
						str += "<tr>"
						str += "<th scope='row'>" + count + "</th>"
						str += "<td>" + dtResult + "</td>"
						str += "<td>" + result[i].examBodpt + "</td>"
						str += "<td id='fileModal'><span data-bs-toggle='modal' data-bs-target='#myModal' style='margin-left:15px; margin-top:10px; width:30px; height:30px;' class='glyphicon glyphicon-film'></span></td>"
						str += "<td id='examCd' style='display:none';>" + result[i].examCd + "</td>"
						str += "</tr>"
						count++;
					}
				}
				$("#examList").append(str);
			}
		});
	});
	
	$(document).on("click", "#waiting tr td button", function() {		
		
		$("#uploadBtn").attr("disabled", true);
		$("#input_imgs").attr("disabled", true);
		
		$("#patiInfo").empty();
		$("#examOrder").empty();
		$("#examList").empty();
		
		var tdArr = new Array();

		btn = $(this);
		var td = btn.parent().parent().children();

		td.each(function(i) {
			tdArr.push(td.eq(i).text());
		});

		state = btn.text();

		var No = td.eq(0).text();
		var paNo = td.eq(1).text();
		var paName = td.eq(2).text();
		// console.log("No : " + No + "paName : " + paName + "paNo : " + paNo);
		
		if (state == '검사시작') {
			
			var data = {"paNo" : paNo};
			dp = $(this)
	
			$.ajax({
				url : "/exam/patiInfo",
				contentType : "application/json; charset=utf-8",
				async : false,
				data : JSON.stringify(data),
				type : "post",
				dataType : "json",
				beforeSend:function(xhr) {
			           xhr.setRequestHeader(header,token);
				},
				success : function(result) {
					// 	alert("result : " + JSON.stringify(result.paNo));
					// 	var aa = ${"#patiInfo tr"}.children().eq(0).text();
					var dt = new Date(result.paFiviDt);
					var dtYY = dt.getFullYear();
					var dtMM = leadingZeros(dt.getMonth() + 1, 2);
					var dtDD = leadingZeros(dt.getDate(), 2);
					var dtResult = dtYY + "-" + dtMM + "-" + dtDD;
						
					var paNo = result.paNo;
					var paName = result.paName;
					var paSex = result.paSex;
					var paReg = fn_getAge(result.paReg);
				
					var str = "";
	
					str += "<tr>"
					str += "<th scope='col'>" + paNo + "</th>"
					str += "<td scope='col'>" + paSex + "</td>"
					str += "<td scope='col'>" + paReg + "</td>"
					str += "<td scope='col'>" + dtResult + "</td>"
					str += "<td scope='col'>" + paName + "</td>"
					str += "</tr>"
	
					$("#patiInfo").append(str);
				}
			});
	
			$.ajax({
				url : "/exam/order",
				contentType : "application/json; charset=utf-8",
				async : false,
				data : JSON.stringify(data),
				type : "post",
				dataType : "json",
				beforeSend:function(xhr) {
			           xhr.setRequestHeader(header,token);
				},
				success : function(result) {
					console.log("resultButton : " + result[0].toVO.olCd);
					
					var str = "";
					var count = 1;
					
					if(result.length == 0) {
						
// 						str += "<tr>"; 
						str += "<td colspan='5' style='text-align:center;'><h3>오더가 없습니다.</h3></td>"; 
// 						str += "</tr>"; 
						
					} else {
						
						for (var i = 0; i < result.length; i++) { 
							str += "<tr>"
							str += "<td>" + result[i].toVO.olCd + "</td>"
							str += "<td>" + result[i].olDisKo + "</td>"
							str += "<td>" + result[i].olActEng + "</td>"
							str += "<td style='display:none;'>" + result[i].olActFee + "</td>"
							str += "<td>" + result[i].toVO.toExamArea + "</td>"
							str += "<td id='radioBtn'>"
							str += "<input class='radio' id='radio_" + count + "' name='rdoOlCd' type='radio' value='" + result[i].toVO.olCd + "'data-toOrNo='" + result[i].toVO.toOrNo + "'data-olActEng='" + result[i].olActEng  + "'data-examBodpt='" + result[i].toVO.toExamArea + "' data-olActFee='" + result[i].olActFee + " 'checked' />";
							str += "<label for='radio_" + count + "'></label></td>";
							str += "</tr>"
							count++;
						}
					}
					$("#examOrder").append(str);
					
					$("#uploadBtn").attr("disabled", false);
					$("#input_imgs").attr("disabled", false);
				}
			});
	
			$.ajax({
				url : "/exam/examList",
				contentType : "application/json; charset=utf-8",
				async : false,
				data : JSON.stringify(data),
				type : "post",
				dataType : "json",
				beforeSend:function(xhr) {
			           xhr.setRequestHeader(header,token);
				},
				success : function(result) {
					
					var str = "";
					var count = 1;
					
					if(result.length == 0) {
						
// 						str += "<tr>"; 
						str += "<td colspan='4' style='text-align:center;'><h3>검사 결과가 없습니다.</h3></td>"; 
// 						str += "</tr>"; 
						
					} else {
						
						for (var i = 0; i < result.length; i++) {
							var dt = new Date(result[i].examDt);
							var dtYY = dt.getFullYear();
							var dtMM = leadingZeros(dt.getMonth() + 1, 2);
							var dtDD = leadingZeros(dt.getDate(), 2);
							var dtResult = dtYY + "-" + dtMM + "-" + dtDD;
		
							str += "<tr>"
							str += "<th scope='row'>" + count + "</th>"
							str += "<td>" + dtResult + "</td>"
							str += "<td>" + result[i].examBodpt + "</td>"
							str += "<td id='fileModal'><span data-bs-toggle='modal' data-bs-target='#myModal' style='margin-left:15px; margin-top:10px; width:30px; height:30px;' class='glyphicon glyphicon-film'></span></td>"
							str += "<td id='examCd' style='display:none';>" + result[i].examCd + "</td>"
							str += "</tr>"
							count++;
						}
					}
					
					$("#examList").append(str);
				} 
			});
			
			$.ajax({
				url : "/exam/stateUpd",
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(data),
				type : "post",
				beforeSend:function(xhr) {
			           xhr.setRequestHeader(header,token);
				},
				success : function(result) {
					
					btn.text("검사중");	
					
					$("#waiting tr td button").attr("disabled", true);
					btn.attr("disabled", false);
				}
			});
			// 대기 환자 목록 reload함수 호출 (버튼 event가 사라져서 일단 보류)
			// fn_patientList();
			
		} else if (state == "검사중") {
			
			btn = $(this);
			var td = btn.parent().parent().children();

			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});

			var paNo = td.eq(1).text();
			var data = {"paNo" : paNo};
			
			$.ajax({ 
				url : "/exam/stateCancle",
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(data),
				type : "post",
				beforeSend:function(xhr) {
			           xhr.setRequestHeader(header,token);
				},
				success : function(result) {
					Swal.fire({
				        icon: "warning",
				        title: "취소  되었습니다.",
				        showConfirmButton: false,
				        background: "#15243e",
				        timer: 5500,
				    }).then((value) => {
				        if(value){
				        	$("#card-images").text("");
				        }
				    });
					btn.text("검사시작");	
					// 대기 환자 목록 reload함수 호출 (버튼 event가 사라져서 일단 보류)
					// fn_patientList();
					$("#waiting tr td button").attr("disabled", false);
				}
			});
		
		} else if (state == "검사완료") {
			Swal.fire({
	            title: "검사를 완료하시겠습니까?",
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
					var data = {"paNo" : paNo};
					
					$.ajax({
						url : "/exam/patiUdp",
						contentType : "application/json; charset=utf-8",
						data : JSON.stringify(data),
						dataType : "json",
						type : "post",
						beforeSend:function(xhr) {
					           xhr.setRequestHeader(header,token);
						},
						success : function() {
							Swal.fire({
						        icon: "success",
						        title: "검사가 완료되었습니다.",
						        showConfirmButton: false,
						        background: "#15243e",
						        timer: 5500,
						    }).then((value) => {
						        if(value){

						        }
						    });
							fn_patientList();
						}
					});
				
				} else {
					fn_patientList();
				}
	        });
		}
	});
	
	$(document).on("click", "#paName", function() {		
		
		$("#uploadBtn").attr("disabled", true);
		$("#input_imgs").attr("disabled", true);
		
		$("#patiInfo").empty();
		$("#examOrder").empty();
		$("#examList").empty();
		
		var tdArr = new Array();

		btn = $(this);
		var td = btn.parent().children();
		console.log(td);

		td.each(function(i) {
			tdArr.push(td.eq(i).text());
		});
		state = td.eq(3).children().text();

		var No = td.eq(0).text();
		var paNo = td.eq(1).text();
		var paName = td.eq(2).text();
		// console.log("No : " + No + "paName : " + paName + "paNo : " + paNo);
		
		if (state == '검사중') {
			
			var data = {"paNo" : paNo};
			dp = $(this)
	
			$.ajax({
				url : "/exam/patiInfo",
				contentType : "application/json; charset=utf-8",
				async : false,
				data : JSON.stringify(data),
				type : "post",
				dataType : "json",
				beforeSend:function(xhr) {
			           xhr.setRequestHeader(header,token);
				},
				success : function(result) {
					// 	alert("result : " + JSON.stringify(result.paNo));
					// 	var aa = ${"#patiInfo tr"}.children().eq(0).text();
					var dt = new Date(result.paFiviDt);
					var dtYY = dt.getFullYear();
					var dtMM = leadingZeros(dt.getMonth() + 1, 2);
					var dtDD = leadingZeros(dt.getDate(), 2);
					var dtResult = dtYY + "-" + dtMM + "-" + dtDD;
						
					var paNo = result.paNo;
					var paName = result.paName;
					var paSex = result.paSex;
					var paReg = fn_getAge(result.paReg);
				
					var str = "";

					str += "<tr>"
					str += "<th scope='col'>" + paNo + "</th>"
					str += "<td scope='col'>" + paSex + "</td>"
					str += "<td scope='col'>" + paReg + "</td>"
					str += "<td scope='col'>" + dtResult + "</td>"
					str += "<td scope='col'>" + paName + "</td>"
					str += "</tr>"
	
					$("#patiInfo").append(str);
				}
			});
	
			$.ajax({
				url : "/exam/order",
				contentType : "application/json; charset=utf-8",
				async : false,
				data : JSON.stringify(data),
				type : "post",
				dataType : "json",
				beforeSend:function(xhr) {
			           xhr.setRequestHeader(header,token);
				},
				success : function(result) {
					console.log("result : " + result[0].toVO.olCd);
					var str = "";
					var count = 1;
					for (var i = 0; i < result.length; i++) { 
						str += "<tr>"
						str += "<td>" + result[i].toVO.olCd + "</td>"
						str += "<td>" + result[i].olDisKo + "</td>"
						str += "<td>" + result[i].olActEng + "</td>"
						str += "<td style='display:none;'>" + result[i].olActFee + "</td>"
						str += "<td>" + result[i].toVO.toExamArea + "</td>"
						str += "<td id='radioBtn'>"
						str += "<input class='radio' id='radio_" + count + "' name='rdoOlCd' type='radio' value='" + result[i].toVO.olCd + "'data-toOrNo='" + result[i].toVO.toOrNo + "'data-olActEng='" + result[i].olActEng + "'data-olActFee='" + result[i].olActFee + "'data-examBodpt='" + result[i].toVO.toExamArea + "'checked' />";
						str += "<label for='radio_" + count + "'></label></td>";
						str += "</tr>"
						count++;
					}
					$("#examOrder").append(str);
					
					$("#uploadBtn").attr("disabled", false);
					$("#input_imgs").attr("disabled", false);
				}
			});
	
			$.ajax({
				url : "/exam/examList",
				contentType : "application/json; charset=utf-8",
				async : false,
				data : JSON.stringify(data),
				type : "post",
				dataType : "json",
				beforeSend:function(xhr) {
			           xhr.setRequestHeader(header,token);
				},
				success : function(result) {
					console.log("result : " + result[0].examCd);
	
					var str = "";
					var count = 1;
					for (var i = 0; i < result.length; i++) {
						var dt = new Date(result[i].examDt);
						var dtYY = dt.getFullYear();
						var dtMM = leadingZeros(dt.getMonth() + 1, 2);
						var dtDD = leadingZeros(dt.getDate(), 2);
						var dtResult = dtYY + "-" + dtMM + "-" + dtDD;
	
						str += "<tr>"
						str += "<th scope='row'>" + count + "</th>"
						str += "<td>" + dtResult + "</td>"
						str += "<td>" + result[i].examBodpt + "</td>"
						str += "<td id='fileModal'><span data-bs-toggle='modal' data-bs-target='#myModal' style='margin-left:15px; margin-top:10px; width:30px; height:30px;' class='glyphicon glyphicon-film'></span></td>"
						str += "<td id='examCd' style='display:none';>" + result[i].examCd + "</td>"
						str += "</tr>"
						count++;
					}
					$("#examList").append(str);
				} 
			});
			
			$.ajax({
				url : "/exam/stateUpd",
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(data),
				type : "post",
				beforeSend:function(xhr) {
			           xhr.setRequestHeader(header,token);
				},
				success : function(result) {
				}
			});
			
			$("#waiting tr td button").attr("disabled", true);
			console.log(btn.parent().children().eq(3).text());
			btn.parent().children().children().attr("disabled", false);
			
		} else if (state == "검사완료") {
			Swal.fire({
	            title: "검사를 완료하시겠습니까?",
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
				
					var data = {"paNo" : paNo};
					
					$.ajax({
						url : "/exam/patiUdp",
						contentType : "application/json; charset=utf-8",
						data : JSON.stringify(data),
						dataType : "json",
						type : "post",
						beforeSend:function(xhr) {
					           xhr.setRequestHeader(header,token);
						},
						success : function() {
							Swal.fire({
						        icon: "success",
						        title: "등록되었습니다.",
						        showConfirmButton: false,
						        background: "#15243e",
						        timer: 5500,
						    }).then((value) => {
						        if(value){
						            
						        }
						    });
							fn_patientList();
						}
					});
			} else {
				fn_patientList();
			}
		});
	}
});

	var sel_file = [];
	$("#input_imgs").on("change", handleImgFileSelect);

	// e : onchange 이벤트 객체
	function handleImgFileSelect(e) {

		// e.target : <input type="flie">
		var files = e.target.files;
		// 이미지 오브젝트 배열
		var fileArr = Array.prototype.slice.call(files);

		// f : 각각의 이미지 파일
		fileArr.forEach(function(f) {
			// 이미지 아니면
			if (!f.type.match("image.*")) {
				Swal.fire({
			        icon: "warning",
			        title: "이미지 확장자만 가능합니다.",
			        showConfirmButton: false,
			        background: "#15243e",
			        timer: 5500,
			    }).then((value) => {
			        if(value){
			        	
			        }
			    });
				// 함수 종료
				return;
			}
			// 이미지를 배열에 넣음
			sel_file.push(f);
			// 이미지를 읽어보자
			var reader = new FileReader();
			// e : 리더가 이미지 읽을 때 이벤트
			reader.onload = function(e) {
				// e.target : 이미지 객체
				var img_html = "<img src=\"" + e.target.result + "\" style='width:420px; height:460px; margin-bottom:70px;' />";
				// 객체.append : 누적, .html : 새로고침, innerHTML : J/S
				$("#card-images").append(img_html);
			}
			// 다음 이미지 파일(f)을 위해 리더를 초기화
			reader.readAsDataURL(f);
		});
	}

	var examCd = "";
	var toOrNo = "";
	var examName = "";
	var examFee = "";

	// 미리보기 사진 지우기
	$("#deleteBtn").on("click", function() {
		$("#card-images").empty();
		$("#input_imgs").val("");
	});
	
	// radio button
	$(document).on("click", "#radioBtn>input:radio[name='rdoOlCd']",
		function() {
			// 		$(this).attr("checked", checked);
			// 		$("input[name='rdoOlCd']").each(function() {
			// 			if($("input:radio[name='rdoOlCd']").is('checked')){
			toOrNo = $(this).data("toorno");
			examName = $(this).data("olacteng");
			examFee = $(this).data("olactfee");
			examBodpt = $(this).data("exambodpt");
			
			console.log("toOrNo : " + toOrNo);
			console.log("examName : " + examName);
			console.log("examFee : " + examFee);
			console.log("examBodpt : " + examBodpt);

			// 			};
			// 		});
		});
	
	// 등록 버튼 클릭
	$("#uploadBtn").on("click", function(e) {

		var str = "";
		var tdArr = new Array();

		var th = $("#patiInfo tr").children("th");
		var td = $("#patiInfo tr").children("td");

		var paNo = th.text();
		// 		var examCd = "";
		// 		var toOrNo = "";
		// 		var examName = "";
		// 		var examFee = "";

		// 	    $("input[name='rdoOlCd']").each(function() {
		// 			if($("input:radio[name='rdoOlCd']").is('checked')){
		// 				toOrNo = $(this).data("toorno");
		// 				examName = $(this).data("olacteng");
		// 				examFee = $(this).data("olactfee");
		// 				console.log("toOrNo : " + toOrNo);
		// 				console.log("examName : " + examName);
		// 				console.log("examFee : " + examFee);

		// 			};
		// 		});

		// 		var pw = prompt("비밀번호를 입력하세요~");	
		//         // alert(pw);

		//         if(pw == "0707"	) {
		//         	alert("인증 되었습니다.");
		// 가상 폼(이미지들을 넣자)
		var formData = new FormData();
		var inputFile = $("input[name='file']");
		// 이미지 파일들을 변수에 담음
		var files = inputFile[0].files;

		console.log("files : " + files);

		// 가상폼인 formdata에 각각의 이미지를 넣자
		for (var i = 0; i < files.length; i++) {
			// uploadFile[]
			formData.append("uploadFile", files[i]);
		}

		// console.log("paNo : " + paNo + ", paReg : " + paReg 
		// 				   + ", paSex :" + paSex + ", paName :" + paName);
		// {examCd},{examFee},SYSDATE,{examName},null,{examBodpt},{toOrNo},{paNo})	
		// 개똥이 => examCd : , examFee : 300, examName : Arthrodesis of hand, examBodpt : 가슴, toOrNo : ORD22002, paNo : 20220002
		console.log("개똥이 => examCd : " + examCd + ", examFee : "
				+ examFee + ", examName : " + examName
				+ ", examBodpt : " + examBodpt + ", toOrNo : "
				+ toOrNo + ", paNo : " + paNo);
		// examCd : 자동생성
		// examFee : 
		formData.append("paNo", paNo);
		// ajax로 받아온 toOrNo, olActName, olActFee
		// examCd는 sql에서 자동 생성, null값
		formData.append("toOrNo", toOrNo);
		formData.append("examCd", examCd);
		formData.append("examName", examName);
		formData.append("examFee", examFee);
		formData.append("examBodpt", examBodpt);

		$.ajax({
			url : "/exam/uploadAjaxAction",
			processData : false,
			contentType : false,
			data : formData,
			dataType : "json",
			type : "post",
			beforeSend:function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(result) {
				console.log("result : " + JSON.stringify(result));
				console.log("result.status : " + result.status);
				
				$("#waiting tr td button").attr("disabled", false);
				
				$("#patiInfo").empty();
				$("#examOrder").empty();
				$("#examList").empty();
				$("#card-images").empty();
				$("#input_imgs").val("");
				$("input:checkbox[name='checkbox']").prop("checked", false);
				// dp.css("display", "none");

				// 대기환자 reload
				fn_patientList();
// 				btn.text("검사완료");	
				Swal.fire({
			        icon: "success",
			        title: "등록 되었습니다.",
			        showConfirmButton: false,
			        background: "#15243e",
			        timer: 5500,
			    }).then((value) => {
			        if(value){
			        	
			        }
			    });
			}
		});
		// 스프링 시큐리티를 위한 토큰 처리(csrf) -> 블토엔 큰 코스로 픽스!
		// 			var header = "${_csrf.headerName}";
		// 			var token = "${_csrf.token}";

		// 			console.log("header : " + header + ", token : " + token);

		// 아작났어유 피씨다타써
		// dataType : 응답 데이터 타입
		// /upload/uploadAjaxAction 참고
		// ATTACH 테이블의 user_no 컬럼의 데이터에는 bookId가 들어가야 함
		// ATTACH 테이블의 seq     컬럼의 데이터는 1부터 1씩 자동증가

		//         } else if(pw == null) {
		//         	alert("취소 되었습니다.");
		//         } else {
		//         	alert("비밀번호가 틀렸네요~");
		//         	location.reload();
		//         } // if문 끝
	});
	// ajax 파일 업로드 끝 //////////////////////
	$(document).on("click", "#fileModal", function() {
		console.log("modal examCd : " + $(this).parent().children('#examCd').html());
		$(this).parent().children('#examDt').html()
		
		var uploadFolder = "/resources/upload";
		
		var examCd = $(this).parent().children('#examCd').html();
		var data = {"examCd" : examCd};
		
		$.ajax({
			url : "/exam/searchImg",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(data),
			dataType : "json",
			type : "post",
			beforeSend:function(xhr) {
		           xhr.setRequestHeader(header,token);
			},
			success : function(result) {
				$(".modal-body").empty();
				
				console.log("result : " + result[0].anyCd);

				for(var i = 0; i < result.length; i++) {
					var str = "";
					str += "<div>"
					str += "<img id='fullModal' data-bs-toggle='modal' data-bs-target='#myModalImg' src=" + uploadFolder + result[i].fileName + " style='width:80%; height:300px; margin-left:30px; margin-bottom:10px;' />"
					str += "</div>"
					str += "<div id='modalCd' style='display:none;'>" + result[i].anyCd + "</div>"

					$("#modalImg").append(str);
				}
			}
		});
	});
	
	$(document).on("click", "#fullModal", function() {
		console.log($(this).attr('src'));
		
		$("#modal-fill").empty();
		
		var imgName = $(this).attr('src');
		var str = "";
		str += "<img style='width:83vw; height:83vh;' src=" + imgName + "/ >" 
		
		$("#modal-fill").append(str);
	});
	
	// 파일 다운로드 함수  ////////////////////
	$("#imgDownload").on("click", function() {

		var filePaName = ""; 
		var fileExamDt = "";
		var filePaNo = "";
		
		var anyCd = $("#modalCd").html();
		
		var data = {"anyCd" : anyCd};
		
		$.ajax({
			url : "/exam/downloadName",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(data),
			dataType : "json",
			type : "post",
			beforeSend:function(xhr) {
		           xhr.setRequestHeader(header,token);
			},
			async: false,
			success : function(result) {
				
				var dt = new Date(result.examDt);
				var dtYY = dt.getFullYear();
				var dtMM = leadingZeros(dt.getMonth() + 1, 2);
				var dtDD = leadingZeros(dt.getDate(), 2);
				var dtResult = dtYY + "-" + dtMM + "-" + dtDD;
				
				fileExamDt = dtResult;
				filePaName = result.patientVO.paName;
				filePaNo = result.patientVO.paNo;
				
				console.log("downloadName1 : " + filePaName);
				console.log("downloadName2 : " + fileExamDt);
				
				var fileName = $("#modal-fill").children().attr("src");
				console.log("fileName : " + fileName);
				
				$("#imgDownload").attr("href", fileName);
				$("#imgDownload").attr("download", "X-ray file(" + filePaNo + ", " + filePaName + ", " + dtResult + ").jpg");
			}
		});
	});
});
</script>
