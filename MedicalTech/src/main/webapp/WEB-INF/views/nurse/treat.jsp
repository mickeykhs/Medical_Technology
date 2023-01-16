<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<style>
.scrollDiv::-webkit-scrollbar{
   display: none;
}
.wait{
	margin-right:85px;
	max-height: 442px;
	overflow:auto;
	overflow-y:scroll;
	display: flex;
	justify-content: flex-start;
	width: 1140px;
	margin-bottom:59px;
	margin-top: 18px;
}
.active{background-color:#15243e;}
</style>


<div style="display:flex;">
<div style="width: 45%;margin-right:34px;">
<div class="box scrollDiv wait" style="width:110%;height:237px;margin-bottom: 20px;min-height: 379px;margin-top: 0px; min-width: 110%;max-height: 379px;">
	<div class="box-header with-border" style="height: 75px;max-height: 75px;">
		<div style="display: flex;">
			<div style="margin-right: 30px;">
				<button type="button" id="newList" class="waves-effect waves-light btn btn-dark  btn-flat mb-5 active"><h5 style="color: #3596f7;"><i class="ti-user me-15"></i>처치환자목록</h5></button>
			</div>	
			<div>
				<button type="button" id="oldList" class="waves-effect waves-light btn btn-dark  btn-flat mb-5"><h5 style="color: #3596f7;"><i class="fa fa-fw fa-check-square-o"></i>처치완료목록</h5></button>
			</div>
		</div>
	</div>
	<!-- ===============처치 환자 목록=================== -->
		
	<div class="box-body" id="waitingList">
		<div class="table-responsive ">
			<table id="mainTable" class="table editable-table table-bordered mb-0 rcpTable" style="cursor: pointer;text-align:center">
				<thead>
					<tr>
						<th>No</th>
						<th>환자명</th>
						<th>생년월일</th>
						<th>버튼</th>
					</tr>
				</thead>
				<tbody id="trtpaList">
					<c:forEach var="patientVO" items="${waitList}" varStatus="stat">
						<tr>
							<td tabindex="1" scope="row">${stat.count}</td>
							<td tabindex="1"  style="display:none;">${patientVO.paNo}</td>
							<td tabindex="1" id="paName">${patientVO.paName}</td>
							<td tabindex="1">${patientVO.paReg}</td>
							<td tabindex="1"><button type="button" id="startBtn${stat.count}" class="waves-effect waves-light btn mb-5 bg-gradient-success start">처치시작</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		<input style="position: absolute; top: 166.297px; left: 490.061px; padding: 14px; text-align: start; font: 400 14px / 21px &quot;IBM Plex Sans&quot;, sans-serif; border: 1px solid rgba(255, 255, 255, 0.12); width: 353.562px; height: 50px; display: none;" class=""></div>
	</div>
	<!-- =============처치환자 목록 끝-=============== -->
	<!-- =============처치 완료 환자 목록 시작 ===================== -->
	<div class="box-body" id="finishedList" style="display: none;">
		<div class="table-responsive ">
			<table id="mainTable" class="table editable-table table-bordered mb-0 rcpTable" style="cursor: pointer;text-align:center">
				<thead>
					<tr>
						<th>No</th>
						<th>환자명</th>
						<th>생년월일</th>
						<th>처치일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="patientVO" items="${finishList}" varStatus="stat">
						<tr>
							<td tabindex="1" scope="row">${stat.count}</td>
							<td tabindex="1"  style="display:none;">${patientVO.paNo}</td>
							<td tabindex="1" id="paName">${patientVO.paName}</td>
							<td tabindex="1">${patientVO.paReg}</td>
							<td tabindex="1"><fmt:formatDate value="${patientVO.rcpTm}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		<input style="position: absolute; top: 166.297px; left: 490.061px; padding: 14px; text-align: start; font: 400 14px / 21px &quot;IBM Plex Sans&quot;, sans-serif; border: 1px solid rgba(255, 255, 255, 0.12); width: 353.562px; height: 50px; display: none;" class=""></div>
	</div>
	
	<!-- =============처치 완료 환자 목록 시작 ===================== -->
</div>

<!-- =============환자정보 시작 -=============== -->
<div class="box" style="width:110%;min-height: 346px;max-height:346px;min-width: 110%;">
			<div class="box-header with-border">
				<h5 class="box-title text-info mb-0"><i class="ti-user me-15"></i>환자정보</h5>
			</div>
			
			<!-- /.box-header -->
			<div class="box-body">
				<div class="row">
					<div class="col-12">
						<div class="form-group row">
							<label for="example-text-input" class="col-sm-3 col-form-label" style="color:azure;font-weight:bold;">환자번호</label>
							<div class="col-sm-8">
								<input class="form-control" type="text" id="paNo" name="paNo" value="">
							</div>
						</div>
						<div class="form-group row">
							<label for="example-text-input" class="col-sm-3 col-form-label" style="color:azure;font-weight:bold;">이름</label>
							<div class="col-sm-8">
								<input class="form-control" type="text" id="name" name="paName" value="">
							</div>
						</div>
						<div class="form-group row">
							<label for="example-date-input" class="col-sm-3 col-form-label" style="color:azure;font-weight:bold;">주민번호</label>
							<div class="col-sm-8">
								<input class="form-control" type="text" id="paReg" name="paReg" value="">
							</div>
						</div>
						
						<div class="form-group row">
							<label for="example-text-input" class="col-sm-3 col-form-label" style="color:azure;font-weight:bold;">성별</label>
							<div class="col-sm-8">
								<input class="form-control" type="text" id="paSex" name="paSex" value="">
							</div>
						</div>
						<div class="form-group row">
							<label for="example-text-input" class="col-sm-3 col-form-label" style="color:azure;font-weight:bold;">진료내용</label>
							<div class="col-sm-8">
								<input class="form-control" type="text" id="chCont" name="chCont" value="">
							</div>
						</div>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.box-body -->
		</div>
</div>
<!-- =============환자정보 끝	-=============== -->

<div>
<!-- =============처치 오더 목록 시작=============== -->
<div class="box scrollDiv" style="overflow:auto;overflow-y:scroll;width:1065px;max-height:379px;min-height:379px;margin-left: 51px;">
	<div class="box-header with-border" style="display:flex;justify-content:space-between;height:73px;align-items:center;">
		<h5 class="box-title text-info mb-0" style="width:70%;"><i class="mdi mdi-medical-bag"></i>&nbsp;&nbsp;&nbsp;&nbsp;오더상세정보</h5>
	</div>
	<!-- /.box-header -->
	<div class="box-body">
		<div class="table-responsive ">
			<table id="mainTable" class="table editable-table table-bordered mb-0" style="cursor: pointer;text-align:center">
				<thead>
					<tr>
						<th style="width:12%;">구분</th>
						<th style="width: 35%;">약품명</th>
						<th>1회 투여량</th>
						<th>1회 투여 횟수</th>
						<th>사용수량</th>
					</tr>
				</thead>
				<tbody id="odTbb">
				</tbody>
			</table>
		</div>
		<!-- /.row -->
	</div>
	<div class="box-footer" style="display: flex; justify-content: flex-end;">
		<button type="button" id="finish" class="waves-effect waves-light btn mb-5 bg-gradient-success" style="height: 111%;margin-right: 2%;display:none;">처치완료</button> 
	</div>
	<!-- /.box-body -->
</div>
<!-- =============처치 오더 목록 끝 -=============== -->
<!-- =============과거 오더 기록 시작========================== -->
<div class="box scrollDiv" style="overflow:auto;overflow-y:scroll;width:1065px;min-height: 346px;max-height:346px; margin-left: 51px;">
	<div class="box-header with-border" style="display:flex;justify-content:space-between;height:62px;align-items:center;">
		<h5 class="box-title text-info mb-0" style="width:70%;"><i class="mdi mdi-medical-bag"></i>&nbsp;&nbsp;&nbsp;&nbsp;과거 처치 내역</h5>
	</div>
	<!-- /.box-header -->
	<div class="box-body">
		<div class="table-responsive ">
			<table id="mainTable" class="table editable-table table-bordered mb-0" style="cursor: pointer;text-align:center">
				<thead>
					<tr>
						<th style="width:12%;">구분</th>
						<th style="width: 35%;">약품명</th>
						<th>1회 투여량</th>
						<th>1회 투여 횟수</th>
						<th>처치일</th>
					</tr>
				</thead>
				<tbody id="pastTreatList">
				</tbody>
			</table>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.box-body -->
</div>
</div>
<!-- =============과거 오더 기록 끝========================== -->
</div>



<script type="text/javascript">
	
	let header = "${_csrf.headerName}";
	let token  = "${_csrf.token}";
	
	
	function stClick(){
		//처치시작하면 정보다 불러오기
		$(".start").on("click",function(){
			console.log("ddkkdkdkdk");
			$(this).html('처치중');
			$(this).off('click'); //두번 클릭 방지
			var start = $(this);
			//.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = start.parent().parent(); 
			var td = tr.children();	
			var paNo = td.eq(1).text();
			
			//console.log("paName" + paName);
			
			let data = {"paNo":paNo};
			console.log(data);
			//console.log(JSON.stringify(data));
			let count = 0;
			
	 		$.ajax({
				url:"/nurse/paInfo",
				type:'post',
				data:JSON.stringify(data),
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				beforeSend:function(xhr){
			    	xhr.setRequestHeader(header,token);
				},
				success:function(rst){
					console.log('rst : ' + JSON.stringify(rst));
					$("#paNo").val(rst.paNo);
					$("#name").val(rst.paName);
					$("#paReg").val(rst.paReg);
					$("#paSex").val(rst.paSex);
					$("#chCont").val(rst.chCont);
					
					$.ajax({
						url:"/nurse/oderList",
						data: JSON.stringify(data),
						contentType:'application/json;charset=utf-8',
						dataType:'json',
						type:'post',
						beforeSend:function(xhr){
					           xhr.setRequestHeader(header,token);
						},
						success:function(result){
							$.each(result,function(index,item){
									
									let cont="";
									cont += '<tr>';
									cont += "<td>" + item.toGubun + "</td>";
									cont += "<td>" + item.drName +"</td>";
									cont += "<td>" + item.prShot +"</td>";
									cont += "<td><input type='text' class='form-control' id='prCnt"+count+"' + value='" + item.prCnt + "' disabled style='border:none;text-align:center;'></td>";
									cont += "<td><input type='text' class='form-control' name='useQty' style='text-align: center;' id='useQty"+count+"' /></td>";
									cont += "<td style='display:none;'><input type='text' class='form-control' id='drCd" + count + "' value='" + item.toDisCd + "'disabled style='border:none;'></td>";
									cont += "<td style='display:none;'><input type='text' class='form-control' id='dsdQty"+count+"' + value='"  + item.drQty + "'disabled style='border:none;'></td>";
									cont += "<td style='display:none;'><input type='text' class='form-control' value='" + item.paNo + "'disabled style='border:none;'></td>";
									cont += '</tr>';
									count++;
									$('#odTbb').append(cont);
							});
							$("#finish").show();
							
								//한환자에 대한 과거 처치내역 불러오기
								$.ajax({
									url:"/nurse/pastTreatList",
									data: JSON.stringify(data),
									contentType:'application/json;charset=utf-8',
									dataType:'json',
									type:'post',
									beforeSend:function(xhr){
								           xhr.setRequestHeader(header,token);
									},
									success:function(rs){
										$.each(rs,function(index,item){
											let cont="";
											cont += '<tr>';
											cont += "<td>" + item.toGubun + "</td>";
											cont += "<td>" + item.drName +"</td>";
											cont += "<td>" + item.prShot +"</td>";
											cont += "<td>" + item.prCnt + "</td>";
											cont += "<td>" + fn_getInsertDate(item.paFiviDt).substr(0,10) + "</td>";
											cont += '</tr>';
											count++;
											$('#pastTreatList').append(cont);
									});
										
								}
							});
						
						}
					})
				}
			}); 
	 		
	 		
		});
	}
	

$(function(){

	stClick(); //클릭함수
	
	//더블 클릭시 취소 가능하게 
	$( ".start" ).dblclick(function() {
		Swal.fire({
            title: '처치 취소 하시겠습니까?',
            icon: 'question',
            showCancelButton: true,
            ConfirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '승인',
            cancelButtonText: '취소',
            background: '#15243e',
            reverseButtons: false,

        }).then(result => {
            if(result.isConfirmed){ //확인 누르면 다 비워주고 숨기고
            	$(".start").html('처치시작');
            	$("#odTbb").empty();
            	$("#pastTreatList").empty();
            	$("#paNo").val(" ");
            	$("#name").val(" ");
            	$("#paReg").val(" ");
            	$("#paSex").val(" ");
            	$("#chCont").val(" ");
            	$("#finish").hide();
            	stClick(); //다시 클릭함수 호출
            }
        });
	});
	

	
 	//처치완료
	$("#finish").on("click",function(){
		
		let paNo = $("#paNo").val();
		let data = {"paNo":paNo}
		//console.log("데이터 : " + JSON.stringify(data))
		
		let tr = $("#odTbb tr").length;
		console.log(tr);
		var arr = [];
		for(var i=0;i<tr;i++){ //dsdQty
			if($('#prCnt'+ i +'').val() < $('#useQty'+ i +'').val()){
				 Swal.fire({ //알트
                     icon: 'warning',
                     title: '사용 수량을 확인해주세요.',
                     showConfirmButton: false,
                     background: '#15243e',
                     timer: 5500,
                 }).then((value) => {
                     if(value){
                         console.log('gg');
                     }
                 });      
				return;
			}else if($('#useQty'+ i +'').val()==""){
				 Swal.fire({ //알트
                     icon: 'warning',
                     title: '사용 수량을 입력해주세요.',
                     showConfirmButton: false,
                     background: '#15243e',
                     timer: 5500,
                 }).then((value) => {
                     if(value){
                         console.log('gg');
                     }
                 }); 
				 return;
			}else{
			var c = {"drCd":$('#drCd' + i).val(), "dsdQty":$('#dsdQty'+ i +'').val() - $('#useQty'+ i +'').val()};
			arr.push(c);
			}
		}
		console.log("확인 : " + JSON.stringify(arr));
		
		Swal.fire({
            title: '처치완료 하시겠습니까?',
            icon: 'question',

            showCancelButton: true,
            ConfirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '확인',
            cancelButtonText: '취소',
            background: '#15243e',

            reverseButtons: false,

        }).then(result => {
        	 if(result.isConfirmed){
				$.ajax({
					url:'/nurse/useQty',
					data:JSON.stringify(arr),
					contentType:'application/json;charset=utf-8',
					dataType:'json',
					type:'post',
					beforeSend:function(xhr){
				           xhr.setRequestHeader(header,token);
					},
					success:function(result){
						console.log('result : ' + JSON.stringify(result));
						$.ajax({
							url:"/nurse/upState",
							data:JSON.stringify(data),
							contentType:'application/json;charset=utf-8',
							dataType:'json',
							type:'post',
							beforeSend:function(xhr){
						           xhr.setRequestHeader(header,token);
							},
							success:function(rst){
								location.reload();
							}
						});	
					}
				});
        	 }
        });
	}); 
	
 	//처치완료목록 버튼 클릭시
 	$("#oldList").on("click",function(){
 		$("#waitingList").hide();
 		$("#finishedList").show();
 		$(this).addClass("active");
 		$("#newList").removeClass("active");
 	});
 	//처치대기목록 버튼 클릭시
 	$("#newList").on("click",function(){
 		$("#finishedList").hide();
 		$("#waitingList").show();
 		$(this).addClass("active");
 		$("#oldList").removeClass("active");
 	});
 	
});

// 날짜 나오는 함수
function fn_getInsertDate(geta){
	let dt = new Date(geta);
	let dtYY = dt.getFullYear();
	let dtMM = dt.getMonth()+1;
	if(dtMM<10){dtMM = "0" + dtMM;}
	let dtDD = dt.getDate();
	if(dtDD<10){dtDD = "0" + dtDD;}
	let dtHH = dt.getHours();
	let dtMI = dt.getMinutes();
	let dtResult = dtYY + "-" + dtMM + "-" + dtDD + " " + dtHH + ":" + dtMI;
	console.log("insertDate : " + dtResult);
	return dtResult;
}
</script>
