<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script src="/resources/js/html2canvas.min.js"></script>
<script src="/resources/js/jspdf.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/소견서.css">
<link rel="stylesheet" href="/resources/css/진단서.css">

<style>


th{
	color:white;
}
</style>
<div class="row" style="font-size:15px; font-weight:900; ">
	<div class="col-md-4">
		<!-- Basic Forms -->
			<div style="display:flex;justify-content:space-between;">
			</div>
		
		<div class="box" style="width:828px; height:351px;">
			<div class="box-header with-border">
				<h4 class="box-title text-info mb-0"><i class="ti-save me-15"></i>발주 내역</h4>
			</div>
			
			<!-- /.box-header -->
			<div class="box-body">
				<div class="scrollDiv " style="width:100%; min-height:260px; max-height:260px; overflow:auto;overflow-y:scroll;overflow-x:scroll;">
							<table id="mainTable" class="table editable-table table-bordered mb-0" style="cursor: pointer;">
								<thead>
									<tr>
										<th>No</th>
										<th>발주일</th>
										<th>담당자</th>
										<th>전화번호</th>
									</tr>
								</thead>
								<tbody id="adOrder">
								</tbody>
							</table>
						<input style="position: absolute; top: 166.297px; left: 490.061px; padding: 14px; text-align: start; font: 400 14px / 21px &quot;IBM Plex Sans&quot;, sans-serif; border: 1px solid rgba(255, 255, 255, 0.12); width: 353.562px; height: 50px; display: none;" class=""></div>
			
				<!-- /.row -->
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->
		<div class="box" style="margin-bottom:49px; width:828px; height:370px;">
				<div class="box-header with-border">
					<h4 class="box-title text-info mb-0"><i class="ti-user me-15"></i>간호사 주문요청 목록</h4>
				</div>
				
				<!-- /.box-header -->
				<div class="box-body">
					<div class="scrollDiv " style="width:100%; height:276px; overflow:auto;overflow-y:scroll;overflow-x:scroll;">
								<table id="nuMainTable" class="table editable-table table-bordered mb-0" style="cursor: pointer;text-align:center; width:782px;">
									<thead>
										<tr>
											<th>약품명</th>
											<th style="width:19%;">제조업체</th>
											<th style="width:14%;">주문수량</th>
											<th style="width:10%;">구분</th>
											<th>요청자</th>
											<th style="width:18%;">요청일</th>
										</tr>
									</thead>
									<tbody id="nurOrder">
										
									</tbody>
								</table>
							<input style="position: absolute; top: 166.297px; left: 490.061px; padding: 14px; text-align: start; font: 400 14px / 21px &quot;IBM Plex Sans&quot;, sans-serif; border: 1px solid rgba(255, 255, 255, 0.12); width: 353.562px; height: 50px; display: none;" class=""></div>
					<!-- /.row -->
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
	</div>
	
	     <!-- 발주 신청자 사번  -->
<!-- 	<input type="hidden"  class="form-control" name="idtAplAst"  id="idtAplAst" value="A10001"> -->
	<input type="hidden" id="idtAplAst" name="idtAplAst" value="<sec:authentication property='principal.empVO.empNo' />" />
    <!-- ///////////////// 발주서 시작 ////////////////////////// -->
<%--     <c:import url="/medical/orderForm"></c:import> --%>
		<jsp:include page="drugOrderForm.jsp"></jsp:include>
		
    <!-- ///////////////// 발주서 끝 ////////////////////////// -->
<!-- 	    <div class="scrollDiv"  style="margin-bottom:49px; max-height:940px; width: 940px; overflow:auto;overflow-y:scroll;overflow-x:scroll;"> -->
	<div style="margin-left:1228px; margin-top:-90px;">
		<button type="button" id="contentClear" class="waves-effect waves-light btn btn-danger mb-5" style="margin-left: 10px;">비우기</button>
		<button type="button" id="savePdfBtn" class="waves-effect waves-light btn btn-info mb-5" style="margin-left: 10px;">PDF다운</button>
		<button type="button"class="waves-effect waves-light btn btn-info mb-5" style="margin-left: 10px;" form="orderInsert" id="btnSubmit">발주신청 완료</button>
	</div>
</div>

<script type="text/javascript">
	let header = "${_csrf.headerName}";
	let token  = "${_csrf.token}";
	let formData1 = new FormData();
	let ddNo = 0;
	let count0 = 0;
	let count1 = 1;
	let count2 = 2;
	var drorVOList = null;
	var add=0;
	// 발주신청 내역 
	function adOrder(){
		$.ajax({
			url:"/medical/adOrder",
			type:"get",
			 beforeSend:function(xhr){
 		           xhr.setRequestHeader(header,token);
 			},
			success:function(result){
				console.log("adOrder :",result);
				$.each(result, function(index, item){
					let content = "";
					content += "<tr>";
					content += "<td>"+item.diCd+"</td>";
					content += 	"<td>"+fn_getInsertDate(item.diDt)+"</td>";
					content += 	"<td>"+item.empName+"</td>";
					content += 	"<td>"+item.empPh+"</td>";
					content += "</tr>";
					
					$("#adOrder").append(content);
				});
			}
		});
	}
	// 날짜 이벤트 
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
	
	// 간호사 주문요청 내역 
	function nurOrderList(){
		$.ajax({
			url:"/medical/nurOrderList",
			type:"get",
			 beforeSend:function(xhr){
 		           xhr.setRequestHeader(header,token);
 			},
			success:function(result){
				drorVOList = result;
				console.log("nurOrder:",result);
				$.each(result,function(index,item){
					console.log("item : ",item);
					var dsdName = "'"+item.dsdName+"'";
					let content = "";
					content += "<tr>";
					content += '<td><a class="disableLink" href="javascript:fn_go('+item.drorCd+','+item.drorSeq+')">'+item.dsdName+"</a></td>";
					content += 	"<td>"+item.dsdCom+"</td>";
					content += 	"<td>"+item.drorQty+"</td>";
					content += 	"<td>"+item.drorGubun+"</td>";
					content += 	"<td>"+item.empName+"</td>";
					content += 	"<td>"+fn_getInsertDate(item.drorOrdt)+"</td>";
					content += "</tr>";
					
					$("#nurOrder").append(content);
				});
			}
		})
		
	}
	
	
$(function(){
	
	var bb=1;
	//화면 외쪽 상단의 발주내역 클릭 시 formData에 데이터 넣어줌
	$(document).on("click","#adOrder tr",function(){
		
		$('#nuMainTable').bind('click', false);
		
		const table = document.getElementById('nurOrder');
		const totalRowCnt = table.rows.length;
		$("#nuMainTable >tbody tr").css("background-color","#000000");
		$("#nuMainTable >tbody tr").attr("disabled", "true");
		console.log("테이블 개수 :"+$("#mainTable >tbody tr").length);		
		cc++;
		$("#mainTable tr").css("background-color","#15243E");
		$(this).css("background-color","white");
// 		var treeTraversal = $(this).children().map(function(){			
// 				return $(this).text();
// 			}).get().join(", ");
		console.log("td(0) : " + $("tr td").eq(0).text());
		
		console.log("td(1) : " + $("tr td").eq(1).text());
		
		//$("tr td").eq(3).text()
		console.log("td(2) : " + $("tr td").eq(2).text());
		
		
		formData1.append("diCd",$("tr td").eq(0).text())
		sessionStorage.setItem("diCd",$("tr td").eq(0).text());
		formData1.append("diDt",$("tr td").eq(1).text())
		formData1.append("idtAplAst",$("#idtAplAst").val());
		
		let diCd = $(this).children().eq(0).text();
		console.log("dicd"+diCd);
		let result= {"diCd" :diCd}
		
		for(let i=0; i<=7; i++){
			$("#num" + i).val("");
			$("#dlDt").val("");
			$("#dlName").val("");
			$("#dsdname" + i).val("");
			$("#drorQty" + i).val("");
			$("#dsdCom" + i).val("");
			
			
			
		}
		
		$.ajax({
			url:"/medical/checkOrder",
			contentType: "application/json;chartset=UTF-8",
			data: JSON.stringify(result),
			dataType:"json",
			type:"post",
			 beforeSend:function(xhr){
 		           xhr.setRequestHeader(header,token);
 			},
			success:function(result){
				console.log("checkOrder : ",result);
				for(let i=0; i<=6; i++){
					$("#num" + i).val("");
					$("#dsdname" + i).val("");
					$("#drorQty" + i).val("");
					$("#dsdCom" + i).val("");
				}
				$.each(result, function(index, item){
					let dsdName = item.dsdName;
					if(item.diCd==diCd){
						$("#num" + (index+1)).val((index+1));
						$("#dsdname" + (index+1)).val(item.dsdName);
						$("#dlName").val(item.empName);
						$("#dlDt").val(fn_getInsertDate(item.diDt));
						$("#drorQty" + (index+1)).val(item.ddQty);
						$("#dsdCom" + (index+1)).val(item.dsdCom);
						
					}
			
				});
				
			}
		});

		
	});
	
	$(document).on("click","#nurOrder tr",function(){
		 	count0++;
			count1++;
			count2++;
			$("tr").css("background-color","#15243E");
			$(this).css("background-color","white");
		console.log("td("+count0+") : " + $("#nurOrder tr td").eq(count0).text());
		console.log("td("+count1+") : " + $("#nurOrder tr td").eq(count1).text());
		console.log("td("+count2+") : " + $("#nurOrder tr td").eq(count2).text());
		
		
		
	});
	
	adOrder();
	nurOrderList();
	
// 	$("#orderInsert").on("click", function(){
// 			alert("나온다");
			
// 				let data = {};
// 			 $.ajax({
// 				 url:"/medical/orderInsert",
// 				 data:JSON.stringify(data),
// 				 contentType :'application/json;charset=UTF-8',
// 				 dataType:"json",
// 				 type:"post",
// 				 success:function(result){
// 						console.log(result);				 
// 					 	alert("AJAX, 발주 등록  성공 ");
						
// 				}
// 			 });
// 	});
	
	// Pdf 
	$('#savePdfBtn').on("click",function() {
		html2canvas($('#pdfDiv')[0]).then(function(canvas) { //저장 영역 div id
			
	           // 캔버스를 이미지로 변환
	           var imgData = canvas.toDataURL('image/png');
	                
	           var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
	           var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
	           var imgHeight = canvas.height * imgWidth / canvas.width;
	           var heightLeft = imgHeight;
	           var margin = 10; // 출력 페이지 여백설정
	           var doc = new jsPDF('p', 'mm');
	           var position = 0;
	              
	           // 첫 페이지 출력
	           doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
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
//  	        doc.save('발주서.pdf');    
	    });
	});
	//내용 지우기 
	$("#contentClear").on("click",function(){
		$("tr").css("background-color","#15243E");
		$("#nuMainTable").unbind("");
		for(let i=0; i<=7; i++){
			$("#num" + i).val("");
			$("#dlDt").val("");
// 			$("#dlName").val("");
			$("#dsdname" + i).val("");
			$("#drorQty" + i).val("");
			$("#dsdCom" + i).val("");
		}
		cc=0;
	});
	
	$("#btnSubmit").click(function(){
		console.log("왔다");
		
		//1:N형식으로 데이터를 완성
		for (let key of formData1.keys()) {
			console.log(key, ":", formData1.get(key));
		}
		 Swal.fire({
	            title: '발주 신청 하시겠습니까?',
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
	            		url:"/medical/orderInsert",
	        			processData:false,
	        			contentType:false,
	        			data:formData1,
	        			type:"post",
		       			 beforeSend:function(xhr){
		       		           xhr.setRequestHeader(header,token);
		       			},
	       		      success:function(result){
	       		    	console.log("result : ", result);
	    				let action = result["result"]
	    				console.log(action);
		       		    	Swal.fire({
						        icon: 'success',
						        title: '발주 완료',
						        showConfirmButton: false,
						        background: '#15243e',
						        timer: 5500,
						    }).then((value) => {
						        if(value){
						        	
						        }
						    });
							 if(action=="완료"){
									 location.href = "/medical/drug";
								}else{
									alert("실패");
								}
	       		      }
	       		});	
					
	            }
	        });
	});
});

	
//주문요청 목록 클릭 시 실행
var cc=0;
function fn_go(p_drorCd, p_drorSeq){
		let drorCd = p_drorCd;
		let seq = p_drorSeq;
		cc++;
				
		console.log("drorCd : " , drorCd);
		console.log("seq : " , seq);
		console.log("cc :"+cc);
		console.log("ddkdkd"+drorVOList);
		
		
		
		$.each(drorVOList, function(index, item){
			let dsdName = item.dsdName;
			if(item.drorCd==drorCd && item.drorSeq == seq){
				$("#num" + cc).val(cc);
				formData1.append("drugDetailVOList["+ddNo+"].diCd",sessionStorage.getItem("diCd"));	//DI_CD
				formData1.append("drugDetailVOList["+ddNo+"].ddNo",(ddNo+1)); 
				$("#num" + cc).removeAttr("name").attr({ name : "drCd" });
				$("#dsdname" + cc).val(item.dsdName);
				$("#drorQty" + cc).val(item.drorQty);
				formData1.append("drugDetailVOList["+ddNo+"].ddQty",item.drorQty); 
				formData1.append("drugDetailVOList["+ddNo+"].drCd",item.drCd); 
				$("#drorQty" + cc).removeAttr("name").attr({ name : "ddQty" }) ;
				$("#dsdCom" + cc).val(item.dsdCom);
				
				ddNo = ddNo + 1;
			}
	
		});
		
		
	}

</script>