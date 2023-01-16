<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/resources/mediTemple/html/images/favicon.ico">

    <title>Doclinic - Dashboard</title>
    
	<!-- Vendors Style-->
	<link rel="stylesheet" href="/resources/mediTemple/html/main-horizontal-dark/css/vendors_css.css">
	  
	<!-- Style-->    
	<link rel="stylesheet" href="/resources/mediTemple/html/main-horizontal-dark/css/horizontal-menu.css"> 
	<link rel="stylesheet" href="/resources/mediTemple/html/main-horizontal-dark/css/style.css">
	<link rel="stylesheet" href="/resources/mediTemple/html/main-horizontal-dark/css/skin_color.css">
	<link rel="stylesheet" href="/resources/mediTemple/html/main-horizontal-dark/css/custom.css">
	
    <style type="text/css">
    	th {
    		color:azure;
    		font-weight:bold;
    	}
    	.scrollDiv::-webkit-scrollbar{
    		display: none;
    	}
    </style>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    
  </head>


<body class="layout-top-nav dark-skin theme-primary fixed scrollDiv" style="overflow:hidden;height:100%;">
<div class="wrapper">
<!-- 	<div id="loader"></div> -->
<!-- //////////////// header 시작  여기는 index.jsp//////////// -->
<tiles:insertAttribute name="header" />
<!-- //////////////// header 끝//////////// -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper rounded-0">
	  <div class="container-full p-20 ">
		<!-- Main content -->
		<section class="content">
	  	<jsp:include page="../nurse/calendar/loadingPage.jsp" flush="false" />
	  	<tiles:insertAttribute name="body" />
		</section>
		<!-- /.content -->
	  </div>
  </div>
  <!-- /.content-wrapper -->
<!-- /////////////// footer 시작/////////////// -->

<!-- /////////////// footer 끝/////////////// -->

  <!-- Control Sidebar -->
  
<!-- //////////////// aside 시작/////////////// -->
<tiles:insertAttribute name="aside" />
<!-- //////////////// aside 끝/////////////// -->

  <!-- /.control-sidebar -->
  
  <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
  
</div>
<!-- ./wrapper -->
	<sec:authorize access="hasRole('ROLE_DOCTOR')">
	<!-- ./side demo panel -->
	<div class="sticky-toolbar">	    
		<button type="button" title="제증명" id="doc" class="waves-effect waves-light btn btn-warning btn-flat mb-5" data-bs-toggle="modal" data-bs-target="#modal-rightt">
					<i class="fa fa-reorder" aria-hidden="true"></i>문서
		</button>
		<button type="button" id="od1" title="오더" class="waves-effect waves-light btn btn-info btn-flat mb-5" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
					<i class="fa fa-fw fa-medkit"></i>오더
		</button>

	</div>
	</sec:authorize>
	<!-- Sidebar -->
		
	<!-- 채팅 -->
	<div id="chat-box-body">
<!-- 		<div class="waves-effect waves-circle btn btn-circle btn-sm btn-danger l-h-10" style="width:18px; height:18px; position: absolute; margin-left:2300px; margin-top:-90px;"> -->
		<div id="chatAlert" class="waves-effect waves-circle btn btn-circle btn-sm btn-danger l-h-10" style="display:none; width:18px; height:18px; position:fixed; left:1663px; top:843px; z-index:1001;">
			<i style="color:white; display:inline-block;  width:10px; padding-right:13px;padding-top:1px;" class="mdi mdi-bell-ring"></i>
		</div>	
		<div id="chat-circle" class="waves-effect waves-circle btn btn-circle btn-sm btn-warning l-h-50" style="z-index:1000;">
			<div id="chat-overlay"></div>
			<span class="icon-Group-chat fs-18"><span class="path1"></span><span class="path2"></span></span>
			
		</div>
		<div class="chat-box">
			<div class="chat-box-header p-15 d-flex justify-content-between align-items-center">
				<div class="text-center flex-grow-1">
					<div class="text-dark fs-18">Medical Technology</div>
					<div>
						<span class="badge badge-sm badge-dot badge-primary"></span> <span
							class="text-muted fs-12">Chat</span>
					</div>
				</div>
				<div class="chat-box-toggle">
					<button id="chat-box-toggle"
						class="waves-effect waves-circle btn btn-circle btn-danger-light h-40 w-40 rounded-circle l-h-45"
						type="button">
						<span class="icon-Close fs-22"><span class="path1"></span><span
							class="path2"></span></span>
					</button>
				</div>
			</div>
			<sec:authorize access="isAuthenticated()">
				<div class="chat-box-body" style="height:605px;">
					<iframe id="ifrm" width="350px" height="605px" src="http://localhost:8859/chat?userid=<sec:authentication property="principal.empVO.empNo"/>&username=<sec:authentication property="principal.empVO.empName"/>" frameborder="0" gesture="media" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				</div>
			</sec:authorize>
		</div>
	</div>
	
	<!-- Page Content overlay -->
	
	<!-- ////////////////////////////modal area 시작 ///////////////////////-->
	
	<!-- ////////// (문서)Right Modal 시작 ////////// -->
	<div class="modal modal-right fade" id="modal-right" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" style="display: none;" aria-hidden="true">
	  <div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
			<div class="fc-right">
				<div class="fc-button-group">
					<ul class="nav nav-tabs" role="tablist" style="justify-content:space-around;width:229%;border:none;">
					    <li class="nav-item"> 
					        <button  class="nav-link active" data-bs-toggle="tab" role="tab">
					            <span><i class="fa fa-fw fa-file"></i>진단서</span>
					        </button> 
					    </li>
					    <li class="nav-item"> 
					        <button class="nav-link" data-bs-toggle="tab" role="tab">
					            <span><i class="fa fa-fw fa-file"></i>소견서</span>
					        </button> 
					    </li>
					    <li class="nav-item"> 
					        <button class="nav-link" data-bs-toggle="tab" role="tab">
					            <span><i class="fa fa-fw fa-file"></i>원외처방전</span>
					        </button> 
					    </li>
					</ul>
				</div>
			</div>
			<button type="button" class="btn-close btn btn-rounded btn-danger" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body" id="document">
		  	<span>hihihi</span>
		  </div>
		  <div class="modal-footer modal-footer-uniform">
			<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			<button type="button" class="btn btn-primary float-end">Save changes</button>
		  </div>
		</div>
	  </div>
	</div>
	<!-- ////////// (문서) Right Modal 끝 ////////// -->
	
	
	<!-- ////////// (오더리스트)Large Modal 시작 ////////// -->
	<div class="modal fade bs-example-modal-lg" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" style="max-height:600px;top:164px;">
				<div class="modal-header">
					<h4 id="staticBackdropLabel" class="box-title text-info mb-0"><i class="ti-envelope me-15"></i>오더리스트</h4>
					<div class="fc-toolbar fc-header-toolbar" style="width:74%;">
						<div class="fc-right">
							<div class="fc-button-group">
								<ul class="nav nav-tabs" role="tablist">
								    <li class="nav-item"> 
								        <button class="nav-link active" id="examination" data-bs-toggle="tab" role="tab">
								            <span><i class="fa fa-fw fa-stethoscope"></i>검사</span>
								        </button> 
								    </li>
								    <li class="nav-item"> 
								        <button class="nav-link" id="injection" data-bs-toggle="tab" role="tab">
								            <span><i class="fa fa-fw fa-plus-square"></i>주사</span>
								        </button> 
								    </li>
								    <li class="nav-item"> 
								        <button class="nav-link" id="medi" data-bs-toggle="tab" role="tab">
								            <span><i class="mdi mdi-hospital"></i>내복</span>
								        </button> 
								    </li>
								</ul>
							</div>
						</div>
						<div>
							<label>
								<input type="search" id="ordName" class="form-control form-control-md" placeholder="" aria-controls="example1" />
							</label>
							<button type="button" id="btnOrdSearch" class="waves-effect waves-light btn btn-rounded btn-info mb-5"><i class="fa fa-search" aria-hidden="true"></i></button>
						</div>
						<div class="fc-clear"></div>
					</div>
				</div>
				<div class="modal-body scrollDiv" style="max-height:600px;overflow:auto;overflow-y:scroll;">
					<div class="box-body">
					
					<div class="table-responsive">
								<table id="mainTable" class="table editable-table table-bordered mb-0" style="cursor: pointer;text-align:center">
									<thead>
										<tr>
											<th>오더코드</th>
											<th>질병코드</th>
											<th>질병명(ko)</th>
											<th>약품명</th>
											<th>의료행위명(en)</th>
										</tr>
									</thead>
									<tbody id="ordData">
									</tbody>
								</table>
							<input style="position: absolute; top: 166.297px; left: 490.061px; padding: 14px; text-align: start; font: 400 14px / 21px &quot;IBM Plex Sans&quot;, sans-serif; border: 1px solid rgba(255, 255, 255, 0.12); width: 353.562px; height: 50px; display: none;" class="" /></div>
				
					<!-- /.row -->
				</div>
				</div>
				<div class="modal-footer" style="display:flex;justify-content:flex-end;">
					<button type="button" class="btn btn-danger text-start" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- ////////// (오더리스트)Large Modal 끝 ////////// -->
	
	<!-- modal area 끝 -->
	
	
	
	<!-- Vendor JS -->
	<script src="/resources/mediTemple/html/main-horizontal-dark/js/vendors.min.js"></script>
	<script src="/resources/mediTemple/html/main-horizontal-dark/js/pages/chat-popup.js"></script>
    <script src="/resources/mediTemple/html/assets/icons/feather-icons/feather.min.js"></script>
    <script src="/resources/mediTemple/html/assets/vendor_components/sweetalert/jquery.sweet-alert.custom.js"></script>
    <script src="/resources/mediTemple/html/assets/vendor_components/sweetalert/sweetalert.min.js"></script>

	<script src="/resources/mediTemple/html/assets/vendor_components/apexcharts-bundle/dist/apexcharts.js"></script>
	<script src="https://rawgit.com/nnnick/Chart.js/v1.0.2/Chart.min.js"></script>
	<script src="/resources/mediTemple/html/assets/vendor_components/raphael/raphael.min.js"></script>
	<script src="/resources/mediTemple/html/assets/vendor_components/morris.js/morris.min.js"></script>
<!-- 	<script src="/resources/mediTemple/html/assets/vendor_components/fullcalendar/lib/moment.min.js"></script> -->
<!-- 	<script src="/resources/mediTemple/html/assets/vendor_components/fullcalendar/fullcalendar.min.js"></script> -->
	<script src="/resources/mediTemple/html/assets/vendor_components/jquery-toast-plugin-master/src/jquery.toast.js"></script>
	<script src="/resources/mediTemple/html/assets/vendor_plugins/iCheck/icheck.min.js"></script>
	<script src="/resources/mediTemple/html/assets/vendor_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
	<script src="/resources/mediTemple/html/assets/vendor_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<script src="/resources/mediTemple/html/assets/vendor_components/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script src="/resources/mediTemple/html/assets/vendor_components/moment/min/moment.min.js"></script>
	<script src="/resources/mediTemple/html/assets/vendor_components/select2/dist/js/select2.full.js"></script>
	<script src="/resources/mediTemple/html/assets/vendor_components/bootstrap-select/dist/js/bootstrap-select.js"></script>
	
	<!-- Doclinic App -->
	<script src="/resources/mediTemple/html/main-horizontal-dark/js/jquery.smartmenus.js"></script>
	<script src="/resources/mediTemple/html/main-horizontal-dark/js/menus.js"></script>
	<script src="/resources/mediTemple/html/main-horizontal-dark/js/template.js"></script>
	<script src="/resources/mediTemple/html/main-horizontal-dark/js/pages/dashboard4.js"></script>
<!-- 	<script src="/resources/mediTemple/html/main-horizontal-dark/js/pages/calendar.js"></script> -->
	<script src="/resources/mediTemple/html/main-horizontal-dark/js/pages/toastr.js"></script>
	<script src="/resources/mediTemple/html/main-horizontal-dark/js/pages/notification.js"></script>
	<div class="jq-toast-wrap top-right">
		<div class="jq-toast-single jq-has-icon jq-icon-error" style="text-align: left; display: none;">
			<span class="jq-toast-loader jq-toast-loaded" style="-webkit-transition: width 3.1s ease-in;-o-transition: width 3.1s ease-in;transition: width 3.1s ease-in;background-color: #ff6849;"></span>
			<span class="close-jq-toast-single">×</span>
			<h2 class="jq-toast-heading">Welcome to my Doclinic</h2>
			Use the predefined ones, or specify a custom position object.
		</div>
	</div>
</body>
<script type="text/javascript">
	let formData = new FormData();
	let idx = 0;
	var number = 0;  // 주사
	var number2 = 0; // 약품
	var number3 = 0; // 검사
	var diseaseCode = null;
	var odrVOList = null;
	var examList = null;
	var chatCnt = 0;
	
	
	$(function(){
		$('input[type=search]').on('keyup',function(e){
			if(e.key ==='Enter' || e.keyCode === 13){
				$('#btnOrdSearch').trigger('click');
			}
		});
		$('#cancel').on('click',function(){
			$('#odTbb').empty();
			$('#odTb').empty();
			$('#odTbbb').empty();
			$('#ch_disCd').val('');
		});
		$('#od1').on('click',function(){
			$('#ordData').empty();
		});
		
		// 오더리스트 검색버튼
		$(document).on('click', '#btnOrdSearch', function(){
			$('#ordData').empty();
			let str = $('#ordName').val();
			console.log('약품명 : ' + str);
			
			let data = {"olDisKo":str,"olDrSortName":str};
			console.log('data : ' + JSON.stringify(data));
			
			$.ajax({
				url:'/doctor/searchOrd',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify(data),
				dataType:'json',
				type:'post',
				beforeSend:function(xhr){
					xhr.setRequestHeader(header,token);
				},
				
				success:function(result){
					console.log('result : ' + JSON.stringify(result));
					odrVOList = result;
					
					$.each(result, function(index, item){
						diseaseCode = "'" + item.olDisCd + "'";
						console.log('질병한글명 : ' + item.olCd);
						
						let content="";
						content +='<tr><td tabindex="1">' + item.olCd + '</td>';
						content +="<td tabindex='1'>" + item.olDisCd + "</td>";
						content +="<td tabindex='1'>" + item.olDisKo + "</td>";
						content +="<td tabindex='1'>" + item.olDrSortName + "</td>";
						content +="<td tabindex='1'>" + item.olActEng + "</td>";
						content +="</tr>";
						
						$('#ordData').append(content);
						
						
						
						$('#ordData tr').on('click',function(){
			    			var tr = $(this);
			    			var td = tr.children();
			    			var cd = td.eq(0).text();
			    			var olDisCd = td.eq(1).text();
			    			
				    		if(item.olCd == cd ){
				    			console.log('olCd : ' + cd);
				    			var drSort = td.eq(3).text();
				    			makeArr(preArr, drSort);
				    			console.log(preArr);
				    			
				    			$('#olDisCd').val(olDisCd);
				    			$('#olDisCd').attr('readonly', true);
				    			$('#disCd2').val(olDisCd);
				    			$('#disCd2').attr('readonly', true);
				    			$('#disCd4').val(olDisCd);
				    			$('#disCd4').attr('readonly', true);
				    			
				    			$('#olCd').val(item.olCd);
				    			$('#olActCd').val(item.olActCd);
				    			$('#toGubun').val(item.olOrSort);
				    			$('#disName').val(item.olDisKo);
				    			$('#disName').attr('readonly', true);
				    			for(var i=0; i<preArr.length; i++){
					    			$('#dName' + i).val(preArr[i]);
					    			$('#dName' + i).attr('readonly', true);
				    			}
				    			
				    			if(item.olNe == "주사"){
					    			let co ="";
					    			co +='<tr><td tabindex="1" class="olNe'+ number +'">' + item.olNe + '</td>';
					    			co +="<td tabindex='1'>" + item.olDrSorNo + "</td>";
					    			co +="<td tabindex='1'>" + item.olDrSortName + "</td>";
					    			co +="<td tabindex='1'>" + item.olDrComName + "</td>";
					    			co +='<td style="display:none;" class="olCd'+ number + '">' + item.olCd + '</td>';
					    			co +='<td style="display:none;" class="olDisCd' + number + '">' + item.olDisCd + '</td>';
					    			co +='<td style="display:none;" class="olActKo">' + item.olActKo + '</td>';
					    			co +='<td style="display:none;" class="olActCd'+ number +'">' + item.olActCd + '</td>';
					    			co +="</tr>";
					    			co +='<tr role="row" class="odd">';
					    			co +='<td class="sorting_1">진통제</td>';
					    			co +='<td>1회투여량:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="prShot' + number +'" name="prShot" style="width:38%;"></td>';
					    			co +='<td>투여횟수:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="prCnt' + number +'" name="prCnt" style="width:38%;"></td>';
					    			co +='<td class="sorting_1">비용: ' + item.olActFee + '원';
					    			co +='</td></tr>';
									
					    			number = number +1;
					    			$('#odTbb').append(co);
					    			
					    			$('.bs-example-modal-lg').modal('hide');	
					    			
				    			}
				    			if(item.olNe == "내복"){
				    				$('#drugName').val(item.olDrSortName);
				    				$('#kyobu').val('7');
					    			let co ="";
					    			co +='<tr><td tabindex="1" class="olNe2'+ number2 +'">' + item.olNe + '</td>';
					    			co +="<td tabindex='1'>" + item.olDrSorNo + "</td>";
					    			co +="<td tabindex='1'>" + item.olDrSortName + "</td>";
					    			co +="<td tabindex='1'>" + item.olDrComName + "</td>";
					    			co +='<td style="display:none;" class="olCd2'+ number2 + '">' + item.olCd + '</td>';
					    			co +='<td style="display:none;" class="olDisCd2' + number2 + '">' + item.olDisCd + '</td>';
					    			co +='<td style="display:none;" class="olActKo">' + item.olActKo + '</td>';
					    			co +='<td style="display:none;" class="olActCd2'+ number2 +'">' + item.olActCd + '</td>';
					    			co +="</tr>";
					    			co +='<tr role="row" class="odd">';
					    			co +='<td class="sorting_1">뉴로비정</td>';
					    			co +='<td>1회투여량:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="prShot2'+ number2 +'" name="prShot" style="width:38%;"></td>';
					    			co +='<td>투여횟수:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="prCnt2'+ number2 +'" name="prShot" style="width:38%;"></td>';
					    			co +='<td>총투약일수:&nbsp;&nbsp;&nbsp;&nbsp;<input type=" text" value="" style="width:38%;"></td></tr>';

					    			number2 = number2 + 1;
					    			$('#odTbbb').append(co);
					    			
					    			$('.bs-example-modal-lg').modal('hide');
				    			}
					    			
				    			if(item.olNe == "검사"){
					    			let con ="";
					    			con +='<tr><td tabindex="1" class="olNe3'+ number3 +'">' + item.olNe + '</td>';
					    			con +="<td tabindex='1'>" + item.olDisCd + "</td>";
					    			con +="<td tabindex='1'>" + item.olDisKo + "</td>";
					    			con +="<td tabindex='1'>" + item.olActKo + "</td>";
					    			con +='<td style="display:none;" class="olCd3'+ number3 + '">' + item.olCd + '</td>';
					    			con +='<td style="display:none;" class="olDisCd3' + number3 + '">' + item.olDisCd + '</td>';
					    			con +='<td style="display:none;" class="olActKo">' + item.olActKo + '</td>';
					    			con +='<td style="display:none;" class="olActCd3'+ number3 +'">' + item.olActCd + '</td>';
					    			con +="</tr>";
					    			con +='<tr><td>검사종류     :</td>';
					    			con +='<td><input name="group5" type="radio" id="radio_32" class="with-gap radio-col-success" value="X-ray" />';
					    			con +='<label for="radio_32" style="min-width:100px;">X-ray</label></td>';
					    			con +='<td><input name="group5" type="radio" id="radio_35" class="with-gap radio-col-warning" value="MRI"/>';
					    			con +='<label for="radio_35" style="min-width:100px;">MRI</label></td>';
					    			con +='<td><input name="group5" type="radio" id="radio_36" class="with-gap radio-col-danger" value="초음파"/>';
					    			con +='<label for="radio_36" style="min-width:100px;">초음파</label></td>';
					    			con +='<td style="display:none;">1회투여량:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="prShot3'+ number3 +'" name="prShot" style="width:38%;"></td>';
					    			con +='<td style="display:none;">투여횟수:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="prCnt3'+ number3 +'" name="prCnt" style="width:38%;"></td></tr>';
									
					    			number3 = number3 + 1;
									$('#odTb').append(con);
					    			
					    			$('.bs-example-modal-lg').modal('hide');
				    			}
				    			
				   			}
			    		});
						
						
						
					}); // each
				}
			});
		});
		
		// 검사탭
		$('#examination').on('click', function(){
			$('#ordData').empty();
			let str = "검사";
			let data = {"olNe":str};
			$.ajax({
				url:'/doctor/ordList',
				contentType:'application/json;charset=utf-8',
			    data: JSON.stringify(data),
			    dataType:'json',
			    type:'post',
			    beforeSend:function(xhr){
					xhr.setRequestHeader(header,token);
				},
			    
			    success:function(result){
			    	console.log('result : ' + JSON.stringify(result));
			    	examList = result;
			    	
			    	$.each(result, function(index, item){
			    		if(item.olNe == "검사"){
				    		let cont = "";
				    		cont +='<tr><td tabindex="1">' + item.olCd + '</a></td>';
				    		cont +="<td tabindex='1'>" + item.olDisCd + "</td>";
				    		cont +="<td tabindex='1'>" + item.olDisKo + "</td>";
				    		cont +="<td tabindex='1'>" + item.olDrSortName + "</td>";
				    		cont +="<td tabindex='1'>" + item.olActEng + "</td>";
				    		cont +="</tr>";
				    		
				    		$('#ordData').prepend(cont);
				    		
				    		$('#ordData tr').on('click',function(){
				    			var tr = $(this);
				    			var td = tr.children();
				    			
				    			var cd = td.eq(0).text();
				    			var olDisCd = td.eq(1).text();
					    		if(item.olCd == cd ){
					    			$('#olDisCd').val(olDisCd);
					    			$('#olDisCd').attr('readonly', true);
					    			$('#disCd2').val(olDisCd);
					    			$('#disCd2').attr('readonly', true);
					    			$('#disCd4').val(olDisCd);
					    			$('#disCd4').attr('readonly', true);
					    			
					    			$('#olCd').val(item.olCd);
					    			$('#olActCd').val(item.olActCd);
					    			$('#toGubun').val(item.olOrSort);
					    			$('#disName').val(item.olDisKo);
					    			$('#disName').attr('readonly', true);
					    			$('#dName').val(item.olDrSortName);
					    			$('#dName').attr('readonly', true);
					    			
					    			let co = "";
					    			co +='<tr><td tabindex="1" class="olNe3'+number3+'">' + item.olNe + '</td>';
					    			co +="<td tabindex='1'>" + item.olDisCd + "</td>";
					    			co +="<td tabindex='1'>" + item.olDisKo + "</td>";
					    			co +="<td tabindex='1'>" + item.olActKo + "</td>";
					    			co +='<td style="display:none;">' + item.olCd + '</td>';
					    			co +='<td style="display:none;" class="olCd3'+ number3 + '">' + item.olCd + '</td>';
					    			co +='<td style="display:none;" class="olDisCd3' + number3 + '">' + item.olDisCd + '</td>';
					    			co +='<td style="display:none;" class="olActKo">' + item.olActKo + '</td>';
					    			co +='<td style="display:none;" class="olActCd3'+ number3 +'">' + item.olActCd + '</td>';
					    			co +="</tr>";
					    			co +='<tr><td>검사종류     :</td>';
					    			co +='<td><input name="group5" type="radio" id="radio_32" class="with-gap radio-col-success" value="X-ray" />';
					    			co +='<label for="radio_32" style="min-width:100px;">X-ray</label></td>';
					    			co +='<td><input name="group5" type="radio" id="radio_35" class="with-gap radio-col-warning" value="MRI"/>';
					    			co +='<label for="radio_35" style="min-width:100px;">MRI</label></td>';
					    			co +='<td><input name="group5" type="radio" id="radio_36" class="with-gap radio-col-danger" value="초음파"/>';
					    			co +='<label for="radio_36" style="min-width:100px;">초음파</label></td>';
					    			co +='<td style="display:none;">1회투여량:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="prShot3'+ number3 +'" name="prShot" style="width:38%;"></td>';
					    			co +='<td style="display:none;">투여횟수:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="prCnt3'+ number3 +'" name="prCnt" style="width:38%;"></td></tr>';
									
					    			
					    			number3 = number3 + 1;
					    			$('#odTb').append(co);
					    			
					    			$('.bs-example-modal-lg').modal('hide');
					    		}
				    		});
			    		}
			    	});
			    	
			    }
			});
		});
		
		
		// 주사 탭
		$('#injection').on('click', function(){
			$('#ordData').empty();
			let str = "주사";
			let data = {"olOrSort":str};
			$.ajax({
				url:'/doctor/ordList',
				contentType:'application/json;charset=utf-8',
			    data: JSON.stringify(data),
			    dataType:'json',
			    type:'post',
			    beforeSend:function(xhr){
					xhr.setRequestHeader(header,token);
				},
				
			    success:function(result){
			    	console.log('result : ' + JSON.stringify(result));
			    	examList = result;
			    	
			    	$.each(result, function(index, item){
			    		diseaseCode = "'" + item.olDisCd + "'";
			    		
			    		if(item.olNe == "주사"){
				    		let cont = "";
				    		cont += '<tr><td tabindex="1">' + item.olCd + '</a></td>';
				    		cont +="<td tabindex='1'>" + item.olDisCd + "</td>";
				    		cont +="<td tabindex='1'>" + item.olDisKo + "</td>";
				    		cont +="<td tabindex='1'>" + item.olDrSortName + "</td>";
				    		cont +="<td tabindex='1'>" + item.olActEng + "</td>";
				    		cont +="</tr>";
				    		
				    		$('#ordData').append(cont);
				    		
				    		
				    		$('#ordData tr').on('click',function(){
				    			var tr = $(this);
				    			var td = tr.children();
				    			
				    			var cd = td.eq(0).text();
				    			var olDisCd = td.eq(1).text();
					    		if(item.olCd == cd ){
					    			$('#olDisCd').val(olDisCd);
					    			$('#olDisCd').attr('readonly', true);
					    			$('#disCd2').val(olDisCd);
					    			$('#disCd2').attr('readonly', true);
					    			$('#disCd4').val(olDisCd);
					    			$('#disCd4').attr('readonly', true);
					    			
					    			
					    			$('#olCd').val(item.olCd);
					    			$('#olActCd').val(item.olActCd);
					    			$('#toGubun').val(item.olOrSort);
					    			$('#disName').val(item.olDisKo);
					    			$('#disName').attr('readonly', true);
					    			$('#dName').val(item.olDrSortName);
					    			$('#dName').attr('readonly', true);
					    			
					    			let co ="";
					    			co +='<tr><td tabindex="1" class="olNe'+ number +'">' + item.olNe + '</td>';
					    			co +="<td tabindex='1'>" + item.olDrSorNo + "</td>";
					    			co +="<td tabindex='1'>" + item.olDrSortName + "</td>";
					    			co +="<td tabindex='1'>" + item.olDrComName + "</td>";
					    			co +='<td style="display:none;" class="olCd'+ number + '">' + item.olCd + '</td>';
					    			co +='<td style="display:none;" class="olDisCd' + number + '">' + item.olDisCd + '</td>';
					    			co +='<td style="display:none;" class="olActKo">' + item.olActKo + '</td>';
					    			co +='<td style="display:none;" class="olActCd'+ number +'">' + item.olActCd + '</td>';
					    			co +="</tr>";
					    			co +='<tr role="row" class="odd final">';
					    			co +='<td class="sorting_1">진통제</td>';
					    			co +='<td>1회투여량:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="prShot'+ number +'" name="prShot" style="width:38%;"></td>';
					    			co +='<td>투여횟수:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="prCnt'+ number +'" name="prCnt" style="width:38%;"></td>';
					    			co +='<td class="sorting_1">비용: ' + item.olActFee + '원';
					    			co +='</td></tr>';
					    			
					    			number = number + 1;
					    			$('#odTbb').append(co);
					    			
					    			$('.bs-example-modal-lg').modal('hide');
					    		}
				    		});
			    		}
			    	});
			    	
			    }
			});
		});
		
		
		// 내복탭 
		$('#medi').on('click', function(){
			$('#ordData').empty();
			$('#kyobu').val('7');
			console.log('와땅');
			let str = "검사";
			let data = {"olNe":str};
			$.ajax({
				url:'/doctor/ordList',
				contentType:'application/json;charset=utf-8',
			    data: JSON.stringify(data),
			    dataType:'json',
			    type:'post',
			    beforeSend:function(xhr){
					xhr.setRequestHeader(header,token);
				},
			    
			    success:function(result){
			    	console.log('result : ' + JSON.stringify(result));
			    	examList = result;
			    	
			    	$.each(result, function(index, item){
			    		diseaseCode = "'" + item.olDisCd + "'";
			    		if(item.olNe == "내복"){
				    		let cont = "";
				    		cont +='<tr><td tabindex="1">' + item.olCd + '</td>';
				    		cont +="<td tabindex='1'>" + item.olDisCd + "</td>";
				    		cont +="<td tabindex='1'>" + item.olDisKo + "</td>";
				    		cont +="<td tabindex='1'>" + item.olDrSortName + "</td>";
				    		cont +="<td tabindex='1'>" + item.olActEng + "</td>";
				    		cont +="</tr>";
				    		
				    		$('#ordData').prepend(cont);
				    		
				    		
				    		$('#ordData tr').on('click',function(){
				    			var tr = $(this);
				    			var td = tr.children();
				    			
				    			
				    			var cd = td.eq(0).text();
				    			var olDisCd = td.eq(1).text();
					    		if(item.olCd == cd ){
					    			
					    			var drSort = td.eq(3).text();
					    			makeArr(preArr, drSort);
					    			console.log(preArr);
					    			
					    			$('#olDisCd').val(olDisCd);
					    			$('#olDisCd').attr('readonly', true);
					    			$('#disCd2').val(olDisCd);
					    			$('#disCd2').attr('readonly', true);
					    			$('#disCd4').val(olDisCd);
					    			$('#disCd4').attr('readonly', true);
					    			
					    			$('#olCd').val(item.olCd);
					    			$('#olActCd').val(item.olActCd);
					    			$('#toGubun').val(item.olOrSort);
					    			$('#disName').val(item.olDisKo);
					    			$('#disName').attr('readonly', true);
					    			for(var i=0; i<preArr.length; i++){
						    			$('#dName' + i).val(preArr[i]);
						    			$('#dName' + i).attr('readonly', true);
					    			}
					    			
					    			let co ="";
					    			co +='<tr><td tabindex="1" class="olNe2'+ number2 +'">' + item.olNe + '</td>';
					    			co +="<td tabindex='1'>" + item.olDrSorNo + "</td>";
					    			co +="<td tabindex='1'>" + item.olDrSortName + "</td>";
					    			co +="<td tabindex='1'>" + item.olDrComName + "</td>";
					    			co +='<td style="display:none;" class="olCd2'+ number2 + '">' + item.olCd + '</td>';
					    			co +='<td style="display:none;" class="olDisCd2' + number2 + '">' + item.olDisCd + '</td>';
					    			co +='<td style="display:none;" class="olActKo">' + item.olActKo + '</td>';
					    			co +='<td style="display:none;" class="olActCd2'+ number2 +'">' + item.olActCd + '</td>';
					    			co +="</tr>";
					    			co +='<tr role="row" class="odd">';
					    			co +='<td class="sorting_1">뉴로비정</td>';
					    			co +='<td>1회투여량:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="prShot2'+ number2 +'" name="prShot" style="width:38%;"></td>';
					    			co +='<td>투여횟수:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="prCnt2'+ number2 +'" name="prShot" style="width:38%;"></td>';
					    			co +='<td>총투약일수:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="" style="width:38%;"></td></tr>';
					    			
					    			number2 = number2 + 1;

					    			$('#odTbbb').append(co);
					    			
					    			$('.bs-example-modal-lg').modal('hide');
					    		}
				    		});
			    		}
			    	});
			    	
			    }
			});
		}); // 약품끝
		
		// 처음 화면에 알림 표시 여부 
		$.ajax({
			url: "/chat/cntSel",
			contentType:'application/json;charset=utf-8',
		    type:'get',
		    beforeSend:function(xhr) {
				xhr.setRequestHeader(header,token);
			},
			success:function(result) {
				if(result > 0) {
					$("#chatAlert").css("display", "block");
				} else {
					$("#chatAlert").css("display", "none");
				}
			}
   		});

		// 채팅 알림 개수 받아와서 Update
		window.addEventListener("message", function(e) {
			console.log("받아온 알림 수 : " + e.data.ttm);
			console.log("타입 : " + typeof(e.data.ttm));
			
	    	if(e.data.ttm == 0) {
	    		$("#chatAlert").hide();
	    		chatCnt = 0;
	    		console.log('숨김');
	    		
	    	} else if (e.data.ttm > 0){
	    		// alert("왔다!!");
	    		$("#chatAlert").show();
	    		chatCnt = e.data.ttm;
				console.log("11111****" + chatCnt);
	    		
				var data = {"chatCnt" : chatCnt}
				
	    		$.ajax({
    				url: "/chat/cntUpt",
					contentType:'application/json;charset=utf-8',
				    data: JSON.stringify(data),
				    dataType:'json',
				    type:'post',
				    beforeSend:function(xhr) {
						xhr.setRequestHeader(header,token);
					},
					success:function(result) {
						console.log("result : " + result.chatCnt);
					}
	    		});
	    	}
	    });
		
		// 채팅 버튼 클릭 
		$("#chat-circle").on("click", function() {
			$("#chatAlert").css("display", "none");
			
			chatCnt = 0;
    		
    		var data = {"chatCnt" : chatCnt}
			
			$.ajax({
				url:'/chat/cntUpt',
				contentType:'application/json;charset=utf-8',
			    data: JSON.stringify(data),
			    dataType:'json',
			    type:'post',
			    beforeSend:function(xhr) {
					xhr.setRequestHeader(header,token);
				},
				success:function(result) {
					console.log("result : " + result.chatCnt);
				}
    		});
		});
	}); // onload 끝
</script>
</html>
