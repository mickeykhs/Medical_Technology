<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<input type="hidden" id="txtEmpName" value="<sec:authentication property='principal.empVO.empName' />" />
<script>
let header = "${_csrf.headerName}";
let token  = "${_csrf.token}";

//시작일자 변경 시 종료일자 +30분 설정---------------------------------------------------------------------------
function startChange(){
	  var start = $('#start').val();
	  var end  = $('#end').val();
	  if(start.substring(3, 5) == '00')
		  end = start.substring(0, 2) + ':30';
	  else
		  end = (parseInt(start.substring(0, 2))+1) + ':00';
	  
	  $('#end').val(end);
}
//날짜 잘라주는 포멧
function stringFormat(p_val){
	if(p_val < 10)
		return p_val = '0'+p_val;
	else
		return p_val;
  }

//수정 버튼클릭시 모든것 수정가능  + 현작성자 불러오기
function fixInput(){
	$("#dsMemo").attr("readonly",false);
	$("#start").attr("disabled",false);
	$("#end").attr("disabled",false);

	$("#sav").hide(); //저장 숨김
	$("#mClose").hide(); //x버튼 숨김
	$("#fix").hide(); //수정 버튼
	$("#del").hide(); //삭제 버튼

	$("#updt").show(); //수정 저장 버튼
	$("#can").show(); //취소 
	$("#paSer").show(); //환자검색 
	let wr = $("#txtEmpName").val();
	console.log("wr : " + wr);
	$("#writer").val($("#txtEmpName").val()); //등록자 value 바꿔주기
}

//환자 검색시 행 클릭하면 input으로 들어가게 해주는 함수
function paClick(){
	$("#paCont tr").on("click",function(){
		
		var tdArr = new Array();
		
		var tr = $(this);
		$(tr).off('click'); //두번 클릭 방지
		var td = tr.children();
		
		console.log("클릭한 Row의 모든 데이터 : "+tr.text());
		
		
		td.each(function(i){
			tdArr.push(td.eq(i).text());
		});
		
		
		first = td.eq(1).text();
		console.log('first : ' + first);
		console.log("배열에 담긴 값 : "+tdArr);
 		var pnum = td.eq(0).text();
		var pnam = td.eq(1).text();

		$("#pNo").val(pnum);
		$("#pName").val(pnam);
		
		$("#paSearchInfo").modal('hide');

	});
}

		$(function(){
			var request = $.ajax({
				url : "/doc/calendar-admin-update", // 값 불러오기
				method : "GET",
				dataType : "json"
			});
			request.done(function(data){
				console.log(data); // log로 데이터 찍어주기
				var calendarEl = document.getElementById('calendar');
				calendar = new FullCalendar.Calendar(calendarEl,{
					height : '700px',
					slotMinTime : '09:00', // Day 캘린더에서 시작 시간
					slotMaxTime : '19:00',  // Day 캘린더에서 종료 시간
					// 헤더에 표시할 툴바
					headerToolbar :{
						left : 'prev, next today',
						center : 'title',
						right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
					},
					initialView : 'dayGridMonth', // 초기 로드 될 때 보이는 캘린더 화면 (기본 설정 : 달)
					navLinks : true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
					editable : true, // 수정 가능?
					selectable : true, // 달력 일자 드래그 설정 가능
					droppable : true, // 드래그 앤 드롭 
					events : data,
					locale : 'ko', // 한국어 설정
					
			// 드래그로 이벤트 수정하기
			eventDrop : function(info){
				
				Swal.fire({
		            title: '일정을 변경하시겠습니까?',
		            icon: 'question',

		            showCancelButton: true,
		            ConfirmButtonColor: '#3085d6',
		            cancelButtonColor: '#d33',
		            confirmButtonText: '변경',
		            cancelButtonText: '취소',
		            background: '#15243e',

		            reverseButtons: false,

		        }).then(result => {
		            if(result.isConfirmed){
					var events = new Array(); // Json 데이터를 받기 위한 배열 선언
					var obj = new Object();
					console.log("info.event : " + JSON.stringify(info));
					obj.title = info.event._def.title;
					obj.start = info.event._instance.range.start;
					obj.end = info.event._instance.range.end;
					obj.empNo = "<sec:authentication property='principal.empVO.empNo' />";
					
					obj.oldTitle = info.oldEvent._def.title;
					obj.oldStart = info.oldEvent._instance.range.start;
					obj.oldEnd = info.oldEvent._instance.range.end;
					
					events.push(obj);
					
					console.log(events);
				}else{
					location.reload(); // 새로 고침
				}
				$(function modifyData(){
					$.ajax({
						url : "/doc/calendar-admin-update",
						method : "PATCH",
						dataType : "json",
						data : JSON.stringify(events),
						contentType : 'application/json',
						beforeSend:function(xhr){
					           xhr.setRequestHeader(header,token);
						},
					})
				})
		        });
			},
			
			
			eventResize: function(info){
				console.log(info);
				if(confirm("'"+info.event.title+"'을 변경하시겠습니까?'")){
				
				var events = new Array(); // JSON 데이터를 받기 위한 배열
				var obj = new Object();
				
				obj.title = info.event._def.title;
				obj.start = info.event._instance.range.start;
				obj.end = info.event._instance.range.end;
				
				obj.oldTitle = info.oldEvent._def.title;
				obj.oldStart = info.oldEvent._instance.range.start;
				obj.oldEnd = info.oldEvent._instance.range.end;
				
				events.push(obj);
				
				console.log(events);
			   }else{
				 location.reload(); // 새로고침  
			   }
				$(function modifyData(){
					$.ajax({
					url : "/doc/calendar-admin-update",
					method : "PATCH",
					dataType : "json",
					data : JSON.stringify(events),
					contentType : 'application/json',
					beforeSend:function(xhr){
				           xhr.setRequestHeader(header,token);
					},
				})
			  })
			},
			
			
			select: function(arg){ // 캘린더에서 드래그로 이벤트를 생성할 수 있다
					$("#schModal").modal('show'); //모달열기
				
					$('#sav').on('click',function(){
						if($('.insertModal #end').val() <= $('.insertModal #start').val()){
							Swal.fire({ //알트
			                     icon: 'warning',
			                     title: '종료시간을 시작시간보다 크게 선택해주세요',
			                     showConfirmButton: false,
			                     background: '#15243e',
			                     timer: 5500,
			                 }).then((value) => {
			                     if(value){
									$('.insertModal #end').focus();
		 							return;
			                     }
			                 });
	 					}
					
					var title = $("#pNo").val();
					var dsMemo = $("#dsMemo").val();
					var empNo = $("#empNo").val();
					
					//시작시간 포멧조작
				 	const TIME_ZONE = 3240 * 10000;
					const s = arg.start;
					const sdt = new Date(+s + TIME_ZONE).toISOString().split('T')[0];
					var strdate = (sdt + ' ' + $('#start').val()+':00');
					var startdate = new Date(strdate);
					
					//끝시간 포멧조작
				    const f = arg.end-1;			
					const fdt = new Date(+ f + TIME_ZONE).toISOString().split('T')[0];
					var ftrdate = (fdt + ' ' + $('#end').val()+':00');
					var finishdate = new Date(ftrdate);
					
					var start = startdate;
					var end = finishdate;
					
					if(title){
				    	calendar.addEvent({
				    		title : title,
				    		dsMemo : dsMemo,
				    		start : start,
				    		end : end,
				    		empNo : empNo,
				    		allDay : arg.allDay
				    	})
				    }else{
				    	//console.log("여기다"); 
				    	location.reload(); // 새로고침  
				    	 return;
				    }
					
					 var events = new Array(); // Json 데이터를 받기 위한 배열 선언
					    var obj = new Object(); // Json을 담기 위해 Object 선언
					    
					    obj.title = title;
					    obj.dsMemo = dsMemo; //증상 =====
					    obj.start = start; // 시작
					    obj.end = end; // 끝
					    obj.empNo = empNo;
					    events.push(obj);
					    
					    var jsondata = JSON.stringify(events);
					    console.log("jsondata : " + jsondata);
					    
					    $(function saveData(jsonData){
					    	$.ajax({
					    		url : "/doc/calendar-admin-update",
					    		method : "POST",
					    		dataType : "json",
					    		data : JSON.stringify(events),
					    		contentType : 'application/json',
					    		beforeSend:function(xhr){
					 	           xhr.setRequestHeader(header,token);
					 			},
					    	})
					    	calendar.unselect();
					    	location.reload(); // 새로고침  
					    }); 
					
				});
				
			},
			
// 			이벤트 선택
			eventClick : function(info){
				
				if(info.event.title != null){
					$("#schModal").modal('show'); //모달열기
					$("#sav").hide(); //저장 숨김
					$("#can").hide(); //취소 숨김
					$("#paSer").hide(); //환자검색 숨김
					$("#mClose").show(); //x버튼 보이게
					$("#fix").show(); //수정 버튼
					$("#del").show(); //삭제 버튼
					//console.log("확인 : " + JSON.stringify(info.event));
					
					$("#pName").val(info.event.extendedProps.paName);
					$("#pNo").val(info.event.extendedProps.paNo);
					$("#dsMemo").val(info.event.extendedProps.dsMemo);
					$('#start').val(stringFormat(info.event.start.getHours())+':'+stringFormat(info.event.start.getMinutes()));
					$('#end').val(stringFormat(info.event.end.getHours())+':'+stringFormat(info.event.end.getMinutes()));
					$("#writer").val(info.event.extendedProps.empName);
					//모달 읽게만 수정 모든것 불가
					$("#dsMemo").attr("readonly",true);
					$("#start").attr("disabled",true);
					$("#end").attr("disabled",true);
					
					
					//삭제 버튼
					$("#del").on("click",function(){
		 				Swal.fire({
				            title: '일정을 삭제하시겠습니까?',
				            icon: 'question',
		
				            showCancelButton: true,
				            ConfirmButtonColor: '#3085d6',
				            cancelButtonColor: '#d33',
				            confirmButtonText: '삭제',
				            cancelButtonText: '취소',
				            background: '#15243e',
		
				            reverseButtons: false,
		
				        }).then(result => {
				            if(result.isConfirmed){
				            	info.event.remove();
				            	console.log(info.event);
								var events = new Array(); // JSON 데이터를 받기 위한 배열 선언
								var obj = new Object();
								    obj.title = info.event._def.title;
								    obj.start = info.event._instance.range.start;
								    events.push(obj);
								    
							    console.log(events);
							    $(function deleteData(){
							    	$.ajax({
							    		url : "/doc/calendar-admin-update",
							    		method : "DELETE",
							    		dataType : "json",
							    		data : JSON.stringify(events),
							    		contentType : 'application/json;charset=utf-8',
							    		beforeSend:function(xhr){
							 	           xhr.setRequestHeader(header,token);
							 			},
							    	})
							    })
				            }
				        });
						
						 
					});
					
					//수정
					$("#fix").on("click",function(){
						fixInput(); //수정가능하게 해주는 value
					});
					
					//수정완료 버튼 클릭
					$("#updt").on("click",function(){
						console.log("확인 : " + JSON.stringify(info.event));
						//////////////////
						if($('.insertModal #end').val() <= $('.insertModal #start').val()){
							Swal.fire({ //알트
			                     icon: 'warning',
			                     title: '종료시간을 시작시간보다 크게 선택해주세요',
			                     showConfirmButton: false,
			                     background: '#15243e',
			                     timer: 5500,
			                 }).then((value) => {
			                     if(value){
									$('.insertModal #end').focus();
		 							return;
			                     }
			                 });
		 				}
					
						var title = $("#pNo").val();
						var dsMemo = $("#dsMemo").val();
						var empNo = $("#empNo").val();
						
						//시작시간 포멧조작
					 	const TIME_ZONE = 3240 * 10000;
						const s = info.event._instance.range.start;
						console.log("보자보자:" + s);
						const sdt = new Date(+s + TIME_ZONE).toISOString().split('T')[0];
						var strdate = (sdt + ' ' + $('#start').val()+':00');
						var startdate = new Date(strdate);
						
						//끝시간 포멧조작
					    const f =  info.event._instance.range.end;
					    console.log("끝:" + f);
						const fdt = new Date(+ f + TIME_ZONE).toISOString().split('T')[0];
						var ftrdate = (fdt + ' ' + $('#end').val()+':00');
						var finishdate = new Date(ftrdate);
						
						var start = startdate;
						var end = finishdate;
						console.log("보자보자:" + start);
						console.log("끝:" + end);
						
						var events = new Array(); // Json 데이터를 받기 위한 배열 선언
						var obj = new Object();
						console.log("info.event : " + JSON.stringify(info));
						obj.title = title;
						obj.dsMemo = dsMemo; //증상 =====
						obj.start = start;
						obj.end = end;
						obj.empNo = "<sec:authentication property="principal.empVO.empNo" />";
						obj.id = info.event.id;
						
				/* 		obj.oldTitle = info.oldEvent._def.title;
						obj.oldStart = info.oldEvent._instance.range.start;
						obj.oldEnd = info.oldEvent._instance.range.end; */
						
						events.push(obj);
						console.log('obj : ' + obj);
						console.log(events);
						
						
						Swal.fire({
				            title: '일정을 변경하시겠습니까?',
				            icon: 'question',

				            showCancelButton: true,
				            ConfirmButtonColor: '#3085d6',
				            cancelButtonColor: '#d33',
				            confirmButtonText: '변경',
				            cancelButtonText: '취소',
				            background: '#15243e',

				            reverseButtons: false,	    
				        }).then(result => {
				            if(result.isConfirmed){
								
								
								$.ajax({
									url : "/doc/calendarupdate",
									method : "PATCH",
									dataType : "json",
									data : JSON.stringify(events),
									contentType : 'application/json',
									beforeSend:function(xhr){
								           xhr.setRequestHeader(header,token);
									},
								});
								location.reload();
								
							}else{
								location.reload(); // 새로 고침
								return;
							}
			
				    	}); // then.result
						
					}); //수정완료버튼
					
				} //if 끝
			}	//eventclick 끝
		});
		calendar.render();
     });
		
   });
	

		



</script>
<script>
$(function(){
	//환자검색버튼
	$('#btnSearch').on('click', function(){
		
		let str = $('#PaName').val();
		//console.log("이름 :  " + str);
		
		let data = {"paName":str};
		//console.log('data : ' + JSON.stringify(data));
		
		$.ajax({
			url:'/doc/paSer',
			contentType:'application/json;charset=utf-8',
			data:JSON.stringify(data),
			dataType:'json',
			type:'post',
			beforeSend:function(xhr){
		           xhr.setRequestHeader(header,token);
			},
			success:function(result){
				//result : List<PatientVO>
				//console.log('result : ' + JSON.stringify(result));
				patientVOList = result;
				
				//item : PatientVO
				$.each(result,function(index, item){
					//console.log('paName : ' + item.paName);
					let content = "";
					content +="<tr><td tabindex='1'>" + item.paNo + "</a></td>";
					content +="<td tabindex='1'>" + item.paName + "</td>";
					content +="<td tabindex='1'>" + item.paPh + "</td>";
					content +="<td tabindex='1'>" + item.paReg + "</td>";
					content +="</tr>";
					
					$('#paCont').append(content);
				});
				paClick();
			}
		})
	});
	
	$('#can').on('click',function(){
		location.href="/doc/calendar2";
	});
	
	$("#mClose").on("click",function(){
		location.href="/doc/calendar2";
	});

});
</script>
<style>
*{
	margin:0;
	padding:0;
}
#section{
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	background-color: #15243e;
	color: white;
}
div{
	color: white;
}
table{
	vertical-align: top;
	width: 100%;
	overflow: auto;
	overflow-y:scroll;
}
#box1 {
	position: relative;
	margin-bottom: 1.5rem;
	width: 100%;
	border-radius: 10px;
	padding: 0px;
	transition: .5s;
	box-shadow: -7.829px 11.607px 21px 0px rgb(25 42 70 / 0%);
	border: 1px solid #5C607B;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 800px;
}
</style>
<section id="section">
	<div style="position: relative;top:-61px;display:flex;flex-direction:column;width:76%;left:-24px;height:90%">
		<div id="title">
			<h1 style="margin-bottom:30px;">의사 스케줄</h1>
		</div>
		<div id="box1">
			<div id="calendar" style="overflow: hidden; height: 90vh; width:140vh;"></div>
		</div>
		
		<!-- 모오달 -->
			<div class="modal center-modal fade show insertModal modal" id="schModal" tabindex="-1" style="display: none;" aria-modal="true">
			  <div class="modal-dialog">
				<div class="modal-content">
				  <div class="modal-header">
					<h5 class="modal-title">진료예약</h5>
					<!-- 환자 검색 버튼 -->
					
					  <button type="button" id="paSer" class="waves-effect waves-light btn btn-primary mb-5" data-bs-toggle="modal" data-bs-target="#paSearchInfo">
					  	<i class="fa fa-search" aria-hidden="true"></i>&nbsp;&nbsp;환자검색
					  </button>
					  <button type="button" id="mClose" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="display: none;"></button>
				  </div>
				  
				  <div class="modal-body">
					  <div class="form-group row">
						  <label for="example-text-input" class="col-sm-2 col-form-label">환자명:</label>
						  <div class="col-sm-10">
							<input class="form-control" type="text" id="pName" readonly>
						  </div>
					  </div>
					  <div class="form-group row">
						  <label for="example-text-input" class="col-sm-2 col-form-label">환자번호:</label>
						  <div class="col-sm-10">
							<input class="form-control" type="text" id="pNo" name="paNo" readonly>
						  </div>
					  </div>
					  <div class="form-group row">
						  <label for="example-text-input" class="col-sm-2 col-form-label">방문목적:</label>
						  <div class="col-sm-10">
							<input class="form-control" type="text" id="dsMemo">
						  </div>
					  </div>
					  <!-- 시간 선택 -->
					  <div class="form-group row">
						<label for="start" class="col-sm-2 col-form-label">시작시간:</label> 
						<select class="form-control" id="start" onchange="startChange()" style="width: 25%;margin-left: 11px;">
							<option value="09:00">09:00</option>
							<option value="09:30">09:30</option>
							<option value="10:00">10:00</option>
							<option value="10:30">10:30</option>
							<option value="11:00">11:00</option>
							<option value="11:30">11:30</option>
							<option value="12:00">12:00</option>
							<option value="12:30">12:30</option>
							<option value="13:00">13:00</option>
							<option value="13:30">13:30</option>
							<option value="14:00">14:00</option>
							<option value="14:30">14:30</option>
							<option value="15:00">15:00</option>
							<option value="15:30">15:30</option>
							<option value="16:00">16:00</option>
							<option value="16:30">16:30</option>
							<option value="17:00">17:00</option>
							<option value="17:30">17:30</option>
							<option value="18:00">18:00</option>
							<option value="18:30">18:30</option>
						</select> 
						<label for="end" class="col-sm-2 col-form-label" style="margin-left: 48px;">종료시간:</label> 
						<select class="form-control" id="end" style="width: 25%;margin-left: 11px;">
							<option value="09:30">09:30</option>
							<option value="10:00">10:00</option>
							<option value="10:30">10:30</option>
							<option value="11:00">11:00</option>
							<option value="11:30">11:30</option>
							<option value="12:00">12:00</option>
							<option value="12:30">12:30</option>
							<option value="13:00">13:00</option>
							<option value="13:30">13:30</option>
							<option value="14:00">14:00</option>
							<option value="14:30">14:30</option>
							<option value="15:00">15:00</option>
							<option value="15:30">15:30</option>
							<option value="16:00">16:00</option>
							<option value="16:30">16:30</option>
							<option value="17:00">17:00</option>
							<option value="17:30">17:30</option>
							<option value="18:00">18:00</option>
							<option value="18:30">18:30</option>
							<option value="19:00">19:00</option>
						</select>
					</div>
<!-- 					<div class="form-group">
						<label for="allDay" class="col-sm-2 col-form-label">종일 여부:</label> 
						<div class="demo-radio-button">
							<input name="allDay" type="radio" id="yes" checked="">
							<label for="yes" style="position:absolute;left:100px;bottom:130px;">예</label>
							<input name="allDay" type="radio" id="no">
							<label for="no" style="position:absolute;left:300px;bottom:130px;">아니요</label>
						</div>
				  </div> -->
				   <div class="form-group row">
					  <label for="example-text-input" class="col-sm-2 col-form-label">등록자:</label>
					  <div class="col-sm-10">
						<input class="form-control" type="text" id="writer" value="<sec:authentication property="principal.empVO.empName" />"  readonly/>
						<input class="form-control" type="hidden" id="empNo" name="empNo" value="<sec:authentication property="principal.empVO.empNo" />" />
					  </div>
				  </div>
				  
				  
				  
				<!--   "<sec:authentication property="principal.empVO.empNo"/>"; -->
				  
				  <div class="modal-footer modal-footer-uniform" style="display:flex;justify-content:space-between">
					<button type="button" id="sav" class="btn btn-info float-end">저장</button>
					<button type="button" id="updt" class="btn btn-info float-end" style="display: none;">저장</button>
					<button type="button" id="fix" class="btn btn-info float-end" style="display:none;">수정</button>
					<button type="button" id="can" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
					<button type="button" id="del" class="btn btn-danger" data-bs-dismiss="modal" style="display:none;">삭제</button>
				  </div>
				</div>
			  </div>
			</div>
		<!-- 모오달 -->
		
		<!-- 환자 검색 -->
		<div class="modal center-modal fade" id="paSearchInfo" tabindex="-1" style="display: none;" aria-hidden="true">
		  <div class="modal-dialog">
			<div class="modal-content">
			  <div class="modal-header">
				<input type="search" id="PaName" name="PaName" class="form-control form-control-sm" placeholder="이름을 입력해주세요" 
					style="width: 30%;margin-right: 50px;height:40px;" />
					<button type="button" id="btnSearch" class="waves-effect waves-light btn btn-primary mb-5" style="right:180px;top:2px;">
						<i class="fa fa-search" aria-hidden="true"></i>&nbsp;&nbsp;검색</button>
			  </div>
			  <div class="modal-body" style="max-height:400px;overflow:auto;">
			  	<div class="table-responsive">
				    <table id="mainTable" class="table editable-table table-bordered mb-0" style="cursor: pointer;text-align:center">
				        <thead>
						    <tr>
						        <th>환자번호</th>
						        <th>이름</th>
						        <th>전화번호</th>
						        <th>주민번호</th>
						    </tr>
						</thead>
						    <tbody id="paCont">
						    </tbody>
				    </table>
				    <input
				        style="position: absolute; top: 166.297px; left: 490.061px; padding: 14px; text-align: start; font: 400 14px / 21px &quot;IBM Plex Sans&quot;, sans-serif; border: 1px solid rgba(255, 255, 255, 0.12); width: 353.562px; height: 50px; display: none;"
				        class="">
				</div>
			  </div>
			  <div class="modal-footer modal-footer-uniform" style="display: flex;justify-content: flex-end;">
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
			  </div>
			</div>
		  </div>
		</div>
<!-- 환자검색 끝 -->
	</div>
	</div>
</section>	

	
<link href="/resources/fullcalendar/lib/main.css" rel="stylesheet" />
<script src="/resources/fullcalendar/lib/main.js"></script>
<script src="/resources/fullcalendar/lib/locales/ko.js"></script>