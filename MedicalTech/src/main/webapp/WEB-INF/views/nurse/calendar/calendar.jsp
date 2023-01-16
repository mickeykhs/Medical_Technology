<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<script>
let header = "${_csrf.headerName}";
let token  = "${_csrf.token}";


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
					initialView : 'timeGridWeek', // 초기 로드 될 때 보이는 캘린더 화면 (기본 설정 : 달)
					navLinks : true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
					editable : true, // 수정 가능?
					selectable : true, // 달력 일자 드래그 설정 가능
					droppable : true, // 드래그 앤 드롭 
					events : data,
					locale : 'ko', // 한국어 설정
					
			// 드래그로 이벤트 수정하기
			eventDrop : function(info){
				
				if(confirm("'"+info.event.title+"'을 수정하시겠습니까?")){
					
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
				
				var title = prompt('사번을 입력해주세요.');
			    if(title){
			    	calendar.addEvent({
			    		title : title,
			    		start : arg.start,
			    		end : arg.end,
			    		allDay : arg.allDay
			    	})
			    }else{
			    	 location.reload(); // 새로고침  
			    	 return;
			    }
			    
			    var events = new Array(); // Json 데이터를 받기 위한 배열 선언
			    var obj = new Object(); // Json을 담기 위해 Object 선언
			    
			    obj.title = title;
			    obj.start = arg.start; // 시작
			    obj.end = arg.end; // 끝
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
			},
			
			// 이벤트 선택해서 삭제하기
			eventClick : function(info){
				if(confirm("'"+info.event.title+"'을 삭제하시겠습니까?")){
					// 확인 클릭 시
					info.event.remove();
				}
				
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
</style>

<jsp:include page="../../tiles/header.jsp" flush="false" />
<section id="section" style="position:absolute;z-index:9999;width:100%;">
	<div style="position: relative;top:45px;display:flex;flex-direction:column;width:76%;left:-24px;height:90%">
		<div id="box1">
			<div id="calendar" style="overflow: hidden; height: 90vh; width:140vh;"></div>
		</div>
	</div>
</section>	
<link href="/resources/fullcalendar/lib/main.css" rel="stylesheet" />
<script src="/resources/fullcalendar/lib/main.js"></script>
<script src="/resources/fullcalendar/lib/locales/ko.js"></script>
<!-- Vendors Style-->
<link rel="stylesheet" href="/resources/mediTemple/html/main-horizontal-dark/css/vendors_css.css">
  
<!-- Style-->    
<link rel="stylesheet" href="/resources/mediTemple/html/main-horizontal-dark/css/horizontal-menu.css"> 
<link rel="stylesheet" href="/resources/mediTemple/html/main-horizontal-dark/css/style.css">
<link rel="stylesheet" href="/resources/mediTemple/html/main-horizontal-dark/css/skin_color.css">
<link rel="stylesheet" href="/resources/mediTemple/html/main-horizontal-dark/css/custom.css">
