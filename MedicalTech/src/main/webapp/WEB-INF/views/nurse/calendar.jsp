<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<input type="hidden" id="txtEmpName" value="<sec:authentication property='principal.empVO.empName' />" />
<script>
let header = "${_csrf.headerName}";
let token  = "${_csrf.token}";

//시작일자 변경 시 종료일자 +30분 설정--------------------------------
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
	$("#start").attr("disabled",false);
	$("#end").attr("disabled",false);

	$("#sav").hide(); //저장 숨김
	$("#mClose").hide(); //x버튼 숨김
	$("#fix").hide(); //수정 버튼
	$("#del").hide(); //삭제 버튼

	$("#updt").show(); //수정 저장 버튼
	$("#can").show(); //취소 
	$("#patientSr").show(); //환자검색 
	$("#nurEnnm").val($("#txtEmpName").val()); //등록자 value 바꿔주기
}


//간호사 검색시 행 클릭하면 input으로 들어가게 해주는 함수
function paClick(){
	$("#empCont tr").on("click",function(){
		
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
 		var emNum = td.eq(0).text();
		var emNam = td.eq(1).text();

		$("#empNm").val(emNam);
		$("#empNo").val(emNum);
		
		$("#nurSer").modal('hide');

	});
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
					
					if($('.insertModal #end').val() <= $('.insertModal #start').val()){
						Swal.fire({ //알트
		                     icon: 'warning',
		                     title: '종료시간을 시작시간보다 크게 선택해주세요',
		                     showConfirmButton: false,
		                     background: '#15243e',
		                     timer: 5500,
		                 }).then((value) => {
		                	 if(value){
			                	 return;
								 $('.insertModal #end').focus();
		                	 }
		                 });
					} else if($("#empNo").val()==""){
							Swal.fire({ //알트
			                     icon: 'warning',
			                     title: '근무자 정보를 입력해주세요.',
			                     showConfirmButton: false,
			                     background: '#15243e',
			                     timer: 5500,
			                 }).then((value) => {
			                     if(value){
									$('#empNo').focus();
		 							return;
			                     }
			                 });
					} else if($("#comments").val()=="null"){
						Swal.fire({ //알트
		                     icon: 'warning',
		                     title: '근무구분을 선택해주세요.',
		                     showConfirmButton: false,
		                     background: '#15243e',
		                     timer: 5500,
		                 }).then((value) => {
		                     if(value){
								$('#comments').focus();
	 							return;
		                     }
		                 });
					
					} else {
					var title = $('#empNo').val();
					
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
					var writer = $("#nurEnwt").val();
					var comment = $("#comments").val();	
					var ennm = $("#nurEnnm").val();
					
					console.log(start);
				    if(title){
				    	calendar.addEvent({
				    		title : title,
				    		start : start,
				    		end : end,
				    		nurEnwt : writer,
				    		nurComments : comment,
				    		nurEnnm : ennm,
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
				    obj.nurEnwt = writer; //등록자 사번
				    obj.nurComments = comment;//상태 
				    obj.nurEnnm = ennm; //등록자 이름
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
				}
			});
		       
		},
			
			// 이벤트 선택해서 삭제하기
			eventClick : function(info){
				
				//일정 읽기 시작
				if(info.event.title != null){
					$(".insertModal").modal('show'); //모달열기
					$("#testt").hide(); //저장 숨김
					$("#can").hide(); //닫기 숨김
					$("#patientSr").hide(); //직원검색 숨김 //ㅋㅋ
					$("#mClose").show(); //x버튼 보이게
					$("#fix").show(); //수정 버튼
					$("#del").show(); //삭제 버튼
					console.log("확인 : " + JSON.stringify(info.event));
					
					$("#empNm").val(info.event.extendedProps.empName);
					$("#empNo").val(info.event.extendedProps.empNo);
					$("#comments").val(info.event.extendedProps.comments);
					$('#start').val(stringFormat(info.event.start.getHours())+':'+stringFormat(info.event.start.getMinutes()));
					$('#end').val(stringFormat(info.event.end.getHours())+':'+stringFormat(info.event.end.getMinutes()));
					$("#nurEnnm").val(info.event.extendedProps.nurEnnm);
					$("#nurEnwt").val(info.event.extendedProps.nurEnwt);
					//모달 읽게만 수정 모든것 불가
					
					//드롭박스 짜장남진자
					$("#gubun").val(info.event.extendedProps.comments);
					$("#sel").hide();
					$("#gubunBox").show();
					
 					//$("#comments").attr("disabled","disabled"); 
					$("#sel").attr("readonly",true); 
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
							    		url :  "/nurse/calendar/calendar-admin-update",
							    		method : "DELETE",
							    		dataType : "json",
							    		data : JSON.stringify(events),
							    		contentType : 'application/json;charset=utf-8',
							    		beforeSend:function(xhr){
							 	           xhr.setRequestHeader(header,token);
							 			},
							    	})
							    	location.reload();
							    })
				            }
				        });
						
						 
					});
					
					//수정
					$("#fix").on("click",function(){
						fixInput(); //수정가능하게 해주는 value
						$("#sel").show();
						$("#gubunBox").hide();
						
					});
					
					//수정완료 버튼 클릭
					$("#updt").on("click",function(){
						
						if($('.insertModal #end').val() <= $('.insertModal #start').val()){
							Swal.fire({ //알트
			                     icon: 'warning',
			                     title: '종료시간을 시작시간보다 크게 선택해주세요',
			                     showConfirmButton: false,
			                     background: '#15243e',
			                     timer: 5500,
			                 }).then((value) => {
			                	 if(value){
				                	 return;
									 $('.insertModal #end').focus();
			                	 }
			                 });
						} else if($("#comments").val()=="null"){
								Swal.fire({ //알트
				                     icon: 'warning',
				                     title: '일정을 선택해주세요',
				                     showConfirmButton: false,
				                     background: '#15243e',
				                     timer: 5500,
				                 }).then((value) => {
				                     if(value){
										$('#comments').focus();
			 							return;
				                     }
				                 });
						}else{
							console.log("확인 : " + JSON.stringify(info.event));
							//////////////////		
							var title = $("#empNo").val();
							var memo = $("#comments").val();
							var writerNo = "<sec:authentication property="principal.empVO.empNo" />";
							var writerNm = $("#txtEmpName").val();
							
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
							obj.comments = memo; //증상 =====
							obj.start = start;
							obj.end = end;
							obj.nurEnwt = writerNo;
							obj.nurEnnm = writerNm;
							obj.id = info.event.id;
							
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
										url : "/nurse/calendarupdate",
										method : "PATCH",
										dataType : "json",
										data : JSON.stringify(events),
										contentType : 'application/json',
										beforeSend:function(xhr){
									           xhr.setRequestHeader(header,token);
										},
									});
									location.reload();
									
								}
				
					    	}); // then.result
						}
					}); //수정완료버튼
					
				} else {
					location.reload(); // 새로 고침
					return;
				} //if 끝
				
				
				
				

				
				
				
				
			}	
		});
		calendar.render();
     });
   });
</script>

<script>
$(function(){
	
	$('#doctorCal').on('click',function(){
		location.href = "/doc/calendar";
	});
	$('#nurseCal').on('click',function(){
		location.href = "/nurse/calendar";
	});
	
	
	$('#closeBtn').on('click',function(){
		$('#empCont').empty();
		$('#emSearch').val('');

	});
	//간호사검색버튼
	$('#btnSearch').on('click', function(){
		$('#empCont').empty();
		
		let str = $('#emSearch').val();
		//console.log("이름 :  " + str);
		
		let data = {"empName":str};
		//console.log('data : ' + JSON.stringify(data));
		
		$.ajax({
			url:'/nurse/nurSearch',
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
				nurVOList = result;
				
				//item : PatientVO
				$.each(result,function(index, item){
					//console.log('paName : ' + item.paName);
					let content = "";
					content +="<tr><td tabindex='1'>" + item.empNo + "</a></td>";
					content +="<td tabindex='1'>" + item.empName + "</td>";
					content +="<td tabindex='1'>" + item.empPh + "</td>";
					content +="</tr>";
					
					$('#empCont').append(content);
				});
				paClick();
			}
		})
	});
	
$('#can').on('click',function(){
	location.href="/nurse/calendar";
});

$("#mClose").on("click",function(){
	location.href="/nurse/calendar";
});

$("#noNurse").on("click",function(){
	location.href="/nurse/calendar";
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
	<div style="position: relative;top:-61px;display:flex;flex-direction:column;width:76%;left:-24px;height:90%">
		<div id="box">
			<div class="box-header with-border" style="display: flex;padding:0.8rem;padding-bottom:4px;border-bottom:none;">
				<div style="margin-right: 30px;">
					<button type="button" id="nurseCal" class="waves-effect waves-light btn btn-dark btn-flat mb-5 active" style="background-color:#15243e;">
						<h6 style="color: #3596f7;"><i class="ti-user me-15"></i>간호사 캘린더</h6></button>
				</div>	
				<div>
					<button type="button" id="doctorCal" class="waves-effect waves-light btn btn-dark btn-flat mb-5">
						<h6 style="color: #3596f7;"><i class="ti-user me-15"></i>의사 캘린더</h6></button>
				</div>
			</div>
			<div class="box-body">			
				<div id="calendar" style="overflow: hidden; height: 90vh; width:140vh;"></div>
			</div>
		</div>
	</div>
</sec:authorize>
</section>

<!-- ///////// center modal ///////////// -->



<sec:authorize access="isAuthenticated()">
<div class="modal center-modal fade show insertModal modal" id="modal-right3" tabindex="-1" aria-modal="true" role="dialog" style="display: none;">
  <div class="modal-dialog">
	<div class="modal-content">
	  <div class="modal-header">
		<h5 class="modal-title">일정 등록</h5>
		
		<sec:authorize access="hasAnyRole('ROLE_NURSE,ROLE_MASTER')">
		<button type="button" id="patientSr" class="waves-effect waves-light btn btn-primary mb-5" 
			data-bs-toggle="modal" data-bs-target="#nurSer"  
			style="float:right;border-radius:10px;position:relative;">
			<i class="fa fa-search"></i>직원검색
		</button>
		 <button type="button" id="mClose" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="display: none;"></button>
	  	</sec:authorize> 
	  </div>
	  <div class="modal-body">
		<div class="form-group row">
			<label for="example-date-input" class="col-sm-5 col-form-label" style="color:azure;font-weight:bold;"></label>
			<div class="col-sm-10" style="display:flex;align-items:center;width:100%;">
				근무자 : <input class="form-control" type="text" id="empNm" name="empNm" style="width:82%;margin-left: 28px;" readonly />
			</div>
		</div>
		<div class="form-group row" style="width:494px;">
			<label for="example-date-input" class="col-sm-5 col-form-label" style="color:azure;font-weight:bold;"></label>
			<div class="col-sm-10" style="display:flex;align-items:center;margin-bottom:10px;width:100%;">
				사&nbsp;&nbsp;&nbsp;&nbsp;번 : <input class="form-control" type="text" id="empNo" name="empNo" style="width:49%;margin-left: 28px;width:82%;" readonly />
			</div>
		</div>
		<div style="display:inline-block;width:102%;height:48px;">
			<div class="form-group row">
				<div class="col-sm-10" style="display:flex;align-items:center;width:50%;">
					<div>시작시간 :</div>
						<label for="start"></label> <select class="form-control"
							id="start" onchange="startChange()" style="margin-left:28px;width:54%;position:relative;left:-15px;">
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
			<div class="form-group row" style="width:50%;position:relative;top:-47px;left:242px;">
				<div class="col-sm-10" style="display:flex;align-items:center;width:100%;">
					<div style="width:69px;position:relative;left:25px;">종료시간 :</div> 
						<label for="end"></label> <select class="form-control"
							id="end" style="margin-left:28px;width:57%;position:relative;left:6px;">
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
		<div class="form-group row" style="width:494px;">
			<label for="example-date-input" class="col-sm-5 col-form-label" style="color:azure;font-weight:bold;"></label>
			<div class="col-sm-10" style="display:flex;align-items:center;margin-bottom:23px;width:100%;margin-top: -30px;">
				등록자 : <input class="form-control" type="text" id="nurEnnm" value="<sec:authentication property="principal.empVO.empName"/>" 
				style="width:49%;margin-left: 28px;width:82%;"  readonly/>
				<input class="form-control" type="text" id="nurEnwt" name="nurEnwt" value="<sec:authentication property="principal.empVO.empNo"/>" 
					style="display: none;"/>
			</div>
		</div>
		
		
		<!-- 근무구분 보여줄 곳 -->
		<div class="form-group row" style="width:494px; display: none;" id="gubunBox">
			<label for="example-date-input" class="col-sm-5 col-form-label" style="color:azure;font-weight:bold;"></label>
			<div class="col-sm-10" style="display:flex;align-items:center;margin-bottom:23px;width:100%;margin-top: -30px;">
				근무구분 : <input class="form-control" type="text" id="gubun" style="width:49%;margin-left: 15px;width:82%;"  readonly/>
			</div>
		</div>
	
		<div id="sel" class="btn-group bootstrap-select show-tick" style="width:99%;bottom: 18px;">
			<select id="comments" name="comments" class="selectpicker" tabindex="-98">
				<option value="null">근무구분</option>
				<option value="근무">근무</option>
				<option value="휴가">휴가</option>
				<option value="반차">반차</option>
				<option value="병가">병가</option>
				<option value="기타일정">기타일정</option>
			</select>
		</div>
	  </div>
	  <div class="modal-footer modal-footer-uniform" style="display:flex;justify-content:space-between;">
	  	<sec:authorize access="hasAnyRole('ROLE_NURSE,ROLE_MASTER')">
			<button type="button" id="testt" class="btn btn-primary float-end">등록</button>
			<button type="button" id="updt" class="btn btn-info float-end" style="display: none;">저장</button>
			<button type="button" id="fix" class="btn btn-info float-end" style="display:none;">수정</button>
			<button type="button" id="del" class="btn btn-danger" data-bs-dismiss="modal" style="display:none;">삭제</button>
			<button type="button" id="can" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
		</sec:authorize>
		<sec:authorize access="!hasAnyRole('ROLE_NURSE,ROLE_MASTER')">
			<button type="button" id="noNurse" class="btn btn-danger" data-bs-dismiss="modal" style="position:relative;left:400px;">닫기</button>
		</sec:authorize>
	  </div>
	</div>
  </div>
</div>
<!-- center modal 시작(직원검색)//////////////////// -->
<div class="modal center-modal fade" id="nurSer" tabindex="-1" style="display: none;" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content">
	  <div class="modal-header">
		<input type="search" id="emSearch" class="form-control form-control-sm" placeholder="이름을 입력해주세요" 
			style="width: 30%;margin-right: 50px;height:40px;" />
		<button type="button" id="btnSearch" class="waves-effect waves-light btn btn-primary mb-5" style="right:180px;top:2px;">
			<i class="fa fa-search" aria-hidden="true"></i>&nbsp;&nbsp;검색</button>
	  </div>
	  <div class="modal-body" style="max-height:400px;overflow:auto;">
	  	<div class="table-responsive">
	  		<table id="mainTable" class="table editable-table table-bordered mb-0" style="cursor: pointer;text-align:center">
				<thead>
					<tr>
						<th>사번</th>
						<th>이름</th>
						<th>전화번호</th>
					</tr>
				</thead>
				<tbody id="empCont">
				</tbody>
			</table>
				<input style="position: absolute; top: 166.297px; left: 490.061px; padding: 14px; 
					text-align: start; font: 400 14px / 21px &quot;IBM Plex Sans&quot;, sans-serif; border: 1px solid rgba(255, 255, 255, 0.12); width: 353.562px; height: 50px; display: none;"class="">
		</div>
	  </div>
	  <div class="modal-footer modal-footer-uniform" style="display:flex;justify-content:flex-end;">
		<button type="button" id="closeBtn" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
	  </div>
	</div>
  </div>
</div>
<!-- center moadl 끝 -->

</sec:authorize>
<link href="/resources/fullcalendar/lib/main.css" rel="stylesheet" />
<script src="/resources/fullcalendar/lib/main.js"></script>
<script src="/resources/fullcalendar/lib/locales/ko.js"></script>
