<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>
<script src="/resources/js/html2canvas.min.js"></script>
<script src="/resources/js/jspdf.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js" integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<link rel="stylesheet" href="/resources/css/소견서.css">
<!-- ㅇ -->
<style>
input[type=text] { 
  font-size:18px;
  font-weight: 900;
}

th{
	color:white;
}
@charset "UTF-8";
.hce {margin:0;padding:0;position:absolute;overflow:hidden;}
.hme {margin:0;padding:0;position:absolute;}
.hhe {margin:0;padding:0;position:relative;}
.hhi {display:inline-block;margin:0;padding:0;position:relative;background-size:contain;}
.hls {margin:0;padding:0;position:absolute;}
.hfS {margin:0;padding:0;position:absolute;}
.hcD {margin:0;padding:0;position:absolute;}
.hcI {margin:0;padding:0;position:absolute;}
.hcS {margin:0;padding:0;position:absolute;}
.hfN {margin:0;padding:0;position:relative;}
.hmB {margin:0;padding:0;position:absolute;}
.hmO {margin:0;padding:0;position:absolute;}
.hmT {margin:0;padding:0;position:absolute;}
.hpN {display:inline-block;margin:0;padding:0;position:relative;white-space:nowrap;}
.htC {display:inline-block;margin:0;padding:0;position:relative;vertical-align:top;overflow:hidden;}
.haN {display:inline-block;margin:0;padding:0;position:relative;}
.hdu {margin:0;padding:0;position:relative;}
.hdS {margin:0;padding:0;position:absolute;}
.hsC {margin:0;padding:0;position:absolute;}
.hsR {margin:0;padding:0;position:absolute;}
.hsG {margin:0;padding:0;position:absolute;}
.hsL {margin:0;padding:0;position:absolute;}
.hsT {margin:0;padding:0;position:absolute;overflow:hidden;}
.hsE {margin:0;padding:0;position:absolute;overflow:hidden;}
.hsA {margin:0;padding:0;position:absolute;overflow:hidden;}
.hsP {margin:0;padding:0;position:absolute;overflow:hidden;}
.hsV {margin:0;padding:0;position:absolute;overflow:hidden;}
.hsO {margin:0;padding:0;position:absolute;}
.hsU {margin:0;padding:0;position:absolute;overflow:hidden;}
.hpi {margin:0;padding:0;position:absolute;}
.hch {margin:0;padding:0;position:absolute;}
.hcG {margin:0;padding:0;position:absolute;}
.heq {margin:0;padding:0;position:absolute;}
.heG {margin:0;padding:0;position:absolute;}
.htA {margin:0;padding:0;position:absolute;}
.hvi {margin:0;padding:0;position:absolute;}
.htb {margin:0;padding:0;position:absolute;}
.htG {margin:0;padding:0;position:absolute;}
.hfJ {margin:0;padding:0;position:absolute;}
.hfG {margin:0;padding:0;position:absolute;}
.hfB {margin:0;padding:0;position:absolute;}
.hfR {margin:0;padding:0;position:absolute;}
.hfC {margin:0;padding:0;position:absolute;}
.hfO {margin:0;padding:0;position:absolute;}
.hfL {margin:0;padding:0;position:absolute;}
.hfM {margin:0;padding:0;position:absolute;}
.hfE {margin:0;padding:0;position:absolute;}
.hpl {margin:0;padding:0;position:absolute;}
.hs {margin:0;padding:0;position:absolute;overflow:visible;}
.hpa {position:relative;padding:0;overflow:hidden;margin-left:2mm;margin-right:0mm;margin-bottom:2mm;margin-top:0mm;border:1px black solid;box-shadow:1mm 1mm 0 #AAAAAA;}
.hpa::after {content:'';position:absolute;margin:0;padding:0;left:0;right:0;top:0;bottom:0;background-color:white;z-index:-2;}
.hrt {display:inline-block;margin:0;padding:0;position:relative;white-space:inherit;vertical-align:middle;line-height:1.1; margin-left: 1px; margin-top: -14px;}
.hco {display:inline-block;margin:0;padding:0;position:relative;white-space:inherit;}
.hcc {margin:0;padding:0;position:absolute;}
.hls {clear:both;}
[onclick] {cursor:pointer;}
.cs0 {font-size:10pt;color:#000000;font-family:"바탕";}
.cs1 {font-size:10pt;color:#000000;font-family:"돋움";}
.cs2 {font-size:15pt;color:#000000;font-family:"돋움";}
.cs3 {font-size:20pt;color:#000000;font-family:"휴먼옛체", "한양궁서";}
.cs4 {font-size:20pt;color:#000000;font-family:"돋움";}
.cs5 {font-size:30pt;color:#000000;font-family:"돋움";}
.cs6 {font-size:9pt;color:#000000;font-family:"바탕";}
.cs7 {font-size:18pt;color:#000000;font-family:"돋움";}
.cs8 {font-size:11pt;color:#000000;font-family:"굴림체";}
.cs9 {font-size:11pt;color:#000000;margin-left: -2px; margin-top: 2px;}
.cs10 {font-size:10pt;color:#000000;}
.cs10::after {content:'';position:absolute;left:0;right:0;top:0;bottom:0;z-index:-1;background-image:url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiPjxsaW5lIHgxPSIwIiB5MT0iOTQlIiB4Mj0iMTAwJSIgeTI9Ijk0JSIgc3R5bGU9InN0cm9rZTpyZ2IoMCwwLDApO3N0cm9rZS13aWR0aDowLjJtbSIvPjwvc3ZnPg==');}
.cs11 {font-size:10pt;color:#000000;font-family:"굴림체";}
.cs12 {font-size:11pt;color:#000000;font-family:"굴림체";font-weight:bold;}
.cs13 {font-size:10pt;color:#000000;font-family:"굴림체";font-weight:bold;}
.cs14 {font-size:9pt;color:#000000;font-family:"굴림체";}
.cs15 {font-size:14pt;color:#000000;font-family:"굴림체";font-weight:bold;}
.cs16 {font-size:10pt;color:#000000;font-family:"굴림체";font-weight:bold;}
.cs17 {font-size:8pt;color:#000000;font-family:"굴림체";}
.cs18 {font-size:15pt;color:#000000;font-family:"굴림체";}
.cs19 {font-size:9pt;color:#000000;font-family:"굴림체";font-weight:bold;}
.cs20 {font-size:10pt;color:#000000;font-family:"굴림체";}
.cs20::after {content:'';position:absolute;left:0;right:0;top:0;bottom:0;z-index:-1;background-image:url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiPjxsaW5lIHgxPSIwIiB5MT0iOTQlIiB4Mj0iMTAwJSIgeTI9Ijk0JSIgc3R5bGU9InN0cm9rZTpyZ2IoMCwwLDApO3N0cm9rZS13aWR0aDowLjJtbSIvPjwvc3ZnPg==');}
.ps0 {text-align:justify;}
.ps1 {text-align:center;}
.ps2 {text-align:justify;}
.ps3 {text-align:left;}
.ps4 {text-align:center;}
.ps5 {text-align:right;}
.ps6 {text-align:justify;}
.ps7 {text-align:justify;}
.ps8 {text-align:left;}
.ps9 {text-align:justify;}
@media print {
.hpa {margin:0;border:0 black none;box-shadow:none;}
body {padding:0;}

}

</style>
  <div class="container-fluid" style="font-size:18px;font-weight: 900; height:40px;">
      <div class="row row-cols-4" style="margin-right: -200px;">
         <div class="col-md-3 col-sm-6 col-sm-6">
            <div class="card card-primary" style=" height: 760px;">
               <div class="card-header">
                  <h4 class="box-title text-info mb-0"><i class="fa fa-drivers-license me-15"></i>환자 관리</h4>
               </div>
               <div class="mailbox-controls">
                  <div style="justify-content: space-around; display: flex; height:40px;">
                     <button id="cancle" type="button" class="btn btn-default btn-sm"
                        style="width: 200px;">
                        <i class="fas fa-reply" style="font-size: 13px; color:white;">진료실 배정</i>
                     </button>
                     <button id="create" type="button" class="btn btn-default btn-sm "
                        style="width: 200px;">
                        <i class="fas fa-reply" style="font-size: 13px;color:white;">환자 관리</i>
                     </button>
                     <button id="document" type="button" onclick="getHide()" class="btn btn-default btn-sm"
                        style="width: 200px;">
                        <i class="fas fa-reply" style="font-size: 13px;color:white;">제증명 관리</i>
                     </button>
                  </div>
               </div>
                  <div class="card-body" style="font-size: 1rem; margin-top:-20px;">
                     <div id="allSearch" class="input-group">
                        <div class="input-group-append">
                           	<input type="text" id="search" onkeyup="enterkey()" class="form-control form-control-lg"
									placeholder="환자 검색" style="height: 40px;">
								<div class="input-group-append">
									<button type="button" id="btnSearch" class="btn btn-lg btn-default" data-toggle="modal" data-target="#modal-default" style="height: 40px;">
										<i class="fa fa-search" style=" position: absolute;top:10px; left:20px; "></i>
									</button>
			                        <button type="button"  id="clear" class="btn btn-default" style="width: 100px;" style="height: 40px;">Reset</button>
								</div>
                        </div>
                        
                    </div>
                    <div id="old">
                     <div class="form-group">
                        <label for="exampleInputPassword1"></label> 
                     	<input type="hidden" id="empNo" name="empNo"  value="<sec:authentication property='principal.empVO.empNo' />" />
                     </div>
                     <div class="form-group">
                        <label for="exampleInputPassword1">환자명</label> <input
                           type="text"  class="form-control" name="paName" id="paName" style="height:25px;">
                     </div>
                     <div class="form-group">
                        <label for="exampleInputPassword1">환자번호</label> <input
                           type="text" class="form-control" name="paNo" id="paNo" style="height:25px;">
                     </div>
                     <div class="form-group">
                        <label for="exampleInputPassword1">우편번호</label> <input
                           type="text" class="form-control" id="paZip" style="height:25px;">
                     </div>
                     <div class="form-group">
                        <label for="exampleInputPassword1">주소</label> <input
                           type="text" class="form-control" id="paAdd1" style="height:25px;" >
                     </div>
                     <div class="form-group">
                        <label for="exampleInputPassword1">상세주소</label> <input
                           type="text" class="form-control" id="paAdd2" style="height:25px;">
                     </div>
                     <div class="form-group">
                        <label for="exampleInputPassword1">내원 목적</label><input
                           type="text" class="form-control" id="rcpMemo" style="height:25px;">
                     </div>
                     <div class="form-group">
                        <label for="exampleInputPassword1">주민등록번호</label> <input
                           type="text" class="form-control" id="paReg" style="height:25px;">
                     </div>
                     <label for="exampleInputPassword1">진료실</label>
                     <div class="row" style="margin-left:1px;">
                        <select id="select_value" name="select_value" class="form-select form-control" style="width: 240px; font-size:10px;">
                           <option value="1진료실">1진료실</option>
                           <option value="2진료실">2진료실</option>
                        </select> &nbsp;
                        <button type="button" id="docAdd"class="btn btn-primary" style="width: 100px; font-size:10px;">접수</button>
                     </div>
                     </div>
                      <!-- 신규환자 등록 모드  -->
                  <div id="new" style="display: none;">
                  <br>
                  <div class="input-group-append">
						<input name="group1" type="radio" id="radio_1" checked="" value="당일환자">
						<label for="radio_1" style="font-size: 15px;">당일환자</label>
						
						<input name="group1" type="radio" id="radio_2" value="예약">
						<label for="radio_2"  style="font-size: 15px;">예약환자</label>&nbsp;
						 <input type="datetime-local" id="dateTimeLocal" onchange="setMinValue()" style="display: none;">
					</div>
                     <div class="form-group">
                        <label for="exampleInputPassword1"></label> <input
                           type="hidden"  class="form-control"name="empNo"  id="empNo" value="D10001">
                         
                     </div>
                     <div class="form-group">
                        <label for="exampleInputPassword1">환자명</label> <input
                           type="text"  class="form-control" name="paName" id="insertName" style="height:25px;">
                     </div>
                     <div class="form-group">
                        <label for="exampleInputPassword1">주민등록번호</label> <input
                           type="text" class="form-control" id="insertReg" style="height:25px;">
                           <span id="mail_check_input_box_warn"></span>
                     </div>
                     <div class="c-inputs-stacked" id="isCheck" style="display: none">
                     	<div style="display:flex;justify-content:space-between;align-items:center;">
	       					<h4 style="font-size: 1rem;margin:0;">보험여부</h4>
							<input type="checkbox" id="checkbox_1" value="보험가입자">
							<label style="font-size: 1rem;" for="checkbox_123" class="me-30">보험가입자</label>
							<input type="checkbox"  id="checkbox_2"  value="미가입자">
							<label style="font-size: 1rem;" for="checkbox_234" class="me-30">미가입자</label>
						</div>
					</div>
                     <div class="form-group">
                        <label for="exampleInputPassword1">성별</label> <input
                           type="text" class="form-control" name="paSex" id="insertSex" style="height:25px;">
                           <input type="hidden" id="paTrmr">
                     </div>
                     <div class="form-group">
                        <label for="exampleInputPassword1">전화번호</label> <input
                           type="text" class="form-control" name="paPh" id="insertPh" style="height:25px;">
                     </div>
                     <div class="row">
                        <label for="exampleInputPassword1">주소</label> <input
                           type="text" class="form-control" id="insertAdd1"onkeyup="enterkey3()" style="background-color: transparent; width:225px;margin-left:9px; height: 25px;">
                           <button type="button" class="btn btn-default" style="width:80px; height:25px;" onclick="execPostCode();" ><i class="fa fa-search"style=" position: relative;top:-8px;"></i></button>
                     </div>
                     <div class="form-group">
                        <label for="exampleInputPassword1">우편번호</label> <input
                           type="text" class="form-control" id="insertZip" style="height:25px;">
                     </div>
                     <div class="form-group">
                        <label for="exampleInputPassword1">상세주소</label> <input
                           type="text" class="form-control" id="insertAdd2" style="height:25px;">
                     </div>
                     
                     <div class="form-group" id="Enwt">
                        <label for="exampleInputPassword1">등록자</label> <input
                           type="text" class="form-control" id="insertEnwt" value="<sec:authentication property='principal.empVO.empName' />" style="height:25px;">
                     </div>
                     
                     <div class="form-group" id="Upwt" style="display: none;">
                        <label for="exampleInputPassword1">수정자</label> <input
                           type="text" class="form-control" id="updateUpwt" value="<sec:authentication property='principal.empVO.empName' />" style="height:25px;">
                     </div>
                     
                     
                     <button type="button" id="paInsert"class="waves-effect waves-light btn btn-info mb-5" style="width: 100px; font-size: 1rem;position:absolute;top:224px;left:238px;">등록</button>
                     <button type="button" id="paOK"class="waves-effect waves-light btn mb-5 bg-gradient-success" style="width: 100px; font-size: 1rem;position:absolute;top:225px;left:349px;">수정</button>
                     
                     <button type="button" id="cancle2"class="waves-effect waves-light btn btn-danger mb-5" style="width: 100px; display: none; font-size: 1rem;position:absolute;top:224px;left:238px;">취소</button>
                     <button type="button" id="paUpdate"class="waves-effect waves-light btn mb-5 bg-gradient-success" style="width: 100px; display: none; font-size: 1rem;position:absolute;top:225px;left:349px;" >수정완료</button>
                  </div>
                  <!-- 신규 환자 끝 -->
                  
                 <!--================ 제증명 모드 ================================== -->
                  <div id="Proof" style="display: none;">
                  <br />
                  <br />
                  <div style="margin-left: 44px;">
	                <input type="date" id="ctfDate" >―<input id="paDate" type="date">
	                <label>Show 
					    <select id="selectDocument"name="complex_header_length" aria-controls="complex_header" class="form-select form-control-sm">
					 			<option value="전체">-전 체-</option>
					            <option value="소견서">-소견서-</option>
					            <option value="진단서">-진단서-</option>
					            <option value="처방전">-처방전-</option>
					    </select>
					</label>
					<button id="inquiry" type="button" class="waves-effect waves-light btn btn-primary mb-5" style="">조회</button>
				</div>
                  <br />
                  <br />
                  	 <div class="card-header">
                     	<h3>제증명 내역</h3>
                     	<button type="button"  id="myBtn-right" class="waves-effect waves-light btn btn-info mb-5" data-toggle="modal" data-target="#modal-right" style="position: absolute;left:170px;">제증명 신청</button>
                     </div>
	                   <div class="scrollDiv" style="width:100%; height:360px; overflow:auto; overflow-y:scroll; ">
							<table id="eventTable" class="table editable-table table-bordered table-separated dataTable" width="100%" cellspacing="0" cellpadding="0" style="text-align: center;">
							  <thead>
								<tr>
									<th style="width:180px;">구분</th>
									<th style="width:180px;">성명</th>
									<th style="width:90px;">처방일</th>
									<th style="width:180px;">담당의</th>
									<th style="width:70px;">상태</th>
									<th>출력</th>
								</tr>
								</thead>
								  <tbody id="breakdown">
								   
									
						          </tbody>
						
							</table>
						</div>
                  </div>
                  <!-- 제증명모드 끝 -->
                  </div>
                 
            <!-- card-body 끝 -->
            </div>
         </div>
         
			<div class="col-md-4">
				<div class="card card-success" style=" height: 370px; text-align: center">
					<div class="card-header"style="height:67px;">
						<div>
							<button id="holdList" class="waves-effect waves-light btn btn-dark btn-flat mb-5 active" style="background-color:#15243e;"><h4 class="box-title text-info mb-0"><i class="ti-user me-15"></i>대기 환자 목록</h4></button>
						</div>
						
						<div style="position: absolute; margin-left: 200px; display: flex; align-items: center; ">
							<button id="watingList" class="waves-effect waves-light btn btn-dark btn-flat mb-5" ><h4 class="box-title text-info mb-0"><i class="ti-user me-15"></i>예약 환자 목록</h4></button>
							<input type="date" id="paDt" style="display: none;">	
							<button  type="button" class="waves-effect waves-light btn btn-primary mb-5" id="allWating" style="display: none;">전체 조회</button>
						</div>
					</div>
					
					
					<div id="holdDiv" class="scrollDiv" >
						<div class="scrollDiv" style="width:100%; height:270px;  overflow:auto; overflow-y:scroll;">
							<table id="eventTable"class="table editable-table table-bordered table-separated dataTable" width="100%" cellspacing="0" cellpadding="0" style="text-align: center; font-size:1rem;">
							  <thead>
								<tr>
									<th>No</th>
									<th>환자번호</th>
									<th style="width:100px;">이름</th>
									<th style="width:100px;">상태</th>
								</tr>
								</thead>
								  <tbody id="hold">
	
						             </tbody>
						
							</table>
						</div>
					
					</div>
					
					<div id="watingDiv" class="scrollDiv" style="display: none;">
						<div class="scrollDiv" style="width:100%; height:370px; overflow:auto; overflow-y:scroll;">
						<table class="table editable-table table-bordered table-separated dataTable" width="100%" cellspacing="0" cellpadding="0" style="text-align: center; font-size:1rem;">
							<thead>
								<tr>
									<th>No</th>
									<th>환자번호</th>
									<th>예약일자</th>
									<th style="width:100px;">이름</th>
								</tr>
							</thead>
							<tbody id="paDtTable">
								
							</tbody>
						</table>
		
						</div>
					
					</div>
						
				</div>

				<div class="card card-danger" style=" height: 370px;  text-align: center">
					<div class="card-header">
						<h4 class="box-title text-info mb-0"><i class="fa fa-fw fa-stethoscope me-15"></i>1진료실</h4>
					</div>
					<div class="scrollDiv"style="width:100%; height:370px; overflow:auto; overflow-y:scroll;">
					<div id="disp1"></div>
					
					</div>
				</div>
			</div>

		<div class="col-md-4">
			<div class="card card-success" style=" height: 370px; width:550px; text-align: center">
					<div class="card-header">
						<h4 class="box-title text-info mb-0"><i class="ti-user me-15"></i>방문 환자</h4>
					</div>
					<div class="card card-success" id="chart_div3" style="position: absolute; left: 27px; top:70px; border:none;" ></div>
				
			</div>
	<!-- ===========================  2진료실 환자 보여주는  UI=========================== -->
			<div class="card card-danger" style=" height: 370px; width:550px; text-align: center;">
					<div class="card-header">
						<h4 class="box-title text-info mb-0"><i class="fa fa-fw fa-stethoscope me-15"></i>2진료실</h4>
					</div>
					<div class="scrollDiv" style="width:100%; height:300px; overflow:auto; overflow-y:scroll;">
					<div id="disp2">
					
					</div>
					</div>
			</div>
		</div>
<!-- 				<div class="col-md-3"> -->
<!-- 					달력 -->
<!-- 					<div class="card card-success" style="height: 500px; "> -->
<!-- 						<div class="card-header">	 -->
<!-- 							<h4 class="box-title text-info mb-0"><i class="fa fa-calendar" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;Calendar</h4> -->
							
<!-- 						</div> -->
<!-- 						<div id="calendar" class="fc fc-unthemed fc-ltr" style="height: 700px;"></div> -->
						
<!-- 					</div> -->
					
<!-- 					</div> -->
				</div>
				
				</div>
			<input type="hidden" id="ctfState" value="대기">
			
<!--=================== 모달 시작 ===========-->
		<div class="modal fade" id="modal-default" aria-hidden="true" role="dialog" style="display: none; z-index: 1100; " >
			  <div class="modal-dialog modal-default">
				<div class="modal-content">
				  <div class="modal-header">
					<h4 class="modal-title">환자 검색 결과</h4>
				  </div>
				  <div class="modal-body">
						<!-- 검색 영역 시작 -->
						
						<div class="scrollDiv" style="width:100%; height:200px; overflow:auto; overflow-y:scroll;">
						<table class="table editable-table table-bordered table-separated dataTable" width="100%" cellspacing="0" cellpadding="0" style="text-align: center; ">
							<thead>
								<tr>
									<th>No</th>
									<th>환자번호</th>
									<th style="width:100px;">이름</th>
									<th>주민번호</th>
								</tr>
							</thead>
							<tbody id="paData">
								
							</tbody>
						</table>
						</div>
						<!-- 결과 영역 끝 -->
				  </div>
				  <div class="modal-footer" style="display:flex;justify-content:flex-end;">
					<button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
				  </div>
				</div>
				<!-- /.modal-content -->
			  </div>
			  <!-- /.modal-dialog -->
		  </div>
  <!--=================== 모달 끝 ===========-->
  
  <!-- 제증명 신청 모달  시작-->
   <!-- 오른쪽 -->
 <div class="modal modal-right fade show" id="modal-right" style="display: none;" aria-modal="true" role="dialog">
	  <div class="modal-dialog" style="width: 700px;">
<!-- 		<div class="modal-content"> -->
		<div class="modal-content" style="white">
		  <div class="modal-header">
			<h5 class="modal-title">제증명 신청</h5>
		  </div>
		  <div id="dropId"class="modal-body" style="font-size:18px;font-weight: 900; color:white;">
		  <!-- 제증명 신청 -->
					<div class="card card-danger" style="height: 700px;">
						<div class="card-header">
							<h4 class="box-title text-info mb-0"><i class="fa fa-fw fa-file-text-o me-15"></i>제증명 신청</h4>
							<div class="input-group-append">
                           	<input type="text" id="search" onkeyup="enterkey2()"  class="form-control form-control-lg2"
									placeholder="환자 검색" style="height:40px;">
								<div class="input-group-append">
									<button type="button" id="btnSearch2"  class="btn btn-lg btn-default" data-toggle="modal" data-target="#modal-default2" style="height:40px;">
										<i class="fa fa-search" style="position: absolute;top:35px; left:480px;"></i>
									</button>
									   <div class="btn-group mb-5">
										  <button type="button"  class="waves-effect waves-light btn btn-dark">Doctor</button>
										  <button type="button"  onclick="dp_menu()" id="split" class="waves-effect waves-light btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
											<span class="caret"></span>
											<span class="sr-only">Toggle Dropdown</span>
										  </button>
										  <div id="drop-content"   class="dropdown-menu"  data-popper-placement="bottom-end">
											
											
										  </div>
										</div>
								</div>
                       		 </div>
						</div>
						<div class="card-body">
								<br>
			                     <div class="row">
			                        <label for="exampleInputPassword1">의사명</label> <input
			                           type="text" class="form-control" id="empName" style=" margin-left: 8px;">
			                     </div>
			                     <br>
			                     <div class="form-group">
			                        <label for="exampleInputPassword1">환자명</label> <input
			                           type="text" class="form-control" id="ctfName">
			                     </div>
			                     <br>
			                     <div class="form-group">
			                        <label for="exampleInputPassword1">신청 사유</label> <input
			                           type="text" class="form-control" id="ctfPast">
			                     </div>
			                     <br>
			                     <div class="form-group">
			                        <label for="exampleInputPassword1">환자번호</label> <input
			                           type="text" class="form-control" id="ctfNo">
			                     </div>
			                     <br>
			                     <label for="exampleInputPassword1">제증명 구분</label>
			                     <div class="row">
			                        <select id="ctfSelect" name="ctfSelect" class="form-select form-control" style="width: 240px; margin-left: 8px;">
						              <option value="전체">-전 체-</option>
							          <option value="소견서">-소견서-</option>
							          <option value="처방전">-처방전-</option>
							          <option value="진단서">-진단서-</option>
			                        </select> &nbsp;
			                        <button type="button" id="ctfInsert"class="btn btn-primary" style="width: 100px;">등 록</button>
			                     </div>
							</div>
						</div>
		  </div>
		  <div class="modal-footer modal-footer-uniform" style="display:flex;justify-content:flex-end;">
			<button type="button" class="btn btn-danger" data-bs-dismiss="modal" style="width: 200px;">닫기</button>
		  </div>
		</div>
	  </div>
	</div>
  
<!-- 모달 끝-->
  
  <!-- 제증명 신청 모달  끝-->
  
  <!-- 처방전 -->
  <div  class="modal center-modal fade" id="modal-prescription" aria-hidden="true" role="dialog" style="display: none;">
	  <div class="modal-dialog" >
		<div class="modal-content" style="width: 830px; margin-left:-180px;">
		  <div class="modal-header">
			<h5 class="modal-title">Modal title</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body" style="background-color:white;">
			<div style="width: 200%; height: 100%;" id="docuForm">
						<%@include file="/WEB-INF/views/document/jaPrescription.jsp"%>
	
			</div>
		  </div>
		  <div class="modal-footer modal-footer-uniform" style="display:flex;justify-content:flex-end;">
			<button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
			<button id="prescription" type="button" class="btn btn-primary float-end">-출 력- </button>
		  </div>
		</div>
	  </div>
	</div>
  <!-- 처방전 끝 -->
  
  <!-- 진단서 -->
  <div class="modal center-modal fade" id="modal-diagnosis" aria-hidden="true" role="dialog" style="display: none;">
	  <div class="modal-dialog" >
		<div class="modal-content" style="width: 830px; margin-left:-180px;">
		  <div class="modal-header">
			<h5 class="modal-title">Modal title</h5>
			<button   type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body" style="background-color:white;">
			<div style="width: 200%; height: 100%;" id="docuForm">
						<%@include file="/WEB-INF/views/document/jaDiagnosis.jsp"%>
	
			</div>
		  </div>
		  <div class="modal-footer modal-footer-uniform" style="display:flex;justify-content:flex-end;">
			<button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
			<button id="diagnosis"  type="button" class="btn btn-primary float-end">-출 력- </button>
		  </div>
		</div>
	  </div>
	</div>
  <!-- 진단서 끝 -->
  
  <!-- 소견서 -->
  <div  class="modal center-modal fade" id="modal-opinion" aria-hidden="true" role="dialog" style="display: none;">
	  <div class="modal-dialog" >
		<div class="modal-content" style="width: 830px; margin-left:-180px;">
		  <div class="modal-header">
			<h5 class="modal-title">Modal title</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body" style="background-color:white;">
					<%@include file="/WEB-INF/views/document/jaNote.jsp"%>

<%-- 						<jsp:include page="/WEB-INF/views/Administrative/answerNote.jsp"></jsp:include> --%>
		  </div>
		  <div class="modal-footer modal-footer-uniform" style="display:flex;justify-content:flex-end;">
			<button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
			<button id="savePdfBtn" type="button" class="btn btn-primary float-end">-출 력- </button>
		  </div>
		</div>
	  </div>
	</div>
  <!-- 소견서 끝 -->
 
<script type="text/javascript">
let dateElement = document.getElementById('dateTimeLocal');
let date = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, -5);
dateElement.value = date;
dateElement.setAttribute("min", date);



function setMinValue() {
    if(dateElement.value < date) {
        alert('현재 시간보다 이전의 날짜는 설정할 수 없습니다.');
        dateElement.value = date;
    }
}



function enterkey() {
	if (window.event.keyCode == 13) {
		let str = $(".form-control-lg").val();
		let cnt=1;
// 		alert(str);
		
		// JSON 형식으로 데이터가 넘어오기 때문에 JSON("key","value")로 변수 할당해야한다.
		let data = {"paName":str};
		console.log("data : " + JSON.stringify(str));
		$(".list-group").empty();
		$("#paData").empty();
		
		let header="${_csrf.headerName}";
//			let token = "${_csrf.token}";
//			console.log("header : "+ header + ", token : "+ token );
		//아작났어유..피씨다타써
		//contentType : 가즈아
		//dataType : 드루와
		$.ajax({
			url:"/medical/searchPa",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			dataType:"json",
			type:"post",
			beforeSend:function(xhr){
		           xhr.setRequestHeader(header,token);
			},
			success:function(result){
				console.log("성공");
				//전역 변수에 넣음
				patientVOList = result;
				if(result == 0){
					$("#paData").append('<td colspan="4" style="text-align: center;"><h3 style="font-size:1rem">검색 결과가 없습니다.</h3></td>');
				}
				$.each(result,function(index,item){
					console.log("숫자 : " + item.num);
					console.log("수진자 : " + item.paName);
					var paNo = "'"+item.paNo+"'";
					console.log(paNo)
					let cont = item.content + "...";
					
					let content = "";
					content += "<tr>";
					content += "<td>"+(index+1)+"</td>";
					content += "<td>"+item.paNo+"</td>";
					content += '<td><a href="javascript:fn_go('+paNo+')">'+item.paName+"</a></td>";
					content += "<td>"+item.paReg+"</td>";
					content += "</tr>";
					
					$("#paData").append(content);	
						
				});
			}
		});
        $("#modal-default").modal("show");
    }
}


function enterkey2() {
	if (window.event.keyCode == 13) {
		 let str = $(".form-control-lg2").val();
			let cnt=1;
// 			alert(str);
			
			// JSON 형식으로 데이터가 넘어오기 때문에 JSON("key","value")로 변수 할당해야한다.
			let data = {"paName":str};
			console.log("data : " + JSON.stringify(str));
			$(".list-group").empty();
			$("#paData").empty();
			
			let header="${_csrf.headerName}";
//			let token = "${_csrf.token}";
//			console.log("header : "+ header + ", token : "+ token );
			//아작났어유..피씨다타써
			//contentType : 가즈아
			//dataType : 드루와
			$.ajax({
				url:"/medical/searchPa",
				contentType:"application/json;charset=utf-8",
				data:JSON.stringify(data),
				dataType:"json",
				type:"post",
				beforeSend:function(xhr){
			           xhr.setRequestHeader(header,token);
				},
				success:function(result){
					console.log("성공");
					//전역 변수에 넣음
					patientVOList = result;
					if(result == 0){
						$("#paData").append('<td colspan="4" style="text-align: center;"><h3 style="font-size:1rem">검색 결과가 없습니다.</h3></td>');
					}
					$.each(result,function(index,item){
						console.log("숫자 : " + item.num);
						console.log("수진자 : " + item.paName);
						var paNo = "'"+item.paNo+"'";
						console.log(paNo)
						let cont = item.content + "...";
						
						let content = "";
						content += "<tr>";
						content += "<td>"+(index+1)+"</td>";
						content += "<td>"+item.paNo+"</td>";
						content += '<td><a href="javascript:fn_goDocument('+paNo+')">'+item.paName+"</a></td>";
						content += "<td>"+item.paReg+"</td>";
						content += "</tr>";
						
						$("#paData").append(content);	
							
					});
				}
			});
	        $("#modal-default").modal("show");
    }
}

function enterkey3() {
	if (window.event.keyCode == 13) {
		execPostCode();
		
	}
}
const cdisp1 = document.querySelector("#disp1");
const cdisp2 = document.querySelector("#disp2");
let header = "${_csrf.headerName}";
let token  = "${_csrf.token}";
let tr;
let patientVOList;
let watingVOList;
let patrmr ="";
let empVOList;
function docList(){
	let jobGubun = "의사";
	let data ={"jobGubun": jobGubun};
	$.ajax({
		url:"/medical/docList",
		contentType :'application/json;charset=UTF-8',
		data:JSON.stringify(data),
		dataType: "json" ,
		type:"post",
		beforeSend:function(xhr){
	           xhr.setRequestHeader(header,token);
		},
		success:function(result){
			console.log("docList:",result);
			empVOList = result;
			$.each(result,function(index,item){
				let content = "";
				var docNo = "'"+item.empNo+"'";
				console.log("의사"+docNo);
				content += '<a onclick="dropClose();" class="dropdown-item" href="javascript:doc_list('+docNo+')" >'+item.empName+'의사</a>';
				$("#drop-content").append(content);
			});
		}
	});
	
	
}

function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("#insertZip").val(data.zonecode);
           $("#insertAdd1").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}

function dp_menu(){
    let click = document.getElementById("drop-content");
    if(click.style.display === "none"){
        click.style.display = "block";
        

    }else{
        click.style.display = "none";
    }
}

function dropClose(){

	let click = document.getElementById("drop-content");
	click.style.display = "none";
	
}

function holdOffice(){
	let one=1;
	$.ajax({
		url:"/medical/holdOffice",
		type:"get",
		beforeSend:function(xhr){
	           xhr.setRequestHeader(header,token);
		},
		success:function(result){
			console.log("holdOffice:",result);
			$.each(result,function(index,item){
				patientVOList = result;
				let count=1;
				var paNo = "'"+item.paNo+"'";
				if(item.paState == "대기중"){
					let content = "";
					content += "<tr id="+item.paNo+">";
					content += "<td>"+one+"</td>";
					content += "<td>"+item.paNo+"</td>";
					content += '<td><a href="javascript:fn_go('+paNo+')">'+item.paName+"</a></td>";
					content += "<td>"+item.paState+"</td>";
					content += "</tr>";
					$("#hold").append(content);
					one++;
				}
			});
		}
	})
	
}


// 	 화면 보여주기 
function officeOne(){
		
		let office= document.getElementById('select_value');
		let docNo= (office.options[office.selectedIndex].value);
		console.log("진료실 번호 : "+docNo);
		let result ={"docNo":docNo};
		let paState="진료중";
		result ={"docNo":docNo,
						 "paState":paState};
		let hold="대기";
	   $.ajax({
	      url:"/medical/OnelistOffice",
	      contentType :'application/json;charset=UTF-8',
	      data:JSON.stringify(result),
		  dataType:"json",
	      type:"post",
	      beforeSend:function(xhr){
	           xhr.setRequestHeader(header,token);
		},
	      success:function(doOffice){
	    	 let add=1;
	         console.log("1진료실 :",doOffice);
// 	         let docNo= doOffice[0].doVO.docNo;
	        	 let tblStr = "<table class='table editable-table table-bordered table-separated dataTable' width='100%' cellspacing='0' cellpadding='0' style='text-align: center;font-size:1rem;'>";
		         tblStr += "<tr><th>No</th><th>환자번호</th><th>전달</th><th style='width:100px;'>이름</th><th style='width:100px;'>상태</th></tr>"
		         let cnt=1;
		         tr="<tr>"
	         if(doOffice == 0){
				tblStr += '<td colspan="5" style="text-align: center;"><h1 style="font-size:1rem">환자가 없습니다.</h1></td>';
		         cdisp1.innerHTML=tblStr;
	         }
		         for(let i=0; i<doOffice.length; i++){
		        	 for(let j=0; j<doOffice[i].doVO.length; j++){
		        		 tr="<tr>"
		        		 if(doOffice[i].paState == "대기중" || doOffice[i].paState == "진료완료" || doOffice[i].paState == "처치완료" || doOffice[i].paState == "검사완료"){
// 		        			tr="<tr style='background-color:#6495ED;'>"
				            tblStr += tr
				            tblStr += "<td>"+cnt+"</td>"
				            tblStr += "<td>"+doOffice[i].paNo+"</td>"
				            tblStr += "<td>"+doOffice[i].rcpVO[j].rcpMemo+"</td>"
				            tblStr += "<td>"+doOffice[i].paName+"</td>"
				            tblStr += "<td class="+cnt+">"+doOffice[i].paState+"</td>"
				            tblStr += "</tr>"
				            	cnt++;
		        		 }else if(doOffice[i].paState == "진료중"){
		        			 tr="<tr style='background-color:#000000;'>"
		         			 	tblStr += tr
		         				tblStr += "<td>"+cnt+"</td>"
		      		            tblStr += "<td>"+doOffice[i].paNo+"</td>"
		      		            tblStr += "<td>"+doOffice[i].rcpVO[j].rcpMemo+"</td>"
		      		            tblStr += "<td>"+doOffice[i].paName+"</td>"
		      		            tblStr += "<td>"+doOffice[i].paState+"</td>"
		      		            tblStr += "</tr>"
		      		          	cnt++;
		        		 }
		        	 }
		         }
		         tblStr += "</table>";
		         
		         cdisp1.innerHTML=tblStr;
		         
	        
	        
	      }
	   });
	}
	


// 2진료실 화면 보여주기 
function officeTwo(){
		
	let value = $('#select_value').find('option').map(function() {return $(this).val();}).get()
	value.splice(0,1);
// 	console.log("splice : "+ value);
	let docNo = "2진료실";
	let paState="진료중";
	let result ={"docNo":docNo,
				 "paState":paState};
// 	$.each(value, function(p_inx,p_arg){
// 		console.log("p_arg :"+p_arg);
// 	});
	console.log("result :"+result);

	

	let hold="대기";
//		console.log(result);
//		console.log("asdasd");
   $.ajax({
      url:"/medical/TwolistOffice",
      contentType :'application/json;charset=UTF-8',
      data:JSON.stringify(result),
	  dataType:"json",
      type:"POST",
      beforeSend:function(xhr){
          xhr.setRequestHeader(header,token);
	},
      success:function(doOffice2){
         console.log("2진료실 :",doOffice2);
//          console.log("데이터 이름:"+doOffice2[1].paName);
         	let tblStr = "<table class='table editable-table table-bordered table-separated dataTable' width='100%' cellspacing='0' cellpadding='0' style='text-align: center; font-size:1rem;'>";
         	tblStr += "<tr><th>No</th><th>환자번호</th><th>전달</th><th style='width:100px;'>이름</th><th style='width:100px;'>상태</th></tr>"
         	let number=1;
         	if(doOffice2 == 0){
				tblStr += '<td colspan="5" style="text-align: center;"><h1 style="font-size:1rem">환자가 없습니다.</h1></td>';
		         cdisp1.innerHTML=tblStr;
	         }
         for(let i=0; i<doOffice2.length; i++){
        	 for(let j=0; j<doOffice2[i].doVO.length; j++){
        		 if(doOffice2[i].paState == "진료중"){
        			tr="<tr style='background-color:#000000;'>"
		            tblStr += tr
		            tblStr += "<td>"+number+"</td>"
		            tblStr += "<td>"+doOffice2[i].paNo+"</td>"
		            tblStr += "<td>"+doOffice2[i].rcpVO[j].rcpMemo+"</td>"
		            tblStr += "<td>"+doOffice2[i].paName+"</td>"
		            tblStr += "<td>"+doOffice2[i].paState+"</td>"
		            tblStr += "</tr>"
		            number++;
        		 }else if(doOffice2[i].paState == "대기중" || doOffice2[i].paState == "진료완료" ||doOffice2[i].paState == "처치완료" || doOffice2[i].paState == "검사완료"){
        			 tr="<tr>"
        			 	tblStr += tr
        				tblStr += "<td>"+number+"</td>"
     		            tblStr += "<td>"+doOffice2[i].paNo+"</td>"
     		            tblStr += "<td>"+doOffice2[i].rcpVO[j].rcpMemo+"</td>"
     		            tblStr += "<td>"+doOffice2[i].paName+"</td>"
     		            tblStr += "<td>"+doOffice2[i].paState+"</td>"
     		            tblStr += "</tr>"
     		            number++;
        		 }
        	 }
         }
	         tblStr += "</table>";
	         
	         cdisp2.innerHTML=tblStr;
	         
        
        
      }
   });
}
// 제증명 신청 내역
function ctfOrder(){
	let ctfState = "대기";
	let data ={"ctfState": ctfState};
	$.ajax({
		url:"/medical/ctfOrder",
		contentType :'application/json;charset=UTF-8',
		data:JSON.stringify(data),
		dataType: "json" ,
		type:"post",
		beforeSend:function(xhr){
	           xhr.setRequestHeader(header,token);
		},
		success:function(result){
			console.log("ctfOrder:",result);
			$.each(result,function(index,item){
				
					var ctf_gubun = "'"+item.ctfGubun+"'";
					let content = "";		
					let pres ="처방전";
					let diag = "진단서";
					let note = "소견서";
					let tr="";
					if(item.ctfState == "대기"){
						 tr="<tr style='background-color:#000000;'>";
					}else{
						tr="<tr>";
					}
					content += tr;
					if(item.ctfGubun =='pres'){
						content += "<td>"+pres+"</td>";
					}else if(item.ctfGubun =='diag'){
						content += "<td>"+diag+"</td>";
					}else{
						content += "<td>"+note+"</td>";
					}
					content += "<td>"+item.ctfName+"</td>";
					content += "<td>"+fn_getInsertDate2(item.ctfEndt)+"</td>";
					content += "<td>"+item.empName+"</td>";
					content += "<td>"+item.ctfState+"</td>";
					if(item.ctfGubun =='pres'){
						content += '<td><button type="button" onclick="prescription('+ item.paNo+','+ctf_gubun+')" class="waves-effect waves-light btn btn-primary mb-5" style="margin-left: 0px; font-size:8px;" id="btnDocu"  data-bs-toggle="modal"  data-bs-target="#modal-prescription">선택</button></td>';
						
					}else if(item.ctfGubun =='diag'){
						content += '<td><button type="button" onclick="diagnosis('+ item.paNo+','+ctf_gubun+')" class="waves-effect waves-light btn btn-primary mb-5" style="margin-left: 0px; font-size:8px;" id="btnDocu"  data-bs-toggle="modal"  data-bs-target="#modal-diagnosis">선택</button></td>';
					}else{
						content += '<td><button type="button" onclick="note('+ item.paNo+','+ctf_gubun+')" class="waves-effect waves-light btn btn-primary mb-5" style="margin-left: 0px; font-size:8px;" id="btnDocu"  data-bs-toggle="modal"  data-bs-target="#modal-opinion">선택</button></td>';
					}
					content += "</tr>";
					$("#breakdown").append(content);
			});
		}
	});
	
}

function prescription(p_arg,ctf){
	let paNo = p_arg;
	let ctfGubun = ctf;
	let data ={"paNo":paNo,
				"docuCd":ctfGubun}
	console.log("detail",data);
	$.ajax({
		url:"/medical/prescription",
		contentType :'application/json;charset=UTF-8',
		data:JSON.stringify(data),
		dataType: "json" ,
		type:"post",
		beforeSend:function(xhr){
	           xhr.setRequestHeader(header,token);
		},
		success:function(result){
			console.log("처방전:",result);
			if(result !=0){
				$("#jaPreName").text("");
				$("#jaPreName").text("김현석");
			}
			$.each(result,function(i,item){
				console.log("paName : " + item.paName);
				console.log("paReg : " + item.paReg);
				$("#preName").val(item.paName);
				$("#preReg").val(item.paReg);
				
				$.each(item.presVO,function(j,gitem){
					console.log("drCd : " + gitem.drCd);
					console.log("preCnt : " + gitem.preCnt);
					console.log("preDays : " + gitem.preDays);
					console.log("preShot : " + gitem.preShot);
					$("#drCd").val(gitem.drCd);
					$("#preCnt").val(gitem.preCnt);
					$("#preDays").val(gitem.preDays);
					$("#preShot").val(gitem.preShot);
				});
				$.each(item.drgVO,function(a,aitem){
					console.log("drCd : " + aitem.drName);
					$("#drName").val(aitem.drName);
				});
			});
		}
		
			
	});
	
}

function diagnosis(p_arg,ctf){
	let paNo = p_arg;
	let ctfGubun = ctf;
	let data ={"paNo":paNo,
				"docuCd":ctfGubun}
	console.log("detail",data);
	$.ajax({
		url:"/medical/diagnosis",
		contentType :'application/json;charset=UTF-8',
		data:JSON.stringify(data),
		dataType: "json" ,
		type:"post",
		beforeSend:function(xhr){
	           xhr.setRequestHeader(header,token);
		},
		success:function(result){
			console.log("진단서:",result);
			if(result !=0){
				$("#jDacharge").text("김현석");
			}
			//item : PatientVO
			$.each(result,function(i,item){
				$("#diaName").val(item.paName);
				$("#diaSex").val(item.paSex);
				$("#diaReg").val(item.paReg);
				$("#diaAdd").val(item.paAdd1);
				$("#diaAge").val(fn_getAge(item.paReg));
				console.log("paAdd1 : " + item.paAdd1);
				console.log("paName : " + item.paName);
				console.log("paReg : " + item.paReg);
				console.log("paSex : " + item.paSex);
				console.log("paZip : " + item.paZip);
				$.each(item.diaVO,function(j,gitem){
					$("#disCd").val(gitem.disCd);
					$("#diaDt").val(fn_getInsertDate(gitem.diaDt));
					$("#diaEndt").val(fn_getInsertDate(gitem.diaEndt));
					$("#diaCont").val(gitem.diaCont);
					$("#diaUse").val(gitem.diaUse);
					
					console.log("diaCont : " + gitem.diaCont);
					console.log("diaDt : " + fn_getInsertDate(gitem.diaDt));
					console.log("diaEndt : " + fn_getInsertDate(gitem.diaEndt));
					console.log("diaUse : " + gitem.diaUse);
					console.log("disCd : " + gitem.disCd);
				});
			});
		}
		
		
	});
	
}

function note(p_arg,ctf){
	let paNo = p_arg;
	let ctfGubun = ctf;
	let data ={"paNo":paNo,
				"docuCd":ctfGubun}
	console.log("detail",data);
	$.ajax({
		url:"/medical/note",
		contentType :'application/json;charset=UTF-8',
		data:JSON.stringify(data),
		dataType: "json" ,
		type:"post",
		beforeSend:function(xhr){
	           xhr.setRequestHeader(header,token);
		},
		success:function(result){
			console.log("소견서:",result);
			if(result !=0){
				$("#jAcharge").text("김현석");
			}
			$.each(result, function(i, item){
				console.log("paAdd1:"+item.paAdd1);
				console.log("paName:"+item.paName);
				console.log("paReg:"+item.paReg);
				console.log("paSex:"+item.paSex);
				$("#noName").val(item.paName);
				$("#noSex").val(item.paSex);
				$("#noReg").val(item.paReg);
				$("#noAge").val(fn_getAge(item.paReg));
				$("#noAdd").val(item.paAdd1);
				
				$.each(item.noteVO, function(j, gitem){
					console.log("ntUse:"+gitem.ntUse);
					console.log("ntView:"+gitem.ntView);
					$("#ntView").val(gitem.ntView);
					$("#ntUse").val(gitem.ntUse);
				});
				
				$.each(item.fileVO, function(h, hitem){
					console.log("fileName :"+hitem.fileName);
					var img_html = "";
						img_html +="<img src=/resources/upload" + hitem.fileName + " style='width:80%; height:90%; margin-left:-450px; margin-bottom:480px;' />"
					$("#noteImg").append(img_html);
				});
				
			});
		}
		
		
	});
	
}

//나이 구하는 함수
function fn_getAge(geta){
	let current = 122;
	let pa = geta.substr(0,2);
	
	if(geta.substr(0,1) == 0){
		pa = "1" + pa;
	}
	
	let age = (current-pa) + 1;
	
	return age;
	
}

function wating(){
	let result={"paRes":null};
	 $.ajax({
	      url:"/medical/reservation",
	      contentType :'application/json;charset=UTF-8',
	      data:JSON.stringify(result),
		  dataType:"json",
	      type:"post",
	      beforeSend:function(xhr){
	           xhr.setRequestHeader(header,token);
		  },
 	      success:function(reservation){
	         console.log("예약환자 :"+reservation);
	         $("#paDtTable").empty();
	     	$.each(reservation,function(index,item){
	     		console.log("예약환자 :",item);
	     		var paNo = "'"+item.paNo+"'";
	     		watingVOList = reservation;
				let content = "";
				content += "<tr>";
				content += "<td>"+(index+1)+"</td>";
				content += "<td>"+item.paNo+"</td>";
				content += "<td>"+fn_getInsertDate(item.paRes)+"</td>";
				content += '<td><a href="javascript:fn_wating('+paNo+')">'+item.paName+"</a></td>";
				content += "</tr>";
				$("#paDtTable").append(content);
				
			});
	      }
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

function getHide(){
	document.getElementById("allSearch").style.display = "none";
	
}



$(function() {
	// 주민등록번호 확인 
	const inputId = document.getElementById("insertReg");
	inputId.focus();
	
	$("#insertReg").on("focusout", function(){
// 		alert("aaa"+$("#insertReg").val());
		let inReg = $("#insertReg").val();
		$("#isCheck").show();
		var result1 = inReg.slice(0,8);
		console.log("체크체크1"+result1);
		let data = {"inReg" : result1 }
		console.log("체크체크2",data);
		
		var checkResult = $("#mail_check_input_box_warn");
		$.ajax({
  			 url:"/medical/inCheck",
  		      contentType :'application/json;charset=UTF-8',
  		      data:JSON.stringify(data),
  			  dataType:"json",
  		      type:"post",
  		      beforeSend:function(xhr){
  		           xhr.setRequestHeader(header,token);
  			},
  		      success:function(result){
  		    	console.log(result);
  		    	if(Object.keys(result).length !=0){
  		    		checkResult.html("보험가입자 입니다.");
  		 	        checkResult.css("color","#3366CC");
  		 	     $("input:checkbox[id='checkbox_1']").prop("checked", true); 
  		 	     $("input:checkbox[id='checkbox_2']").prop("checked", false); 
  		 	     	
  		    	}else{
  		    		checkResult.html("보험미가입자 입니다.");
  		    		checkResult.css("color","#FF0000");
  		    		$("input:checkbox[id='checkbox_1']").prop("checked", false);
  		    		$("input:checkbox[id='checkbox_2']").prop("checked", true);
  		    	}
		        	
  		      }
  		});	
		

		
     });
	
// 	$("#paReg").focusout();
	
	
	
	google.load("visualization", "1", {
		"packages" : [ "corechart" ]
	});
	
	google.setOnLoadCallback(drawChart3);

	function drawChart3() {
		let jsonData = $.ajax({
			url : "/medical/chart03",
			dataType : "json",
			async : false
		}).responseText;
		console.log("jsonData33333 : " ,JSON.parse(jsonData));
		console.log("ssdd"+JSON.parse(jsonData)[0]['MAX(RCP_FV)']);
		console.log("ssdd"+JSON.parse(jsonData)[0]['MAX(RCP_ME)']);
		// 데이터 테이블 생성
		  var data = google.visualization.arrayToDataTable([
	          ['name', 'score'],
	          ['초진',     JSON.parse(jsonData)[0]['MAX(RCP_FV)'] *1],
	          ['재진',     JSON.parse(jsonData)[0]['MAX(RCP_ME)'] * 1]
	        ]);
		// 차트를 출력할 div 선택(PieChart, LineChart, ColumnChart)
		let chart = new google.visualization.PieChart(document
				.getElementById("chart_div3"));

		var options = {
			title : "초/재진 환자 수",
			curveType : "function",
			width : 520,
			height : 250,
			maintainAspectRatio: false,
			
			hAxis : {
				title : '가로축',
				textStyle : {
					color : '#FFF'
				}
			},  
			titleTextStyle : {
				color : 'white' // 타이틀 색
			},
			vAxis : {
				title : '세로축',
				textStyle : {
					color : '#FFF'
				}
			},
			series : { // 선색
				0 : {
					color : '#3596F7'
				},
				1 : {
					color : '#3596F7'
				}
			},
			legend : { // 항목
				textStyle : {
					fontSize : 14,
					color : 'white'
				}
			},

			backgroundColor : {
				fill : '#0C1A32',
			}

		};

		// 차트객체(chart).draw(데이터테이블(data), 옵션)
		chart.draw(data, options);
	}
	let today = new Date();   

	let year = today.getFullYear(); // 년도
	let month = today.getMonth() + 1;  // 월
	let date = today.getDate();  // 날짜
	let day = today.getDay();  // 요일
	$("#holdList").on("click",function(){
		$("#watingDiv").hide();
		$("#paDt").hide();
		$("#allWating").hide();
		$("#holdDiv").show();
		$(this).addClass("active");
 		$("#watingList").removeClass("active")
	});
	
	$("#watingList").on("click",function(){
		$("#watingDiv").show();
		$("#paDt").show();
		$("#allWating").show();
		$("#holdDiv").hide();
		$(this).addClass("active");
 		$("#holdList").removeClass("active")
	});
	
	docList();
	 let myWindow;
	 $("#myBtn-right").on("click",function(){
		 	console.log("modal");
// 		 	myWindow = window.open('http://192.168.142.26/medical/receipt', '네이버팝업', 'width=700px,height=800px,scrollbars=yes');
	        $("#modal-right").modal("show");
	    });
// 	$("#split").on("click", function(){
// 		$('#sel').attr('class','dropdown-menu show');
// 	});
	
	
	$("#empCheck").on("click", function(){
		let empName = $("#empName").val();
// 		alert(empName+"앙");
		let data ={"empName" : empName};
	
// 		$.ajax({
// 			url:"/medical/empCheck",
// 			 contentType :'application/json;charset=UTF-8',
// 		      data:JSON.stringify(data),
// 			  dataType:"json",
// 		      type:"post",
// 		      success:function(result){
// 		      };
		 	
// 		});
		
	});
	
	
// 	$("#savePdfBtn").on("click", function() {
		
// 		const html = document.querySelector('html');
// 		const printContents = document.querySelector('#note').innerHTML;
// 		const printDiv = document.createElement('DIV');
// 		printDiv.className ='print-div';
		 
// 		html.appendChild(printDiv);
		
		
// 		printDiv.innerHTML = printContents;
// 		document.body.style.display = 'none';
// 		setTimeout(window.print(), 3000);
// 		document.body.style.display = 'block';
// 		printDiv.style.display = 'none';
// 	});
	
	
	

	
	
	$(document).on("click","#hold tr",function(){
		$("#hold tr").css("background-color","#172B4C");
		$("#paDtTable tr").css("background-color","#172B4C");
		$(this).css("background-color","#000000");
	
	});
	
	
	$(document).on("click","#paDtTable tr",function(){
		$("#paDtTable tr").css("background-color","#172B4C");
		$("#hold tr").css("background-color","#172B4C");
		$(this).css("background-color","#000000");
	
	});
	

	
	

	
	
	//pdf 
	$('#savePdfBtn').on("click",function() {
		html2canvas($('#note')[0]).then(function(canvas) { //저장 영역 div id
			
	           // 캔버스를 이미지로 변환
	            var imgData = canvas.toDataURL('image/png');

                var imgWidth = 210; // 이미지 가로 길이(mm) A4 기준
                var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
                var imgHeight = canvas.height * imgWidth / canvas.width;
                var heightLeft = imgHeight;

                var doc = new jsPDF('p', 'mm');
                var position = 0;

                // 첫 페이지 출력
                doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
                heightLeft -= pageHeight;

                // 한 페이지 이상일 경우 루프 돌면서 출력
                while (heightLeft >= 20) {
                    position = heightLeft - imgHeight;
                    doc.addPage();
                    doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
                    heightLeft -= pageHeight;
                }
	           // 파일 저장
	            window.open(doc.output("bloburl"));
//  	      		 doc.save('소견서.pdf');    
	    });
	});
	
	//pdf 진단서
	$('#diagnosis').on("click",function() {
		html2canvas($('#diag')[0]).then(function(canvas) { //저장 영역 div id
			
	           // 캔버스를 이미지로 변환
	            var imgData = canvas.toDataURL('image/png');

                var imgWidth = 210; // 이미지 가로 길이(mm) A4 기준
                var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
                var imgHeight = canvas.height * imgWidth / canvas.width;
                var heightLeft = imgHeight;

                var doc = new jsPDF('p', 'mm');
                var position = 0;

                // 첫 페이지 출력
                doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
                heightLeft -= pageHeight;

                // 한 페이지 이상일 경우 루프 돌면서 출력
                while (heightLeft >= 20) {
                    position = heightLeft - imgHeight;
                    doc.addPage();
                    doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
                    heightLeft -= pageHeight;
                }
	           // 파일 저장
	            window.open(doc.output("bloburl"));
//  	        doc.save('진단서.pdf');    
	    });
	});
	
	//pdf 처방전
	$('#prescription').on("click",function() {
		html2canvas($('#presc')[0]).then(function(canvas) { //저장 영역 div id
			
	           // 캔버스를 이미지로 변환
	            var imgData = canvas.toDataURL('image/png');

                var imgWidth = 210; // 이미지 가로 길이(mm) A4 기준
                var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
                var imgHeight = canvas.height * imgWidth / canvas.width;
                var heightLeft = imgHeight;

                var doc = new jsPDF('p', 'mm');
                var position = 0;

                // 첫 페이지 출력
                doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
                heightLeft -= pageHeight;

                // 한 페이지 이상일 경우 루프 돌면서 출력
                while (heightLeft >= 20) {
                    position = heightLeft - imgHeight;
                    doc.addPage();
                    doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
                    heightLeft -= pageHeight;
                }
	           // 파일 저장
	            window.open(doc.output("bloburl"));
//  	        doc.save('처방전.pdf');    
	    });
	});

	wating();
	ctfOrder();
	
	// 전체 버튼
	$("#allWating").on("click",function(){
		
		wating();	
	});
	
	
	// 제증명 신청
	$("#ctfInsert").on("click",function(){
		 let ctfSelect= document.getElementById('ctfSelect');
		 let ctfGubun= (ctfSelect.options[ctfSelect.selectedIndex].value);
		 if(ctfGubun=="진단서"){
			 ctfGubun="diag";
		 }else if(ctfGubun=="소견서"){
			 ctfGubun="note";
		 }else{
			 ctfGubun="pres";
		 }
		 let empName = $("#empName").val()
		 let ctfName = $("#ctfName").val()
		 let ctfPast = $("#ctfPast").val()
		 let ctfState = $("#ctfState").val()
		 let ctfNo = $("#ctfNo").val()
		 
		 let data ={
				"ctfGubun" : ctfGubun
				,"empName" : empName
				,"ctfName" : ctfName
				, "ctfPast" : ctfPast
				,"ctfState" : ctfState
				, "paNo" : ctfNo
				
		 };
		 Swal.fire({
	            title: '문서를 신청 하시겠습니까?',
	            icon: 'question',

	            showCancelButton: true,
	            ConfirmButtonColor: '#3085d6',
	            cancelButtonColor: '#d33',
	            confirmButtonText: '등록',
	            cancelButtonText: '취소',
	            background: '#15243e',

	            reverseButtons: false,

	        }).then(result => {
	            if(result.isConfirmed){
	            	$.ajax({
	       			 url:"/medical/ctfInsert",
	       		      contentType :'application/json;charset=UTF-8',
	       		      data:JSON.stringify(data),
	       			  dataType:"json",
	       		      type:"post",
	       		      beforeSend:function(xhr){
	       		           xhr.setRequestHeader(header,token);
	       			},
	       		      success:function(result){
	       		    	if(result['result']== "완료"){
		   		        	Swal.fire({
						        icon: 'success',
						        title: '문서 신청 완료',
						        showConfirmButton: false,
						        background: '#15243e',
						        timer: 5500,
						    }).then((value) => {
						        if(value){
						        	
						        }
						    });
	   						$("#breakdown").empty();
	   					}else{
	   						alert("재증명 신청 실패");
	   					}
	   					ctfOrder();
	       		      }
	       		});	
					
	            }
	        });
		 
	 
		 
	});
	
	var ctfDate = "";
	$("#ctfDate").change(function(){
		ctfDate = this.value;
	});
	
	// 제증명 선택 내역 조회 
	$("#inquiry").on("click", function(){
		
		 $("#breakdown").empty()
		 let result= document.getElementById('selectDocument');
		 let value= (result.options[result.selectedIndex].value);
		 console.log("셀렉트 값 :"+value);
		 let ctfState = "대기";
		 let ctfEndt="";
		 if(value=="전체"){
			 ctfEndt="";
		 }else if(value=="진단서"){
			 ctfEndt="diag";
		 }else if(value=="소견서"){
			 ctfEndt="note";
		 }else{
			 ctfEndt="pres";
		 }
		 
		 console.log("조회 클릭 값 : "+ctfEndt);
		 console.log("날짜 클릭 값 : "+ctfDate);
		let data = {"ctfEndt" : ctfDate
					,"ctfGubun" : ctfEndt
					,"ctfState" : ctfState}
			
		 $.ajax({
			url : "/medical/ctfDetailOrder",
			data : JSON.stringify(data),
			dataType : "json",
			contentType :'application/json;charset=UTF-8',
			type:"post",
			beforeSend:function(xhr){
		           xhr.setRequestHeader(header,token);
			},
			success:function(result){
				$.each(result,function(index,item){
					let content = "";	
					var ctf_gubun = "'"+item.ctfGubun+"'";
					let pres ="처방전";
					let diag = "진단서";
					let note = "소견서";
					let tr="";
					if(item.ctfState == "대기"){
						 tr="<tr style='background-color:#000000;'>";
					}else{
						tr="<tr>";
					}
					content += tr;
					if(item.ctfGubun =='pres'){
						content += "<td>"+pres+"</td>";
					}else if(item.ctfGubun =='diag'){
						content += "<td>"+diag+"</td>";
					}else{
						content += "<td>"+note+"</td>";
					}
// 					content += "<td>"+item.ctfGubun+"</td>";
					content += "<td>"+item.ctfName+"</td>";
					content += "<td>"+fn_getInsertDate(item.ctfEndt)+"</td>";
					content += "<td>"+item.empName+"</td>";
					content += "<td>"+item.ctfState+"</td>";
					if(item.ctfGubun =='pres'){
						content += '<td><button type="button" onclick="prescription('+ item.paNo+','+ctf_gubun+')" class="waves-effect waves-light btn mb-5 bg-gradient-primary" style="margin-left: 0px;" id="btnDocu"  data-bs-toggle="modal"  data-bs-target="#modal-prescription">선택</button></td>';
						
					}else if(item.ctfGubun =='diag'){
						content += '<td><button type="button" onclick="diagnosis('+ item.paNo+','+ctf_gubun+')" class="waves-effect waves-light btn mb-5 bg-gradient-primary" style="margin-left: 0px;" id="btnDocu"  data-bs-toggle="modal"  data-bs-target="#modal-diagnosis">선택</button></td>';
					}else{
						content += '<td><button type="button" onclick="note('+ item.paNo+','+ctf_gubun+')" class="waves-effect waves-light btn mb-5 bg-gradient-primary" style="margin-left: 0px;" id="btnDocu"  data-bs-toggle="modal"  data-bs-target="#modal-opinion">선택</button></td>';
					}
					content += "</tr>";
					$("#breakdown").append(content);
			});
			}
		 });
		
		
	});
	
// 	$("#selectDocument").change(function(){
// 		console.log(this.value);
// 	});
	
	$("#paDt").change(function(){
		let date=this.value
		console.log(date);
		let result={"testDate" : date};
		
		 $.ajax({
		      url:"/medical/reservation",
		      contentType :'application/json;charset=UTF-8',
		      data:JSON.stringify(result),
			  dataType:"json",
		      type:"post",
		      beforeSend:function(xhr){
		           xhr.setRequestHeader(header,token);
			},
		      success:function(reservation){
		    	  $("#paDtTable").empty()
		         console.log("예약환자 :"+reservation);
		     	$.each(reservation,function(index,item){
		     		console.log("예약환자 :",item);
		     		console.log("예약환자 :",item);
		     		var paNo = "'"+item.paNo+"'";
					let content = "";
					content += "<tr>";
					content += "<td>"+(index+1)+"</td>";
					content += "<td>"+item.paNo+"</td>";
					content += "<td>"+fn_getInsertDate(item.paRes)+"</td>";
					content += '<td><a href="javascript:fn_go('+paNo+')">'+item.paName+"</a></td>";
					content += "<td>"+item.paAdd1+"</td>";
					content += "</tr>";
					$("#paDtTable").append(content);
				});
		      }
		   });
	});
// 	document.getElementById('paDt').value = new Date().toISOString().substring(
// 			0, 10);
// 	 $(document).ready(function(){
// 		    var date2 = new Date().toISOString().substring(0, 10);
// 		    $('#paDt').attr('placeholder',date2);
// 		  });
	 
	document.getElementById('paDate').value = new Date().toISOString().substring(
			0, 10);
	 $(document).ready(function(){
		    var date3 = new Date().toISOString().substring(0, 10);
		    $('#paDate').attr('placeholder',date3);
		  });
	 
	// 신규환자 등록 
	$("#create").on("click", function() {
		$("#create").css("background-color","#5b5aee");
		$("#cancle").css("background-color","transparent");
		$("#document").css("background-color","transparent");
     if($("#old").css("display", "none")){
    	 $("#old").hide();
    	 $("#Proof").hide();
    	 $("#new").show();
    	 $("#allSearch").show();
    	 $("#insertName").val("");
   		 $("#insertSex").val("");
    	 $("#insertAdd1").val("");
    	 $("#insertPh").val("");
   		 $("#insertAdd2").val("");	
    	 $("#insertZip").val("");
   		 $("#insertReg").val("");
//    	     $("#insertEnwt").val("");
   	 	 $("#paTrmr").val("");
   		$("#insertName").attr("readonly",false);
		$("#insertName").css("background-color","transparent");
		
   		$("#insertSex").attr("readonly",false);
		$("#insertSex").css("background-color","transparent");
		
   		$("#insertPh").attr("readonly",false);
		$("#insertPh").css("background-color","transparent");
		
   		$("#insertAdd1").attr("readonly",false);
		$("#insertAdd1").css("background-color","transparent");
		
   		$("#insertAdd2").attr("readonly",false);
		$("#insertAdd2").css("background-color","transparent");
		
   		$("#insertZip").attr("readonly",false);
		$("#insertZip").css("background-color","transparent");
		
   		$("#insertReg").attr("readonly",false);
		$("#insertReg").css("background-color","transparent");
		
		
   		$("#insertEnwt").attr("readonly",false);
		$("#insertEnwt").css("background-color","transparent");
     };
     
  });
	// 신규환자 등록 
	$("#document").on("click", function() {
		$("#cancle").css("background-color","transparent");
		$("#create").css("background-color","transparent");
		$("#document").css("background-color","#5b5aee");
		
		 $("#Proof").show();
		 $("#old").hide();
	   	 $("#new").hide();
	});
	
	// 진료실 배정 버튼
	$("#cancle").on("click", function() {
		var checkResult = $("#mail_check_input_box_warn");
		checkResult.html("");
		$("#cancle").css("background-color","#5b5aee");
		$("#create").css("background-color","transparent");
		$("#document").css("background-color","transparent");
		$("#isCheck").hide();
		 if($("#old").css("display", "none")){
	    	 $("#old").show();
	    	 $("#new").hide();
	    	 $("#Proof").hide();
	    	 $("#allSearch").show();
	    	 $("#paName").val("");
				$("#paName").attr("readonly",false);
				$("#paName").css("background-color","transparent");
				
				$("#paNo").val("");
				$("#paNo").attr("readonly",false);
				$("#paNo").css("background-color","transparent");

				$("#paZip").val("");
				$("#paZip").attr("readonly",false);
				$("#paZip").css("background-color","transparent");

				$("#paAdd1").val("");
				$("#paAdd1").attr("readonly",false);
				$("#paAdd1").css("background-color","transparent");
				
				$("#paAdd2").val("");
				$("#paAdd2").attr("readonly",false);
				$("#paAdd2").css("background-color","transparent");
				
				$("#paReg").val("");
				$("#paReg").attr("readonly",false);
				$("#paReg").css("background-color","transparent");
				
				// 신규환자 등록 
				$("#insertName").val("");
				$("#insertName").attr("readonly",false);
				$("#insertName").css("background-color","transparent");
				
				$("#insertSex").val("");
				$("#insertSex").attr("readonly",false);
				$("#insertSex").css("background-color","transparent");
				
				$("#insertAdd1").val("");
				$("#insertAdd1").attr("readonly",false);
				$("#insertAdd1").css("background-color","transparent");
				
				$("#insertPh").val("");
				$("#insertPh").attr("readonly",false);
				$("#insertPh").css("background-color","transparent");
				
				$("#insertAdd2").val("");
				$("#insertAdd2").attr("readonly",false);
				$("#insertAdd2").css("background-color","transparent");
				
				
				$("#insertZip").val("");
				$("#insertZip").attr("readonly",false);
				$("#insertZip").css("background-color","transparent");
				
				
				$("#insertReg").val("");
				$("#insertReg").attr("readonly",false);
				$("#insertReg").css("background-color","transparent");
				
// 				$("#insertEnwt").val("");
				$("#paTrmr").val("");
	     };
     
  });
	
	// 신규환자 관리 취소 버튼 
	$("#cancle2").on("click", function() {
		 if($("#old").css("display", "none")){
	    	 $("#Enwt").show();
	    	 $("#paOK").show();
	    	 $("#paInsert").show();
	    	 $("#Upwt").hide();
	    	 $("#cancle2").hide();
	    	 $("#paUpdate").hide();
	    	 $("#paName").val("");
				$("#paName").attr("readonly",false);
				$("#paName").css("background-color","transparent");
				
				$("#paNo").val("");
				$("#paNo").attr("readonly",false);
				$("#paNo").css("background-color","transparent");

				$("#paZip").val("");
				$("#paZip").attr("readonly",false);
				$("#paZip").css("background-color","transparent");

				$("#paAdd1").val("");
				$("#paAdd1").attr("readonly",false);
				$("#paAdd1").css("background-color","transparent");
				
				$("#paAdd2").val("");
				$("#paAdd2").attr("readonly",false);
				$("#paAdd2").css("background-color","transparent");
				
				$("#paReg").val("");
				$("#paReg").attr("readonly",false);
				$("#paReg").css("background-color","transparent");
				$("#paTrmr").val("");
				// 신규환자 등록 
				$("#insertName").val("");
				$("#insertName").attr("readonly",false);
				$("#insertName").css("background-color","transparent");
				
				$("#insertSex").val("");
				$("#insertSex").attr("readonly",false);
				$("#insertSex").css("background-color","transparent");
				
				$("#insertAdd1").val("");
				$("#insertAdd1").attr("readonly",false);
				$("#insertAdd1").css("background-color","transparent");
				
				$("#insertPh").val("");
				$("#insertPh").attr("readonly",false);
				$("#insertPh").css("background-color","transparent");
				
				$("#insertAdd2").val("");
				$("#insertAdd2").attr("readonly",false);
				$("#insertAdd2").css("background-color","transparent");
				
				
				$("#insertZip").val("");
				$("#insertZip").attr("readonly",false);
				$("#insertZip").css("background-color","transparent");
				
				
				$("#insertReg").val("");
				$("#insertReg").attr("readonly",false);
				$("#insertReg").css("background-color","transparent");
				
// 				$("#insertEnwt").val("");
	     };
     
  });
	
$("#paUpdate").on("click",function(){
	let paName = $("#insertName").val();
	let paSex = $("#insertSex").val();
	let paPh = $("#insertPh").val();
	let paAdd1 = $("#insertAdd1").val();
	let paAdd2 = $("#insertAdd2").val();
	let paZip = $("#insertZip").val();
	let paReg = $("#insertReg").val();
	let paEnwt = $("#insertEnwt").val();
	let paUpwt = $("#updateUpwt").val();
	console.log(paName);
	console.log(paSex);
	console.log(paPh);
	console.log(paAdd1);
	console.log(paAdd2);
	console.log(paZip);
	console.log(paReg);
	console.log(paEnwt);
	console.log(paUpwt);
	let data= {
			"paName": paName ,
			"paSex": paSex  ,
			"paPh": paPh   ,
			"paAdd1": paAdd1,
			"paAdd2": paAdd2,
			"paZip": paZip,
			"paReg": paReg,
			"paEnwt": paEnwt,
			"paUpwt": paUpwt};
	
	 Swal.fire({
         title: '수정 하시겠습니까?',
         icon: 'question',

         showCancelButton: true,
         ConfirmButtonColor: '#3085d6',
         cancelButtonColor: '#d33',
         confirmButtonText: '등록',
         cancelButtonText: '취소',
         background: '#15243e',

         reverseButtons: false,

     }).then(result => {
         if(result.isConfirmed){
        		$.ajax({
        			url:"/medical/paUpdate",
        			data : JSON.stringify(data),
        			contentType :'application/json;charset=UTF-8',
        			type: "post",
        			dataType: "json",
//        	 		asynce: false,
        			beforeSend:function(xhr){
        		           xhr.setRequestHeader(header,token);
        			},
        			success:function(result){
        				if(result['result']== "완료"){
        					Swal.fire({
    					        icon: 'success',
    					        title: '환자 수정 완료',
    					        showConfirmButton: false,
    					        background: '#15243e',
    					        timer: 5500,
    					    }).then((value) => {
    					        if(value){
    					        	
    					        }
    					    });
        					$("#hold").empty();	
        					$("#insertName").val("");
    	    				$("#insertName").attr("readonly",false);
    	    				$("#insertName").css("background-color","transparent");
    	    				
    	    				$("#insertSex").val("");
    	    				$("#insertSex").attr("readonly",false);
    	    				$("#insertSex").css("background-color","transparent");
    	    				
    	    				$("#insertPh").val("");
    	    				$("#insertPh").attr("readonly",false);
    	    				$("#insertPh").css("background-color","transparent");
    	    				
    	    				$("#insertAdd1").val("");
    	    				$("#insertAdd1").attr("readonly",false);
    	    				$("#insertAdd1").css("background-color","transparent");
    	    				
    	    				$("#insertAdd2").val("");
    	    				$("#insertAdd2").attr("readonly",false);
    	    				$("#insertAdd2").css("background-color","transparent");
    	    				
    	    				$("#insertZip").val("");
    	    				$("#insertZip").attr("readonly",false);
    	    				$("#insertZip").css("background-color","transparent");
    	    				
    	    				$("#insertReg").val("");
    	    				$("#insertReg").attr("readonly",false);
    	    				$("#insertReg").css("background-color","transparent");
    	    				
    	    				$("#insertEnwt").val("");
    	    				$("#paTrmr").val("");
        					
        				}else{
        					alert("수정 실패");
        				}
        					holdOffice();
        			}
        			
        		});
				
         }
     });
	 

	
});
	
  // 숫자입력 validate
  $("#txtPrice").on("keyup", function() {
     $(this).val($(this).val().replace(/[^0-9]/g, ""));
  });
		 holdOffice();
		 officeTwo();
		 officeOne();
	
	var Toast = Swal.mixin({
        toast: true,
        showConfirmButton: false,
        timer: 3000
      });
  
	 
	 $("#clear").on("click",function(){
		 $("#search").val("");
		 
	 });
	 
	 $("#paOK").on("click",function(){
			
			$("#insertAdd1").attr("readonly",false);
			$("#insertAdd1").css("background-color","transparent");
			
			$("#insertPh").attr("readonly",false);
			$("#insertPh").css("background-color","transparent");
			
			$("#insertAdd2").attr("readonly",false);
			$("#insertAdd2").css("background-color","transparent");
			
			$("#insertZip").attr("readonly",false);
			$("#insertZip").css("background-color","transparent");
			
			 if($("#Upwt").css("display", "none")){
		    	 $("#Enwt").hide();
		    	 $("#paOK").hide();
		    	 $("#paInsert").hide();
		    	 $("#Upwt").show();
		    	 $("#cancle2").show();
		    	 $("#paUpdate").show();
		    	 
		     };
			
	 });
	 
	 var dateTime = "";
		var reState = "대기중";
		$("#dateTimeLocal").change(function(){
			dateTime = this.value;
		});
		
		$("input[name='group1']").change(function(){
			// 휴대폰 결제 선택 시.
			if($("input[name='group1']:checked").val() == '예약'){
				$('#dateTimeLocal').show();
				reState = $("input[name='group1']:checked").val();
				console.log(reState);
			}	
			// 무통장입금 결제 선택 시.
			else if($("input[name='group1']:checked").val() == '당일환자'){
				$('#dateTimeLocal').hide();
				reState = '대기중';
			}
		});
		
	 // 신규환자 등록 
	 $("#paInsert").on("click",function(){
		
		let paName = $("#insertName").val();
		let paSex = $("#insertSex").val();
		let paPh = $("#insertPh").val();
		let paAdd1 = $("#insertAdd1").val();
		let paAdd2 = $("#insertAdd2").val();
		let paZip = $("#insertZip").val();
		let paReg = $("#insertReg").val();
		let paEnwt = $("#insertEnwt").val();
		let paTrmr = $("#paTrmr").val();
		console.log(paName);
		console.log(paSex);
		console.log(paPh);
		console.log(paAdd1);
		console.log(paAdd2);
		console.log(paZip);
		console.log(paTrmr);
		var result1 = paReg.slice(7,15);
		var result2 = paReg.slice(7,9);
		console.log("substr1 : "+ result1);
		console.log("substr2 : "+ result2);
// 		console.log($('input:checkbox[id="checkbox_1"]:checked').val());		
// 		console.log($('input:checkbox[id="checkbox_2"]:checked').val());
		
		let yes = $('input:checkbox[id="checkbox_1"]:checked').val();
		let no = $('input:checkbox[id="checkbox_2"]:checked').val();
		
		var paInsuYn;
		if(yes != null && no == null){
			paInsuYn =yes; 
		}else{
			paInsuYn =no;
		}
		console.log(paInsuYn);
		paReg = paReg.replace(result1, result2+'******');
		
		console.log("주민등록번호"+paReg);
		console.log(paEnwt);
		let data3= {
				"paName": paName ,
				"paSex": paSex  ,
				"paPh": paPh   ,
				"paAdd1": paAdd1 ,
				"paAdd2": paAdd2 ,
				"paZip": paZip  ,
				"paReg": paReg  ,
				"paEnwt": paEnwt,
				"paState" : reState,
				"paRes" : dateTime,
				"paInsuYn" : paInsuYn,
				"paTrmr" : paTrmr
				
};
		console.log("data3 :",data3);
		 Swal.fire({
	            title: '환자를 등록 하시겠습니까?',
	            icon: 'question',

	            showCancelButton: true,
	            ConfirmButtonColor: '#3085d6',
	            cancelButtonColor: '#d33',
	            confirmButtonText: '등록',
	            cancelButtonText: '취소',
	            background: '#15243e',

	            reverseButtons: false,

	        }).then(result => {
	            if(result.isConfirmed){
	            	$.ajax({
	            		url:"/medical/paInsert",
	        			data : JSON.stringify(data3),
	        			contentType :'application/json;charset=UTF-8',
	        			type: "post",
	        			dataType: "json",
	        			asynce: false,
	        			beforeSend:function(xhr){
	        		           xhr.setRequestHeader(header,token);
	        			},
	       		      success:function(result){
	       		    	if(result['result']== "완료"){
		   		        	Swal.fire({
						        icon: 'success',
						        title: '환자 등록 완료',
						        showConfirmButton: false,
						        background: '#15243e',
						        timer: 5500,
						    }).then((value) => {
						        if(value){
						        	
						        }
						    });
	   		        		$("#hold").empty();
	   					}else{
	   						alert("실패");
	   					}
	       		    	holdOffice();
	    				wating();
	    				$("#insertName").val("");
	    				$("#insertName").attr("readonly",false);
	    				$("#insertName").css("background-color","transparent");
	    				
	    				$("#insertSex").val("");
	    				$("#insertSex").attr("readonly",false);
	    				$("#insertSex").css("background-color","transparent");
	    				
	    				$("#insertPh").val("");
	    				$("#insertPh").attr("readonly",false);
	    				$("#insertPh").css("background-color","transparent");
	    				
	    				$("#insertAdd1").val("");
	    				$("#insertAdd1").attr("readonly",false);
	    				$("#insertAdd1").css("background-color","transparent");
	    				
	    				$("#insertAdd2").val("");
	    				$("#insertAdd2").attr("readonly",false);
	    				$("#insertAdd2").css("background-color","transparent");
	    				
	    				$("#insertZip").val("");
	    				$("#insertZip").attr("readonly",false);
	    				$("#insertZip").css("background-color","transparent");
	    				
	    				$("#insertReg").val("");
	    				$("#insertReg").attr("readonly",false);
	    				$("#insertReg").css("background-color","transparent");
	    				
	    				$("#insertEnwt").val("");
	    				$("#paTrmr").val("");
	    				$("#isCheck").hide();
	    				$("#mail_check_input_box_warn").hide();
	    				
	       		      }
	       		});	
					
	            }
	        });
		 
	 });
		 
	 
	 
	 // 접수 아작스
	 $("#docAdd").on("click",function(){
		 
		 
		 let empNo = $("#empNo").val();
		 let paNo =$('#paNo').val();	
		 let rcpMemo =$('#rcpMemo').val();	
		 let office= document.getElementById('select_value');
		 let docNo= (office.options[office.selectedIndex].value);
		 
		 console.log(empNo);
		 console.log("접수 nynyny : "+patrmr);
		 console.log(paNo);
		 console.log(rcpMemo);
		 console.log(docNo);
		
		 let data = {"empNo":empNo,
				 	 "paNo":paNo,
				 	"rcpMemo":rcpMemo,
				 	"docNo":docNo,
				 	"paTrmr" :patrmr};
		 
		 Swal.fire({
	            title: '진료실 배정 하시겠습니까?',
	            icon: 'question',

	            showCancelButton: true,
	            ConfirmButtonColor: '#3085d6',
	            cancelButtonColor: '#d33',	
	            confirmButtonText: '등록',
	            cancelButtonText: '취소',
	            background: '#15243e',

	            reverseButtons: false,

	        }).then(result => {
	            if(result.isConfirmed){
	            	$.ajax({
	            		url:"/medical/insertDo",
		       			 data:JSON.stringify(data),
		       			 contentType :'application/json;charset=UTF-8',
		       			 dataType:"json",
		       			 type:"post",
		       			 beforeSend:function(xhr){
		       		           xhr.setRequestHeader(header,token);
		       			},
	       		      success:function(result){
	       		    	Swal.fire({
					        icon: 'success',
					        title: '진료실 등록 완료',
					        showConfirmButton: false,
					        background: '#15243e',
					        timer: 5500,
					    }).then((value) => {
					        if(value){
					        	
					        }
					    });
						 //대기 환자 목록에서 빠짐
// 							 $("#"+paNo).empty();
						 if(docNo=="1진료실"){
							 $("#hold").empty();
							 holdOffice();
							 officeOne();
							 wating();
							 drawChart3();
						 }else{
							 $("#hold").empty();
							 holdOffice();
							 officeTwo();
							 wating();
							 drawChart3();
						 }
							$("#paName").val("");
							$("#paName").attr("readonly",false);
		    				$("#paName").css("background-color","transparent");
		    				
							$("#paNo").val("");
							$("#paNo").attr("readonly",false);
		    				$("#paNo").css("background-color","transparent");
		    				
							$("#paZip").val("");
							$("#paZip").attr("readonly",false);
		    				$("#paZip").css("background-color","transparent");
		    				
							$("#paAdd1").val("");
							$("#paAdd1").attr("readonly",false);
		    				$("#paAdd1").css("background-color","transparent");
		    				
							$("#paAdd2").val("");
							$("#paAdd2").attr("readonly",false);
		    				$("#paAdd2").css("background-color","transparent");
		    				
							$("#paReg").val("");
							$("#paReg").attr("readonly",false);
		    				$("#paReg").css("background-color","transparent");
		    				
							$("#rcpMemo").val("");
							$("#rcpMemo").attr("readonly",false);
		    				$("#rcpMemo").css("background-color","transparent");
	       		      }
	       		});	
					
	            }
	        });
		 
	 });
	 
	
	 
	 $("#btnSearch").on("click",function(){
		 let str = $(".form-control-lg").val();
			let cnt=1;
// 			alert(str);
			
			// JSON 형식으로 데이터가 넘어오기 때문에 JSON("key","value")로 변수 할당해야한다.
			let data = {"paName":str};
			console.log("data : " + JSON.stringify(str));
			$(".list-group").empty();
			$("#paData").empty();
			
			let header="${_csrf.headerName}";
// 			let token = "${_csrf.token}";
// 			console.log("header : "+ header + ", token : "+ token );
			//아작났어유..피씨다타써
			//contentType : 가즈아
			//dataType : 드루와
			$.ajax({
				url:"/medical/searchPa",
				contentType:"application/json;charset=utf-8",
				data:JSON.stringify(data),
				dataType:"json",
				type:"post",
				beforeSend:function(xhr){
			           xhr.setRequestHeader(header,token);
				},
				success:function(result){
					console.log("성공");
					//전역 변수에 넣음
					patientVOList = result;
					if(result == 0){
						$("#paData").append('<td colspan="4" style="text-align: center;"><h3 style="font-size:1rem">검색 결과가 없습니다.</h3></td>');
					}
					$.each(result,function(index,item){
						console.log("숫자 : " + item.num);
						console.log("수진자 : " + item.paName);
						var paNo = "'"+item.paNo+"'";
						console.log(paNo)
						let cont = item.content + "...";
						
						let content = "";
						content += "<tr>";
						content += "<td>"+(index+1)+"</td>";
						content += "<td>"+item.paNo+"</td>";
						content += '<td><a href="javascript:fn_go('+paNo+')">'+item.paName+"</a></td>";
						content += "<td>"+item.paReg+"</td>";
						content += "</tr>";
						
						$("#paData").append(content);	
							
					});
				}
			});
	        $("#modal-default").modal("show");
	    });
	 
	 $("#btnSearch2").on("click",function(){
		 let str = $(".form-control-lg2").val();
			let cnt=1;
// 			alert(str);
			
			// JSON 형식으로 데이터가 넘어오기 때문에 JSON("key","value")로 변수 할당해야한다.
			let data = {"paName":str};
			console.log("data : " + JSON.stringify(str));
			$(".list-group").empty();
			$("#paData").empty();
			
			let header="${_csrf.headerName}";
// 			let token = "${_csrf.token}";
// 			console.log("header : "+ header + ", token : "+ token );
			//아작났어유..피씨다타써
			//contentType : 가즈아
			//dataType : 드루와
			$.ajax({
				url:"/medical/searchPa",
				contentType:"application/json;charset=utf-8",
				data:JSON.stringify(data),
				dataType:"json",
				type:"post",
				beforeSend:function(xhr){
			           xhr.setRequestHeader(header,token);
				},
				success:function(result){
					console.log("성공");
					//전역 변수에 넣음
					patientVOList = result;
					if(result == 0){
						$("#paData").append('<td colspan="4" style="text-align: center;"><h3 style="font-size:1rem">검색 결과가 없습니다.</h3></td>');
					}
					$.each(result,function(index,item){
						console.log("숫자 : " + item.num);
						console.log("수진자 : " + item.paName);
						var paNo = "'"+item.paNo+"'";
						console.log(paNo)
						let cont = item.content + "...";
						
						let content = "";
						content += "<tr>";
						content += "<td>"+(index+1)+"</td>";
						content += "<td>"+item.paNo+"</td>";
						content += '<td><a href="javascript:fn_goDocument('+paNo+')">'+item.paName+"</a></td>";
						content += "<td>"+item.paReg+"</td>";
						content += "</tr>";
						
						$("#paData").append(content);	
							
					});
				}
			});
	        $("#modal-default").modal("show");
	    });
});
</script>
<script type="text/javascript">
function fn_getInsertDate(geta){
	let dt = new Date(geta);
	let dtYY = dt.getFullYear();
	let dtMM = dt.getMonth()+1;
	if(dtMM<10){dtMM = "0" + dtMM;}
	let dtDD = dt.getDate();
	if(dtDD<10){dtDD = "0" + dtDD;}
	let dtHH = dt.getHours();
	let dtMI = dt.getMinutes();
	let dtResult = dtYY + "-" + dtMM + "-" + dtDD+"일"+dtHH+"시"+dtMI+"분";
	console.log("insertDate : " + dtResult);
	return dtResult;
}

function fn_getInsertDate2(geta){
	let dt = new Date(geta);
	let dtYY = dt.getFullYear();
	let dtMM = dt.getMonth()+1;
	if(dtMM<10){dtMM = "0" + dtMM;}
	let dtDD = dt.getDate();
	if(dtDD<10){dtDD = "0" + dtDD;}
	let dtHH = dt.getHours();
	let dtMI = dt.getMinutes();
	let dtResult = dtYY + "-" + dtMM + "-" + dtDD;
	console.log("insertDate : " + dtResult);
	return dtResult;
}

function fn_goDocument(geta){
	let str = geta;
	console.log("str : " + str);
	$.each(patientVOList,function(index,item){
		let paNo = item.paNo;
		
		if(str==paNo){
			console.log("item : " + JSON.stringify(item));
			console.log(item.paName);
			
			$("#ctfNo").val(item.paNo);
			$("#ctfNo").css("background-color","black");
			
			$("#ctfName").val(item.paName);
			$("#ctfName").css("background-color","black");

			$("#modal-default").modal("hide");
			return;
		}
	});
}

function doc_list(geta){
	let str = geta;
	console.log("str : " + str);
	$.each(empVOList,function(index,item){
		let empNo = item.empNo;
		
		if(str==empNo){
			console.log("item : " + JSON.stringify(item));
			$("#empName").val(item.empName);
			$("#empName").attr("readonly",true);
			$("#empName").css("background-color","black");
			
			return;
		}
	});
}



function fn_go(geta){
	let str = geta;
	console.log("str : " + str);
	$.each(patientVOList,function(index,item){
		let paNo = item.paNo;
		if(str==paNo){
			console.log("item : " + JSON.stringify(item));
			console.log(item.paName);
			patrmr = item.paTrmr;
			console.log("nynynyny : "+patrmr);
			$("#paName").val(item.paName);
			$("#paName").attr("readonly",true);
			$("#paName").css("background-color","black");
			
			$("#paNo").val(item.paNo);
			$("#paNo").attr("readonly",true);
			$("#paNo").css("background-color","black");
			

			$("#paZip").val(item.paZip);
			$("#paZip").attr("readonly",true);
			$("#paZip").css("background-color","black");

			$("#paAdd1").val(item.paAdd1);
			$("#paAdd1").attr("readonly",true);
			$("#paAdd1").css("background-color","black");
			
			$("#paAdd2").val(item.paAdd2);
			$("#paAdd2").attr("readonly",true);
			$("#paAdd2").css("background-color","black");
			
			$("#paReg").val(item.paReg);
			$("#paReg").attr("readonly",true);
			$("#paReg").css("background-color","black");
			
			// 신규환자 등록 
			$("#insertName").val(item.paName);
			$("#insertName").attr("readonly",true);
			$("#insertName").css("background-color","black");
			
			$("#insertSex").val(item.paSex);
			console.log("sdsd"+item.paSex);
			$("#insertSex").attr("readonly",true);
			$("#insertSex").css("background-color","black");
			
			$("#insertAdd1").val(item.paAdd1);
			$("#insertAdd1").attr("readonly",true);
			$("#insertAdd1").css("background-color","black");
			
			$("#insertPh").val(item.paPh);
			$("#insertPh").attr("readonly",true);
			$("#insertPh").css("background-color","black");
			
			$("#insertAdd2").val(item.paAdd2);
			$("#insertAdd2").attr("readonly",true);
			$("#insertAdd2").css("background-color","black");
			
			
			$("#insertZip").val(item.paZip);
			$("#insertZip").attr("readonly",true);
			$("#insertZip").css("background-color","black");
			
			
			$("#insertReg").val(item.paReg);
			$("#insertReg").attr("readonly",true);
			$("#insertReg").css("background-color","black");
			
// 			$("#insertEnwt").val(item.paEnwt);

			
			$("#paTrmr").val(item.paTrmr);
			
			$("#search").val("");
			
			$("#modal-default").modal("hide");
			
			return;
		}
	});
}

function fn_wating(geta){
	let str = geta;
	console.log("str : " + str);
	$.each(watingVOList,function(index,item){
		let paNo = item.paNo;
		console.log("item.paNo : "+paNo);
		if(str==paNo){
			console.log("item : " + JSON.stringify(item));
			console.log(item.paName);
			$("#paName").val(item.paName);
			$("#paName").attr("readonly",true);
			$("#paName").css("background-color","black");
			
			$("#paNo").val(item.paNo);
			$("#paNo").attr("readonly",true);
			$("#paNo").css("background-color","black");
			

			$("#paZip").val(item.paZip);
			$("#paZip").attr("readonly",true);
			$("#paZip").css("background-color","black");

			$("#paAdd1").val(item.paAdd1);
			$("#paAdd1").attr("readonly",true);
			$("#paAdd1").css("background-color","black");
			
			$("#paAdd2").val(item.paAdd2);
			$("#paAdd2").attr("readonly",true);
			$("#paAdd2").css("background-color","black");
			
			$("#paReg").val(item.paReg);
			$("#paReg").attr("readonly",true);
			$("#paReg").css("background-color","black");
			
			// 신규환자 등록 
			$("#insertName").val(item.paName);
			$("#insertName").attr("readonly",true);
			$("#insertName").css("background-color","black");
			
			$("#insertSex").val(item.paSex);
			$("#insertSex").attr("readonly",true);
			$("#insertSex").css("background-color","black");
			
			$("#insertAdd1").val(item.paAdd1);
			$("#insertAdd1").attr("readonly",true);
			$("#insertAdd1").css("background-color","black");
			
			$("#insertPh").val(item.paPh);
			$("#insertPh").attr("readonly",true);
			$("#insertPh").css("background-color","black");
			
			$("#insertAdd2").val(item.paAdd2);
			$("#insertAdd2").attr("readonly",true);
			$("#insertAdd2").css("background-color","black");
			
			
			$("#insertZip").val(item.paZip);
			$("#insertZip").attr("readonly",true);
			$("#insertZip").css("background-color","black");
			
			
			$("#insertReg").val(item.paReg);
			$("#insertReg").attr("readonly",true);
			$("#insertReg").css("background-color","black");
			
			$("#insertEnwt").val(item.paEnwt);
			
			$("#paTrmr").val(item.paTrmr);

			$("#modal-default").modal("hide");
			
			return;
		}
	});
}
</script>
