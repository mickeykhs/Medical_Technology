<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>

button#regedit:hover{
transform-origin: 50% 50%;
    transform: scale(1.2);
}
button#cancel:hover{
transform-origin: 50% 50%;
    transform: scale(1.2);
}
.theme-primary .nav-tabs .nav-link.active {
    transform: scale(1.1);
}
#trtpaList tr td button:hover{
	transform-origin: 50% 50%;
    transform: scale(1.15);
}
.bkcr{background-color:#15243e;} 
/* .bkcr{background-color:#ffffff !important;} */
[type="checkbox"] + label:before,
[type="checkbox"]:not(.filled-in) + label:after {
	border: 2px solid red;
}
@keyframes fadeIn {
	0% { opacity: 0; margin-left:200%;}
	50% { opacity:0.2; maring-left:100%;}
	100% { opacity: 1; margin-left:0%;}
}
@keyframes fadeOut {
	from { opacity: 1;margin-left:0%;}
	to { opacity: 0;margin-left:200%;}
}
@-webkit-keyframes fadeIn {
	0% { opacity: 0; margin-left:200%;}
	50% { opacity:0.2; maring-left:100%;}
	100% { opacity: 1; margin-left:0%;}
}
@-webkit-keyframes fadeOut {
	from { opacity: 1;margin-left:0%;}
	to { opacity: 0;margin-left:200%;}
}

</style>
<sec:authorize access="isAuthenticated()">
<div class="row">
	<div class="col-lg-2 col-12" style="margin-right:10px;width:19%;">
		<div class="box">
			<div class="box-header with-border" style="height:66px;">
				<h4 class="box-title text-info mb-0"><i class="ti-user me-15"></i>환자정보</h4>
				<button type="button" id="patientSr" data-backdrop="static" class="waves-effect waves-light btn btn-primary mb-5" 
					data-bs-toggle="modal" data-bs-target="#modal-center" 
					style="float:right;border-radius:10px;position:relative;left:13px;bottom:7px;">
					<i class="fa fa-search"></i>환자검색
				</button>
			</div>
			
			<!-- /.box-header -->
			<div class="box-body">
				<div class="row">
					<div class="col-12">
							<input class="form-control" type="hidden" id="paNo" name="paNo"  />
						<input type="hidden" id="empNo" name="empNo" value="<sec:authentication property="principal.empVO.empNo"/>" /> 
						<div class="form-group row">
							<label for="example-text-input" class="col-sm-4 col-form-label" style="color:azure;font-weight:bold;width:43%;">주민등록번호</label>
							<div class="col-sm-10">
								<input class="form-control" type="text" id="paReg" name="paReg"
									value="">
							</div>
						</div>
						<div style="display:flex">
							<div class="form-group row" style="width: 58%;">
								<label for="example-text-input" class="col-sm-4 col-form-label" style="color:azure;font-weight:bold;width: 66%;">이름</label>
								<div class="col-sm-10">
									<input class="form-control" type="text" id="paName"
										name="paName" value="">
								</div>
							</div>
							<div class="form-group row" style="width:50%;">
								<label for="example-text-input" class="col-sm-4 col-form-label" style="color:azure;font-weight:bold;width:66%;">성별</label>
								<div class="col-sm-10">
									<input class="form-control" type="text" id="paSex" name="paSex"
										value="">
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label for="example-text-input" class="col-sm-4 col-form-label" style="color:azure;font-weight:bold;">메모</label>
							<div class="col-sm-10">
								<input class="form-control" type="text" id="rcpMemo" name="rcpMemo"
									value="" readonly="readonly" />
							</div>
						</div>
						<div class="form-group row">
							<label for="example-date-input" class="col-sm-5 col-form-label" style="color:azure;font-weight:bold;">최종내원일</label>
							<div class="col-sm-10">
								<input class="form-control" type="text" id="paFiviDt"
									name="paFiviDt" value="" readonly="readonly">
							</div>
						</div>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.box-body -->
		</div>
	<!-- /////////////////////// 환자 정보 끝//////////////// -->
	
	<!-- /////////////////////// 진료내역 시작 //////////////// -->
	
		<div class="box scrollDiv" style="min-height:295px;max-height:295px;overflow:auto;overflow-y:scroll;">
			<div class="box-header with-border">
				<h4 class="box-title text-info mb-0"><i class="ti-save me-15"></i>진료내역</h4>
			</div>
			
			<!-- /.box-header -->
			<div class="box-body">
				<div class="table-responsive">
							<table id="mainTable" class="table editable-table table-bordered mb-0" style="cursor: pointer;">
								<thead>
									<tr>
										<th style="width:53%;">진료내용</th>
										<th>진료일자</th>
									</tr>
								</thead>
								<tbody id="trmr2">
								</tbody>
							</table>
						<input style="position: absolute; top: 166.297px; left: 490.061px; padding: 14px; text-align: start; font: 400 14px / 21px &quot;IBM Plex Sans&quot;, sans-serif; border: 1px solid rgba(255, 255, 255, 0.12); width: 353.562px; height: 50px; display: none;" class=""></div>
			
				<!-- /.row -->
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->
		
	<!-- //////////////////// 진료 내역 끝///////////////// -->
	</div>
	
	<!-- ///////////////////  오더상세 시작 ///////////////// -->
	<div class="col-lg-5 col-12">
		<div class="box scrollDiv" style="height:750px;max-height:750px;overflow:auto;overflow-y:scroll;">
				<div class="box-header with-border" style="display:flex;justify-content:space-between;height:73px;align-items:center;">
					<h4 class="box-title text-info mb-0" style="width:70%;"><i class="mdi mdi-medical-bag"></i>&nbsp;&nbsp;&nbsp;&nbsp;오더상세</h4>
					<button type="button" id="regedit" class="waves-effect waves-light btn btn-info mb-5" style="border-radius:10px;">등록</button>
					<button type="button" id="cancel" class="waves-effect waves-light btn btn-danger mb-5" style="border-radius:10px;">취소</button>
				</div>
				<div class="box-header with-border" style="display:flex;justify-content:space-between;height:73px;align-items:center;">
					<h4 class="box-title text-info mb-0" style="width:70%;"><i class="mdi mdi-medical-bag"></i>&nbsp;&nbsp;&nbsp;&nbsp;검사</h4>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="table-responsive" id="examGroup" style="margin-bottom:20px;">
						<table id="mainTable" class="table editable-table table-bordered table-separated dataTable" style="cursor: pointer;text-align:center">
							<thead>
								<tr>
									<th style="width:14%;">구분</th>
									<th style="width:19%;">질병코드</th>
									<th>질병명</th>
									<th>검사명</th>
								</tr>
							</thead>
							<tbody id="odTb">
							</tbody>
						</table>
					</div>
				
					<!-- /.row -->
				</div>
				<!-- /.box-body -->
				<div style="display:flex;justify-content:flex-end;">
					<div class="col-md-4" style="margin-right:20px;">
						<h5 class="my-10" style="text-align:center;font-weight:bold;">검사 부위</h5>
						<div class="btn-group bootstrap-select show-tick">
							<select id="testArea" class="selectpicker" tabindex="-98">
								<option value="null">선택해주세요</option>
								<option value="가슴">가슴</option>
								<option value="허리">허리</option>
								<option value="등">등</option>
								<option value="골반">골반</option>
								<option value="머리">머리</option>
								<option value="손">손</option>
								<option value="다리">다리</option>
								<option value="목">목</option>
								<option value="엉덩이">엉덩이</option>
							</select>
						</div>
					</div>
				</div>
				
				
				<div class="box-header with-border" style="display:flex;justify-content:space-between;height:73px;align-items:center;">
					<h4 class="box-title text-info mb-0" style="width:70%;"><i class="mdi mdi-medical-bag"></i>&nbsp;&nbsp;&nbsp;&nbsp;주사</h4>
				</div>
				
				  <div class="box-body">
					<div class="table-responsive ">
						<table id="mainTable" class="table editable-table table-bordered table-separated dataTable" style="cursor: pointer;text-align:center">
							<thead>
								<tr>
									<th style="width:12%;">구분</th>
									<th>약품번호</th>
									<th>약품명</th>
									<th style="width:18%;">업체명</th>
								</tr>
								
							</thead>
							<tbody id="odTbb">
							</tbody>
						</table>
						<input style="position: absolute; top: 166.297px; left: 490.061px; padding: 14px; text-align: start; font: 400 14px / 21px &quot;IBM Plex Sans&quot;, sans-serif; border: 1px solid rgba(255, 255, 255, 0.12); width: 353.562px; height: 50px; display: none;" class="">
					</div>
					
				</div>
				
				<div class="box-header with-border" style="display:flex;justify-content:space-between;height:73px;align-items:center;">
					<h4 class="box-title text-info mb-0" style="width:70%;"><i class="mdi mdi-medical-bag"></i>&nbsp;&nbsp;&nbsp;&nbsp;내복</h4>
				</div>
				
				  <div class="box-body">
					<div class="table-responsive ">
						<table id="mainTable" class="table editable-table table-bordered table-separated dataTable" style="cursor: pointer;text-align:center">
							<thead>
								<tr>
									<th style="width:14%;">구분</th>
									<th>약품번호</th>
									<th>약품명</th>
									<th>업체명</th>
								</tr>
							</thead>
							<tbody id="odTbbb">
							</tbody>
						</table>
						<input style="position: absolute; top: 166.297px; left: 490.061px; padding: 14px; text-align: start; font: 400 14px / 21px &quot;IBM Plex Sans&quot;, sans-serif; border: 1px solid rgba(255, 255, 255, 0.12); width: 353.562px; height: 50px; display: none;" class="">
					</div>
				</div>
			</div>
			<!-- /.box -->
			<!-- ================================================================= -->
		<div style="display:none;">
			<input type="hidden" id="toDisCd" name="toDisCd" />
			<input type="hidden" id="olActCd" name="olActCd" />
			<input type="hidden" id="toGubun" name="toGubun" />
		</div>
	</div>
	<!-- ///////////////////  오더상세 끝 ///////////////// -->
    
    
    
    
    <!-- ///////////////// 진료 환자|제증명 신청 목록 시작 //////////////////// -->
    <div class="col-lg-4 col-12" style="margin-left:10px;width:38%;">
	    <div class="box scrollDiv" style="margin-bottom:24px;max-height:361px;overflow:auto;overflow-y:scroll;min-height:361px;">
	    
    		<div class="box-header with-border" style="display: flex;padding:0.8rem;padding-bottom:4px;">
				<div style="margin-right: 30px;">
					<button type="button" id="newList" class="waves-effect waves-light btn btn-dark btn-flat mb-5 active" style="background-color:#15243e;">
						<h4 style="color: #3596f7;"><i class="ti-user me-15"></i>진료환자 목록</h4></button>
				</div>	
				<div>
					<button type="button" id="oldList" class="waves-effect waves-light btn btn-dark btn-flat mb-5">
						<h4 style="color: #3596f7;"><i class="ti-user me-15"></i>제증명 신청 목록</h4></button>
				</div>
			</div>
			
			<!-- /.box-header -->
			<div class="box-body" id="treatPaList">
				<div class="table-responsive ">
							<table id="mainTable" class="table editable-table table-bordered mb-0 rcpTable" style="cursor: pointer;text-align:center">
								<thead>
									<tr>
										<th>환자번호</th>
										<th>주민등록번호</th>
										<th>수진자</th>
										<th>상태</th>
										<th>버튼</th>
									</tr>
								</thead>
								<tbody id="trtpaList">
<%-- 									<c:forEach var="rcpVO" items="${rcpVOList}" varStatus="stat"> --%>
<!-- 										<tr> -->
<%-- 											<td tabindex="1">${rcpVO.patientVO.paNo}</td> --%>
<%-- 											<td tabindex="1">${rcpVO.patientVO.paReg}</td> --%>
<%-- 											<td tabindex="1" class="paNm1">${rcpVO.patientVO.paName}</td> --%>
<%-- 											<td tabindex="1" id="hs${stat.count}">${rcpVO.patientVO.paState}</td> --%>
<%-- 											<td tabindex="1"><button type="button" id="btnS${stat.count}"  --%>
<%-- 												class="waves-effect waves-light btn mb-5 bg-gradient-primary" style="border-radius:10px;">${rcpVO.patientVO.paUpwt}</button></td> --%>
<!-- 										</tr> -->
<%-- 									</c:forEach> --%>
								</tbody>
							</table>
						<input style="position: absolute; top: 166.297px; left: 490.061px; padding: 14px; text-align: start; font: 400 14px / 21px &quot;IBM Plex Sans&quot;, sans-serif; border: 1px solid rgba(255, 255, 255, 0.12); width: 353.562px; height: 50px; display: none;" class=""></div>
			
				<!-- /.row -->
			</div>
			<!-- /.box-body -->
		<!-- ////////////////////제증명 신청 목록 시작 /////////////////// -->
			<div class="box-body" id="ctforPaList" style="display:none;">
				<div class="table-responsive ">
							<table id="mainTable2" class="table editable-table table-bordered mb-0 rcpTable" style="cursor: pointer;text-align:center">
								<thead>
									<tr>
										<th>환자번호</th>
										<th>수진자</th>
										<th>신청서류</th>
										<th>신청일시</th>
										<th>버튼</th>
									</tr>
								</thead>
								<tbody id="ctforList">
<%-- 									<c:forEach var="ctforVO" items="${ctforVOList}" varStatus="stat"> --%>
<!-- 									<tr> -->
<%-- 										<td tabindex="1">${ctforVO.paNo}</td> --%>
<%-- 										<td tabindex="1">${ctforVO.ctfName}</td> --%>
<%-- 										<td tabindex="1">${ctforVO.ctfGubun}</td> --%>
<%-- 										<td tabindex="1">${ctforVO.ctfEndt.substring(0,16)}</td> --%>
<%-- 										<td tabindex="1"><button type="button" id="btnCtfor${stat.count}"  --%>
<%-- 											class="waves-effect waves-light btn mb-5 bg-gradient-primary" style="border-radius:10px;">${ctforVO.ctfState}</button></td> --%>
<%-- 										<td tabindex="1" style="display:none;"><input type="hidden" id="ctfState" value="${ctforVO.ctfState}" /></td> --%>
<!-- 									</tr> -->
<%-- 									</c:forEach> --%>
								</tbody>
							</table>
						<input style="position: absolute; top: 166.297px; left: 490.061px; padding: 14px; text-align: start; font: 400 14px / 21px &quot;IBM Plex Sans&quot;, sans-serif; border: 1px solid rgba(255, 255, 255, 0.12); width: 353.562px; height: 50px; display: none;" class=""></div>
			
				<!-- /.row -->
			</div>
			
		<!-- ////////////////////제증명 신청 목록 끝  /////////////////// -->
		</div>
		<!-- /.box -->
		
    <!-- ///////////////// 진료 환자|제증명 신청 목록 끝 //////////////////// -->
	
    
	<!-- ///////////////// 검사내역시작 //////////////////// -->
			<div class="box">
				<div class="box-header with-border">
					<h4 class="box-title text-info mb-0"><i class="ti-save me-15"></i>검사내역</h4>
					
				</div>
				<!-- /.box-header -->
				<div class="box-body scrollDiv" style="max-height:299px; min-height:299px; overflow:auto; overflow-y:scroll;">
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
							<tbody id="examList2">
	<!-- 							<tr> -->
	<!-- 								<th scope="row">1</th> -->
	<!-- 								<td>22/09/01</td> -->
	<!-- 								<td>흉부</td> -->
	<!-- 								<td><img src="/resources/upload/file.png" style="margin-left:15px; width:30px; height:30px;"/></td> -->
	<!-- 							</tr> -->
							</tbody>
						</table>
					</div>
				</div>
				<!-- /.box-body -->
			</div>
    <!-- ///////////////// 검사내역 끝 //////////////////// -->
    </div>
</div>

<!-- modal 영역 -->

<!-- fill modal 시작 -->
<div class="modal modal-right fade" data-backdrop="false" id="modal-rightt" tabindex="-1" style="display: none;z-index:1047;" aria-hidden="true">
  <div class="modal-dialog" style="width:78%;">
	<div class="modal-content">
	  <div class="modal-header" style="left: 26px; position: absolute; height:60vh">
		<div class="fc-right">
			<div class="fc-button-group" style="height:100%;">
				<ul class="nav nav-tabs" role="tablist" style="display:block;width:143%;padding-left:8px;height:106%;border: none;">
				    <li class="nav-item" style="margin-right:25px;margin-bottom:100px;display:flex;">
				        <button class="nav-link active" id="chTab" data-bs-toggle="tab" role="tab" aria-selected="false" 
				        	style="display:inline-block;border-radius:10px;margin-right:54px;height:38px;">
				            <span><i class="fa fa-fw fa-file"></i>차&nbsp;&nbsp;트</span>
				        </button>
				        
				    </li>
				    <li class="nav-item" style="margin-right:25px;margin-bottom:100px;display:flex;"> 
				        <button class="nav-link" id="diaTab" data-bs-toggle="tab" role="tab" aria-selected="false" 
				        	style="display:inline-block;border-radius:10px;margin-right:48px;">
				            <span><i class="fa fa-fw fa-file"></i>진단서</span>
				        </button>
				    </li>
				    <li class="nav-item" style="margin-right:25px;margin-bottom:100px;display:flex;"> 
				        <button class="nav-link" id="noteTab" data-bs-toggle="tab" role="tab" aria-selected="false" 
				        	style="display:inline-block;border-radius:10px;margin-right:48px;">
				            <span><i class="fa fa-fw fa-file"></i>소견서</span> 
				        </button>
				        
				    </li>
				    <li class="nav-item" style="display:flex;"> 
				        <button class="nav-link" id="preTab" data-bs-toggle="tab" role="tab" aria-selected="true"  
				        	style="display:inline-block;border-radius:10px;margin-right:48px;">
				            <span><i class="fa fa-fw fa-file"></i>처방전</span>
				        </button> 
				    </li>
				</ul>
			</div>
		</div>
	  </div>
	  <div class="modal-body" style="height:96vh;left:195px;">
		<div class="col-lg-6 col-12">
		
    <!-- ///////////////// 차트 시작 ////////////////////////// -->
    		<div class="col-lg-6 col-12" id="docuCh" style="width:210mm;height:209.99mm;">
    			<!-- 정형외과 차트 시작 ///////////////////////////////////////////////////////////// -->
    			<div class="box" style="max-height:900px;">
					<div class="box-header with-border">
					  <h3 class="box-title" style="text-align:center;font-weight:700;"><i class="fa fa-folder-open-o" aria-hidden="true" style="margin-right:30px;"></i>정형외과 차트</h3>
					</div>
					<!-- /.box-header -->
						<div class="box-body">
							<div class="row">
							  <div class="col-md-6">
								<div class="form-group">
								<label class="col-form-label" style="color:azure;font-weight:bold;">차트 번호</label>
									<input type="text" class="form-control" id="chNo" name="chNo" value="" readonly="readonly" />
									<input type="hidden" class="form-control" id="rcpNo" name="rcpNo" value="" />
								</div>
							  </div>
							  <div class="col-md-6">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">작성날짜</label>
									<input type="text" class="form-control" id="chEndt" name="chEndt" value="" readonly="readonly" />
									<input type="hidden" class="form-control" id="chDt" name="chDt" value="" />
								</div>
							  </div>
							</div>
							
							
							<div class="row">
							  <div class="col-md-6">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">수진자</label>
								    <input type="text" class="form-control" id="ch_paName" name="paName" value=""  />
								</div>
							  </div>
							  <div class="col-md-6">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">주민등록번호</label>
								    <input type="text" class="form-control" id="ch_paReg" name="paReg" value="" readonly="readonly" />
								</div>
							  </div>
							</div>
							
							<div class="row">
							  <div class="col-md-2">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">나이</label>
								    <input type="text" class="form-control" id="ch_paAge" value="" readonly="readonly" />
								</div>
							  </div>
							  <div class="col-md-2">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">성별</label>
								    <input type="text" class="form-control" id="ch_paSex" name="paSex" value="" />
								</div>
							  </div>
							  <div class="col-md-4">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">전화번호</label>
								    <input type="text" class="form-control" id="ch_paPh" name="paPh" value="" readonly="readonly" />
								</div>
							  </div>
							  <div class="col-md-4">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">이메일</label>
								    <input type="text" class="form-control" id="ch_paMail" name="paMail" value="" readonly="readonly" />
								</div>
							  </div>
							</div>
							
							
							<div class="row">
							  <div class="col-md-6">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">기본주소</label>
								    <input type="text" class="form-control" id="ch_paAdd1" name="paAdd1" value="" readonly="readonly" />
								</div>
							  </div>
							  <div class="col-md-6">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">상세주소</label>
								    <input type="text" class="form-control" id="ch_paAdd2" name="paAdd2" value="" readonly="readonly" />
								</div>
							  </div>
							</div>
							
							
							<div class="form-group">
							  <label class="col-form-label" style="color:azure;font-weight:bold;">차트 내용(진료 상세)</label>
							    <textarea rows="3" class="form-control" id="chCont" name="chCont" readonly="readonly"
									placeholder="내용을 작성하세요">
								</textarea>
							</div>
							
							
							<div class="row">
							  <div class="col-md-6">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">담당의</label>
								    <input type="text" class="form-control" id="empName" name="empName" readonly="readonly" value="<sec:authentication property="principal.empVO.empName"/>" />
								</div>
							  </div>
							  <div class="col-md-6">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">질병코드</label>
								    <input type="text" class="form-control" id="olDisCd" name="olDisCd" value="" readonly="readonly" />
								</div>
							  </div>
							</div>
							
							<div class="form-group">
							  <label class="col-form-label" style="color:azure;font-weight:bold;">주요 호소 증상</label>
							    <textarea rows="3" class="form-control" id="chCont2" name="chCont2"  readonly="readonly"
									placeholder="내용을 작성하세요">
								</textarea>
							</div>
							
						</div>
						<!-- /.box-body -->
						<div class="box-footer" style="display:flex;justify-content:flex-end;">
							<button type="button" id="saveCh" class="waves-effect waves-light btn btn-info mb-5" style="margin-right:18px;">
					        	<i class="fa fa-save" style="margin-right:12px;"></i>등록
					        </button>
					        <button type="button" id="editCh" class="waves-effect waves-light btn mb-5 bg-gradient-success" 
					         	style="height:41.11px;margin-right:18px;">
					        	<i class="fa fa-edit" style="margin-right:12px;"></i>수정
					        </button>
					        <button type="button" id="chClose" class="waves-effect waves-light btn mb-5 bg-gradient-danger" data-bs-dismiss="modal" style="height:41.11px;margin-right:18px;">
					        	<i class="fa fa-close" aria-hidden="true" style="margin-right:12px;"></i>닫기
					        </button>
					        <button type="button" id="chOk" class="waves-effect waves-light btn btn-info mb-5" style="margin-right:18px;
					        	display:none;">
					        	<i class="fa fa-save" style="margin-right:12px;"></i>확인
					        </button>
					        <button type="button" id="chCancel" class="waves-effect waves-light btn btn-warning mb-5" style="height:41.11px;
					         	display:none;float:right;">
					        	<i class="fa fa-mail-reply"" style="margin-right:12px;"></i>이전
					        </button>
						</div>  
				  </div>
    			
    			<!-- 정형외과 차트 끝 ///////////////////////////////////////////////////////////// -->
    			
		    </div>
		    <!-- ///////////////// 차트 끝 ////////////////////////// -->
		    
		    
		    
		    <!-- ///////////////// 진단서 시작 ////////////////////////// -->
		    <div class="col-lg-6 col-12" id="docuDia" style="width:210mm;height:209.99mm;display:none;position:relative;top:-16px;">
		    	<!-- 진단서 시작 ////////////////////////////////-->
		    	<div class="box" style="margin-top: 7px;">
					<div class="box-header with-border">
						<h3 class="box-title" style="text-align:center;font-weight:700;"><i class="fa fa-folder-open-o" aria-hidden="true" style="margin-right:30px;"></i>진단서 (Diagnosis)</h3>
					</div>
					<div class="box-header with-border" style="display:flex;">
						<label class="col-form-label" style="color:azure;font-weight:bold;margin-right:32px;">담당의</label>
						<input type="text" class="form-control" id="empName2" name="empName2" value="<sec:authentication property="principal.empVO.empName"/>" readonly="readonly" 
						 style="width:15%; text-align:center;background-color:#162F5B;color:azure;font-weight:bold;" />
					</div>
					<!-- /.box-header -->
						<div class="box-body">
							<div class="row">
							  <div class="col-md-3">
								<div class="form-group">
								<label class="col-form-label" style="color:azure;font-weight:bold;">성명</label>
									<input type="text" class="form-control" id="paName2" value="" readonly="readonly" />
								</div>
							  </div>
							  <div class="col-md-5">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">주민번호</label>
									<input type="text" class="form-control" id="paReg2" value="" readonly="readonly" />
								</div>
							  </div>
							  <div class="col-md-2">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">성별</label>
									<input type="text" class="form-control" id="paSex2"  value="" readonly="readonly" />
								</div>
							  </div>
							  <div class="col-md-2">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">연령</label>
									<input type="text" class="form-control" id="paAge2" value="" readonly="readonly" />
								</div>
							  </div>
							</div>
							
							
							<div class="row">
							  <div class="col-md-6">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">기본주소</label>
								    <input type="text" class="form-control" id="dia_paAdd1" value="" readonly="readonly" />
								</div>
							  </div>
							  <div class="col-md-6">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">상세주소</label>
								    <input type="text" class="form-control" id="dia_paAdd2" value="" readonly="readonly" />
								</div>
							  </div>
							</div>
							
							<div class="row">
							  <div class="col-md-4">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">병명</label>
								    <input type="text" class="form-control" id="disName" value="" readonly="readonly" />
								</div>
							  </div>
							  <div class="col-md-4">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">진단일</label>
								    <input type="text" class="form-control" id="diaDt" value="" />
								</div>
							  </div>
							  <div class="col-md-4">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">한국질병 분류번호</label>
								    <input type="text" class="form-control" id="disCd2" value="" readonly="readonly" />
								</div>
							  </div>
							  <div class="col-md-4" style="display:none;">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">발병일</label>
								    <input type="text" class="form-control" id="disDate" value="" readonly="readonly" />
								</div>
							  </div>
							</div>
							
							<div class="form-group">
							  <label class="col-form-label" style="color:azure;font-weight:bold;">내용</label>
							    <textarea rows="3" class="form-control" id="diaCont" readonly="readonly" 
									placeholder="내용을 작성하세요">
								</textarea>
							</div>
							
							<div class="row">
							  <div class="col-md-6">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">비고</label>
								    <input type="text" class="form-control" id="diaBigo" value="" readonly="readonly" />
								</div>
							  </div>
							  <div class="col-md-6">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">용도</label>
								    <input type="text" class="form-control" id="diaUse" value="" readonly="readonly" />
								</div>
							  </div>
							</div>
							<div class="row">
							  <div class="col-md-12">
								<div class="form-group" style="display:flex;">
								  <label class="col-form-label" style="color:azure;font-weight:bold;width:20%;font-size:1.3rem;">발행일</label>
								    <input type="text" class="form-control" id="sysd1" value="" readonly="readonly" 
								    	style="border:none;font-size:1.3rem;color:azure;font-weight:bold;" />
								</div>
							  </div>
							  <div class="col-md-12">
								<div class="form-group" style="display:flex;">
								  <label class="col-form-label" style="color:azure;font-weight:bold;width:20%;font-size:1.3rem;">의료기관명</label>
								    <input type="text" class="form-control" value="DDIT 의료재단 Medical_TechNology" 
								    	readonly="readonly" style="border:none;font-size:1.3rem;color:azure;font-weight:bold;" />
								</div>
							  </div>
							  <div class="col-md-12">
								<div class="form-group" style="display:flex;">
								  <label class="col-form-label" style="color:azure;font-weight:bold;width:20%;font-size:1.3rem;">주소 및 명칭</label>
								    <input type="text" class="form-control" value="대전시 중구 계룡로 846, 3-4층" 
								    	readonly="readonly" style="border:none;font-size:1.3rem;color:azure;font-weight:bold;" />
								</div>
							  </div>
							  <div class="col-md-12">
								<div class="form-group" style="display:flex;">
								  <label class="col-form-label" style="color:azure;font-weight:bold;width:20%;font-size:1.3rem;">전화</label>
								    <input type="text" class="form-control" value="042 - 222 - 8202&nbsp;&nbsp;FAX : 070 -8768 - 2972" 
								    	readonly="readonly" style="border:none;font-size:1.3rem;color:azure;font-weight:bold;" />
								</div>
							  </div>
							</div>
							
							
							
							
						<!-- /.box-body -->
						<div class="box-footer" style="display:flex;justify-content:flex-end;height:49px;padding:0;border-top:none;">
							<button type="button" id="saveDia" class="waves-effect waves-light btn btn-info mb-5" style="margin-right:18px;height:41.11px;">
					        <i class="fa fa-save" style="margin-right:12px;"></i>등록
					        </button>
					         <button type="button" id="editDia" class="waves-effect waves-light btn mb-5 bg-gradient-success" 
					         	style="height:41.11px;margin-right:18px;">
					        <i class="fa fa-edit" style="margin-right:12px;"></i>수정
					        </button>
					        <button type="button" id="diaClose" class="waves-effect waves-light btn mb-5 bg-gradient-danger" data-bs-dismiss="modal" style="height:41.11px;margin-right:18px;">
					        	<i class="fa fa-close" aria-hidden="true" style="margin-right:12px;"></i>닫기
					        </button>
					        <button type="button" id="diaOk" class="waves-effect waves-light btn btn-info mb-5" style="margin-right:18px;
					        display:none;">
					        <i class="fa fa-save" style="margin-right:12px;"></i>확인
					        </button>
					         <button type="button" id="diaCancel" class="waves-effect waves-light btn btn-warning mb-5" style="height:41.11px;
					         	display:none;float:right;">
					        <i class="fa fa-mail-reply" style="margin-right:12px;"></i>이전
					        </button>
						</div>  
						
				  </div>
		    
		    <!-- 진단서 끝 ///////////////////////////////// -->
			 </div> <!-- box.끝 -->
		    <!-- ///////////////// 진단서 끝 ////////////////////////// -->
		   </div> <!-- 남겨 -->
		    
		    
		    <!-- ///////////////// 소견서 시작 ////////////////////////// -->
			<div class="col-lg-6 col-12" id="docuNote" style="width:210mm;height:209.99mm;margin:0;display:none;">
			
				<!-- 소견서 시작 ////////////////////////////////-->
		    	<div class="box" style="max-height:892px;">
					<div class="box-header with-border">
						<h3 class="box-title" style="text-align:center;font-weight:700;"><i class="fa fa-folder-open-o" aria-hidden="true" style="margin-right:30px;"></i>소견서 (Note)</h3>
					</div>
					<div class="box-header with-border" style="display:flex;">
						<label class="col-form-label" style="color:azure;font-weight:bold;margin-right:32px;">담당의</label>
						<input type="text" class="form-control" id="damdang" value="<sec:authentication property="principal.empVO.empName"/>" readonly="readonly" 
						 style="width:15%; text-align:center;background-color:#162F5B;color:azure;font-weight:bold;" />
					</div>
					<!-- /.box-header -->
						<div class="box-body">
							<div class="row">
							  <div class="col-md-3">
								<div class="form-group">
								<label class="col-form-label" style="color:azure;font-weight:bold;">성명</label>
									<input type="text" class="form-control" id="paName3" value="" readonly="readonly" />
								</div>
							  </div>
							  <div class="col-md-5">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">주민번호</label>
									<input type="text" class="form-control" id="paReg3" value="" readonly="readonly" />
								</div>
							  </div>
							  <div class="col-md-2">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">성별</label>
									<input type="text" class="form-control" id="paSex3"  value="" readonly="readonly" />
								</div>
							  </div>
							  <div class="col-md-2">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">연령</label>
									<input type="text" class="form-control" id="paAge3" value="" readonly="readonly" />
								</div>
							  </div>
							</div>
							
							
							<div class="row">
							  <div class="col-md-6">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">기본주소</label>
								    <input type="text" class="form-control" id="note_paAdd1" value="" readonly="readonly" />
								</div>
							  </div>
							  <div class="col-md-6">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">상세주소</label>
								    <input type="text" class="form-control" id="note_paAdd2" value="" readonly="readonly" />
								</div>
							  </div>
							</div>
							
							<div class="form-group">
							  <label class="col-form-label" style="color:azure;font-weight:bold;">진료소견</label>
							    <textarea rows="3" class="form-control" id="ntView" readonly="readonly" 
									placeholder="내용을 작성하세요">
								</textarea>
							</div>
							
							
							
							
							<div class="row" style="height:162px;">
							  <div class="col-md-4">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">용도</label>
								    <input type="text" class="form-control" id="ntUse" value="" readonly="readonly" />
								</div>
							  </div>
							  <div class="col-md-8" style="position:absolute;left:61%;height:31%;width:39%;">
								<div class="form-group">
								  <label class="form-label" style="margin-right:10px;">비고(이미지)</label>
								  <label class="file">
									<input type="file" id="input_imgs" />
									<div class="card" id="card-images" style="max-height:273px;min-height:273px;">
									</div>
								  </label>
								</div>
							  </div>
							</div>
							<div class="row">
							  <div class="col-md-12">
								<div class="form-group" style="display:flex;">
								  <label class="col-form-label" style="color:azure;font-weight:bold;width:20%;font-size:1.3rem;">발행일</label>
								    <input type="text" class="form-control" id="sysd2" value="" readonly="readonly" 
								    	style="border:none;font-size:1.3rem;color:azure;font-weight:bold;" />
								</div>
							  </div>
							  <div class="col-md-12">
								<div class="form-group" style="display:flex;">
								  <label class="col-form-label" style="color:azure;font-weight:bold;width:20%;font-size:1.3rem;">의료기관명</label>
								    <input type="text" class="form-control" value="DDIT 의료재단 Medical_TechNology" 
								    	readonly="readonly" style="border:none;font-size:1.3rem;color:azure;font-weight:bold;" />
								</div>
							  </div>
							  <div class="col-md-12">
								<div class="form-group" style="display:flex;">
								  <label class="col-form-label" style="color:azure;font-weight:bold;width:20%;font-size:1.3rem;">주소 및 명칭</label>
								    <input type="text" class="form-control" value="대전시 중구 계룡로 846, 3-4층" 
								    	readonly="readonly" style="border:none;font-size:1.3rem;color:azure;font-weight:bold;" />
								</div>
							  </div>
							  <div class="col-md-12">
								<div class="form-group" style="display:flex;">
								  <label class="col-form-label" style="color:azure;font-weight:bold;width:20%;font-size:1.3rem;">전화</label>
								    <input type="text" class="form-control" value="042 - 222 - 8202&nbsp;&nbsp;FAX : 070 -8768 - 2972" 
								    	readonly="readonly" style="border:none;font-size:1.3rem;color:azure;font-weight:bold;" />
								</div>
							  </div>
							</div>
							
						<!-- /.box-body -->
						<div class="box-footer" style="display:flex;justify-content:flex-end;height:49px;padding:0;border-top:none;position:relative;top;6px;">
							<button type="button" id="saveNote" class="waves-effect waves-light btn btn-info mb-5" style="margin-right:18px;" >
						        <i class="fa fa-save" style="margin-right:12px;"></i>등록
					        </button>
					        <button type="button" id="editNote" class="waves-effect waves-light btn mb-5 bg-gradient-success" 
					         	style="height:41.11px;margin-right:18px;">
					        	<i class="fa fa-edit" style="margin-right:12px;"></i>수정
					        </button>
					        <button type="button" id="noteClose" class="waves-effect waves-light btn mb-5 bg-gradient-danger" data-bs-dismiss="modal" style="height:41.11px;margin-right:18px;">
					        	<i class="fa fa-close" aria-hidden="true" style="margin-right:12px;"></i>닫기
					        </button>
					        <button type="button" id="noteOk" class="waves-effect waves-light btn btn-info mb-5" style="margin-right:18px;
					        	display:none;">
					        	<i class="fa fa-save" style="margin-right:12px;"></i>확인
					        </button>
					        <button type="button" id="noteCancel" class="waves-effect waves-light btn btn-warning mb-5" style="height:41.11px;
					         	display:none;float:right;">
					        	<i class="fa fa-mail-reply" style="margin-right:12px;"></i>이전
					        </button>
						</div>  
						
				  </div>
		    
		    <!-- 소견서서 끝 ///////////////////////////////// -->
			 </div> <!-- box.끝 -->
		    </div><!-- 남겨 -->
			    
		    
		    <!-- ///////////////// 소견서 끝 ////////////////////////// -->
		    
		    
		    
		    <!-- ///////////////// 원외처방전 시작 ////////////////////////// -->
		    <div class="col-lg-6 col-12" id="docuPre" style="width:210mm;height:209.99mm;margin:0;display:none;">
		    
		    	<!-- 원외처방전 시작 ////////////////////////////////-->
		    	<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title" style="text-align:center;font-weight:700;"><i class="fa fa-folder-open-o" aria-hidden="true" style="margin-right:30px;"></i>원외처방전 (Prescription)</h3>
					</div>
					<!-- /.box-header -->
						<div class="box-body">
							<div class="row">
							  <div class="col-md-3">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">교부 연월일</label>
									<input type="text" class="form-control" id="injDt"  value="" readonly="readonly" />
								</div>
							  </div>
							  <div class="col-md-4">
								<div class="form-group">
								<label class="col-form-label" style="color:azure;font-weight:bold;">성명</label>
									<input type="text" class="form-control" id="paName4" value="" readonly="readonly" />
								</div>
							  </div>
							  <div class="col-md-5">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">주민번호</label>
									<input type="text" class="form-control" id="paReg4" value="" readonly="readonly" />
								</div>
							  </div>
							  
							</div>
							
							<div class="row">
								<div class="col-md-6">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">처방의료인의 성명</label>
									<input type="text" class="form-control" id="empName4" value="<sec:authentication property="principal.empVO.empName"/>" readonly="readonly" />
								</div>
							  </div>
							  <div class="col-md-6">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">질병 분류기호</label>
								    <input type="text" class="form-control" id="disCd4" value="" readonly="readonly" />
								</div>
							  </div>
							</div>
							
							
							<div class="row">
							  <div class="col-md-6">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">의료기관 명칭</label>
								    <input type="text" class="form-control" value="DDIT 의료재단  Medical_TechNology" readonly="readonly" />
								</div>
							  </div>
							  <div class="col-md-6">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">의료기관 전화번호</label>
								    <input type="text" class="form-control" value="042 - 222 - 8202" readonly="readonly" />
								</div>
							  </div>
							  
							</div>
							
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label class="col-form-label" style="color:azure;font-weight:bold;
											border:1px solid azure;width:100%;padding-left:10px;margin-top:10px;margin-bottom:10px;">※환자의 요구가 있는 때에는 질병분류기호를 기재하지 아니합니다.</label>
									</div>
								</div>
							</div>
							
							<div class="row">
							  <div class="col-md-6">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">처방 의약품의 명칭</label>
								    <input type="text" class="form-control" id="dName0" value="" readonly="readonly" />
								</div>
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;"></label>
								    <input type="text" class="form-control" id="dName1" value="" readonly="readonly" style="margin-top:-27px;" />
								</div>
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;"></label>
								    <input type="text" class="form-control" id="dName2" value="" readonly="readonly" style="margin-top:-27px;" />
								</div>
							  </div>
							  <div class="col-md-2">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">1회 투약량</label>
								    <input type="text" class="form-control" id="preShot0" value="" readonly="readonly" />
								</div>
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;"></label>
								    <input type="text" class="form-control" id="preShot1" value="" readonly="readonly" style="margin-top:-27px;" />
								</div>
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;"></label>
								    <input type="text" class="form-control" id="preShot2" value="" readonly="readonly" style="margin-top:-27px;" />
								</div>
							  </div>
							  <div class="col-md-2">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">1일 투여횟수</label>
								    <input type="text" class="form-control" id="preCnt0" value="" readonly="readonly"  />
								</div>
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;"></label>
								    <input type="text" class="form-control" id="preCnt1" value="" readonly="readonly" style="margin-top:-27px;" />
								</div>
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;"></label>
								    <input type="text" class="form-control" id="preCnt2" value="" readonly="readonly" style="margin-top:-27px;" />
								</div>
							  </div>
							  <div class="col-md-2">
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;">총 투약일수</label>
								    <input type="text" class="form-control" id="preDays0" value="" readonly="readonly" />
								</div>
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;"></label>
								    <input type="text" class="form-control" id="preDays1" value="" readonly="readonly" style="margin-top:-27px;" />
								</div>
								<div class="form-group">
								  <label class="col-form-label" style="color:azure;font-weight:bold;"></label>
								    <input type="text" class="form-control" id="preDays2" value="" readonly="readonly" style="margin-top:-27px;" />
								</div>
							  </div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<label class="col-form-label" style="color:azure;font-weight:bold;border:1px solid azure;width:100%;
									padding-left:10px;margin-top:10px;margin-bottom:10px;">용법 : 매식(전,간,후) 시 &nbsp;분복용</label>
								</div>
							</div>
							<br />
							<br />
							<div class="row" style="margin-bottom:111px;">
								<div class="col-me-12">
									<label class="col-form-label" style="color:azure;font-weight:bold;display:flex;width:100%;">교부일부터
									<input type="text" class="form-control" id="kyobu" value="" readonly="readonly" style="border:none;width:11%;
										text-align:center;padding:0;color:azure;font-weight:bold;" /><span>일간 사용기간내에 약국에 제출하여야 합니다.</span></label>
								</div>
							</div>
							
						<!-- /.box-body -->
						<div class="box-footer" style="display:flex;justify-content:flex-end;height:49px;padding:0;border-top:none;">
							<button type="button" id="savePre" class="waves-effect waves-light btn btn-info mb-5" style="margin-right:18px;" >
					        	<i class="fa fa-save" style="margin-right:12px;"></i>등록
					        </button>
					        <button type="button" id="editPre" class="waves-effect waves-light btn mb-5 bg-gradient-success" 
					         	style="height:41.11px;margin-right:18px;">
					        	<i class="fa fa-edit" style="margin-right:12px;"></i>수정
					        </button>
					        <button type="button" id="preClose" class="waves-effect waves-light btn mb-5 bg-gradient-danger" data-bs-dismiss="modal" style="height:41.11px;margin-right:18px;">
					        	<i class="fa fa-close" aria-hidden="true" style="margin-right:12px;"></i>닫기
					        </button>
					        <button type="button" id="preOk" class="waves-effect waves-light btn btn-info mb-5" style="margin-right:18px;
					        	display:none;">
					        	<i class="fa fa-save" style="margin-right:12px;"></i>확인
					        </button>  
					        <button type="button" id="preCancel" class="waves-effect waves-light btn btn-warning mb-5" style="height:41.11px;
					         	display:none;float:right;">
					        	<i class="fa fa-mail-reply" style="margin-right:12px;"></i>이전
					        </button>
						</div>  
						
				  </div>
		    
		    <!-- 원외처방전 끝 ///////////////////////////////// -->
			 </div> <!-- box.끝 -->
			 
			 
		    </div> <!-- 남겨 -->
    <!-- ///////////////// 원외처방전 끝 ////////////////////////// -->
    
    <!-- ///////////////////  병원 문서 끝 ///////////////// -->
    <div id="detailBody">
	    <img src="/resources/mediTemple/html/images/svg-icon/medical/body.png" 
			                    style="position:fixed;top:72.15mm;left:216.97mm;width:130.15mm;height:130.65mm;" />
		<input type="checkbox" id="md_checkbox_1" class="filled-in chk-col-danger" name="chkchk" value="다리" />
		<label for="md_checkbox_1" style="position:fixed;left:325mm;bottom:60mm;color:#FEA62B;font-weight:bold;">다리</label>
		<input type="checkbox" id="md_checkbox_2" class="filled-in chk-col-danger" name="chkchk" value="손" />
		<label for="md_checkbox_2" style="position:fixed;left:279mm;bottom:83mm;color:#FEA62B;font-weight:bold;">손</label>
		<input type="checkbox" id="md_checkbox_3" class="filled-in chk-col-danger" name="chkchk" value="가슴" />
		<label for="md_checkbox_3" style="position:fixed;left:331mm;bottom:137mm;color:#FEA62B;font-weight:bold;">가슴</label>
		<input type="checkbox" id="md_checkbox_4" class="filled-in chk-col-danger" name="chkchk" value="등" />
		<label for="md_checkbox_4" style="position:fixed;left:275mm;bottom:135mm;color:#FEA62B;font-weight:bold;">등</label>
		<input type="checkbox" id="md_checkbox_5" class="filled-in chk-col-danger" name="chkchk" value="목" />
		<label for="md_checkbox_5" style="position:fixed;left:289mm;bottom:152mm;color:#FEA62B;font-weight:bold;">목</label>
		<input type="checkbox" id="md_checkbox_6" class="filled-in chk-col-danger" name="chkchk" value="허리" />
		<label for="md_checkbox_6" style="position:fixed;left:332mm;bottom:123mm;color:#FEA62B;font-weight:bold;">허리</label>
		<input type="checkbox" id="md_checkbox_7" class="filled-in chk-col-danger" name="chkchk" value="골반" />
		<label for="md_checkbox_7" style="position:fixed;left:268mm;bottom:114mm;color:#FEA62B;font-weight:bold;">골반</label>
		<input type="checkbox" id="md_checkbox_8" class="filled-in chk-col-danger" name="chkchk" value="머리" />
		<label for="md_checkbox_8" style="position:fixed;left:308mm;bottom:173mm;color:#FEA62B;font-weight:bold;">머리</label>
		<input type="checkbox" id="md_checkbox_9" class="filled-in chk-col-danger" name="chkchk" value="엉덩이" />
		<label for="md_checkbox_9" style="position:fixed;left:325mm;bottom:84mm;color:#FEA62B;font-weight:bold;">엉덩이</label>
    </div>
    
  </div>
 </div>
<!-- 	  <div class="modal-footer" style="display:flex;justify-content:flex-end;width:139%;"> -->
<!-- 		<button type="button" class="btn btn-danger" data-bs-dismiss="modal" style="position:relative;left:100px;width:90px;bottom:72px;">닫기</button> -->
<!-- 	  </div> -->
	</div>
  </div>
  <input type="hidden" id="diag" value="diag" /><input type="hidden" id="diaPmtPrice" value="2000" />
  <input type="hidden" id="note" value="note" /><input type="hidden" id="ntPmtPrice" value="3000" />
  <input type="hidden" id="pres" value="pres" />
</div>

</sec:authorize>

<!-- fill modal 끝 -->
<!-- center modal 시작 -->

<div class="modal center-modal fade" id="modal-center" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" style="display: none;" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content">
	  <div class="modal-header">
		<input type="search" id="paSearch" class="form-control form-control-sm" placeholder="이름을 입력해주세요" 
			style="width: 30%;margin-right: 50px;height:40px;" />
		<button type="button" id="btnSearch" class="waves-effect waves-light btn mb-5 bg-gradient-primary" style="right:180px;top:2px;">
			<i class="fa fa-search" aria-hidden="true"></i>&nbsp;&nbsp;검색</button>
	  </div>
	  <div class="modal-body scrollDiv" style="max-height:400px;overflow:auto;">
	  	<div class="table-responsive">
		    <table id="mainTable" class="table editable-table table-bordered mb-0" style="cursor: pointer;text-align:center">
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
		    <input
		        style="position: absolute; top: 166.297px; left: 490.061px; padding: 14px; text-align: start; font: 400 14px / 21px &quot;IBM Plex Sans&quot;, sans-serif; border: 1px solid rgba(255, 255, 255, 0.12); width: 353.562px; height: 50px; display: none;"
		        class="">
		</div>
	  </div>
	  <div class="modal-footer modal-footer-uniform" style="display:flex;justify-content:flex-end;">
		<button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
	  </div>
	</div>
  </div>
</div>
<!-- center modal 끝 -->

<!-- myModal 시작 -->
<div id="myModal" class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">검사 이미지</h4>
			</div>
			<div id="modalImg" class="modal-body" style="max-height:800px; overflow:auto">
			
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal" style="float:right;">닫기</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- myModal 끝 -->
<!-- fullModal 시작 -->
<div id="myModalImg" class="modal fade" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document" style="width:100%; height:100%; margin:0; padding:0;">
		<div class="modal-content" style="width:100vw; height:100%;">
			<div class="modal-header" style="dispalye:flex; justify-content:space-between;">
				<div style="margin-left:148px;">
					<h4 class="modal-title" id="myModalLabel" style="font-size:1.9rem;">확대 이미지</h4>
				</div>
				<div>
					<h4><a id="imgDownload" href="" download style="margin-right:140px;"><i class="ti-save me-15"></i></a></h4>
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
<!-- fullModal 끝 -->

<!-- <div><button type="button" id="sweet" class="waves-effect waves-light btn mb-5 bg-gradient-warning"  -->
<!-- style="border-radius:10px;">test버튼</button> -->
<!-- </div> -->

<script type="text/javascript">
	var preArr = [];
	var patientVOList = null;
	var paName = "";
	var paState = "";
	var paUpwt = "";
	var tbNo = $('.rcpTable >tbody tr').length;
	var rs = "";
	var today = new Date();
	var day =fn_getInsertDate(today).substr(0,10);
	let header = "${_csrf.headerName}";
	let token  = "${_csrf.token}";
	// 환자목록뿌려주기
	treatReload();
	ctforReload();
	color();
	
	
	window.onbeforeunload = function(){ $('#loading_bar').show();}
$(function(){
	$('#loading_bar').hide();
// 	treatReload();
// 	ctforReload();
// 	color();
	// 검사부위 글 바꿔주기 
	$('.filter-option').text('검사부위를 선택해주세요');
	// select box 부위
	$('#doc').on('click',function(){
		$('input:checkbox[name=chkchk]').prop('checked', false);	
		$('input:checkbox[name=chkchk]').each(function(){
			if(this.value == $('#testArea option:selected').val()){
				this.checked = true;
			}
		});
	});
	
	
	// 스윗알럿 체크
	$('#sweet').on('click',function(){
		$('#loading_bar').show();
		setTimeout(()=>{
			$('#loading_bar').hide();
		}, 3000)
		$('input[type=checkbox][name=chkchk]:checked').val();		
		console.log($('input[type=checkbox][name=chkchk]:checked').val());		
		color();
		console.log($('#diaCont').val());
		console.log($('#testArea option:selected').val());
//		var value1 = $('input[name=group5][type=radio]:checked').val();
//		console.log(value1);
//		
//		var a = $('.olNe').text();
//		console.log(a);
// 		Swal.fire({
// 	        icon: 'success',
// 	        title: '글이 잘 등록되었습니다',
// 	        showConfirmButton: false,
// 	        background: '#15243e',
// 	        timer: 5500,
// 	    }).then((value) => {
// 	        if(value){
// 	            console.log('good');
	            
	            
// 	        }
// 	    });
		
		
	});
	
	// 환자정보 -> 환자검색버튼눌럿을시 
	$('#patientSr').on('click',function(){
		$('#trmr2').empty();
		$("#modal-center").modal("show");
		$('#modal-center').modal({backdrop: 'static', keyboard: false});
	});
	$('tr td button').on('click',function(){
		$('#trmr2').empty();
	});
	
	
	$('input[type=search]').on('keyup',function(e){
		if(e.key ==='Enter' || e.keyCode === 13){
			$('#btnSearch').trigger('click');
		}
	});
	
	// 모달창안에서 환자검색버튼
	$('#btnSearch').on('click', function(){
		
		$('#paData').empty();
		let str = $('#paSearch').val();
		console.log("이름 :  " + str);
		
		let data = {"paName":str};
		console.log('data : ' + JSON.stringify(data));
		
		$.ajax({
			url:'/doctor/searchPa',
			contentType:'application/json;charset=utf-8',
			data:JSON.stringify(data),
			dataType:'json',
			type:'post',
			beforeSend:function(xhr){
				xhr.setRequestHeader(header,token);
			},
			
			success:function(result){
				//result : List<PatientVO>
				console.log('result : ' + JSON.stringify(result));
				patientVOList = result;
				
				//item : PatientVO
				$.each(result,function(index, item){
					console.log('paName : ' + item.paName);
					console.log('')
					var a = "'"+ item.paNo +"'"
					
					let content = "";
					content +='<tr><td tabindex="1"><a href="javascript:fn_go('+ a +')">' + item.paNo + "</a></td>";
					content +="<td tabindex='1'>" + item.paReg + "</td>";
					content +="<td tabindex='1'>" + item.paName + "</td>";
					content +="<td tabindex='1'>" + item.paPh + "</td>";
					content +="</tr>";
					
					$('#paData').append(content);
					
				});
				
			}
				
		})
	});
	
	// 진료환자목록에서 환자이름 누를때
	$(document).on('click', '#trtpaList .paNm1', function(){
// 	$('#trtpaList').find('.paNm1').on('click',function(){
		
		$('#examList2').empty();
		$('#trmr2').empty();
		console.log($(this).text());
		var td3 = $(this);
		var paNo = td3.prev().prev().text();
		console.log('paNo: ' + paNo);
		let data = {"paNo":paNo};
		
		$.ajax({
			url : "/exam/examList",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(data),
			type : "post",
			dataType : "json",
			beforeSend:function(xhr) {
		           xhr.setRequestHeader(header,token);
			},
			success : function(result) {
				console.log("result부위 : " + JSON.stringify(result));
				console.log("result부위2 : " + result[0].examCd);

				var str = "";
				var count = 1;
				for (var i = 0; i < result.length; i++) {
					var dt = new Date(result[i].examDt);
					var dtYY = dt.getFullYear();
					var dtMM = dt.getMonth() + 1;
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
				$("#examList2").append(str);
			}
		});
		
		
		$.ajax({
			url:'/chart/rcpList',
			contentType:'application/json;charset=utf-8',
			data:JSON.stringify(data),
			dataType:'json',
			type:'post',
			beforeSend:function(xhr){
				xhr.setRequestHeader(header,token);
			},
			
			success:function(result){
				console.log('result++ : ' + JSON.stringify(result));
				
				// 접수번호 넣기
				$('#rcpNo').val(result[0].rcpNo);
				// 차트번호 넣기
				$('#chNo').val(result[0].rcpNo);
				// 증상메모 넣기
				$('#rcpMemo').val(result[0].rcpMemo);
			}
		});
		
		$.ajax({
			url:'/doctor/paList',
			contentType:'application/json;charset=utf-8',
			data:JSON.stringify(data),
			dataType:'json',
			type:'post',
			beforeSend:function(xhr){
				xhr.setRequestHeader(header,token);
			},
			
			success:function(result){
				console.log('result환자 : ' + JSON.stringify(result));
				
				// 환자번호 넣기
				$('#paNo').val(result.paNo);
				// 이름 넣기
				$('#paName').val(result.paName);
				$('#paName').attr('readonly', true);
				$('#ch_paName').val(result.paName);
				$('#ch_paName').attr('readonly', true);
				$('#paName2').val(result.paName);
				$('#paName2').attr('readonly', true);
				$('#paName3').val(result.paName);
				$('#paName3').attr('readonly', true);
				$('#paName4').val(result.paName);
				$('#paName4').attr('readonly', true);
				paName = result.paName;
				
				// 주민번호
				$('#paReg').val(result.paReg);
				$('#paReg').attr('readonly', true);
				$('#ch_paReg').val(result.paReg);
				$('#paReg2').val(result.paReg);
				$('#paReg2').attr('readonly', true);
				$('#paReg3').val(result.paReg);
				$('#paReg3').attr('readonly', true);
				$('#paReg4').val(result.paReg);
				$('#paReg4').attr('readonly', true);
				
				
				// 성별
				$('#paSex').val(result.paSex);
				$('#paSex').attr('readonly', true);
				$('#ch_paSex').val(result.paSex);
				$('#ch_paSex').attr('readonly', true);
				$('#paSex2').val(result.paSex);
				$('#paSex2').attr('readonly', true);
				$('#paSex3').val(result.paSex);
				$('#paSex3').attr('readonly', true);
				
				console.log(result.paFiviDt);
				console.log('djkfljsdlkfj');
				// 마지막 내원일
				if(result.paFiviDt == null){
					$('#paFiviDt').val('초진환자 입니다');
				} else {
					$('#paFiviDt').val(fn_getInsertDate(result.paFiviDt).substr(0,10));
					$('#paFiviDt').attr('readonly', true);
				}
				
				// 주소
				$('#ch_paAdd1').val(result.paAdd1);
				$('#ch_paAdd2').val(result.paAdd2);
				$('#dia_paAdd1').val(result.paAdd1);
				$('#dia_paAdd2').val(result.paAdd2);
				$('#note_paAdd1').val(result.paAdd1);
				$('#note_paAdd2').val(result.paAdd2);
			
				// 나이
				$('#ch_paAge').val(fn_getAge(result.paReg));
				$('#paAge2').val(fn_getAge(result.paReg));
				$('#paAge3').val(fn_getAge(result.paReg));
			
				// 전화번호
				$('#ch_paPh').val(result.paPh);
			
				// 이메일
				$('#ch_paMail').val(result.paMail);
				
				// 날짜
				$('#chEndt').val(day);
				$('#chDt').val(day);
				$('#diaDt').val(day);
				$('#diaDt2').val(day);
				$('#noteDt').val(day);
				$('#injDt').val(day);
				$('#sysd1').val(day);
				$('#sysd2').val(day);
				
				// 환자가 병원에 다녀간 이력이 있으면 진료내역 보여주고 없으면 없다고 보여주기
				if(result.paTrmr == 'Y'){
					$.ajax({
						url:'/doctor/chart',
						contentType:'application/json;charset=utf-8',
						data:JSON.stringify(data),
						dataType:'json',
						type:'post',
						beforeSend:function(xhr){
							xhr.setRequestHeader(header,token);
						},
						
						success:function(rs){
							console.log('rs++++ : ' + JSON.stringify(rs));
							$('#disDate').val(fn_getInsertDate(rs.chDt).substr(0,10));
							
							let co = "";
							for(var i=0; i<rs.length; i++){
								co +="<tr><td tabindex='1'>" + rs[i].chCont + "</td>";
								co +="<td tabindex='1'>" + fn_getInsertDate(rs[i].chDt).substr(0,10) + "</td>";
								co +="</tr>";
							}
							
							$('#trmr2').append(co);
							
						}
					});
				}
				if(result.paTrmr != 'Y'){
					let no = "진료내역이 없습니다.";
					let con = "";
					con +="<tr><td tabindex='1'>" + no + "</td>";
					con +="<td tabindex='1'>"+ no +"</td>";
					con +="</tr>";
					
					$('#trmr2').append(con);
				}
				
			}
		});
	});
	
	
	
	
	
	// 진료환자목록에서 진료시작 버튼 클릭
	$(document).on('click', '#trtpaList tr td button', function(){
		console.log('왓다');
		var tdArr = new Array();
		var btn = $(this);
		var btd = btn.parent();
		var tr = btd.parent();
		var td = tr.children();
		
		var paNo = td.eq(0).text();
		var paName = td.eq(2).text();
		var data = {"paNo":paNo};
		
		///////////////////////////////////////////////////////
		if($(this).parent('td').prev().html() == '처치완료' || 
		   $(this).parent('td').prev().html() =='검사완료' ){
				
				
				Swal.fire({
		            title: '진료 완료를 하시겠습니까?',
		            icon: 'info',

		            showCancelButton: true,
		            cancelButtonColor: '#d33',
		            confirmButtonText: '확인',
		            cancelButtonText: '취소',
		            background: '#15243e',

		            reverseButtons: false,

		        }).then(result => {
		            if(result.isConfirmed){
		            	console.log($(this));
		            	$(this).html('진료완료');
		            	btn.closest('tr').attr('background-color', '#212529');
	 					///////////// 진료완료가 되면 paState => 진료완료로 바꾸고 paTrmr을 Y로 바꾸자  (해야함)///////////
		            	$.ajax({
		            		url:'/pastate/update',
		    				contentType:'application/json;charset=utf-8',
		    				data:JSON.stringify(data),
		    				dataType:'json',
		    				type:'post',
		    				beforeSend:function(xhr){
		    					xhr.setRequestHeader(header,token);
		    				},
		    				
		    				success:function(rs){
		            			console.log('rs : ' + JSON.stringify(rs));
		            		}
		            	});
		            } 
		        });	
				
		} else if($(this).parent('td').prev().html() == '진료완료') {
			$(this).closest('tr').empty();
		} else if($(this).parent('td').prev().html() == '진료중'){
			
			$(this).parent('td').prev().prev().text();
			
		} else {      // 진료시작일시
			
			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});
			
			
			console.log('paNo : ' + paNo);
			console.log('paName :  ' + paName);
			
			// 테이블 클릭시 css추가와 alert
			$(this).closest('tr').attr('bgcolor', '#212529');
	        $(this).html('진료중'); // 버튼
	        $(this).parent('td').prev().html('진료중');
	        
			paUpwt = $(this).html();  // ::진료중(버튼)
	        paState = $(this).parent('td').prev().html(); // ::진료중(상태)
	        console.log('paState : ' + paState);
			console.log('paUpwt : ' + paUpwt);
			console.log('paNo : ' + paNo);
			
			$.ajax({
				url:'/chart/rcpList',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify(data),
				dataType:'json',
				type:'post',
				beforeSend:function(xhr){
					xhr.setRequestHeader(header,token);
				},
				
				success:function(result){
					console.log('result++ : ' + JSON.stringify(result));
					
					// 접수번호 넣기
					$('#rcpNo').val(result[0].rcpNo);
					
					// 차트번호 넣기
					$('#chNo').val(result[0].rcpNo);
					// 증상메모 넣기
					$('#rcpMemo').val(result[0].rcpMemo);
				}
			});
			
			$.ajax({
				url:'/doctor/paList',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify(data),
				dataType:'json',
				type:'post',
				beforeSend:function(xhr){
					xhr.setRequestHeader(header,token);
				},
				
				success:function(result){
					console.log('result : ' + JSON.stringify(result));
					
					// 환자번호 넣기
					$('#paNo').val(result.paNo);
					// 이름 넣기
					$('#paName').val(result.paName);
					$('#paName').attr('readonly', true);
					$('#ch_paName').val(result.paName);
					$('#ch_paName').attr('readonly', true);
					$('#paName2').val(result.paName);
					$('#paName2').attr('readonly', true);
					$('#paName3').val(result.paName);
					$('#paName3').attr('readonly', true);
					$('#paName4').val(result.paName);
					$('#paName4').attr('readonly', true);
					paName = result.paName;
					
					// 주민번호
					$('#paReg').val(result.paReg);
					$('#paReg').attr('readonly', true);
					$('#ch_paReg').val(result.paReg);
					$('#paReg2').val(result.paReg);
					$('#paReg2').attr('readonly', true);
					$('#paReg3').val(result.paReg);
					$('#paReg3').attr('readonly', true);
					$('#paReg4').val(result.paReg);
					$('#paReg4').attr('readonly', true);
					
					
					// 성별
					$('#paSex').val(result.paSex);
					$('#paSex').attr('readonly', true);
					$('#ch_paSex').val(result.paSex);
					$('#ch_paSex').attr('readonly', true);
					$('#paSex2').val(result.paSex);
					$('#paSex2').attr('readonly', true);
					$('#paSex3').val(result.paSex);
					$('#paSex3').attr('readonly', true);
					
					// 마지막 내원일
					if(result.paFiviDt == null){
						$('#paFiviDt').val('초진환자 입니다');
					} else {
						$('#paFiviDt').val(fn_getInsertDate(result.paFiviDt).substr(0,10));
						$('#paFiviDt').attr('readonly', true);
					}
					
					// 주소
					$('#ch_paAdd1').val(result.paAdd1);
					$('#ch_paAdd2').val(result.paAdd2);
					$('#dia_paAdd1').val(result.paAdd1);
					$('#dia_paAdd2').val(result.paAdd2);
					$('#note_paAdd1').val(result.paAdd1);
					$('#note_paAdd2').val(result.paAdd2);
				
					// 나이
					$('#ch_paAge').val(fn_getAge(result.paReg));
					$('#paAge2').val(fn_getAge(result.paReg));
					$('#paAge3').val(fn_getAge(result.paReg));
				
					// 전화번호
					$('#ch_paPh').val(result.paPh);
				
					// 이메일
					$('#ch_paMail').val(result.paMail);
					
					// 날짜
					$('#chEndt').val(day);
					$('#chDt').val(day);
					$('#diaDt').val(day);
					$('#diaDt2').val(day);
					$('#noteDt').val(day);
					$('#injDt').val(day);
					$('#sysd1').val(day);
					$('#sysd2').val(day);
					console.log('데이터 : ' + data);
					// 환자가 병원에 다녀간 이력이 있으면 진료내역 보여주고 없으면 없다고 보여주기
					if(result.paTrmr == 'Y'){
						$.ajax({
							url:'/doctor/chart',
							contentType:'application/json;charset=utf-8',
							data:JSON.stringify(data),
							dataType:'json',
							type:'post',
							beforeSend:function(xhr){
								xhr.setRequestHeader(header,token);
							},
							
							success:function(rs){
								console.log('rs++++ : ' + JSON.stringify(rs));
								console.log(rs.length);
								console.log('trmr2 : ');
								$('#disDate').val(fn_getInsertDate(rs[0].chDt).substr(0,10));
								console.log($('#disDate').val());
								
								let co = "";
								for(var i=0; i<rs.length; i++){
									co +="<tr><td tabindex='1'>" + rs[i].chCont + "</td>";
									co +="<td tabindex='1'>" + fn_getInsertDate(rs[i].chDt).substr(0,10) + "</td>";
									co +="</tr>";
								}
								
								$('#trmr2').append(co);
								
							}
						});
					}
					if(result.paTrmr != 'Y'){
						let no = "진료내역이 없습니다.";
						let con = "";
						con +="<tr><td tabindex='1'>" + no + "</td>";
						con +="<td tabindex='1'>"+ no +"</td>";
						con +="</tr>";
						
						$('#trmr2').append(con);
					}
					
				}
			});
			
	    	// 환자 상태 변경 아작스 
			let dt = {"paState":paState, "paUpwt":paUpwt, "paNo":paNo};
			console.log('dt : ' + dt);
			$.ajax({
				url:'/patient/state',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify(dt),
				dataType:'json',
				type:'post',
				beforeSend:function(xhr){
					xhr.setRequestHeader(header,token);
				},
				
				success:function(res){
					console.log('res : ' + JSON.stringify(res));
				}
			});
			
		}
	});
			        
					
					
	// 	차트 탭  클릭 이벤트
	const chTab = document.querySelector('#chTab');
	const diaTab = document.querySelector('#diaTab');
	const noteTab = document.querySelector('#noteTab');
	const preTab = document.querySelector('#preTab');
	
	const docuCh = document.querySelector('#docuCh');
	const docuDia = document.querySelector('#docuDia');
	const docuNote = document.querySelector('#docuNote');
	const docuPre = document.querySelector('#docuPre');
	const detailBody = document.querySelector('#detailBody');
	
	
	chTab.addEventListener('click',function(){
		docuDia.style.WebkitAnimation = "fadeOut 0.7s";
		docuDia.style.animation = "fadeOut 0.7s";
		docuNote.style.WebkitAnimation = "fadeOut 0.7s";
		docuNote.style.animation = "fadeOut 0.7s";
		docuPre.style.WebkitAnimation = "fadeOut 0.7s";
		docuPre.style.animation = "fadeOut 0.7s";
		setTimeout(()=>{
			docuCh.style.WebkitAnimation = "fadeIn 0.7s";
			docuCh.style.animation = "fadeIn 0.7s";
			detailBody.style.WebkitAnimation = "fadeIn 0.7s";
			detailBody.style.animation = "fadeIn 0.7s";
			setTimeout(()=>{
				docuNote.style.display = "none";
				docuPre.style.display = "none";
				docuDia.style.display = "none";
				docuCh.style.display = "block";
				detailBody.style.display = "block";
			}, 310)
		}, 310);
	});
	
	
	diaTab.addEventListener('click',function(){
		docuCh.style.WebkitAnimation = "fadeOut 0.7s";
		docuCh.style.animation = "fadeOut 0.7s";
		docuNote.style.WebkitAnimation = "fadeOut 0.7s";
		docuNote.style.animation = "fadeOut 0.7s";
		docuPre.style.WebkitAnimation = "fadeOut 0.7s";
		docuPre.style.animation = "fadeOut 0.7s";
		detailBody.style.WebkitAnimation = "fadeOut 0.7s";
		detailBody.style.animation = "fadeOut 0.7s";
		setTimeout(()=>{
			docuDia.style.WebkitAnimation = "fadeIn 0.7s";
			docuDia.style.animation = "fadeIn 0.7s";
			setTimeout(()=>{
				docuCh.style.display = "none";
				docuNote.style.display = "none";
				docuPre.style.display = "none";
				detailBody.style.display = "none";
				docuDia.style.display = "block";
			}, 310)
		}, 310);
	});
	noteTab.addEventListener('click',function(){
		docuCh.style.WebkitAnimation = "fadeOut 0.7s";
		docuCh.style.animation = "fadeOut 0.7s";
		docuDia.style.WebkitAnimation = "fadeOut 0.7s";
		docuDia.style.animation = "fadeOut 0.7s";
		docuPre.style.WebkitAnimation = "fadeOut 0.7s";
		docuPre.style.animation = "fadeOut 0.7s";
		detailBody.style.WebkitAnimation = "fadeOut 0.7s";
		detailBody.style.animation = "fadeOut 0.7s";
		setTimeout(()=>{
			docuNote.style.WebkitAnimation = "fadeIn 0.7s";
			docuNote.style.animation = "fadeIn 0.7s";
			setTimeout(()=>{
				docuCh.style.display = "none";
				docuPre.style.display = "none";
				detailBody.style.display = "none";
				docuDia.style.display = "none";
				docuNote.style.display = "block";
			}, 310)
		}, 310);
	});
	preTab.addEventListener('click',function(){
		docuCh.style.WebkitAnimation = "fadeOut 0.7s";
		docuCh.style.animation = "fadeOut 0.7s";
		docuDia.style.WebkitAnimation = "fadeOut 0.7s";
		docuDia.style.animation = "fadeOut 0.7s";
		docuNote.style.WebkitAnimation = "fadeOut 0.7s";
		docuNote.style.animation = "fadeOut 0.7s";
		detailBody.style.WebkitAnimation = "fadeOut 0.7s";
		detailBody.style.animation = "fadeOut 0.7s";
		setTimeout(()=>{
			docuPre.style.WebkitAnimation = "fadeIn 0.7s";
			docuPre.style.animation = "fadeIn 0.7s";
			setTimeout(()=>{
				docuCh.style.display = "none";
				detailBody.style.display = "none";
				docuDia.style.display = "none";
				docuNote.style.display = "none";
				docuPre.style.display = "block";
			}, 310)
		}, 310);
	});

	
	
// 	$('#chTab').on('click', function(){
// 		$('#docuDia').css('display','none');
// 		$('#docuNote').css('display','none');
// 		$('#docuPre').css('display','none');
// 		$('#docuCh').css('display','block');
// 		$('#detailBody').css('display','block');
// 	});
// 	$('#diaTab').on('click', function(){
// 		$('#detailBody').css('display','none');
// 		$('#docuCh').css('display','none');
// 		$('#docuNote').css('display','none');
// 		$('#docuPre').css('display','none');
// 		$('#docuDia').css('display','block');
// 	});
// 	$('#noteTab').on('click', function(){
// 		$('#docuDia').css('display','none');
// 		$('#docuCh').css('display','none');
// 		$('#docuPre').css('display','none');
// 		$('#detailBody').css('display','none');
// 		$('#docuNote').css('display','block');
// 	});
// 	$('#preTab').on('click', function(){
// 		$('#docuDia').css('display','none');
// 		$('#docuCh').css('display','none');
// 		$('#docuNote').css('display','none');
// 		$('#detailBody').css('display','none');
// 		$('#docuPre').css('display','block');
// 	});
	
	
	// 오더상세 등록버튼
	$('#regedit').on('click',function(){
		
		let olCd = $('.olCd').val();// 오더리스트 코드
		let toDisCd = $('.olDisCd').val();// 질병코드
		let olActCd = $('.olActCd').val();// 진료행위명
		let chNo = $('#chNo').val();// 차트번호
		let toGubun = $('.olNe').val();// 오더 구분
		let paNo = $('#paNo').val(); // 환자번호
		let prShot = $('.prShot').val(); // 1회투여량
		let prCnt = $('.prCnt').val(); // 1회투여횟수
// 		let data = {"olCd":olCd, "toDisCd":toDisCd, "olActCd":olActCd,
// 				"chNo":chNo, "toGubun":toGubun, "paNo":paNo, "prShot":prShot, "prCnt":prCnt};
// 		console.log(trs.attr('class', 'odd').length);
		var trs = $('#odTbb').children();  // 주사 tr의 개수
		var trss = $('#odTbbb').children(); // 약품 tr의 개수
		var trsss = $('#odTb').children();  // 검사tr의 개수
		
		var trslen = trs.length / 2;
		var trsslen = trss.length / 2;
		var trssslen = trsss.length / 2;		
		console.log('gg: ' + $('#testArea').val());
		let arr = [];
		
		// 주사
		for(var i=0; i<trslen; i++){
			var vo = {
					"olCd": $('.olCd'+ i +'').text(),
					"toDisCd": $('.olDisCd'+ i +'').text(),
					"olActCd": $('.olActCd'+ i +'').text(),
					"chNo":$('#chNo').val(),
					"toGubun": $('.olNe'+ i +'').text(),
					"paNo": $('#paNo').val(),
					"prShot": $('.prShot'+ i +'').val(),
					"prCnt": $('.prCnt'+ i +'').val(),
					"toExamArea":$('#testArea').val()
			}
			arr.push(vo);
		}
		// 약품
		for(var i=0; i<trsslen; i++){
			var vo = {
					"olCd": $('.olCd2'+ i +'').text(),
					"toDisCd": $('.olDisCd2'+ i +'').text(),
					"olActCd": $('.olActCd2'+ i +'').text(),
					"chNo":$('#chNo').val(),
					"toGubun": $('.olNe2'+ i +'').text(),
					"paNo": $('#paNo').val(),
					"prShot": $('.prShot2'+ i +'').val(),
					"prCnt": $('.prCnt2'+ i +'').val(),
					"toExamArea":$('#testArea').val()
			}
			arr.push(vo);
		}
		// 검사
		for(var i=0; i<trssslen; i++){
			var vo = {
					"olCd": $('.olCd3'+ i +'').text(),
					"toDisCd": $('.olDisCd3'+ i +'').text(),
					"olActCd": $('.olActCd3'+ i +'').text(),
					"chNo":$('#chNo').val(),
					"toGubun": $('.olNe3'+ i +'').text(),
					"paNo": $('#paNo').val(),
					"prShot": $('.prShot3'+ i +'').val(),
					"prCnt": $('.prCnt3'+ i +'').val(),
					"toExamArea":$('#testArea').val()
			}
			arr.push(vo);
		}
		console.log(JSON.stringify(arr));
		
		Swal.fire({
            title: '오더등록을 하시겠습니까?',
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
					url:'/order/injregedit',
					data: JSON.stringify(arr),
					contentType:"application/json;charset=utf-8",
					dataType:'json',
					type:'post',
					beforeSend:function(xhr){
						xhr.setRequestHeader(header,token);
					},

					success:function(result){
						console.log('result : ' + JSON.stringify(result));
						Swal.fire({
					        icon: 'success',
					        title: '오더가 잘 등록되었습니다',
					        showConfirmButton: false,
					        background: '#15243e',
					        timer: 5500,
					    }).then((value) => {
					        if(value){
					        	
					        }
					    });
					}
				});
				
            }
        });
		
	});
	
	// 차트 등록(save) 버튼
	$('#saveCh').on('click',function(){
		let chDisCd = $('#olDisCd').val();// 질병코드
		let chCont = $('#chCont').val();  // 차트내용
		let chDt = $('#chDt').val(); // 진료한 날짜
		let rcpNo = $('#rcpNo').val();// 접수번호
		let paNo = $('#paNo').val(); // 환자번호
		let empNo = $('#empNo').val();// 사번	
		let data = {"chDisCd":chDisCd, "chCont":chCont, "chDt":chDt,
					"rcpNo":rcpNo, "paNo":paNo, "empNo":empNo};
		console.log(chEndt);
		console.log(chDisCd);
		console.log(chCont);
		console.log(chDt);
		console.log(rcpNo);
		console.log(paNo);
		console.log(empNo);
		console.log(data);
		
		Swal.fire({
            title: '차트를 등록 하시겠습니까?',
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
        			url:'/chart/regedit',
        			contentType:'application/json;charset=utf-8',
        			data:JSON.stringify(data),
        			type:'post',
        			beforeSend:function(xhr){
        				xhr.setRequestHeader(header,token);
        			},
        			
        			success:function(result){
        				console.log('result : ' + JSON.stringify(result));
        				Swal.fire({
        			        icon: 'success',
        			        title: '차트 등록 완료',
        			        showConfirmButton: false,
        			        background: '#15243e',
        			        timer: 5500,
        			    }).then((value) => {
        			        if(value){
        			            
        			        }
        			    });
        			}
        		});
				
            }
        });
		
		
		
	});
	
	// 차트 수정버튼
	$('#editCh').on('click',function(){
		$('#editCh').css('display','none');
		$('#saveCh').css('display','none');
		$('#chClose').css('display','none');
		$('#chOk').css('display','block');
		$('#chCancel').css('display','block');
		$('#chCont').attr('readonly',false);
		$('#chCont').css('border','2px solid dodgerblue');
		$('#chCont2').attr('readonly',false);
		$('#chCont2').css('border','2px solid dodgerblue');
	});
	
	$('#chCancel').on('click',function(){
		$('#chOk').css('display','none');
		$('#chCancel').css('display','none');
		$('#editCh').css('display','block');
		$('#saveCh').css('display','block');
		$('#chClose').css('display','block');
		$('#chCont').attr('readonly','readonly');
		$('#chCont').css('border','1px solid rgba(255, 255, 255, 0.12)');
		$('#chCont2').attr('readonly','readonly');
		$('#chCont2').css('border','1px solid rgba(255, 255, 255, 0.12)');
	});
	
	$('#chOk').on('click',function(){
		let chCont = $('#chCont').val();
		let chNo = $('#chNo').val();
		let data = {"chCont":chCont, "chNo":chNo};
		console.log(data);
		
		
		Swal.fire({
            title: '수정된 차트를 등록하시겠습니까?',
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
        			url:'/chart/edit',
        			data: JSON.stringify(data),
        			contentType:"application/json;charset=utf-8",
        			dataType:'json',
        			type:'post',
        			beforeSend:function(xhr){
        				xhr.setRequestHeader(header,token);
        			},
        			
        			success:function(result){
        				console.log('result차트 : ' + JSON.stringify(result));
        				Swal.fire({
        			        icon: 'success',
        			        title: '차트 수정 완료',
        			        showConfirmButton: false,
        			        background: '#15243e',
        			        timer: 5500,
        			    }).then((value) => {
        			        if(value){
        			        
        			        }
        			    });
        			}
        		});
				
            }
        });
		
		
	});
	
	
	// 진단서 수정버튼
	$('#editDia').on('click',function(){
		$('#editDia').css('display','none');
		$('#saveDia').css('display','none');
		$('#diaClose').css('display','none');
		$('#diaOk').css('display','block');
		$('#diaCancel').css('display','block');
		$('#disDate').attr('readonly',false);
		$('#disDate').css('border','2px solid dodgerblue');
		$('#diaCont').attr('readonly',false);
		$('#diaCont').css('border','2px solid dodgerblue');
		$('#diaBigo').attr('readonly',false);
		$('#diaBigo').css('border','2px solid dodgerblue');
		$('#diaUse').attr('readonly',false);
		$('#diaUse').css('border','2px solid dodgerblue');
	});
	$('#diaCancel').on('click',function(){
		$('#diaOk').css('display','none');
		$('#diaCancel').css('display','none');
		$('#editDia').css('display','block');
		$('#saveDia').css('display','block');
		$('#diaClose').css('display','block');
		$('#disDate').attr('readonly','readonly');
		$('#disDate').css('border','1px solid rgba(255, 255, 255, 0.12)');
		$('#diaCont').attr('readonly','readonly');
		$('#diaCont').css('border','1px solid rgba(255, 255, 255, 0.12)');
		$('#diaBigo').attr('readonly','readonly');
		$('#diaBigo').css('border','1px solid rgba(255, 255, 255, 0.12)');
		$('#diaUse').attr('readonly','readonly');
		$('#diaUse').css('border','1px solid rgba(255, 255, 255, 0.12)');
	});
	
	// 진단서 등록 버튼
	$('#saveDia').on('click',function(){
		// 진단서 코드 PK   dia_cd
		$('#damdang').val();// 담당의사명
		$('#disDate').val()// 발병일   
		$('#paNo').val(); // 환자번호1
		$('#disCd2').val(); // 질병코드
		$('#diag').val();// 문서코드   Diag, Note, Pres
		// 발행번호   ctfNo
		$('#diaPmtPrice').val();// 납부금액   diaPmtPrice
		// 진단서 내용
		// 진단서 용도
		// 작성날짜 SYSDATE
		let data = {"chDocnm": $('#damdang').val(),"diaDt":$('#disDate').val(), "paNo":$('#paNo').val() , "disCd":$('#disCd2').val() , 
				"docuCd":$('#diag').val() , "diaPmtPrice":$('#diaPmtPrice').val(), "diaCont":$('#diaCont').val() , 
				"diaUse":$('#diaUse').val()}
		console.log(data);
		
		Swal.fire({
            title: '진단서를 등록하시겠습니까?',
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
					url:'/order/diagnosis',
					data: JSON.stringify(data),
					contentType:"application/json;charset=utf-8",
					dataType:'json',
					type:'post',
					beforeSend:function(xhr){
						xhr.setRequestHeader(header,token);
					},
					
					success:function(result){
						console.log('result : ' + JSON.stringify(result));
						Swal.fire({
					        icon: 'success',
					        title: '진단서 등록 완료',
					        showConfirmButton: false,
					        background: '#15243e',
					        timer: 5500,
					    }).then((value) => {
					        if(value){
					           
					        }
					    });
					}
				});
            }
        });
		
		
		
	});
	
	// 소견서 수정 버튼
	$('#editNote').on('click',function(){
		$('#editNote').css('display','none');
		$('#saveNote').css('display','none');
		$('#noteClose').css('display','none');
		$('#noteOk').css('display','block');
		$('#noteCancel').css('display','block');
		$('#ntView').attr('readonly',false);
		$('#ntView').css('border','2px solid dodgerblue');
		$('#ntUse').attr('readonly',false);
		$('#ntUse').css('border','2px solid dodgerblue');
	});
	$('#noteCancel').on('click',function(){
		$('#noteOk').css('display','none');
		$('#noteCancel').css('display','none');
		$('#editNote').css('display','block');
		$('#saveNote').css('display','block');
		$('#noteClose').css('display','block');
		$('#ntView').attr('readonly','readonly');
		$('#ntView').css('border','1px solid rgba(255, 255, 255, 0.12)');
		$('#ntUse').attr('readonly','readonly');
		$('#ntUse').css('border','1px solid rgba(255, 255, 255, 0.12)');
	});
	
	// 소견서 등록 버튼
	$('#saveNote').on('click', function(){
		// 소견서 코드 PK    nt_cd
		// 작성 날짜  SYSDATE
		$('#paNo').val();// 환자번호
		$('#disCd2').val();// 질병코드
		// 통합첨부파일번호  없으면 null  file_atch_no
		$('#note').val();// 문서코드
		// 발행번호  ctfNo
		$('#ntPmtPrice').val();// 납부금액  ntPmtPrice
		$('#ntUse').val();// 용도
		
		let data = {"paNo":$('#paNo').val(), "disCd":$('#disCd2').val(), 
				"docuCd":$('#note').val(), "ntPmtPrice":$('#ntPmtPrice').val(), 
				"ntUse":$('#ntUse').val(), "ntView":$('#ntView').val()};
		console.log(data);
		
		Swal.fire({
            title: '소견서를 등록하시겠습니까?',
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
					url:'/order/note',
					data: JSON.stringify(data),
					contentType:"application/json;charset=utf-8",
					dataType:'json',
					type:'post',
					beforeSend:function(xhr){
						xhr.setRequestHeader(header,token);
					},
					
					success:function(result){
						console.log('result : ' + JSON.stringify(result));
						Swal.fire({
					        icon: 'success',
					        title: '소견서 등록 완료',
					        showConfirmButton: false,
					        background: '#15243e',
					        timer: 5500,
					    }).then((value) => {
					        if(value){
					           
					        }
					    });
					}
				});
				
            }
        });
		
		
	});
	
	// 원외처방전 수정 버튼
	$('#editPre').on('click',function(){
		$('#editPre').css('display','none');
		$('#savePre').css('display','none');
		$('#preClose').css('display','none');
		$('#preOk').css('display','block');
		$('#preCancel').css('display','block');
		for(var i=0; i<preArr.length; i++){
			$('#preShot' + i).attr('readonly',false);
			$('#preShot' + i).css('border','2px solid dodgerblue');
			$('#preCnt' + i).attr('readonly',false);
			$('#preCnt' + i).css('border','2px solid dodgerblue');
			$('#preDays' + i).attr('readonly',false);
			$('#preDays' + i).css('border','2px solid dodgerblue');
			
		}
	});
	$('#preCancel').on('click',function(){
		$('#preOk').css('display','none');
		$('#preCancel').css('display','none');
		$('#editPre').css('display','block');
		$('#savePre').css('display','block');
		$('#preClose').css('display','block');
		for(var i=0; i<preArr.length; i++){
			$('#preShot' + i).attr('readonly','readonly');
			$('#preShot' + i).css('border','1px solid rgba(255, 255, 255, 0.12)');
			$('#preCnt' + i).attr('readonly','readonly');
			$('#preCnt' + i).css('border','1px solid rgba(255, 255, 255, 0.12)');
			$('#preDays' + i).attr('readonly','readonly');
			$('#preDays' + i).css('border','1px solid rgba(255, 255, 255, 0.12)');
		}
	});
	
	// 원외처방전 등록 버튼
	$('#savePre').on('click', function(){
		// 원외처방전코드 preCd PK
		$('#paNo').val(); // 환자번호
		// 발행번호  ctfNo
		$('#pres').val(); // 문서코드
		// 작성날짜  SYSDATE
		console.log($('#olDisCd').val());
		
		var arr = [];
		// 약품
		for(var i=0; i<preArr.length; i++){
			var vo = {
					"paNo": $('#paNo').val(),
					"docuCd": $('#pres').val(),
					"preShot": $('#preShot' + i).val(),
					"preCnt":$('#preCnt' + i).val(),
					"preDays": $('#preDays' + i).val(),
					"drCd": $('#olDisCd').val(),
			};
			arr.push(vo);
		}
		
		
		let data = {"paNo":$('#paNo').val(), "docuCd":$('#pres').val(), 
				"preShot":$('#preShot0').val() , "preCnt":$('#preCnt0').val() , 
				"preDays":$('#preDays0').val() , "drCd":$('#olDisCd').val()};
// 		console.log(data);
		console.log(arr);
		
		
		Swal.fire({
            title: '원외처방전을 등록하시겠습니까?',
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
        			url:'/order/pres',
//         			data: JSON.stringify(data),
        			data: JSON.stringify(arr),
        			contentType:"application/json;charset=utf-8",
        			dataType:'json',
        			type:'post',
        			beforeSend:function(xhr){
        				xhr.setRequestHeader(header,token);
        			},
        			
        			success:function(result){
        				console.log('result원외 : ' + JSON.stringify(result));
        				Swal.fire({
					        icon: 'success',
					        title: '원외처방전 등록 완료',
					        showConfirmButton: false,
					        background: '#15243e',
					        timer: 5500,
					    }).then((value) => {
					        if(value){
					           
					        }
					    });
        			}
        		});
				
            }
        });
		
		
		
	});
	//제증명신청목록 버튼 클릭시
 	$("#oldList").on("click",function(){
 		ctforReload();
 		$("#treatPaList").hide();
 		$("#ctforPaList").show();
 		$(this).addClass("active");
 		$("#newList").removeClass("active");
 	});
 	//대기환자목록 버튼 클릭시
 	$("#newList").on("click",function(){
 		treatReload();
 		$("#ctforPaList").hide();
 		$("#treatPaList").show();
 		$(this).addClass("active");
 		$("#oldList").removeClass("active");
 	});
	
	// 제증명신청목록 대기 버튼클릭
	$(document).on('click', '#ctforList tr td button', function(){
		var paNo = $(this).parent('td').prev().prev().prev().prev().prev().text();
		var ctfGubun = $(this).parent('td').prev().prev().text();
		console.log(ctfGubun);
		console.log(paNo);
		data = {"paNo":paNo, "ctfGubun":ctfGubun};
		console.log(data);
		
		Swal.fire({
            title: '제증명 등록이 완료되었습니까?',
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
            	$(this).html('완료');
            	$(this).parent('td').parent('tr').attr('bgcolor', '#212529');
            	$.ajax({
        			url:'/ctfor/stateUp',
        			data: JSON.stringify(data),
        			contentType:"application/json;charset=utf-8",
        			dataType:'json',
        			type:'post',
        			
        			beforeSend:function(xhr){
        				xhr.setRequestHeader(header,token);
        			},
        			
        			success:function(result){
        				console.log('result : ' + JSON.stringify(result));
        				Swal.fire({
					        icon: 'success',
					        title: '제증명 등록 완료',
					        showConfirmButton: false,
					        background: '#15243e',
					        timer: 5500,
					    }).then((value) => {
					        if(value){
					           
					        }
					    });
        			}
        		});
            }
        });
	});
	
	// 제증명 신청 목록에서 환자이름 눌렀을 시 해당 tr을 클릭했을 시
	$(document).on('click', '#ctforList tr', function(){
		
		$('#examList2').empty();
		$('#trmr2').empty();
		console.log($(this).text());
		var tr = $(this);
		var paNo = tr.children().eq(0).text();
		console.log('환자번호: ' + paNo);
		let data = {"paNo":paNo};
		
		$.ajax({
			url : "/exam/examList",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(data),
			type : "post",
			dataType : "json",
			beforeSend:function(xhr) {
		           xhr.setRequestHeader(header,token);
			},
			success : function(result) {
				console.log("result부위 : " + JSON.stringify(result));
				console.log("result부위2 : " + result[0].examCd);

				var str = "";
				var count = 1;
				for (var i = 0; i < result.length; i++) {
					var dt = new Date(result[i].examDt);
					var dtYY = dt.getFullYear();
					var dtMM = dt.getMonth() + 1;
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
				
				$("#examList2").append(str);
			}
		});
		
		
		$.ajax({
			url:'/doctor/paList',
			contentType:'application/json;charset=utf-8',
			data:JSON.stringify(data),
			dataType:'json',
			type:'post',
			beforeSend:function(xhr){
				xhr.setRequestHeader(header,token);
			},
			
			success:function(result){
				console.log('result환자 : ' + JSON.stringify(result));
				
				// 환자번호 넣기
				$('#paNo').val(result.paNo);
				// 이름 넣기
				$('#paName').val(result.paName);
				$('#paName').attr('readonly', true);
				$('#ch_paName').val(result.paName);
				$('#ch_paName').attr('readonly', true);
				$('#paName2').val(result.paName);
				$('#paName2').attr('readonly', true);
				$('#paName3').val(result.paName);
				$('#paName3').attr('readonly', true);
				$('#paName4').val(result.paName);
				$('#paName4').attr('readonly', true);
				paName = result.paName;
				
				// 주민번호
				$('#paReg').val(result.paReg);
				$('#paReg').attr('readonly', true);
				$('#ch_paReg').val(result.paReg);
				$('#paReg2').val(result.paReg);
				$('#paReg2').attr('readonly', true);
				$('#paReg3').val(result.paReg);
				$('#paReg3').attr('readonly', true);
				$('#paReg4').val(result.paReg);
				$('#paReg4').attr('readonly', true);
				
				
				// 성별
				$('#paSex').val(result.paSex);
				$('#paSex').attr('readonly', true);
				$('#ch_paSex').val(result.paSex);
				$('#ch_paSex').attr('readonly', true);
				$('#paSex2').val(result.paSex);
				$('#paSex2').attr('readonly', true);
				$('#paSex3').val(result.paSex);
				$('#paSex3').attr('readonly', true);
				
				console.log(result.paFiviDt);
				console.log('djkfljsdlkfj');
				// 마지막 내원일
				if(result.paFiviDt == null){
					$('#paFiviDt').val('초진환자 입니다');
				} else {
					$('#paFiviDt').val(fn_getInsertDate(result.paFiviDt).substr(0,10));
					$('#paFiviDt').attr('readonly', true);
				}
				
				// 주소
				$('#ch_paAdd1').val(result.paAdd1);
				$('#ch_paAdd2').val(result.paAdd2);
				$('#dia_paAdd1').val(result.paAdd1);
				$('#dia_paAdd2').val(result.paAdd2);
				$('#note_paAdd1').val(result.paAdd1);
				$('#note_paAdd2').val(result.paAdd2);
			
				// 나이
				$('#ch_paAge').val(fn_getAge(result.paReg));
				$('#paAge2').val(fn_getAge(result.paReg));
				$('#paAge3').val(fn_getAge(result.paReg));
			
				// 전화번호
				$('#ch_paPh').val(result.paPh);
			
				// 이메일
				$('#ch_paMail').val(result.paMail);
				
				// 날짜
				$('#chEndt').val(day);
				$('#chDt').val(day);
				$('#diaDt').val(day);
				$('#diaDt2').val(day);
				$('#noteDt').val(day);
				$('#injDt').val(day);
				$('#sysd1').val(day);
				$('#sysd2').val(day);
				
				// 환자가 병원에 다녀간 이력이 있으면 진료내역 보여주고 없으면 없다고 보여주기
				if(result.paTrmr == 'Y'){
					$.ajax({
						url:'/doctor/chart',
						contentType:'application/json;charset=utf-8',
						data:JSON.stringify(data),
						dataType:'json',
						type:'post',
						beforeSend:function(xhr){
							xhr.setRequestHeader(header,token);
						},
						
						success:function(rs){
							console.log('rs++++ : ' + JSON.stringify(rs));
							$('#disDate').val(fn_getInsertDate(rs.chDt).substr(0,10));
							console.log(rs.length);
							
							let co = "";
							for(var i=0; i<rs.length; i++){
								co +="<tr><td tabindex='1'>" + rs[i].chCont + "</td>";
								co +="<td tabindex='1'>" + fn_getInsertDate(rs[i].chDt).substr(0,10) + "</td>";
								co +="</tr>";
							}
							
							$('#trmr2').append(co);
							
						}
					});
				}
				if(result.paTrmr != 'Y'){
					let no = "진료내역이 없습니다.";
					let con = "";
					con +="<tr><td tabindex='1'>" + no + "</td>";
					con +="<td tabindex='1'>"+ no +"</td>";
					con +="</tr>";
					
					$('#trmr2').append(con);
				}
				
			}
		});
	});
	
	
	// 소견서 미리보기 시작
	let sel_file = [];
	$('#input_imgs').on('change', handlerImgFileSelect);
	function handlerImgFileSelect(e){
		let files = e.target.files;
		let fileArr = Array.prototype.slice.call(files);
		
		fileArr.forEach(function(f){
			if(!f.type.match('image.*')){
				console.log('이미지만 가능');
				return;
			}
			
			sel_file.push(f);
			
			let reader = new FileReader();
			reader.onload = function(e){
				let img_html = '<img class="card-img-top" src="' + e.target.result + '" style="width:100%;height:274px;border-radius:10px;"  />';
				$('#card-images').prepend(img_html);
				
			}
			reader.readAsDataURL(f);
		});
	}
	
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
	
	
}); // document.onload


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
	str += '<img style="width:83vw; height:83vh;" src="' + imgName + '" />'; 
	console.log('str : ' + str);
	
	$("#modal-fill").append(str);
});

	function leadingZeros(n, digits) {
		var zero = '';
		n = n.toString();
	
		if (n.length < digits) {
			for (var i = 0; i < digits - n.length; i++)
				zero += '0';
		}
		return zero + n;
	}




	// confirm창 함수
	function work(){
		rs = confirm("진료완료를 하시겠습니까?");
		if(rs == true){
			console.log('확인');	
			return true;
		} 
		if(rs == false){
			console.log('취소');
			return false;
		}
	}

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
	
	// 나이 구하는 함수
	function fn_getAge(geta){
		let current = 122;
		let pa = geta.substr(0,2);
		
		if(geta.substr(0,1) == 0){
			pa = "1" + pa;
		}
		
		let age = (current-pa) + 1;
		
		return age;
		
	}
	
	// 아작스 부분 새로고침 함수
	function treatReload(){
		$.ajax({
			url : '/patient/treatStandby',
			contentType : 'application/json; charset=utf-8',
			type : 'post',
			dataType : 'json',
			beforeSend:function(xhr) {
		           xhr.setRequestHeader(header,token);
			},
			success : function(result) {
				console.log(result);
				$('#trtpaList').empty();
				
				var str = "";
				
				for (var i = 0; i < result.length; i++) {
					str += '<tr>';
					str += '<td tabindex="1">' + result[i].patientVO.paNo + '</td>';
					str += '<td tabindex="1">' + result[i].patientVO.paReg+'</td>';
					str += '<td tabindex="1" class="paNm1">' + result[i].patientVO.paName + '</td>';
					str += '<td tabindex="1" id="hs' + (i+1) + '">' + result[i].patientVO.paState + '</td>';
					str += '<td tabindex="1"><button type="button" id="btnS' + (i+1) + '"';
					str += 'class="waves-effect waves-light btn mb-5 bg-gradient-primary treatBtn" style="border-radius:10px;">' + result[i].patientVO.paUpwt + '</button></td>';
					str += '</tr>';
				}
				
				$('#trtpaList').append(str);
			}
		});
	}
	
	// 제증명 신청서류 함수
	function ctforReload(){
		$.ajax({
			url : '/patient/ctforStandby',
			contentType : 'application/json; charset=utf-8',
			type : 'post',
			dataType : 'json',
			beforeSend:function(xhr) {
		           xhr.setRequestHeader(header,token);
			},
			success : function(result) {
				console.log(result);
				$('#ctforList').empty();
				var str = "";
				
				for (var i = 0; i < result.length; i++) {
					str +='<tr>';
					str +='<td tabindex="1">' + result[i].paNo + '</td>';
					str +='<td tabindex="1" class="paNm2">' + result[i].ctfName+ '</td>';
					if(result[i].ctfGubun == 'diag'){
						str +='<td tabindex="1">진단서</td>';
					} else if(result[i].ctfGubun == 'note'){
						str +='<td tabindex="1">소견서</td>';
					} else {
						str +='<td tabindex="1">처방전</td>';
					}
					str +='<td tabindex="1" style="display:none;">' + result[i].ctfGubun + '</td>';
					str +='<td tabindex="1">' + result[i].ctfEndt.substring(0,16) + '</td>';
					str +='<td tabindex="1"><button type="button" id="btnCtfor' + (i+1) + '"';
					str +='class="waves-effect waves-light btn mb-5 bg-gradient-primary" style="border-radius:10px;">' + result[i].ctfState + '</button></td>';
					str +='<td tabindex="1" style="display:none;"><input type="hidden" class="ctfState" value="' + result[i].ctfState + '" /></td>';
					str +='</tr>';
				
					
				}
				
				$('#ctforList').append(str);
			}
		});
	}
	
	function color(){
		// 로딩시 진료환자목록에서 색깔 다르게 지정해주기
		let tt = $('#trtpaList tr').length;
		console.log('tt : ' + tt);
		for(var i=1; i<=tt; i++){
			if($('#hs'+i).text() == '처치완료' || $('#hs'+i).text() == '검사완료' || $('#hs' + i).text() == '진료중'){
				$('#hs'+i).closest('tr').attr('bgcolor','#212529');
			}
		}
		
		for(var i=0; i<tt; i++){
			var b = $('#trtpaList tr').eq(i).children().eq(3).text();
			if(b === '진료중'){
				$('#trtpaList tr').eq(i).attr('bgcolor', '#212529');
			}
		}
		let tt2 = $('#ctforList tr').length;
		for(var i=0; i<tt2; i++){
			var ctforTr = $('#ctforList tr').eq(i).children().eq(4).text();
			if(ctforTr === '완료'){
				$('#ctforList tr').eq(i).attr('bgcolor', '#212529');
			}
		}
	
	}
	
	function makeArr(array, val){
		var chk = array.indexOf(val);
		if(chk == -1){
			array.push(val);  // 값이 없다면 배열의 마지막에 추가
		} else {
// 			array.splice(chk, 1); // 삭제하고
			array.push(val); // 마지막에 추가한다.
		}
	}
	

	function fn_go(geta){
		let str2 = geta;
		console.log(patientVOList);
		chart = patientVOList[0].chartVO;
		console.log(chart);
		
		
		$.each(patientVOList, function(index, item){
			let paNo = item.paNo;
			console.log('paNo : ' + paNo);
			console.log('item : ' + item);
			
			
			if(str2 == paNo){
				chart = item.chartVO;
				console.log(chart);
// 				console.log("chCont : " + item.chartVO[0].chCont);
// 				console.log('길이 : ' + item.chartVO.length);
				
				
				$.each(chart, function(index2, item2){
					console.log('하하하하');
					let no = "진료내역이 없습니다.";
					let co = "";
					if(item2.chCont != null && item2.chEndt != null){
						
// 						$('#chEndt').val(fn_getInsertDate(item2.chEndt).substr(0,10));
						$('#chNo').val(item2.chNo);
						console.log(item2.chNo);
						
						console.log('하하');
						console.log(item2.chDt);
						
						$('#disDate').val(fn_getInsertDate(item2.chDt).substr(0,10));
						var dayList = new Array();
						dayList.push($('#disDate').val());
						console.log('dayList : ' + dayList);
					
						co +="<tr><td tabindex='1'>" + item2.chCont + "</td>";
						co +="<td tabindex='1'>" + fn_getInsertDate(item2.chDt).substr(0,10) + "</td>";
						co +="</tr>";
						
					} else {
						co +="<tr><td tabindex='1'>" + no + "</td>";
						co +="<td tabindex='1'>"+ no +"</td>";
						co +="</tr>";
					}
						
					$('#trmr2').append(co);
										
				});
				
				$('#paNo').val(item.paNo);
				// 주민번호
				$('#paReg').val(item.paReg);
				$('#paReg').attr('readonly', true);
				$('#paReg2').val(item.paReg);
				$('#paReg2').attr('readonly', true);
				$('#paReg3').val(item.paReg);
				$('#paReg3').attr('readonly', true);
				$('#paReg4').val(item.paReg);
				$('#paReg4').attr('readonly', true);
				$('#ch_paReg').val(item.paReg);
				
				// 이름
				$('#paName').val(item.paName);
				paName = item.paName;
				$('#paName').attr('readonly', true);
				$('#ch_paName').val(item.paName);
				$('#ch_paName').attr('readonly', true);
				$('#paName2').val(item.paName);
				$('#paName2').attr('readonly', true);
				$('#paName3').val(item.paName);
				$('#paName3').attr('readonly', true);
				$('#paName4').val(item.paName);
				$('#paName4').attr('readonly', true);
				
				// 성별
				$('#paSex').val(item.paSex);
				$('#paSex').attr('readonly', true);
				$('#ch_paSex').val(item.paSex);
				$('#ch_paSex').attr('readonly', true);
				$('#paSex2').val(item.paSex);
				$('#paSex2').attr('readonly', true);
				$('#paSex3').val(item.paSex);
				$('#paSex3').attr('readonly', true);
				
				// 마지막 내원일
				if(item.paFiviDt == null){
					$('#paFiviDt').val('초진환자 입니다');
				} else {
					$('#paFiviDt').val(fn_getInsertDate(item.paFiviDt).substr(0,10));
					$('#paFiviDt').attr('readonly', true);
				}
				
				// 주소
				$('#ch_paAdd1').val(item.paAdd1);
				$('#ch_paAdd2').val(item.paAdd2);
				$('#dia_paAdd1').val(item.paAdd1);
				$('#dia_paAdd2').val(item.paAdd2);
				$('#note_paAdd1').val(item.paAdd1);
				$('#note_paAdd2').val(item.paAdd2);
				
				// 나이
				$('#ch_paAge').val(fn_getAge(item.paReg));
				$('#paAge2').val(fn_getAge(item.paReg));
				$('#paAge3').val(fn_getAge(item.paReg));
				
				
				// 전화번호
				$('#ch_paPh').val(item.paPh);
				
				// 이메일
				$('#ch_paMail').val(item.paMail);
				
				// 날짜
				$('#chEndt').val(day);
				$('#chDt').val(day);
				$('#diaDt').val(day);
				$('#diaDt2').val(day);
				$('#noteDt').val(day);
				$('#injDt').val(day);
				$('#sysd1').val(day);
				$('#sysd2').val(day);
				
				
				$('#modal-center').modal('hide');
				return;
			}
		});
		
	}
	
	
</script>