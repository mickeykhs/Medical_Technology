<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  
<link rel="stylesheet" href="/resources/css/receipt.css">
<script src="/resources/js/jquery-3.6.0.js"></script>
<div style="display:flex; justify-content:space-between; margin-right:30px; margin-left:30px;">
	<div class="col-lg-3 col-12">
	<!-- /.box -->
		<div class="box" style="min-height: 31.7vh; max-height:31.7vh; width:28vw;">
			<div class="box-header with-border">
		  		<h4 class="box-title text-info mb-0"><i class="ti-user me-15"></i>대기 환자</h4>
			</div>
			<!-- /.box-header -->
			<div class="box-body scrollDiv" style="overflow:auto; overflow-y:scroll;">
				<div class="table-responsive">
			  		<table class="table table-sm mb-0">
				  		<tbody>
							<tr>
							  <th scope="col" style="text-align:center;">대기번호</th>
							  <th scope="col" style="text-align:center;">환자명</th>
							  <th scope="col" style="text-align:center;">상태</th>
							  <th scope="col" style="text-align:center;">수납완료여부</th>
							</tr>
				  		</tbody>
				  		<tbody id="waitList">
							
				  		</tbody>
					</table>
				</div>
			</div>
			<!-- /.box-body -->
		</div>
		<div class="box" style="width:28vw;">
			<div class="box-header">
				<h4 class="box-title text-info mb-0"><i class="ti-user me-15"></i>환자 조회</h4>
			</div>
			<!-- /.box-header -->
			<div class="box-body" style="height:252px;"> <!-- 높이 252px 길이맞추느라 추가함 -->
				<div class="form-group" style="display:none;">
					<label class="form-label">환자번호</label> <input name="paNo" class="form-control" readonly>
				</div>
				<div class="form-group">
					<label class="form-label">환자명</label> <input name="paName" class="form-control" readonly>
				</div>
				<div class="form-group">
					<label class="form-label">주민등록번호</label> <input name="paReg" class="form-control" readonly>
				</div>
				<div class="form-group" style="display:none;">
					<label class="form-label">연락처</label> <input name="paPh" class="form-control" readonly>
				</div>
				<div class="form-group">
					<label class="form-label">보험가입 여부</label> <input name="paInsuYn" class="form-control" readonly>
				</div>
				<div class="form-group" style="display:none;">
					<label class="form-label">주소</label> <input name="paAdd1" class="form-control" readonly>
				</div>
				<div class="form-group" style="display:none;">
					<label class="form-label">상세주소</label> <input name="paAdd2" class="form-control"  readonly>
				</div>
				<div class="form-group">
					<label class="form-label">마지막 내원일</label> <input name="paFiviDt" class="form-control" readonly>
				</div>
				<div class="form-group" style="display:none;">
					<label class="form-label">환자 상태</label> <input name="paState" class="form-control" readonly>
				</div>
			</div>
			<div class="box-footer text-end" style="border-top: none; display:flex; justify-content:space-between;">
				<button id="search"  type="button" class="waves-effect waves-light btn btn-primary mb-5">조회</button>
				<button id="clear" type="button" class="waves-effect waves-light btn btn-danger mb-5">취소</button>
			</div>
			<!-- /.box-body -->
		</div>
	</div>
	<div class="col-8">
		<div class="box" style="height:50vh;">
			<div class="box-header">
				<h4 class="box-title text-info mb-0"><i class="fa fa-fw fa-won"></i>수납 내역</h4>
			</div>
			<!-- /.box-header -->
			<div class="box-body no-padding scrollDiv" style="overflow:auto; overflow-y:scroll; height:30vh;">
				<div class="table-responsive">
					<table class="table table-hover">
						<tbody id="toList">
							<tr>
								<th>의료명</th>
								<th>수진자</th>
								<th>진료일</th>
								<th>구분</th>
								<th>담당의</th>
								<th>금액</th>
							</tr>
						</tbody>
						<tbody id="orderFee">	

						</tbody>
					</table>
				</div>
			</div>
			<div class="box-body no-padding scrollDiv" style="overflow:auto; overflow-y:scroll; height:20vh;">
				<div class="table-responsive " >
					<table class="table table-hover">
						<tbody>
							<tr>
								<th>제증명분류</th>
								<th>수진자</th>
								<th>발급일</th>
								<th>담당의</th>
								<th>금액</th>
							</tr>
						</tbody>
						<tbody id="certiList">	

						</tbody>
					</table>
				</div>
			</div>
			<!-- /.box-body -->
			<div class="box-body no-padding">
				<div class="table-responsive">
					<div style="display:flex;width: 100%;justify-content: space-between;">
						<div style="width:50%;">
							<label for="example-text-input" class="col-sm-2 col-form-label" style="color:#b5b5c3; background-color:#0c1a32; font-size:1.3rem; margin-left:20px;">
								총 금액&nbsp;&nbsp;:</label>
							<input type="text" id="totalCost" style="color:#b5b5c3; background-color:#0c1a32; border:none; font-size:1.3rem;" value="" readonly />
						</div>
						
						<!-- 셀렉트  -->
						<div style="display:flex;justify-content:flex-end;">
							<div class="demo-radio-button" style="margin-left:40px;position:absolute;">
								<input name="group1" type="radio" id="radio_1" class="radio-col-info" checked />
								<label for="radio_1" name="payment" style="width:6%;">카드</label>
								<input name="group1" type="radio" id="radio_2" class="radio-col-info" style="">
								<label for="radio_2" name="payment" style="margin-left:-123px;">현금</label>
							</div>
							<div style="padding-right:19px;">
								<button id="payment" type="submit" class="waves-effect waves-light btn btn-info mb-5" data-bs-toggle="modal" data-bs-target="#modal-right">결제</button>
								<!-- <button id="payment" type="submit" class="waves-effect waves-light btn mb-5 bg-gradient-secondary" data-bs-toggle="modal" data-bs-target="#modal-right">결제</button> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- 박스 하나 더만드는 중 ============ -->
		
		<div class="box" style="height:26.4vh;">
			<div class="box-header with-border">
				<h4 class="box-title text-info mb-0" style="margin-top:10px;"><i class="fa fa-fw fa-won"></i>수납 이력</h4>
				<button type="button" id="recBtn" class="waves-effect waves-light btn btn-primary mb-5"  data-bs-toggle="modal" data-bs-target="#modal-center" style="float:right; margin-right:20px;">
					<i class="fa fa-search" aria-hidden="true"></i>&nbsp;&nbsp;환자검색
				</button>
				<input class="form-control" id="picker" type="date" name="date" style="width: 12%; float: right; background-color: #3596f7; color: white; margin-right:30px;">
			</div>
			<!-- /.box-header -->
			<div class="box-body no-padding scrollDiv" style="overflow:auto; overflow-y:scroll; height:30vh;">
				<div class="table-responsive">
					<table class="table table-hover">
						<tbody id="toList">
							<tr>
								<th>수납코드</th>
								<th>수납일</th>
								<th>수진자</th>
								<th>결제수단</th>
								<th>수납금액</th>
								<th>담당자</th>
								<th>보험가입여부</th>
								<th>수납완료여부</th>
							</tr>
						</tbody>
						<tbody id="pastHistory">	

						</tbody>
					</table>
				</div>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- 박스 하나 더만드는 중 ============ -->
		
	</div>
</div>
<div class="modal center-modal fade" id="modal-center" tabindex="-1" style="display: none;" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content">
	  <div class="modal-header">
		<input type="search" id="paSearch" class="form-control form-control-sm" placeholder="이름을 입력해주세요" style="width:30%; margin-right:50px;">
		<button type="button" id="btnSearch" class="waves-effect waves-light btn btn-primary mb-5" style="right:180px;top:2px;">
			<i class="fa fa-search" aria-hidden="true"></i>&nbsp;&nbsp;검색
		</button>
	  </div>
	  <div class="modal-body scrollDiv" style="max-height:400px; overflow:auto; overflow-y:scroll;">
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

<!-- 진료 영수증 Modal -->
<div class="modal modal-right fade scrollDiv" id="modal-right" tabindex="-1" style="display:none; width:68%; overflow:auto; overflow-y:scroll; z-index:1047;" aria-hidden="true;" >
  <div class="modal-dialog" style="width:65%; height:110%;">
	<div class="modal-content">
	  <div class="modal-header" style="display:flex; justify-content:right;">
	  	<h3>
		  	<i style="margin-right:10px; cursor: pointer;" id="print" class="ti-printer"></i>
		</h3>
	  </div>
	  <div id="printArea" class="modal-body">
  		<div id="pdfDiv" class="hpa" style="width: 210mm; height: 226mm; background-color: white;">
			<div class="hcD" style="left: 20mm; top: 25mm;">
				<div class="hcI">
				</div>
			</div>
			<div class="hcD" style="left: 20mm; top: 6mm;">
				<div class="hcI">
					<div class="hls ps1"
						style="line-height: 162.81mm; white-space: nowrap; left: 0mm; top: 0mm; height: 162.81mm; width: 170.01mm;">
						<div class="htb"
							style="left: 0.49mm; width: 169.62mm; top: 0.49mm; height: 162.81mm; display: inline-block; position: relative; vertical-align: middle;">
							<svg class="hs" viewBox="-2.50 -2.50 174.61 167.81"
								style="left: -2.50mm; top: -2.50mm; width: 174.61mm; height: 167.81mm;">
								<defs>
								<pattern id="w_00" width="10" height="10"
									patternUnits="userSpaceOnUse">
								<rect width="10" height="10" fill="rgb(239,239,239)" /></pattern></defs>
								<path fill="url(#w_00)"
									d="M86.67,60.44L113.72,60.44L113.72,66.31L86.67,66.31L86.67,60.44Z "></path>
								<path fill="url(#w_00)"
									d="M113.72,60.44L168.63,60.44L168.63,66.31L113.72,66.31L113.72,60.44Z "></path>
								<defs>
								<pattern id="w_01" width="10" height="10"
									patternUnits="userSpaceOnUse">
								<rect width="10" height="10" fill="rgb(242,242,242)" /></pattern></defs>
								<path fill="url(#w_01)"
									d="M113.72,107.40L142.68,107.40L142.68,113.27L113.72,113.27L113.72,107.40Z "></path>
								<path fill="url(#w_01)"
									d="M142.68,107.40L168.63,107.40L168.63,113.27L142.68,113.27L142.68,107.40Z "></path>
								<path d="M0,0 L0,161.83"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
								<path d="M30.96,19.35 L30.96,123.80"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M59.92,25.22 L59.92,31.09"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M86.67,19.35 L86.67,31.09"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M86.67,36.96 L86.67,113.27"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M113.72,19.35 L113.72,123.80"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M142.68,25.22 L142.68,36.96"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M142.68,66.31 L142.68,123.80"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M168.63,0 L168.63,161.83"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
								<path d="M-0.20,0 L168.83,0"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
								<path d="M-0.20,19.35 L168.83,19.35"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
								<path d="M-0.20,19.35 L168.83,19.35"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M-0.20,25.22 L168.83,25.22"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
								<path d="M-0.20,31.09 L168.83,31.09"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M-0.20,36.96 L168.83,36.96"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
								<path d="M-0.20,42.83 L168.83,42.83"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M-0.20,48.70 L168.83,48.70"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M-0.20,53.57 L168.83,53.57"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M-0.20,60.44 L168.83,60.44"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M-0.20,66.31 L168.83,66.31"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M-0.20,72.18 L86.73,72.18"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M113.66,72.18 L168.83,72.18"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M-0.20,78.05 L86.73,78.05"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M113.66,78.05 L168.83,78.05"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M-0.20,83.92 L86.73,83.92"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M113.66,83.92 L168.83,83.92"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M-0.20,89.79 L86.73,89.79"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M113.66,89.79 L168.83,89.79"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M-0.20,95.66 L86.73,95.66"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M113.66,95.66 L168.83,95.66"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M-0.20,101.53 L86.73,101.53"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M113.66,101.53 L168.83,101.53"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M-0.20,107.40 L31.02,107.40"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
								<path d="M-0.20,107.40 L31.02,107.40"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M30.90,107.40 L86.73,107.40"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
								<path d="M30.90,107.40 L86.73,107.40"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M113.66,107.40 L168.83,107.40"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M-0.20,113.27 L168.83,113.27"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
								<path d="M-0.20,123.80 L168.83,123.80"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M-0.20,128.66 L168.83,128.66"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
								<path d="M-0.20,161.83 L168.83,161.83"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
								<path d="M168.63,0 L168.63,161.83"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
								<path d="M0,0 L0,161.83"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
								<path d="M-0.20,161.83 L168.83,161.83"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
								<path d="M-0.20,0 L168.83,0"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path></svg>
							<div class="hce" style="left: 0mm; top: 0mm; width: 168.63mm; height: 19.35mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 3.01mm;">
										<div class="hls ps1" style="line-height: 6.28mm; white-space: nowrap; left: 0mm; top: -0.35mm; height: 7.06mm; width: 167.64mm;">
											<span class="hrt cs1">진료비 계산서(영수증)</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 0mm; top: 19.35mm; width: 30.96mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 29.97mm;">
											<span class="hrt cs0">&nbsp;상호</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 30.96mm; top: 19.35mm; width: 55.71mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps0" style="color:black; font-weight:bold; line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 54.72mm;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MedicalTechnology</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 86.67mm; top: 19.35mm; width: 27.05mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 26.06mm;">
											<span class="hrt cs0">&nbsp;담&nbsp;&nbsp;당&nbsp;&nbsp;의&nbsp;</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 113.72mm; top: 19.35mm; width: 54.91mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div id="empName" class="hls ps1" style="color:black; font-weight:bold; line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 53.92mm;">
											<span class="hrt cs0">&nbsp;&nbsp;</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 0mm; top: 25.22mm; width: 30.96mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 29.97mm;">
											<span class="hrt cs0">&nbsp;등 록 번 호</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 30.96mm; top: 25.22mm; width: 28.96mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div id="recCd" class="hls ps1" style="color:black; font-weight:bold; line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.97mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce"
								style="left: 59.92mm; top: 25.22mm; width: 26.75mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 25.77mm;">
											<span class="hrt cs0">&nbsp;진 &nbsp;료 &nbsp;과</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 86.67mm; top: 25.22mm; width: 27.05mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div id="mediDepart" class="hls ps1" style="color:black; font-weight:bold; line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 26.06mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 113.72mm; top: 25.22mm; width: 28.96mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.97mm;">
											<span class="hrt cs0">&nbsp;&nbsp;진료일시</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 142.68mm; top: 25.22mm; width: 25.95mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div id="recDt" class="hls ps1" style="color:black; font-weight:bold; line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 24.96mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 0mm; top: 31.09mm; width: 30.96mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 29.97mm;">
											<span class="hrt cs0">&nbsp;성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 30.96mm; top: 31.09mm; width: 82.76mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div id="paName" class="hls ps1" style="color:black; font-weight:bold; line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 81.77mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce"
								style="left: 113.72mm; top: 31.09mm; width: 28.96mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1"
											style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.97mm;">
											<span class="hrt cs0">&nbsp;&nbsp;진료유형</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce"
								style="left: 142.68mm; top: 31.09mm; width: 25.95mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1"
											style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 24.96mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce"
								style="left: 0mm; top: 36.96mm; width: 30.96mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1"
											style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 29.97mm;">
											<span class="hrt cs0">항 &nbsp;&nbsp;&nbsp;목</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce"
								style="left: 30.96mm; top: 36.96mm; width: 55.71mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1"
											style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 54.72mm;">
											<span class="hrt cs0">급여</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce"
								style="left: 86.67mm; top: 36.96mm; width: 27.05mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1"
											style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 26.06mm;">
											<span class="hrt cs0">항 &nbsp;&nbsp;&nbsp;목</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce"
								style="left: 113.72mm; top: 36.96mm; width: 54.91mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1"
											style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 53.92mm;">
											<span class="hrt cs0">비급여</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 0mm; top: 42.83mm; width: 30.96mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 29.97mm;">
											<span class="hrt cs0">분&nbsp;&nbsp;&nbsp;류</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 30.96mm; top: 42.83mm; width: 27.75mm; height: 5.87mm; border-right:1px solid #8E8E8E">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm; display:flex;">
										<div class="hrt cs0" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.36mm;">본인부담금</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 58.71mm; top: 42.83mm; width: 27.75mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm; display:flex;">
										<div class="hrt cs0" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.36mm;">공단부담금</div>
									</div>
								</div>
							</div>
							<div class="hce"
								style="left: 86.67mm; top: 42.83mm; width: 27.05mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 26.06mm;">
											<span class="hrt cs0">&nbsp;재 &nbsp;&nbsp;료 &nbsp;대</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 113.72mm; top: 42.83mm; width: 54.91mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 53.92mm;">
											<span class="hrt cs0">&nbsp;</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 0mm; top: 48.70mm; width: 30.96mm; height: 4.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 29.97mm;">
											<span class="hrt cs0">&nbsp;진 &nbsp;&nbsp;찰&nbsp;&nbsp;료</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 30.96mm; top: 48.70mm; width: 27.75mm; height: 4.87mm; border-right:1px solid #8E8E8E">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI">
										<div id="docPay" class="hls ps1" style="color:black; font-weight:bold; line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.36mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 58.71mm; top: 48.70mm; width: 27.75mm; height: 4.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI">
										<div id="docPayG" class="hls ps1" style="color:black; font-weight:bold; line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.36mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 86.67mm; top: 48.70mm; width: 27.05mm; height: 4.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 26.06mm;">
											<span class="hrt cs0">&nbsp;기 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;타</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 113.72mm; top: 48.70mm; width: 54.91mm; height: 4.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 53.92mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 0mm; top: 53.57mm; width: 30.96mm; height: 6.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 1mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 29.97mm;">
											<span class="hrt cs0">&nbsp;투약, 처방료</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 30.96mm; top: 53.57mm; width: 27.75mm; height: 6.87mm; border-right:1px solid #8E8E8E">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 1mm;">
										<div id="drugPay" class="hls ps1" style="color:black; font-weight:bold; line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.36mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 58.71mm; top: 53.57mm; width: 27.75mm; height: 6.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 1mm;">
										<div id="drugPayG" class="hls ps1" style="color:black; font-weight:bold; line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.36mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce"
								style="left: 86.67mm; top: 53.57mm; width: 27.05mm; height: 6.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 1mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 26.06mm;">
											<span class="hrt cs0">본인부담액①</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce"
								style="left: 113.72mm; top: 53.57mm; width: 54.91mm; height: 6.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 1mm;">
										<div id="costDedPl" class="hls ps1" style="color:black; font-weight:bold; line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 53.92mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 0mm; top: 60.44mm; width: 30.96mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 29.97mm;">
											<span class="hrt cs0">&nbsp;주&nbsp;&nbsp;사&nbsp;&nbsp;료</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 30.96mm; top: 60.44mm; width: 27.75mm; height: 5.87mm; border-right:1px solid #8E8E8E">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div id="treatPay" class="hls ps1" style="color:black; font-weight:bold; line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.36mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 58.71mm; top: 60.44mm; width: 27.75mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div id="treatPayG" class="hls ps1" style="color:black; font-weight:bold; line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.36mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce"
								style="left: 86.67mm; top: 60.44mm; width: 27.05mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 26.06mm;">
											<span class="hrt cs0">공단부담액②</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce"
								style="left: 113.72mm; top: 60.44mm; width: 54.91mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div id="costCorPl" class="hls ps1" style="color:black; font-weight:bold; line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 53.92mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce"
								style="left: 0mm; top: 66.31mm; width: 30.96mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 29.97mm;">
											<span class="hrt cs0">&nbsp;영상진단료</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce"
								style="left: 30.96mm; top: 66.31mm; width: 27.75mm; height: 5.87mm; border-right:1px solid #8E8E8E">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div id="examPay" class="hls ps1" style="color:black; font-weight:bold; line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.36mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 58.71mm; top: 66.31mm; width: 27.75mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div id="examPayG" class="hls ps1" style="color:black; font-weight:bold; line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.36mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 86.67mm; top: 66.31mm; width: 27.05mm; height: 46.96mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 11.73mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 26.06mm;">
											<span class="hrt cs0">지</span>
										</div>
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: 4.46mm; height: 3.88mm; width: 26.06mm;">
											<span class="hrt cs0">정</span>
										</div>
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: 9.12mm; height: 3.88mm; width: 26.06mm;">
											<span class="hrt cs0">진</span>
										</div>
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: 13.78mm; height: 3.88mm; width: 26.06mm;">
											<span class="hrt cs0">료</span>
										</div>
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: 18.43mm; height: 3.88mm; width: 26.06mm;">
											<span class="hrt cs0">비</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 113.72mm; top: 66.31mm; width: 28.96mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.97mm;">
											<span class="hrt cs0">&nbsp;진 &nbsp;찰 &nbsp;료</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 142.68mm; top: 66.31mm; width: 25.95mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 24.96mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 0mm; top: 72.18mm; width: 30.96mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 29.97mm;">
											<span class="hrt cs0">&nbsp;마 &nbsp;&nbsp;취&nbsp;&nbsp;료</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 30.96mm; top: 72.18mm; width: 27.75mm; height: 5.87mm; border-right:1px solid #8E8E8E">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.36mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 58.71mm; top: 72.18mm; width: 27.75mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.36mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 113.72mm; top: 72.18mm; width: 28.96mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.97mm;">
											<span class="hrt cs0">&nbsp;의학 관리료</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 142.68mm; top: 72.18mm; width: 25.95mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 24.96mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 0mm; top: 78.05mm; width: 30.96mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 29.97mm;">
											<span class="hrt cs0">&nbsp;수&nbsp;&nbsp;술&nbsp;&nbsp;료</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 30.96mm; top: 78.05mm; width: 27.75mm; height: 5.87mm; border-right:1px solid #8E8E8E">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.36mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 58.71; top: 78.05mm; width: 27.75mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.36mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 113.72mm; top: 78.05mm; width: 28.96mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.97mm;">
											<span class="hrt cs0">&nbsp;검 &nbsp;사 &nbsp;료</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 142.68mm; top: 78.05mm; width: 25.95mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 24.96mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 0mm; top: 83.92mm; width: 30.96mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 29.97mm;">
											<span class="hrt cs0">&nbsp;혈 &nbsp;&nbsp;액&nbsp;&nbsp;료</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 30.96mm; top: 83.92mm; width: 27.75mm; height: 5.87mm; border-right:1px solid #8E8E8E">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.36mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 58.71mm; top: 83.92mm; width: 27.75mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.36mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 113.72mm; top: 83.92mm; width: 28.96mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.97mm;">
											<span class="hrt cs0">방사진단,치료</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 142.68mm; top: 83.92mm; width: 25.95mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 24.96mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 0mm; top: 89.79mm; width: 30.96mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 29.97mm;">
											<span class="hrt cs0">&nbsp;보철, 교정료</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 30.96mm; top: 89.79mm; width: 27.75mm; height: 5.87mm; border-right:1px solid #8E8E8E">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.36mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 58.71mm; top: 89.79mm; width: 27.75mm; height: 5.87mm; ">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.36mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 30.96mm; top: 89.79mm; width: 55.71mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 54.72mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 113.72mm; top: 89.79mm; width: 28.96mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.97mm;">
											<span class="hrt cs0">&nbsp;마 &nbsp;&nbsp;취 &nbsp;료</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 142.68mm; top: 89.79mm; width: 25.95mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 24.96mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 0mm; top: 95.66mm; width: 30.96mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 29.97mm;">
											<span class="hrt cs0">&nbsp;진 &nbsp;단 &nbsp;서</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 30.96mm; top: 95.66mm; width: 27.75mm; height: 5.87mm; border-right:1px solid #8E8E8E">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div id="diaPay" class="hls ps1" style="color:black; font-weight:bold; line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.36mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 58.71mm; top: 95.66mm; width: 27.75mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div id="diaPayG" class="hls ps1" style="color:black; font-weight:bold; line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.36mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 113.72mm; top: 95.66mm; width: 28.96mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.97mm;">
											<span class="hrt cs0">&nbsp;정 신 요 법</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 142.68mm; top: 95.66mm; width: 25.95mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 24.96mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 0mm; top: 101.53mm; width: 30.96mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 29.97mm;">
											<span class="hrt cs0">&nbsp;소 &nbsp;견 &nbsp;서</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 30.96mm; top: 101.53mm; width: 27.75mm; height: 5.87mm; border-right:1px solid #8E8E8E">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div id="notePay" class="hls ps1" style="color:black; font-weight:bold; line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.36mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 58.71mm; top: 101.53mm; width: 27.75mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div id="notePayG" class="hls ps1" style="color:black; font-weight:bold; line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.36mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 113.72mm; top: 101.53mm; width: 28.96mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.97mm;">
											<span class="hrt cs0">&nbsp;처치,수술료</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 142.68mm; top: 101.53mm; width: 25.95mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 24.96mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 0mm; top: 107.40mm; width: 30.96mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 29.97mm;">
											<span class="hrt cs0">&nbsp;합&nbsp;&nbsp;&nbsp;계&nbsp;</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 30.96mm; top: 107.40mm; width: 27.75mm; height: 5.87mm; border-right:1px solid #8E8E8E">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div id="costDed" class="hls ps1" style="color:black; font-weight:bold; line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.36mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 58.71mm; top: 107.40mm; width: 27.75mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div id="costCor" class="hls ps1" style="color:black; font-weight:bold; line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.36mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 113.72mm; top: 107.40mm; width: 28.96mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.97mm;">
											<span class="hrt cs0">&nbsp;&nbsp;소&nbsp;&nbsp;&nbsp;계③</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 142.68mm; top: 107.40mm; width: 25.95mm; height: 5.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 24.96mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 0mm; top: 113.27mm; width: 30.96mm; height: 10.53mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 0.50mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 29.97mm;">
											<span class="hrt cs0">&nbsp;&nbsp;총 진 료 비</span>
										</div>
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: 4.46mm; height: 3.88mm; width: 29.97mm;">
											<span class="hrt cs0">&nbsp;&nbsp;&nbsp;① &nbsp; + &nbsp;②</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 30.96mm; top: 113.27mm; width: 82.76mm; height: 10.53mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 2.83mm;">
										<div id="totalPay" class="hls ps1" style="color:black; font-weight:bold; line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 81.77mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 113.72mm; top: 113.27mm; width: 28.96mm; height: 10.53mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 2.83mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.97mm;">
											<span class="hrt cs0">&nbsp;&nbsp;담당자</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 142.68mm; top: 113.27mm; width: 25.95mm; height: 10.53mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 2.83mm;">
									<sec:authorize access="isAuthenticated()">
										<div id="recEmpNo" class="hls ps1" style="color:black; font-weight:bold; line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 24.96mm;">
											<span class="hrt cs0">&nbsp;&nbsp;<sec:authentication property="principal.empVO.empName"/>&nbsp;</span>
										</div>
									</sec:authorize>	
									</div>
								</div>
							</div>
							<div class="hce" style="left: 0mm; top: 123.80mm; width: 30.96mm; height: 4.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 29.97mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 30.96mm; top: 123.80mm; width: 28.96mm; height: 4.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.97mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 59.92mm; top: 123.80mm; width: 26.75mm; height: 4.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 25.77mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 86.67mm; top: 123.80mm; width: 27.05mm; height: 4.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 26.06mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 113.72mm; top: 123.80mm; width: 28.96mm; height: 4.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 27.97mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 142.68mm; top: 123.80mm; width: 25.95mm; height: 4.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 24.96mm;"></div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 0mm; top: 128.66mm; width: 168.63mm; height: 33.16mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 2.50mm;">
										<div class="hls ps1" style="color:black; font-weight:bold; line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 167.64mm;">
											<span id="recDtYY"></span><span class="hrt cs0">&nbsp;년&nbsp;&nbsp;</span><span id="recDtMM"></span><span class="hrt cs0">&nbsp;월&nbsp;&nbsp;</span> 
												<span id="recDtDD"></span><span class="hrt cs0">&nbsp;일</span>
										</div>
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: 4.46mm; height: 3.88mm; width: 167.64mm;"></div>
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: 9.12mm; height: 3.88mm; width: 167.64mm;">
											<span class="hrt cs0">위 금액을 정히 영수함.</span>
										</div>
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: 13.78mm; height: 3.88mm; width: 167.64mm;"></div>
										<div class="hls ps4" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: 18.43mm; height: 3.88mm; width: 167.64mm;">
											<span class="hrt cs0">&nbsp;&nbsp;&nbsp;&nbsp;* 이 계산서는 소득세법상 의료비 공제 신청에 필요합니다.</span>
										</div>
										<div class="hls ps4" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: 23.09mm; height: 3.88mm; width: 167.64mm;">
											<span class="hrt cs0">&nbsp;&nbsp;&nbsp;&nbsp;* 이 계산서는 재발행되지 않습니다. &nbsp;&nbsp;&nbsp;&nbsp;</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="hls ps5" style="line-height: 5.01mm; white-space: nowrap; left: 0mm; top: 163.52mm; height: 5.86mm; width: 170.01mm;">
						<div class="htb" style="left: 0.49mm; width: 170mm; top: 0.49mm; height: 5.86mm; display: inline-block; position: relative; vertical-align: middle;">
							<svg class="hs" viewBox="-2.50 -2.50 175 10.85" style="left: -2.50mm; top: -2.50mm; width: 175mm; height: 10.85mm;">
								<path d="M-0.05,4.87 L169.06,4.87" style="stroke:#000000;stroke-linecap:butt;stroke-dasharray:0.17,0.26;stroke-width:0.12;"></path></svg>
							<div class="hce" style="left: 0mm; top: 0mm; width: 169.01mm; height: 4.87mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI">
										<div class="hls ps0" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 168.02mm;"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="hls ps5" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: 169.18mm; height: 3.88mm; width: 170.01mm;"></div>
					<div class="hls ps5" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: 173.06mm; height: 3.88mm; width: 170.01mm;">
						<span class="hrt cs4">의료재단 DDIT</span></br><span class="hrt cs5">MedicalTechnology</span>
					</div>
					<div class="hls ps5" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: 176.94mm; height: 3.88mm; width: 170.01mm;"></div>
					<div class="hls ps0" style="line-height: 33.57mm; white-space: nowrap; left: 0mm; top: 181.02mm; height: 33.57mm; width: 170.01mm;">
						<div class="htb" style="left: 0.49mm; width: 170.04mm; top: 0.49mm; height: 33.57mm; display: inline-block; position: relative; vertical-align: middle;">
							<svg class="hs" viewBox="-2.50 -2.50 175.04 38.57" style="left: -2.50mm; top: -2.50mm; width: 175.04mm; height: 38.57mm;">
								<path d="M0,14.53 L0,32.59"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
								<path d="M169.05,14.53 L169.05,32.59"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
								<path d="M-0.05,14.53 L169.26,14.53"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
								<path d="M-0.20,23.06 L169.26,23.06"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
								<path d="M-0.20,32.58 L169.26,32.58"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
								<path d="M169.05,14.53 L169.05,32.59"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
								<path d="M0,14.53 L0,32.59"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
								<path d="M-0.20,32.58 L169.26,32.58"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
								<path d="M-0.05,14.53 L169.26,14.53"
									style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path></svg>
							<div class="hce" style="left: 0mm; top: 0mm; width: 169.05mm; height: 14.53mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 168.06mm;"></div>
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: 4.46mm; height: 3.88mm; width: 168.06mm;">
											<span class="hrt cs7">귀 하 께 서 &nbsp;&nbsp;진 료 받 으 신 곳</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 0mm; top: 14.53mm; width: 169.05mm; height: 8.52mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI" style="top: 1.83mm;">
										<div class="hls ps1" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 168.06mm;">
											<span class="hrt cs7">진
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;료
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;과(실)</span>
										</div>
									</div>
								</div>
							</div>
							<div class="hce" style="left: 0mm; top: 23.06mm; width: 169.05mm; height: 9.52mm;">
								<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
									<div class="hcI">
										<div id="docNo" class="hls ps1" style="color:black; font-weight:bold; line-height: 3.10mm; white-space: nowrap; left: 0mm; top: -0.19mm; height: 3.88mm; width: 168.06mm;"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="hls ps0" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: 216.16mm; height: 3.88mm; width: 170.01mm;"></div>
					<div class="hls ps0" style="line-height: 3.10mm; white-space: nowrap; left: 0mm; top: 221.99mm; height: 3.88mm; width: 170.01mm;"></div>
				</div>
			</div>
	  	</div>
	  </div>  
	  <!-- modal-body 끝 -->
	  <div class="modal-footer modal-footer-uniform">
		<button type="button" class="btn btn-danger" data-bs-dismiss="modal" style="float:right;">닫기</button>
	  </div>
	</div>
  </div>
</div>
<script>

// 수납내역에 있는 데이터를 영수증에 넣기 위한 전역변수 선언
var empName = "";  // 담당의사
var docPay = Math.floor((5600 * 0.4) / 100) * 100;  // 진찰료 본인부담금 금액
var docPayG = Math.floor((5600 * 0.6) / 100) * 100;  // 진찰료 공단부담금 금액
var treatPay = 0;  // 주사료, 처치료 본인부담금 금액
var treatPayG = 0;  // 주사료, 처치료 공단부담금 금액
var drugPay = 0; // 투약, 처방료 본인부담금 금액
var drugPayG = 0; // 투약, 처방료 공단부담금 금액
var examPay = 0; // 검사료, 영상진단료 본인부담금 금액
var examPayG = 0; // 검사료, 영상진단료 공단부담금 금액
var paName = "";  // 환자이름
var notePay = 0;  // 소견서 본인부담금 금액
var notePayG = 0;  // 소견서 공단부담금 금액
var diaPay = 0;  // 진단서 본인부담금 금액
var diaPayG = 0;  // 진단서 공단부담금 금액
var cost = 0;  // 본인 부담금 총 금액
var costG = 0;  // 공단부담금 총 금액
var paNo = "";  // 환자 번호
var diaCd = "";  // 진단서코드
var ntCd = "";  // 소견서코드
var recCd = ""  // 수납코드
var paInsuYn = "";  // 보험가입 여부
var header = "${_csrf.headerName}";
var token  = "${_csrf.token}";

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

// 대기환자 목록 조회
function fn_waitList() {
	
	$.ajax({
		url : "/accept/waitList",
		contentType : "application/json; charset=utf-8",
		type : "get",
		beforeSend:function(xhr) {
           xhr.setRequestHeader(header,token);
		},
		success : function(result) {
			
			var str = "";
			
			if(result.length == 0) {
				
// 				str += "<tr>"; 
				str += "<td colspan='4' style='text-align:center;'><h3>수납 대기환자가 없습니다.</h3></td>"; 
// 				str += "</tr>"; 
				
			} else {
				
				for(var i = 0; i < result.length; i++) {
					
					var dt = new Date(result[i].paFiviDt);
					var dtYY = dt.getFullYear();
					var dtMM = leadingZeros(dt.getMonth() + 1, 2);
					var dtDD = leadingZeros(dt.getDate(), 2);
					var dtResult = dtYY + "-" + dtMM + "-" + dtDD;
					
					str += "<tr>"
					str += "<td style='text-align:center;'>" + (i+1) + "</th>";
					str += "<td style='text-align:center;'>" + result[i].paName + "</td>";
					str += "<td style='text-align:center;'>" + result[i].paState + "</td>";
					str += "<td style='text-align:center;'>N</td>";
					str += "<td style='display:none;'>" + result[i].paNo + "</td>";
					str += "<td style='display:none;'>" + result[i].paReg + "</td>";
					str += "<td style='display:none;'>" + result[i].paPh + "</td>";
					str += "<td style='display:none;'>" + result[i].paAdd1 + "</td>";
					str += "<td style='display:none;'>" + result[i].paAdd2 + "</td>";
					str += "<td style='display:none;'>" + dtResult + "</td>";
					str += "<td style='display:none;'>" + result[i].paInsuYn + "</td>";
					str += "</tr>";
				}
			}
			$("#waitList").append(str);
		}
	});
}

// 수납 이력 조회(환자별) 
function fn_recList() {
	
	var data = {"paNo" : paNo};
	
	$.ajax({
		url : "/accept/recList",
		contentType : "application/json; charset=utf-8",
		async : false,
		data : JSON.stringify(data),
		type : "post",
		dataType : "json",
		beforeSend:function(xhr) {
           xhr.setRequestHeader(header,token);
		},
		success : function(result) {
			
			$("#pastHistory").empty();
			
			var str = "";
			
			if(result.length == 0) {
				
// 				str += "<tr>"; 
				str += "<td colspan='9' style='text-align:center;'><h3>수납 이력이 없습니다.</h3></td>"; 
// 				str += "</tr>"; 
				
			} else {
			
				for(var i = 0; i < result.length; i++) {
				
					var dt = new Date(result[i].recDt);
					var dtYY = dt.getFullYear();
					var dtMM = leadingZeros(dt.getMonth() + 1, 2);
					var dtDD = leadingZeros(dt.getDate(), 2);
					var dtResultRecDt = dtYY + "-" + dtMM + "-" + dtDD;
					
					str += "<tr>";
					str += "<td>" + result[i].recCd + "</td>";
					str += "<td>" + dtResultRecDt + "</td>";
					str += "<td>" + result[i].patientVO.paName + "</td>";
					str += "<td>" + result[i].recMt + "</td>";
					str += "<td>" + result[i].recTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "</td>";
					str += "<td>" + result[i].recEmpNo + "</td>";
					str += "<td>" + result[i].paInsuYn + "</td>";
					str += "<td>" + result[i].recYn + "</td>";
					str += "</tr>";
				}
			}
			$("#pastHistory").append(str);
		}
	});
}

// 당일 수납이력 조회
function fn_recToday() {

	$.ajax({
		url : "/accept/recToday",
		contentType : "application/json; charset=utf-8",
		type : "get",
		beforeSend:function(xhr) {
           xhr.setRequestHeader(header,token);
		},
		success : function(result) {
			
			$("#pastHistory").empty();
			
			var str = "";
			
			if(result.length == 0) {
				
// 				str += "<tr>"; 
				str += "<td colspan='9' style='text-align:center;'><h3>금일 수납 이력이 없습니다.</h3></td>"; 
// 				str += "</tr>"; 
				
			} else {
				
				for(var i = 0; i < result.length; i++) {
					
					var dt = new Date(result[i].recDt);
					var dtYY = dt.getFullYear();
					var dtMM = leadingZeros(dt.getMonth() + 1, 2);
					var dtDD = leadingZeros(dt.getDate(), 2);
					var dtResultRecDt = dtYY + "-" + dtMM + "-" + dtDD;
					
					str += "<tr>";
					str += "<td>" + result[i].recCd + "</td>";
					str += "<td>" + dtResultRecDt + "</td>";
					str += "<td>" + result[i].patientVO.paName + "</td>";
					str += "<td>" + result[i].recMt + "</td>";
					str += "<td>" + result[i].recTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "</td>";
					str += "<td>" + result[i].recEmpNo + "</td>";
					str += "<td>" + result[i].paInsuYn + "</td>";
					str += "<td>" + result[i].recYn + "</td>";
					str += "</tr>";
				}
			}
			
			$("#pastHistory").append(str);
		}
	});
}


$(function() {

	// 대기환자 목록 호출
	fn_waitList();
	// 금일 수납이력 목록 호출
	fn_recToday();
	
	$("#payment").attr("disabled", true);
	$("#insertRec").attr("disabled", true);
		
	$("#searchBtn").on("click", function() {
		$("#paData").empty();
	});
	
	// 대기환자 목록 클릭시 환자 정보 조회하기
	$(document).on("click", "#waitList tr", function() {
		
		$("#pastHistory").empty();
		$("#totalCost").val("");
		$("#orderFee").empty();
		$("#certiList").empty();
		
		var paName = $(this).children().eq(1).text();
		var paState = $(this).children().eq(2).text();
		var paNo = $(this).children().eq(4).text();
		var paReg = $(this).children().eq(5).text().substr(0,8) + "******";
		var paPh = $(this).children().eq(6).text();
		paPh = paPh.substr(0,3) + "-" + paPh.substr(3,4) + "-" + paPh.substr(7);
		var paAdd1 = $(this).children().eq(7).text();
		var paAdd2 = $(this).children().eq(8).text();
		var paFiviDt = $(this).children().eq(9).text();
		// 보험가입 여부 추가
		paInsuYn = $(this).children().eq(10).text();
		
		$("input[name=paNo]").val(paNo);
		$("input[name=paName]").val(paName);
		$("input[name=paReg]").val(paReg);
		$("input[name=paPh]").val(paPh);
		$("input[name=paAdd1]").val(paAdd1);
		$("input[name=paAdd2]").val(paAdd2);
		$("input[name=paFiviDt]").val(paFiviDt);
		$("input[name=paState]").val(paState);
		$("input[name=paInsuYn]").val(paInsuYn);
	});
	
	$("#btnSearch").on("click", function(){
		
		// $("#patiInfo").empty();
		$("#paData").empty();
		
		paName = $("#paSearch").val();
		
		var data = {"paName" : paName};
		
		$.ajax({
			url : "/accept/paSearch",
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
				
				for (var i = 0; i < result.length; i++) { 

					str += "<tr>";
					str += "<td>" + result[i].paNo + "</td>";
					str += "<td>" + result[i].paReg + "</td>";
					str += "<td>" + result[i].paName + "</td>";
					str += "<td>" + result[i].paPh + "</td>";
					str += "</tr>";
				}
				
				$("#paData").append(str);
			}
		});
	});
	
	// 환자검색 버튼 누를때마다 목록 초기화
	$("#recBtn").on("click", function() {
		$("#paData").empty();
		$("#paSearch").val("");
	});
	
	$(document).on("click", "#paData tr", function() {
		
		$("#pastHistory").empty();
		$("#totalCost").val("");
		$("#orderFee").empty();
		$("#certiList").empty();
		
		paNo  = $(this).children().eq(0).text();
		console.log(paNo);
		
		var data = {"paNo" : paNo};
		
		// 수납 이력 조회하는 함수 호출
		fn_recList();
	});
	
	//날짜 선택 조회
  	$("#picker").change(function() {

  		// 환자 조회 초기화
		$("input[name=paNo]").val("");
		$("input[name=paName]").val("");
		$("input[name=paReg]").val("");
		$("input[name=paPh]").val("");
		$("input[name=paAdd1]").val("");
		$("input[name=paAdd2]").val("");
		$("input[name=paFiviDt]").val("");
		$("input[name=paState]").val("");
		$("input[name=paInsuYn]").val("");
		
		// 수납 이력 초기화
		$("#pastHistory").empty();
		// 전역변수 총금액 초기화
		$("#totalCost").val("");
		// 수납 내역 초기화(오더)
		$("#orderFee").empty();
		// 수납 내역 초기화(제증명)
		$("#certiList").empty();
		
//   		// 문자열을 Date형식으로 바꿔주는 함수
//   		function parse(str) {
// 		    var yy = str.substr(0, 4);
// 		    var mm = str.substr(5, 2);
// 		    var dd = str.substr(8, 2);
// 		    return new Date(yy, mm-1, dd);
//   		}

  		var dt = $("#picker").val(); //yyyy-mm-dd 로 나옴 
  		console.log(dt);
  		
  		// 년,월,일 잘라서 날짜 형식 YY/MM/DD로 바꿔줌
  		var yy = dt.substring(2,4); 
  		var mm = dt.substring(5,7);
  		var dd = dt.substring(8,10);
  		var recDt = yy + "/" + mm + "/" + dd;
  			
  		console.log(typeof(recDt));
  		console.log(recDt);

  		var data = {"recDt" : recDt};
  		
  		// 선택한 날짜에 해당하는 수납 이력 조회
  		$.ajax({
  			url : "/accept/recDate",
			contentType : "application/json; charset=utf-8",
			async : false,
			data : JSON.stringify(data),
			type : "post",
			dataType : "json",
			beforeSend:function(xhr) {
	           xhr.setRequestHeader(header,token);
			},
			success : function(result) {
				$("#pastHistory").empty();
				
				var str = "";
				
				if(result.length == 0) {
					
// 					str += "<tr>"; 
					str += "<td colspan='9' style='text-align:center;'><h3>수납 이력이 없습니다.</h3></td>"; 
// 					str += "</tr>"; 
					
				} else {
					for(var i = 0; i < result.length; i++) {
						
						var dt = new Date(result[i].recDt);
						var dtYY = dt.getFullYear();
						var dtMM = leadingZeros(dt.getMonth() + 1, 2);
						var dtDD = leadingZeros(dt.getDate(), 2);
						var dtResultRecDt = dtYY + "-" + dtMM + "-" + dtDD;
						
						str += "<tr>";
						str += "<td>" + result[i].recCd + "</td>";
						str += "<td>" + dtResultRecDt + "</td>";
						str += "<td>" + result[i].patientVO.paName + "</td>";
						str += "<td>" + result[i].recMt + "</td>";
						str += "<td>" + result[i].recTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "</td>";
						str += "<td>" + result[i].recEmpNo + "</td>";
						str += "<td>" + result[i].paInsuYn + "</td>";
						str += "<td>" + result[i].recYn + "</td>";
						str += "</tr>";
					}
				}
				
				$("#pastHistory").append(str);
			}
  		});
  	});
	
	$("#clear").on("click", function() {
		
		// 환자 조회 초기화
		$("input[name=paNo]").val("");
		$("input[name=paName]").val("");
		$("input[name=paReg]").val("");
		$("input[name=paPh]").val("");
		$("input[name=paAdd1]").val("");
		$("input[name=paAdd2]").val("");
		$("input[name=paFiviDt]").val("");
		$("input[name=paState]").val("");
		$("input[name=paInsuYn]").val("");
		
		// 수납 이력 초기화
		$("#pastHistory").empty();
		// 전역변수 총금액 초기화
		$("#totalCost").val("");
		// 수납 내역 초기화(오더)
		$("#orderFee").empty();
		// 수납 내역 초기화(제증명)
		$("#certiList").empty();
	})
	
	$("#search").on("click", function() {
		
		// 본인부담금, 공단부담금 초기화
		drugPay = 0;
		treatPay = 0;
		examPay = 0;
		diaPay = 0;
		notePay = 0;
		drugPayG = 0;
		treatPayG = 0;
		examPayG = 0;
		diaPayG = 0;
		notePayG = 0;
		
		// 진찰료 초기화
		docPay = Math.floor((5200 * 0.4) / 100) * 100;  
		docPayG = Math.floor((5200 * 0.6) / 100) * 100;  
		
		// 총 금액 초기화
		cost = 0;
		costG = 0;
		
		$("#orderFee").empty();
		$("#certiList").empty();
		$("#totalCost").val("");
		
		if($("input[name=paNo]").val() != "") {
			
			$("#totalCost").empty();
			
			console.log("paNo : " + $("input[name=paNo]").val());
			console.log("paName : " + $("input[name=paName]").val());
			console.log("paState : " + $("input[name=paState]").val());
			
			paNo = $("input[name=paNo]").val();
			paName = $("input[name=paName]").val();
			var paState = $("input[name=paState]").val();
			
			var data = {"paNo" : paNo};
			
			// 오더 리스트 금액 조회
			$.ajax({
				url : "/accept/orderFee",
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
						
// 						str += "<tr>"; 
						str += "<td colspan='6' style='text-align:center;'><h3>수납 내역이 없습니다.</h3></td>"; 
// 						str += "</tr>"; 
						
					} else {
						for(var i = 0; i < result.length; i++) {
							var dt = new Date(result[i].chartVO.chDt);
							var dtYY = dt.getFullYear();
							var dtMM = leadingZeros(dt.getMonth() + 1, 2);
							var dtDD = leadingZeros(dt.getDate(), 2);
							var dtResult = dtYY + "-" + dtMM + "-" + dtDD;
							
							// 오더 개수에 따라서 진료비를 분배
							var docPayDup = docPay / (result.length);
							var docPayDupG = docPayG / (result.length);
							
							var olActFee = Math.floor((0.4 * parseInt(result[i].olActFee)) / 100) * 100 + docPay;
							var olActFeeG = Math.floor((0.6 * parseInt(result[i].olActFee)) / 100) * 100 + docPayG;
							console.log("오더금액 : " + olActFee);
							
							if(paInsuYn == "미가입자") {
								olActFee = olActFee + olActFeeG;
								console.log("보험 미가입시 오더 금액  : " + olActFee);
							}
							
							str += "<tr>";
							str += "<td>" + result[i].olActKo + "</td>";
							str += "<td>" + paName + "</td>";
							str += "<td>" + dtResult + "</td>";
							str += "<td>" + result[i].toVO.toGubun + "</td>";
							str += "<td>" + result[i].empVO.empName + "</td>";
							str += "<td>" + olActFee.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "</td>";
							str += "</tr>";
							
							if(paInsuYn == "보험가입자") {
								if(result[i].toVO.toGubun == "검사") {
									examPay += Math.floor((parseInt(olActFee) - docPayDup) / 100) * 100;
									examPayG += Math.floor((parseInt(olActFeeG) - docPayDupG) / 100) * 100;
								} else if(result[i].toVO.toGubun == "내복") {
									drugPay += Math.floor((parseInt(olActFee) - docPayDup) / 100) * 100;
									drugPayG += Math.floor((parseInt(olActFeeG) - docPayDupG) / 100) * 100;
								} else if(result[i].toVO.toGubun == "주사") {
									treatPay += Math.floor((parseInt(olActFee) - docPayDup) / 100) * 100;
									treatPayG += Math.floor((parseInt(olActFeeG) - docPayDupG) / 100) * 100;
								} 
							} else if(paInsuYn == "미가입자") {
								if(result[i].toVO.toGubun == "검사") {
									examPay += Math.floor((parseInt(olActFee) - docPayDup - docPayDupG) / 100) * 100;
								} else if(result[i].toVO.toGubun == "내복") {
									drugPay += Math.floor((parseInt(olActFee) - docPayDup - docPayDupG) / 100) * 100;
								} else if(result[i].toVO.toGubun == "주사") {
									treatPay += Math.floor((parseInt(olActFee) - docPayDup - docPayDupG) / 100) * 100;
								} 
							}
							
							cost += parseInt(olActFee);
							costG += parseInt(olActFeeG);
							empName	= result[i].empVO.empName;
						}
					}
					console.log("오더 본인부담금 : " + cost);
					console.log("오더 공단부담금 : " + costG);
					
					$("#orderFee").append(str);
					$("#payment").attr("disabled", false);
					$("#insertRec").attr("disabled", false);
				}
			});
			
			var exist = 0;
			
			// 진단서 금액 조회
			$.ajax({
				url : "/accept/diaFee",
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
						
						exist = 0; 
						
					} else {
						
						for(var i = 0; i < result.length; i++) {
							
							var dt = new Date(result[i].diaDt);
							var dtYY = dt.getFullYear();
							var dtMM = leadingZeros(dt.getMonth() + 1, 2);
							var dtDD = leadingZeros(dt.getDate(), 2);
							var dtResultDia = dtYY + "-" + dtMM + "-" + dtDD;
							
							var diaPmtPrice = Math.floor((0.4 * parseInt(result[i].diaPmtPrice)) / 100) * 100;
							var diaPmtPriceG = Math.floor((0.6 * parseInt(result[i].diaPmtPrice)) / 100) * 100;
							
							if(paInsuYn == "미가입자") {
								diaPmtPrice = diaPmtPrice + diaPmtPriceG;
								console.log("보험 미가입시 진단서 금액  : " + diaPmtPrice);
							}
							
							var ctfGubun = "";
							if(result[i].ctforVO.ctfGubun == "diag") {
								ctfGubun = "진단서";
							}
							
							str += "<tr>";
							str += "<td>" + ctfGubun + "</td>";
							str += "<td>" + result[i].ctforVO.ctfName + "</td>";
							str += "<td>" + dtResultDia + "</td>";
							str += "<td>" + result[i].ctforVO.empName + "</td>";
							str += "<td>" + diaPmtPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "</td>";
							str += "<td style='display:none;'>" + result[i].diaCd + "</td>";
							str += "</tr>";
							
							diaCd = result[i].diaCd
							diaPay += diaPmtPrice;
							diaPayG += diaPmtPriceG;
							cost += diaPmtPrice;
							costG += diaPmtPriceG;
							
							console.log("진단서 본인부담금" + diaPmtPrice);
							console.log("진단서 공단부담금" + diaPmtPriceG);
						}
						exist = 1;
					}
					
					$("#certiList").append(str);
				}
			});
			
			// 소견서 금액 조회
			$.ajax({
				url : "/accept/noteFee",
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
					
					if(exist == 1) {
					
						for(var i = 0; i < result.length; i++) {
						
							var dt = new Date(result[i].ntDt);
							var dtYY = dt.getFullYear();
							var dtMM = leadingZeros(dt.getMonth() + 1, 2);
							var dtDD = leadingZeros(dt.getDate(), 2);
							var dtResultNote = dtYY + "-" + dtMM + "-" + dtDD;
							
							var ntPmtPrice = Math.floor((0.4 * parseInt(result[i].ntPmtPrice)) / 100) * 100;
							var ntPmtPriceG = Math.floor((0.6 * parseInt(result[i].ntPmtPrice)) / 100) * 100;
							
							if(paInsuYn == "미가입자") {
								ntPmtPrice = ntPmtPrice + ntPmtPriceG;
								console.log("보험 미가입시 소견서 금액  : " + ntPmtPrice);
							}
							
							var ctfGubun = "";
							if(result[i].ctforVO.ctfGubun == "note") {
								ctfGubun = "소견서";
							}
							
							str += "<tr>"
							str += "<td>" + ctfGubun + "</td>"
							str += "<td>" + result[i].ctforVO.ctfName + "</td>"
							str += "<td>" + dtResultNote + "</td>"
							str += "<td>" + result[i].ctforVO.empName + "</td>"
							str += "<td>" + ntPmtPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "</td>"
							str += "<td style='display:none;'>" + result[i].ntCd + "</td>"
							str += "</tr>"
									
							ntCd = result[i].ntCd;
							notePay += ntPmtPrice;
							notePayG += ntPmtPriceG;
							
							cost += ntPmtPrice;
							costG += ntPmtPriceG;
							
							console.log("소견서 본인부담금" + ntPmtPrice);
							console.log("소견서 공단부담금" + ntPmtPriceG);
						}
					} else {
										
						if(result.length == 0) {
							
							str += "<tr>"; 
							str += "<td colspan='5' style='text-align:center;'><h3>제증명 내역이 없습니다.</h3></td>"; 
							str += "</tr>"; 
							
						} else {
							
							for(var i = 0; i < result.length; i++) {
								
								var dt = new Date(result[i].ntDt);
								var dtYY = dt.getFullYear();
								var dtMM = leadingZeros(dt.getMonth() + 1, 2);
								var dtDD = leadingZeros(dt.getDate(), 2);
								var dtResultNote = dtYY + "-" + dtMM + "-" + dtDD;
								
								var ntPmtPrice = Math.floor((0.4 * parseInt(result[i].ntPmtPrice)) / 100) * 100;
								var ntPmtPriceG = Math.floor((0.6 * parseInt(result[i].ntPmtPrice)) / 100) * 100;
								
								if(paInsuYn == "미가입자") {
									ntPmtPrice = ntPmtPrice + ntPmtPriceG;
									console.log("보험 미가입시 소견서 금액  : " + ntPmtPrice);
								}
								
								var ctfGubun = "";
								if(result[i].ctforVO.ctfGubun == "note") {
									ctfGubun = "소견서";
								}
								
								str += "<tr>"
								str += "<td>" + ctfGubun + "</td>"
								str += "<td>" + result[i].ctforVO.ctfName + "</td>"
								str += "<td>" + dtResultNote + "</td>"
								str += "<td>" + result[i].ctforVO.empName + "</td>"
								str += "<td>" + ntPmtPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "</td>"
								str += "<td style='display:none;'>" + result[i].ntCd + "</td>"
								str += "</tr>"
										
								ntCd = result[i].ntCd;
								notePay += ntPmtPrice;
								notePayG += ntPmtPriceG;
								
								cost += ntPmtPrice;
								costG += ntPmtPriceG;
								
								console.log("소견서 본인부담금" + ntPmtPrice);
								console.log("소견서 공단부담금" + ntPmtPriceG);
							}
						}
					}
					$("#certiList").append(str);
				}
			});
			
			// 수납내역 조회
			fn_recList();
			
			console.log("전체금액 : " + cost);
			$("#totalCost").val("   " + cost.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원");
		}  // if문 close
	});
	
	$("#payment").on("click", function() {
		
		// console.log("카드 or 현금 value값 : " + $('input[type=radio]:checked').next().text());
		
		$("#waitList").empty();
		$("#orderFee").empty();
		$("#certiList").empty();
		$("#totalCost").val("");

		// 결제 영수증에 남아있는 내용 초기화
		$("#docPayG").html("");
		$("#drugPayG").html("");
		$("#treatPayG").html("");
		$("#examPayG").html("");
		$("#diaPayG").html("");
		$("#notePayG").html("");
		$("#costCor").html("");
		$("#costCorPl").html("");
		
		var recEmpNo = $("#recEmpNo").text().trim();
		console.log("담당자 : " + recEmpNo);
		var recTotal = cost;  
		var recDt = "";    // 수납날짜
		var recDtYY = "";  // 수납연
		var recDtMM = "";  // 수납월
		var recDtDD = "";  // 수납일 
		var doNo = "";  // 진료실 번호
		var recMt = $('input[type=radio]:checked').next().text();
		
		var data = {"paNo" : paNo, "recTotal" : recTotal, "recEmpNo" : recEmpNo, "diaCd" : diaCd, "ntCd" : ntCd, "recMt" : recMt, "paInsuYn" : paInsuYn};
		
		// 결제 영수증 출력
		$.ajax({
			url : "/accept/receipt",
			async : false,
			type : "post",
			dataType : "json",
			beforeSend:function(xhr) {
	           xhr.setRequestHeader(header,token);
			},
			success : function(result) {
				
				var dt = new Date(result.recDt);
				var dtYY = dt.getFullYear();
				var dtMM = leadingZeros(dt.getMonth() + 1, 2);
				var dtDD = leadingZeros(dt.getDate(), 2);
				var dtResultrecDt = dtYY + "-" + dtMM + "-" + dtDD;
				
				recEmpNo = result.recEmpNo;
				recDt = dtResultrecDt;
				recCd = result.recCd;	
				recDtYY = recDt.slice(0, 4);
				recDtMM = recDt.slice(5, 7);
				recDtDD = recDt.slice(8, 10);
			}
		});
		
		// 수납내역 수납이력에 등록
		$.ajax({
			url : "/accept/insertRec",
			contentType : "application/json; charset=utf-8",
			async : false,
			data : JSON.stringify(data),
			type : "post",
			dataType : "json",
			beforeSend:function(xhr) {
	           xhr.setRequestHeader(header,token);
			},
			success : function(result) {
				
				Swal.fire({
			        icon: 'success',
			        title: '결제가 완료되었습니다',
			        showConfirmButton: false,
			        background: '#15243e',
			        timer: 5500,
			    }).then((value) => {
			        if(value){
			        	$("#payment").attr("disabled", true);
			        }
			    });
			}
		});
		
		console.log("empName : " + empName);
		console.log("paNo : " + paNo);
		var data = {"empName" : empName, "paNo" : paNo};
		
		// 진료실 조회 후 영수증에 출력
		$.ajax({
			url : "/accept/docOff",
			contentType : "application/json; charset=utf-8",
			async : false,
			data : JSON.stringify(data),
			type : "post",
			dataType : "json",
			beforeSend:function(xhr) {
	           xhr.setRequestHeader(header,token);
			},
			success : function(result) {
				console.log(result.docNo);
				docNo = result.docNo;
			}
		});
		
		
		// 영수증에 값 넣어주기
		$("#empName").html(empName);
		$("#paName").html(paName);
		$("#recEmpNo").html(recEmpNo);
		$("#recCd").html(recCd);
		// recDt 2023-01-04 -> 2023.01.04
		recDt = recDt.replaceAll("-", ".");
		$("#recDt").html(recDt);
		$("#recDtYY").html(recDtYY);
		$("#recDtMM").html("&nbsp;&nbsp;" + recDtMM);
		$("#recDtDD").html("&nbsp;&nbsp;" + recDtDD);
		$("#docNo").html(docNo);
		$("#mediDepart").html("정형외과");
			
		if(paInsuYn == "보험가입자") {
		
			// 본인 부담금 
			$("#docPay").html(docPay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$("#drugPay").html(drugPay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$("#treatPay").html(treatPay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$("#examPay").html(examPay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$("#diaPay").html(diaPay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$("#notePay").html(notePay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$("#costDed").html(cost.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$("#costDedPl").html(cost.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			// 공단 부담금
			$("#docPayG").html(docPayG.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$("#drugPayG").html(drugPayG.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$("#treatPayG").html(treatPayG.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$("#examPayG").html(examPayG.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$("#diaPayG").html(diaPayG.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$("#notePayG").html(notePayG.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$("#costCor").html(costG.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$("#costCorPl").html(costG.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			// 본인 부담금 + 공단 부담금
			var totalPay = cost + costG
			$("#totalPay").html(totalPay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			
		} else if(paInsuYn == "미가입자") {
			docPay = docPay + docPayG;

			costDed = cost;
			costDedPl = cost;
			
			// 본인 부담금 
			$("#docPay").html(docPay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$("#drugPay").html(drugPay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$("#treatPay").html(treatPay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$("#examPay").html(examPay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$("#diaPay").html(diaPay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$("#notePay").html(notePay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$("#costDed").html(cost.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$("#costDedPl").html(cost.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));

			// 본인 부담금 + 공단 부담금
			var totalPay = cost
			$("#totalPay").html(totalPay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));			
		}
		
		
		// 대기환자 목록 조회
    	fn_waitList();
		
		// 수납내역 조회
		fn_recList();
		
	});
	
	$("#print").on("click", function() {
		
		const html = document.querySelector('html');
		const printContents = document.querySelector('#printArea').innerHTML;
		const printDiv = document.createElement('DIV');
		printDiv.className ='print-div';
		 
		html.appendChild(printDiv);
		printDiv.innerHTML = printContents;
		document.body.style.display = 'none';
		window.print();
		document.body.style.display = 'block';
		printDiv.style.display = 'none';
	});
});
</script>