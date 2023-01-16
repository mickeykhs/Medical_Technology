<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<script>
let header = "${_csrf.headerName}";
let token  = "${_csrf.token}";
function startChange(){
	  var start = $('#start').val();
	  var end  = $('#end').val();
	  if(start.substring(3, 5) == '00')
		  end = start.substring(0, 2) + ':30';
	  else
		  end = (parseInt(start.substring(0, 2))+1) + ':00';
	  
	  $('#end').val(end);
}

		console.log($('.fc-today-button fc-button fc-button-primary').text());
		let str;
		$(function(){
			var request = $.ajax({
				url : "/nurse/calendar/calendar-admin-update", // 값 불러오기
				method : "GET",
				dataType : "json"
			});
			request.done(function(data){
				str = data;
				console.log(data); // log로 데이터 찍어주기
				var calendarEl = document.getElementById('calendar');
				calendar = new FullCalendar.Calendar(calendarEl,{
					height : '700px',
					slotMinTime : '08:00', // Day 캘린더에서 시작 시간
					slotMaxTime : '20:00',  // Day 캘린더에서 종료 시간
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
						
						obj.title = info.event._def.title;
						obj.start = info.event._instance.range.start;
						obj.end = info.event._instance.range.end;
						
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
							url : "/nurse/calendar/calendar-admin-update",
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
					url : "/nurse/calendar/calendar-admin-update",
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
				
				$('#modal-right3').modal('show');
				$('#testt').on('click',function(){
					var title = $('#empNo').val();
					
// 					var dt = new Date();
// 					console.log(dt);
// 					var dtYY = dt.getFullYear();
// 					console.log(dtYY);
// 					var dtMM = dt.getMonth()+1;
// 					if(dtMM<10){dtMM = "0" + dtMM;}
// 					let dtDD = dt.getDate();
// 					if(dtDD<10){dtDD = "0" + dtDD;}
// 					var dtStart = $('#start').val(); // 시작 시간
// 					var dtEnd = $('#end').val(); // 종료 시간
					
					
					
					const TIME_ZONE = 3240 * 10000;
	                const s = arg.start;
	                const sdt = new Date(+s + TIME_ZONE).toISOString().split('T')[0];
	                var strdate = (sdt + ' ' + $('#start').val()+':00');
	                var startdate = new Date(strdate);
	               
	                //끝시간 포멧조작
	                const f = arg.end-1;         
	      /*        console.log( "시작시간보자 "+ s);
	                console.log( "끝시간보자 "+ f); */
	                const fdt = new Date(+ f + TIME_ZONE).toISOString().split('T')[0];
	                var ftrdate = (fdt + ' ' + $('#end').val()+':00');
	                var finishdate = new Date(ftrdate);
	                
// 	                console.log('나와');
// 	                console.log(startdate);
// 	                console.log(finishdate);
		            
		            
					var start = startdate;
					var end = finishdate;
					
// 					var ss =  dtYY + "-" + dtMM + "-" + dtDD;
// 					var start = ss + 'T' + $('#start').val() + ':00';
// 					console.log('start : ' + start);
// 					var ee = dtYY + "-" + dtMM + "-" + dtDD + ':00';
// 					console.log('ee : ' + ee);
// 					var end = ee + 'T' + $('#end').val();
// 					console.log(end);
					
					
					console.log(start);
				    if(title){
				    	calendar.addEvent({
				    		title : title,
				    		start : start,
				    		end : end,
				    		allDay : arg.allDay
				    	})
				    }else{
				    	 location.reload(); // 새로고침  
				    	 return;
				    }
				    
				    var events = new Array(); // Json 데이터를 받기 위한 배열 선언
				    var obj = new Object(); // Json을 담기 위해 Object 선언
				    
				    obj.title = title;
				    obj.start = start; // 시작
				    obj.end = end; // 끝
				    obj.nurComments = $("#comments").val();	//상태 
				    events.push(obj);
				    
				    
				    var jsondata = JSON.stringify(events);
				    console.log("jsondata : " + jsondata);
				    
				    $(function saveData(jsonData){
				    	$.ajax({
				    		url : "/nurse/calendar/calendar-admin-update",
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
			
			// 이벤트 선택해서 삭제하기
			eventClick : function(info){
				
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
		            }
		        });
				
				
				
				console.log(info.event);
				var events = new Array(); // JSON 데이터를 받기 위한 배열 선언
				var obj = new Object();
				    obj.title = info.event._def.title;
				    obj.start = info.event._instance.range.start;
				    events.push(obj);
				    
			    console.log(events);
			    $(function deleteData(){
			    	$.ajax({
			    		url : "/nurse/calendar/calendar-admin-update",
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
		calendar.render();
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
.swal-container {
	z-index:9999;
}
</style>
<section id="section" style="position:absolute;width:100%;">
<sec:authorize access="isAuthenticated()">
	<div style="position: relative;top:45px;display:flex;flex-direction:column;width:76%;left:-24px;height:90%">
		<div id="box1">
			<div id="calendar" style="overflow: hidden; height: 90vh; width:140vh;"></div>
		</div>
	</div>
</sec:authorize>
</section>

<!-- ///////// center modal ///////////// -->



<sec:authorize access="isAuthenticated()">
<div class="modal center-modal fade " id="modal-right3" tabindex="-1" aria-modal="true" role="dialog" style="display: none;">
  <div class="modal-dialog">
	<div class="modal-content">
	  <div class="modal-header">
		<h5 class="modal-title">일정 등록</h5>
		<button type="button" id="patientSr" class="waves-effect waves-light btn btn-primary mb-5" 
			data-bs-toggle="modal" data-bs-target="#modal-cen"  
			style="float:right;border-radius:10px;position:relative;">
			<i class="fa fa-search"></i>직원검색
		</button>
	  </div>
	  <div class="modal-body">
		<div class="form-group row">
			<label for="example-date-input" class="col-sm-5 col-form-label" style="color:azure;font-weight:bold;"></label>
			<div class="col-sm-10" style="display:flex;align-items:center;">
				근무자 : <input class="form-control" type="text" id="empNm" name="empNm" value="<sec:authentication property="principal.empVO.empName"/>"
				style="width:49%;margin-left: 28px;" />
			</div>
		</div>
		<div class="form-group row">
			<label for="example-date-input" class="col-sm-5 col-form-label" style="color:azure;font-weight:bold;"></label>
			<div class="col-sm-10" style="display:flex;align-items:center;margin-bottom:10px;">
				사&nbsp;&nbsp;&nbsp;&nbsp;번 : <input class="form-control" type="text" id="empNo" name="empNo" value="<sec:authentication property="principal.empVO.empNo"/>" 
				style="width:49%;margin-left: 28px;" />
			</div>
		</div>
		<div style="display:inline-block;width:102%;height:48px;">
			<div class="form-group row">
				<div class="col-sm-10" style="display:flex;align-items:center;width:178px;">
					<div style="width:65%;color:azure;font-weight:bold;">시작시간 :</div>
						<label for="start"></label> <select class="form-control"
							id="start" onchange="startChange()" style="margin-left:28px;width:57%;position:relative;left:-14px;">
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
				</div>
			</div>
			<div class="form-group row" style="width:46%;position:relative;top:-47px;left:210px;">
				<div class="col-sm-10" style="display:flex;align-items:center;">
					<div style="width:65%;color:azure;font-weight:bold;">종료시간 :</div> 
						<label for="end"></label> <select class="form-control"
							id="end" style="margin-left:28px;width:57%;position:relative;left:-21px;">
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
			</div>
		</div>
		<div class="btn-group bootstrap-select show-tick" style="width:83%;">
			<select id="comments" name="comments" class="selectpicker" tabindex="-98">
				<option value="null">일정 선택</option>
				<option value="근무">근무</option>
				<option value="휴가">휴가</option>
				<option value="반차">반차</option>
				<option value="병가">병가</option>
				<option value="기타일정">기타일정</option>
			</select>
		</div>
	  </div>
	  <div class="modal-footer modal-footer-uniform" style="display:flex;justify-content:space-between;">
		<button type="button" id="testt" class="btn btn-primary float-end">등록</button>
		<button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
	  </div>
	</div>
  </div>
</div>
<!-- center modal 시작(직원검색)//////////////////// -->
<div class="modal center-modal fade" id="modal-cen" tabindex="-1" style="display: none;" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content">
	  <div class="modal-header">
		<input type="search" id="paSearch" class="form-control form-control-sm" placeholder="이름을 입력해주세요" 
			style="width: 30%;margin-right: 50px;height:40px;" />
		<button type="button" id="btnSearch" class="waves-effect waves-light btn mb-5 bg-gradient-primary" style="right:180px;top:2px;">
			<i class="fa fa-search" aria-hidden="true"></i>&nbsp;&nbsp;검색</button>
	  </div>
	  <div class="modal-body" style="max-height:400px;overflow:auto;">
	  	<div class="table-responsive">
		</div>
	  </div>
	  <div class="modal-footer modal-footer-uniform" style="display:flex;justify-content:flex-end;">
		<button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
	  </div>
	</div>
  </div>
</div>
<!-- center moadl 끝 -->

</sec:authorize>
<link href="/resources/fullcalendar/lib/main.css" rel="stylesheet" />
<script src="/resources/fullcalendar/lib/main.js"></script>
<script src="/resources/fullcalendar/lib/locales/ko.js"></script>
