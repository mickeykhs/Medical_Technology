<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<!-- 문자형식 -->
<style>
.scrollDiv::-webkit-scrollbar{
   display: none;
}


</style>
<div style="display:flex; ">
<div class="box" style="width: 63%;margin-right: 1%;height: 444px;">
<div class="box-header with-border" style="display: flex;justify-content: space-between;">
  <h4 class="box-title" style="color:#3596f7;"><i class="mdi mdi-comment-processing-outline"></i>문자형식</h4>
  		<button type="button" id="addMent" class="waves-effect waves-light btn btn-primary mb-5" data-bs-toggle="modal" data-bs-target="#modal-addM">
  			<i class="fa fa-plus" aria-hidden="true"></i>추가
  		</button>
</div>
<!-- /.box-header -->
<div class="box-body scrollDiv" style="overflow:auto;overflow-y: scroll;max-height: 309px;">
		<div class="table-responsive" >
			  <table class="table table-hover mb-0">
						  <thead>
							<tr>
							  <th scope="col">No</th>
							  <th scope="col">제목</th>
							  <th scope="col" style="width: 48%;">내용</th>
							  <th scope="col" style="width: 23%;"></th>
							</tr>
						  </thead>
						  <tbody id="resbody">
						  <c:forEach var="resVO" items="${resVOList}" varStatus="stat">
								<tr>
								  <td style="display: none;">${resVO.reNo}</td>
								  <td>${stat.count}</td>
								  <td>
								      <input class="form-control"  type="text"  maxlength='30' value="${resVO.reTitle}" disabled>
								  </td>
								  <td style="width: 30%;">
								      <input class="form-control"  id="content${stat.count}" name="content" type="text"  maxlength='80'  value="${resVO.reCont}" readonly="readonly">
								  </td>
								  <td style="text-align: center;"> 
								  	  <button type="button" class="waves-effect waves-light btn mb-5 bg-gradient-success edit" style="width: 67px;height:41px; margin-right:5px;">수정</button>
									  <button type="button" class="waves-effect waves-light btn btn-danger mb-5 delete" style="width: 67px;height: 41px;">삭제</button>
									  <!-- <button type="button" class="waves-effect waves-light btn btn-info-light mb-5 edit" style="width: 34%; margin-right:5px;">수정</button> -->
		    						  <!-- <button type="button" class="waves-effect waves-light btn btn-danger-light mb-5 delete" style="width: 34%;">삭제</button> -->
		    						  <button type="button" class="waves-effect waves-light btn btn-info mb-5 sav" style="width: 34%; margin-right:5px; display: none;">저장</button>
		    						  <button type="button" class="waves-effect waves-light btn btn-danger mb-5 can" style="width: 34%; display: none;">취소</button>
		    						 <!--  <button type="button" class="waves-effect waves-light btn btn-info-light mb-5 sav" style="width: 34%; margin-right:5px; display: none;">저장</button> -->
									  <!-- <button type="button" class="waves-effect waves-light btn btn-danger-light mb-5 can" style="width: 34%; display: none;">취소</button> -->
	    						  </td>
								</tr>
							</c:forEach>
						  </tbody>
						</table>
		</div>
	</div>
<!-- 	<div style="display:flex; justify-content:flex-end;width:96%;">
	    <button type="button" id="addMent" class="waves-effect waves-light btn btn-info-light mb-5" data-bs-toggle="modal" data-bs-target="#modal-addM" style="width: 15%;">추가</button>
	</div> -->
<!-- /.box-body -->
</div>


<!-- 문자 내용 -->
<div class="box" style="width: 32%;height: 444px;">
<div class="box-header with-border" style="display: flex;justify-content: space-between;">
  <h4 class="box-title" style="color:#3596f7;"><i class="mdi mdi-comment-processing-outline"></i>문자 작성</h4>
  
  <button type="button" id="paSearch" class="waves-effect waves-light btn btn-primary mb-5" data-bs-toggle="modal" data-bs-target="#modal-pa">
  	<i class="fa fa-search" aria-hidden="true"></i>&nbsp;&nbsp;환자검색
  </button>

</div>
<!-- /.box-header -->
<div class="box-body scrollDiv" style="overflow:auto;overflow-y: scroll;max-height: 380px;">
		<div class="table-responsive" style="overflow:hidden;">
				<div class="form-group row">
				  <label for="example-text-input" class="col-sm-3 col-form-label">수신인</label>
				  <div class="col-sm-9">			  	
				  	<input type="text"  id="pName" class="form-control" placeholder="수신인" readonly>
				   </div>
				</div>
				<div class="form-group row">
				  <label for="example-text-input" class="col-sm-3 col-form-label">환자번호</label>
				  <div class="col-sm-9">	
				  	<input type="text"  id="paNo" name="paNo" class="form-control" placeholder="환자번호" readonly>
				  </div>
				</div>
				<div class="form-group row">
				  <label for="example-text-input" class="col-sm-3 col-form-label">연락처</label>
				  <div class="col-sm-9">	
				  	<input type="text" id="paPh" class="form-control" placeholder="연락처">
				  </div>
				</div>
				
				<div class="form-group">
				  <label class="form-label">내용</label> 
				  <textarea class="form-control" id="smsCont" name="smsCont" rows="2" placeholder="내용을 입력해주세요"></textarea>
				  <div id="send_cnt">(0 / 80)</div> 
				</div>
		</div>
		<hr>
	</div>
	<div style="display:flex; justify-content:flex-end;width:96%;">
		<button type="button" id="sendSms" class="waves-effect waves-light btn btn-info mb-5" style="width: 15%; margin-right:5px;">전송</button>
	</div>
<!-- /.box-body -->
</div>
  </div>
<!-- 발송 내역 -->
<div class="box" style="width: 96%;min-height: 275px;">
	<div class="box-header with-border">
	  <h4 class="box-title" style="color:#3596f7;"><i class="fa fa-fw fa-plus-square"></i>발송내역</h4>
	  <input class="form-control" id="picker"  type="date" name="date" style="width: 10%; float: right;background-color: #3596f7;color: white;;"> 
	</div>
	<!-- /.box-header -->
	<div class="box-body scrollDiv" style="overflow:auto;overflow-y: scroll;max-height: 173px;min-height: 173px;">
		<div class="table-responsive">
		  <table class="table table-bordered mb-0">
			  <thead>
				<tr>
				  <th scope="col">No</th>
				  <th scope="col">발송일</th>
				  <th scope="col">수신인</th>
				  <th scope="col">연락처</th>
				  <th scope="col">내용</th>
			  </thead>
			  <tbody id="pastMsg">
			   <c:forEach var="smsVO" items="${smsVOList}">
				<tr>
				  <td>${smsVO.smsCd}</td>
				  <td>${smsVO.smsSdDate}</td>
				  <td>${smsVO.paName}</td>
				  <td>${smsVO.paPh}</td>
				  <td>${smsVO.smsCont}</td>
				</tr>
				</c:forEach>
			  </tbody>
			</table>
		</div>
	</div>
	<!-- /.box-body -->
  </div>


<!-- 환자 검색 -->
<div class="modal center-modal fade" id="modal-pa" tabindex="-1" style="display: none;" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content">
	  <div class="modal-header">
		<input type="search" id="PaName" name="PaName" class="form-control form-control-sm" placeholder="이름을 입력해주세요" 
			style="width: 30%;margin-right: 50px;height:40px;" />
			<button type="button" id="btnSearch" class="waves-effect waves-light btn btn-primary mb-5" style="right:180px;top:2px;">
				<i class="fa fa-search" aria-hidden="true"></i>&nbsp;&nbsp;검색</button>
	<!-- 	<button type="button" id="btnSearch" class="waves-effect waves-light btn mb-5 bg-gradient-primary" style="right:180px;top:2px;">
			<i class="fa fa-search" aria-hidden="true"></i>&nbsp;&nbsp;검색</button> -->
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
<!-- 예약문구 등록하기 -->
<!-- ========================================================================== -->
<div class="modal center-modal fade" id="modal-addM" tabindex="-1" style="display: none;" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content">
	  <div class="modal-header">
		<h5 class="box-title text-info mb-0 mt-20"><i class="ti-save me-15"></i>예약문구 등록</h5>
<!-- 		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
	  </div>
	  <div class="modal-body" style="max-height:400px;overflow:auto;">
	  	<div class="form-group">
		  <label class="form-label">제목</label>
		  <input type="text" id="reTitle" name="reTitle"  maxlength='30' class="form-control" placeholder="제목">
		</div>
		<div class="form-group">
		  <label class="form-label">문구</label>
		  <textarea rows="5" id="reCont" name="reCont" class="form-control" placeholder="문구를 입력해주세요"></textarea>
		  <div id="test_cnt">(0 / 80)</div>
		</div>
	  </div>
	  <div class="modal-footer modal-footer-uniform" style="display: flex;justify-content: space-between;">
		<button type="button" id="saveM" class="btn btn-info">저장</button>
		<button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
	  </div>
	</div>
  </div>
</div>
<!-- 예약문구 등록하기 끝 -->
  
<script type="text/javascript">
let header = "${_csrf.headerName}";
let token  = "${_csrf.token}";


//예약문구 클릭시 내용 들어가게 해줌
function clickMent(){
 $("#resbody tr td input").on("click",function(){
		console.log('baba');
		
		var ip = $(this); 
		var ipp = ip.val();
		console.log('ipp :' + ipp);

		$('#smsCont').val(ipp);
		
});
}
 
//환자 검색시 행 클릭하면 input으로 들어가게 해주는 함수
function trClick(){
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
		var pph = td.eq(2).text();
		
		var ph = pph.replace(/\-/g,'');
		
		$("#paPh").val(ph);		
		$("#paNo").val(pnum);
		$("#pName").val(pnam);
		
		$("#modal-pa").modal('hide');

	});
}


//삭제버튼 클릭시 삭제
function erase(){
$(".delete").on("click",function(){
	var str = ""
	var tdArr = new Array();	// 배열 선언
	var checkBtn = $(this);
	var tr = checkBtn.parent().parent();
	var td = tr.children();
	console.log("체크 데이터!!!!!! : "+tr.text());
	var no = td.eq(0).text();
	
	let data = {"reNo":no};
	$.ajax({
		url:'/sms/deleteMent',
		contentType:'application/json;charset=utf-8',
		data:JSON.stringify(data),
		dataType:'json',
		type:'post',
		beforeSend:function(xhr){
	           xhr.setRequestHeader(header,token);
		},
		success:function(result){
			location.reload();
		}
	});
	
});
}

function modify(){
	//수정버튼 클릭시 취소/저장
	$(".edit").on('click',function(){
			
		var checkBtn = $(this);
		console.log(checkBtn);
		var num = checkBtn.parent().prev().prev().prev().prev().html(); //저장된 문구 pk 가져오기
		console.log("번호 찍기" + num);
		var cont1 = checkBtn.parent().prev().children(); // 내용
		var cont2 = checkBtn.parent().prev().prev().children(); // 제목
		checkBtn.hide(); //수정버튼 가리기
		checkBtn.siblings('.delete').hide(); //삭제 버튼 가리기
		checkBtn.siblings('.can').show(); //취소 버튼 보이게
		checkBtn.siblings('.sav').show(); //저장 버튼 보이게
		//console.log(cont1);
		//console.log(cont2);
		cont1.attr('readonly',false); //내용 수정가능
		cont2.attr('disabled',false); //제목 수정가능
		
		
		//console.log("체크==" + title);
		
		//취소 버튼 클릭하면 다시 원점
		$(".can").on('click',function(){
			cont1.attr('readonly',true); //내용 수정불가
			cont2.attr('disabled',true); //제목 수정불가
			checkBtn.show(); //수정버튼 가리기
			checkBtn.siblings('.delete').show(); //삭제 버튼 가리기
			checkBtn.siblings('.can').hide(); //취소 버튼 보이게
			checkBtn.siblings('.sav').hide(); //저장 버튼 보이게
		});
		
		   //저장 버튼 클릭시 수정 해주기
			$(".sav").on("click",function(){
			var title = cont2.val(); // 제목
			var te  = cont1.val();  //내용
			let data ={"reNo":num,"reTitle":title,"reCont":te};
			$.ajax({
				url:'/sms/updateMent',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify(data),
				dataType:'text',
				type:'post',
				beforeSend:function(xhr){
			           xhr.setRequestHeader(header,token);
				},
				success:function(result){
					checkBtn.show(); //수정버튼 가리기
					checkBtn.siblings('.delete').show(); //삭제 버튼 가리기
					checkBtn.siblings('.can').hide(); //취소 버튼 보이게
					checkBtn.siblings('.sav').hide(); //저장 버튼 보이게
					cont1.attr('readonly',true); //내용 수정불가
					cont2.attr('disabled',true); //제목 수정불가
				}
			})
		});
	});
}

//모달 닫으면 내용 없애주기
function XClose(){
	$(".btn-close").on("click",function(){
		 $("#reTitle").val(" ");
		 $("#reCont").val(" ");
	});
}






//문자 문구 등록하기
$("#saveM").on("click",function(){
	$("#resbody").empty(); //예약문구 내용 지우고
	let reTitle = $("#reTitle").val();
	let reCont = $("#reCont").val();
	
	let data={"reTitle":reTitle,"reCont":reCont};
	console.log("data : " + JSON.stringify(data));
	
	
	let da ={"reTitle" : reTitle};
	let num=0;
	$.ajax({
		url:"/sms/saveMent",
		data: JSON.stringify(data),
		contentType:'application/json;charset=utf-8',
		dataType:'text',
		type:'post',
		beforeSend:function(xhr){
	           xhr.setRequestHeader(header,token);
		},
		success:function(rst){
			//추가시 문구 목록 다시 불러오기
			console.log("kgb222:",$("#modal-addM"));
			console.log("fbi:",rst);
			if(rst == "OK"){
				$("#modal-addM").modal('hide'); //모달 닫기
			$.ajax({
				url:"/sms/getMent",
				data: JSON.stringify(da),
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				type:'post',
				beforeSend:function(xhr){
			           xhr.setRequestHeader(header,token);
				},
				success:function(result){
				console.log("result : " + JSON.stringify(result));
				$.each(result,function(index,item){
					num++;
					let cont="";
					cont +="<tr><td style='display:none;'>"+item.reNo+"</td>";
					cont += "<td>"+num+"</td>";
					cont += "<td><input class='form-control' type='text'  value='" + item.reTitle + "'disabled></td>";
					cont += "<td style='width: 30%;'><input class='form-control' id='content"+num+"' name='content' type='text'  value='"+item.reCont+"' readonly></td>";
						/* 버튼 수정시 여기도 수정해야함  */					
					cont += "<td style='text-align: right;'><button type='button'  class='waves-effect waves-light btn mb-5 bg-gradient-success edit' style='width: 34%; margin-right:5px;'>수정</button>";
					cont += "<button type='button' class='waves-effect waves-light btn btn-danger mb-5 delete' style='width: 34%;'>삭제</button>";
					cont += "<button type='button' class='waves-effect waves-light btn btn-info mb-5 sav' style='width: 34%; margin-right:5px; display: none;'>저장</button>";
					cont += "<button type='button' class='waves-effect waves-light btn btn-danger mb-5 can' style='width: 34%; display: none;'>취소</button></td></tr>";
					$('#resbody').append(cont);
					});
						erase(); //삭제 가능하게 해주기
						clickMent();
						modify();
						$("#reTitle").val(" ");
						$("#reCont").val(" ");
						$("#modal-addM").modal('hide'); //모달 닫기
						Swal.fire({ //알트
					        icon: 'success',
					        title: '문구가 저장되었습니다.',
					        showConfirmButton: false,
					        background: '#15243e',
					        timer: 5500,
					    }).then((value) => {
					        if(value){
					            console.log('gg');
					        }
					    });				
					}
				});
			}
		}
	}); 
});


$(function(){
	
	 erase(); //삭제버튼 살려줌	
	 clickMent(); //내용클릭시 문자로 들어감
	 modify(); //수정 취소 저장 가능
	 XClose();

	 
	//날짜 선택 조회
  	$("#picker").change(function(){
  		let dt = $("#picker").val(); //yyyy-mm-dd 로 나옴 
  		
  		//년,월,일 잘라서 날짜 형식 YY/MM/DD로 바꿔줌
  		let yy = dt.substring(2,4); 
  		let mm = dt.substring(5,7);
  		let dd = dt.substring(8,10);
  		let date = yy + "/" + mm + "/" + dd;
		
  		
  		console.log(date);
  		
  		let data = {"smsSdDate":date}
  		console.log("선택날짜 : " + JSON.stringify(data));
  		let num=0;
  		$.ajax({
  			url:'/sms/searchDate',
			contentType:'application/json;charset=utf-8',
			data:JSON.stringify(data),
			dataType:'json',
			type:'post',
			beforeSend:function(xhr){
		           xhr.setRequestHeader(header,token);
			},
			success:function(result){
				console.log('result : ' + JSON.stringify(result));
				$("#pastMsg").empty(); //예약문구 내용 지우고
				$.each(result,function(index,item){
					let cont="";
					num++;
					cont += "<tr><td>"+num+"</td>";
					cont += "<td>"+item.smsSdDate+"</td>";
					cont += "<td>"+item.paName+"</td>";
					cont += "<td>"+item.paPh+"</td>";
					cont += "<td>"+item.smsCont+"</td></tr>";
					$('#pastMsg').append(cont);
				});
			}
  		});
  		
  	});
		

	 //예약문구 글자수 세기
	 $('#reCont').on('keyup', function() {
        $('#test_cnt').html("("+$(this).val().length+" / 80)");
        if($(this).val().length > 80) {
            $(this).val($(this).val().substring(0, 80));
            $('#test_cnt').html("(80 / 80)");
        }
	 });
	 
	 //smsCont send_cnt
	 
	 //문자 보낼때 글자수 세기
	 $('#smsCont').on('keyup', function() {
        $('#send_cnt').html("("+$(this).val().length+" / 80)");
        if($(this).val().length > 80) {
            $(this).val($(this).val().substring(0, 80));
            $('#send_cnt').html("(80 / 80)");
        }
	 });
	 
	 
	 
	// 환자검색버튼
	$('#btnSearch').on('click', function(){
		
		$('#paCont').empty();
		let str = $('#PaName').val();
		//console.log("이름 :  " + str);
		
		let data = {"paName":str};
		//console.log('data : ' + JSON.stringify(data));
		
		$.ajax({
			url:'/sms/searchPa',
			contentType:'application/json;charset=utf-8',
			data:JSON.stringify(data),
			dataType:'json',
			type:'post',
			beforeSend:function(xhr){
		           xhr.setRequestHeader(header,token);
			},
			success:function(result){
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
				trClick();
			}
				
		})
	});
	
	
	//문자전송	
	$("#sendSms").on("click",function(){
		$("#pastMsg").empty(); //예약문구 내용 지우고
		let paPh = $("#paPh").val();
		let smsCont = $("#smsCont").val();
		let paNo = $("#paNo").val();
		
		
		let data = {"smsCont":smsCont,"paNo":paNo,"paPh":paPh};
		let da = {"paNo":paNo};
		
		console.log("data : " + JSON.stringify(data));
/* 		$("#paPh").val(" ");		
		$("#smsCont").val(" ");
		$("#paNo").val(" ");
		$("#pName").val(" "); */
		
	
		$.ajax({
			url:"/sms/sendSMS",
			data: JSON.stringify(data),
			contentType:'application/json;charset=utf-8',
			dataType:'text',
			type:'post',
			beforeSend:function(xhr){
		           xhr.setRequestHeader(header,token);
			},
			success:function(rst){
				console.log("rst : " + JSON.stringify(rst));
				$.ajax({ //문자전송시 전송내역 ajax로 다시 불러오기
					url:"/sms/pastSms",
					data: JSON.stringify(da),
					contentType:'application/json;charset=utf-8',
					dataType:'json',
					type:'post',
					beforeSend:function(xhr){
				           xhr.setRequestHeader(header,token);
					},
					success:function(result){
						$("#paPh").val(" ");		
						$("#smsCont").val(" ");
						$("#paNo").val(" ");
						$("#pName").val(" ");
						$.each(result,function(index,item){
							let cont="";
							cont += "<tr><td>"+item.smsCd+"</td>";
							cont += "<td>"+item.smsSdDate+"</td>";
							cont += "<td>"+item.paName+"</td>";
							cont += "<td>"+item.paPh+"</td>";
							cont += "<td>"+item.smsCont+"</td></tr>";
							$('#pastMsg').append(cont);
						});
						
						Swal.fire({
					        icon: 'success',
					        title: '문자 전송이 완료되었습니다',
					        showConfirmButton: false,
					        background: '#15243e',
					        timer: 5500,
					    }).then((value) => {
					        if(value){
					            console.log('gg');
					        }
					    });
					}
				});
			}
		});
	});
		
});
</script>