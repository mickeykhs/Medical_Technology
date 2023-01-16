<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<style>
.scrollDiv::-webkit-scrollbar{
   display: none;
}
.wait{
	margin-right:85px;
	max-height: 442px;
	overflow:auto;
	overflow-y:scroll;
	display: flex;
	justify-content: flex-start;
	width: 1140px;
	margin-bottom:59px;
	margin-top: 18px;
}
</style>
<!-- 약품재고 리스트 시작 -->
<div class="col-12 col-lg-6" style="width: 51%; float: right;">
  <div class="box" style="min-height: 753px;max-height: 753px;">
	<div class="box-header with-border"  style="display:flex;">
	    <h4 class="box-title" style="color:#3596f7;margin-right:50px;"><i class="fa fa-fw fa-medkit"></i> 약품 재고 목록</h4>
	    <input type="search" id="drsdName" class="form-control form-control-md" aria-controls="example1" style="width: 28%;height:71%;margin-right:20px;">
	    <button type="button" id="btnDrsdSearch" class="waves-effect waves-light btn btn-rounded btn-info mb-5" style="margin-right: 75px;">
	  	  <i class="fa fa-search" aria-hidden="true"></i>
	    </button>
		<ul class="nav nav-tabs" role="tablist" style="width: 24%; border-bottom:none;">
		    <li class="nav-item" style="width: 50%;"> 
		        <a class="nav-link active" id="inject" data-bs-toggle="tab" href="#profile8" role="tab" aria-selected="true">
		            <span><i class="fa fa-fw fa-plus-square"></i>주사</span>
		        </a> 
		    </li>
		    <li class="nav-item" style="width: 50%;"> 
		        <a class="nav-link" id="peels" data-bs-toggle="tab" href="#messages8" role="tab">
		            <span><i class="mdi mdi-hospital"></i>내복</span>
		        </a> 
		    </li>
		 </ul>
	</div>
	<!-- /.box-header -->
	<div class="box-body scrollDiv " style="overflow: auto;overflow-y: scroll;">
		<div class="table-responsive ">
		  <table class="table table-bordered mb-0">
			  <thead>
				<tr id="drSnonono">
				  <th scope="col">No</th>
				  <th scope="col">약품코드</th>
				  <th scope="col">약품명</th>
				  <th scope="col" style="width:11%;">제조사</th>
				  <th scope="col" style="width:9%;">재고</th>
				  <th scope="col" style="width:9%;">최소재고</th>
				  <th scope="col" style="width:9%;">구분</th>
				</tr>
			  </thead>
			  <tbody id="drS">
			  <c:forEach var="drsdVO" items="${drsdVOList}" varStatus="stat">
				<tr class="list">
				  <th scope="row">${stat.count}</th>
				  <td>${drsdVO.drCd}</td>
				  <td>${drsdVO.dsdName}</td>
				  <td>${drsdVO.dsdCom}</td>
				  <td id="dsQty${stat.count}">${drsdVO.dsdQty}</td>
				  <td id="msQty${stat.count}">${drsdVO.dsdMsQty}</td>
				  <td>${drsdVO.dsdGubun}</td>
				</tr>
			  </c:forEach>
				<!-- 검색결과가 없으면 -->
				<tbody style="display: none;" id="nono">
					<tr>
						<td colspan="7" style="text-align: center;"><b>검색결과가 없습니다.</b></td>
					</tr>
				</tbody>
				
			</tbody>
			</table>


		</div>
	</div>
	<!-- /.box-body -->
  </div>
  <!-- /.box -->
</div>
<!-- 약품재고 리스트 끝 -->

<!-- 약품 주문 폼 -->
<div class="box" style="width: 48%;">
<div class="box-header with-border" style="height:89.38px;">
  <h4 class="box-title" style="color:#3596f7;"><i class="fa fa-fw fa-plus-square"></i> 약품 주문 요청</h4>
</div>
<!-- /.box-header -->
<div class="box-body scrollDiv" style="overflow:auto;overflow-y: scroll;max-height: 230px;min-height: 230px;">
		<div class="table-responsive">
			<form id="drOrder" name="drOrder">
			  <table class="table table-bordered mb-0" >
				  <thead>
					<tr>
					  <th scope="col" style="width: 9%;">No</th>
					  <th scope="col">약품코드</th>
					  <th scope="col" style="width: 32%;">약품명</th>
					  <th scope="col">제조업체</th>
					  <th scope="col">주문수량</th>
					  <th scope="col">구분</th>
					</tr>
				  </thead>
				  <tbody id="drO">
				  </tbody>
				</table>
			</form>
		</div>
	</div>
	<div  class="box-footer" style="display:flex; justify-content:flex-end;width:96%;height: 61px;">
	    <button type="button" id="order" class="waves-effect waves-light btn btn-info mb-5" style="width:84px;margin-right:5px;height: 37px;margin-top: -10px;">요청</button>
		<button type="button" id="calcel" class="waves-effect waves-light btn btn-danger mb-5" style="width:84px;margin-right:-35px;height: 37px;margin-top: -10px;">취소</button>
	</div>
<!-- /.box-body -->
</div>
<!-- 약품 주문폼  끝 -->

<!-- -------------약품 주문 내역 시작------------- -->
  <div class="box" style="width: 48%;min-height:351px;max-height:351px;overflow:hidden;">
	<div class="box-header with-border">
	  <h4 class="box-title" style="color:#3596f7;"><i class="fa fa-fw fa-plus-square"></i> 주문 요청 내역</h4>
	 <!--  <input class="form-control"  id="searchDate" type="date" name="date" style="width: 30%; float: right;"> -->
	</div>
	<!-- /.box-header -->
	<div class="box-body scrollDiv" style="overflow:auto;overflow-y: scroll;max-height: 328px;min-height: 328px;">
		<div class="table-responsive">
		  <table class="table table-bordered mb-0">
			  <thead>
				<tr>
				  <th scope="col">No</th>
				  <th scope="col">약품코드</th>
				  <th scope="col">약품명</th>
				  <th scope="col">업체명</th>
				  <th scope="col" style="width:9%;">수량</th>
				  <th scope="col" style="width:9%;">구분</th>
				  <th scope="col">요청자</th>
<!-- 				  <th scope="col"><i class="fa fa-fw fa-chevron-down"></i></th> -->
				</tr>
			  </thead>
			  <tbody id="drorList">
			  <c:forEach var="drorVO" items="${drorVOList}">
				<tr>
				  <th>${drorVO.drorCd}</th>
				  <td>${drorVO.drCd}</td>
				  <td>${drorVO.dsdName}</td>
				  <td>${drorVO.dsdCom}</td>
				  <td>${drorVO.drorQty}</td>
				  <td>${drorVO.drorGubun}</td>
				  <td>${drorVO.empName}</td>
				</tr>
				</c:forEach>
			  </tbody>
			</table>
		</div>
	</div>
	<!-- /.box-body -->
  </div>
  <!-- /.box -->
<!--   <button id="testt">test</button> -->
<!-- -------------약품 주문내역 끝------------- -->
<script type="text/javascript">
let header = "${_csrf.headerName}";
let token  = "${_csrf.token}";

var num = 0;
var first=null;
var two=null;
//
 
function trClick(){
	$("#drS tr").on("click",function(){
		
		var tdArr = new Array();
		
		var tr = $(this);
		$(tr).off('click'); //두번 클릭 방지
		var td = tr.children();
		
		
		//console.log("체크 : " + JSON.stringify(tr));
		//console.log("체크 : " + JSON.stringify(td));
		console.log("클릭한 Row의 모든 데이터 : "+tr.text());
		
		
		td.each(function(i){
			tdArr.push(td.eq(i).text());
		});
		
		
		first = td.eq(1).text();
		console.log('first : ' + first);
		
		let cd = $(".cd");
		//console.log(cd.length);
		//console.log('tr: ' + tr.eq(0).children().eq(1).text());
		
		console.log("배열에 담긴 값 : "+tdArr);
		var code = td.eq(1).text();
		var name = td.eq(2).text();
		var company = td.eq(3).text();
		//var price = td.eq(5).text();
		var carte = td.eq(6).text();

		for(let i=0;i<=cd.length;i++){
			if(cd.eq(i).val() == code){
				return;
			}
		}
		
		let idtReqNur = "<sec:authentication property="principal.empVO.empNo"/>";
		console.log(idtReqNur);
		
		num ++;
		var str = ""; //담아주기위한 빈배열 선언
		str +="<tr><td><input type='text' class='form-control' name='drorSeq' value='"+ num + "'readonly /></td>" ;
		str +="<td><input type='text' class='form-control cd drC" + num + "' id='drCd' name='drCd' value='"+ code + "'readonly /></td>";
		str +="<td><input type='text' class='form-control' value='"+ name +"'readonly/></td>" ;
		str +="<td><input type='text' class='form-control' value='"+ company + "'readonly /></td>" ;
		str +="<td><input type='text' class='form-control dsdQty33' id='dsdQty"+ num + "' name='drorQty' /></td>" ;
/* 		str +="<td><input type='text' class='form-control' name='drorPrice' value='"+ price +"'readonly/></td>" ; */
		str +="<td><input type='text' class='form-control' name='drorGubun' value='"+carte + "'readonly/></td>" ;
		str +="<td style='display:none;'><input type='text' name='idtReqNur' value='"+ idtReqNur +"' /></td></tr>";
		
		$("#drO").append(str);
		
	});
}

function redd(){
	
	var len = $(".list").length; //재고수량 리스트 길이
	//console.log("길이"  + len);
	//console.log($('#dsQty1').text());
	for(let i=1;i<=len;i++){
		if($('#dsQty'+ i).text() < $('#msQty'+ i ).text()){
			//console.log($('#dsQty'+ i).text());
			$('#dsQty'+ i).css("color","red");
		}
	}
}




$(function(){

	

	
	
	 
	redd();
	trClick(); //클릭이벤트 호출
	$('#testt').on('click',function(){
		var arr2 = [];	
		
		var trlen = $('#drO tr').length;
		for(var i=1; i<=trlen; i++){
			var vo2 = {
					"dsdQty":$('#dsdQty' + i).val(),
					"drCd":$('.drC' + i).val()
			}
			arr2.push(vo2);
		}
		console.log(arr2);
	});

	
	//주사카테고리
	$('#inject').on('click',function(){
		$("#drS").empty();
		let str = "주사";
		let data = {"drCarte":str};
		let count = 0;
		$.ajax({
			url:'/nurse/drCarte',
			contentType:'application/json;charset=utf-8',
			data:JSON.stringify(data),
			dataType:'json',
			type:'post',
			beforeSend:function(xhr){
		           xhr.setRequestHeader(header,token);
			},
			success:function(result){
				console.log('result : ' + JSON.stringify(result));
				
				$.each(result,function(index,item){
					if(item.dsdGubun == "주사"){
						count++;
						let cont="";
						cont += '<tr><th scope="row">' + count + '</th>';
						cont += '<td>' + item.drCd + '</td>';
						cont += '<td>' + item.dsdName + '</td>';
						cont += '<td>' + item.dsdCom + '</td>';
						if(item.dsdQty<item.dsdMsQty){
							cont += '<td style="color: red;">' + item.dsdQty + '</td>';
							cont += '<td>' + item.dsdMsQty + '</td>';
						}else{
							cont += '<td>' + item.dsdQty + '</td>';
							cont += '<td>' + item.dsdMsQty + '</td>';
						}
						cont += '<td>' + item.dsdGubun + '</td>';
						cont += '</tr>';
						$('#drS').append(cont);
					}
				});
				trClick(); //클릭이벤트 호출
			}
		});
	});
	
	// 엔터키 입력
	$('#btnDrsdSearch').on('keyup',function(e){
	   if(e.key ==='Enter' || e.keyCode === 13){
	      $('#btnDrsdSearch').trigger('click');
	   }
	});
	
	
	
	
	//약품 이름으로 검색
	$('#btnDrsdSearch').on('click',function(){
		$("#drS").empty();
		let str = $("#drsdName").val();
		console.log("약품명" + str);
		
		let data = {"dsdName":str,"dsdCom":str};
		console.log('data : ' + JSON.stringify(data));
		
		let count = 0;
		$.ajax({
			url:'/nurse/searchDrsd',
			contentType:'application/json;charset=utf-8',
			data:JSON.stringify(data),
			dataType:'json',
			type:'post',
			beforeSend:function(xhr){
		           xhr.setRequestHeader(header,token);
			},
			success:function(result){
				console.log('result : ' + JSON.stringify(result));
				
				if(result.length !=0){
					$('#nono').hide();
					//18
					$.each(result,function(index,item){
							count++;
							let cont="";
							cont += '<tr><th scope="row">' + count + '</th>';
							cont += '<td>' + item.drCd + '</td>';
							cont += '<td>' + item.dsdName + '</td>';
							cont += '<td>' + item.dsdCom + '</td>';
							if(item.dsdQty<item.dsdMsQty){
								cont += '<td style="color: red;">' + item.dsdQty + '</td>';
								cont += '<td>' + item.dsdMsQty + '</td>';
							}else{
								cont += '<td>' + item.dsdQty + '</td>';
								cont += '<td>' + item.dsdMsQty + '</td>';
							}
							cont += '<td>' + item.dsdGubun + '</td>';
							cont += '</tr>';
							$('#drS').append(cont);
					});
				}else{
					$('#nono').show();
				}
				trClick(); //클릭이벤트 호출
			}
		});
	});
	////////////////////////////////
	//투약 카테고리
	$('#peels').on('click',function(){
		$("#drS").empty();
		let str = "내복";
		let data = {"drCarte":str};
		let count = 0;
		$.ajax({
			url:'/nurse/drCarte',
			contentType:'application/json;charset=utf-8',
			data:JSON.stringify(data),
			dataType:'json',
			type:'post',
			beforeSend:function(xhr){
		           xhr.setRequestHeader(header,token);
			},
			success:function(result){
				console.log('result : ' + JSON.stringify(result));
				
				$.each(result,function(index,item){
					if(item.dsdGubun == "내복"){
						count++;
						let cont="";
						cont += '<tr><th scope="row">' + count + '</th>';
						cont += '<td>' + item.drCd + '</td>';
						cont += '<td>' + item.dsdName + '</td>';
						cont += '<td>' + item.dsdCom + '</td>';
						if(item.dsdQty<item.dsdMsQty){
							cont += '<td style="color: red;">' + item.dsdQty + '</td>';
							cont += '<td>' + item.dsdMsQty + '</td>';
						}else{
						cont += '<td>' + item.dsdQty + '</td>';
						cont += '<td>' + item.dsdMsQty + '</td>';
						}
						cont += '<td>' + item.dsdGubun + '</td>';
						cont += '</tr>';
						$('#drS').append(cont);
					}
				});
				trClick(); //클릭이벤트 호출
			}
		});
	});
	
	//재고 요청 신청
	$("#order").on("click",function(){
		let empNo = $("#empNo").val();
		console.log("사번  : "  + empNo)
		var trs = $("#drO").children();
		let str = $('#drCd').val();
		console.log('str : ' + str);
		let data = {"drCd":str};
		console.log(data);
		
		var arr2 = [];
		
		var trlen = $('#drO tr').length;
		for(var i=1; i<=trlen; i++){
			var vo2 = {
					"dsdQty":$('#dsdQty' + i).val(),
					"drCd":$('.drC' + i).val()
			}
			arr2.push(vo2);
		}
		console.log(arr2);
		
		
		
		var arr =[];
		for(var i=0; i<trs.length; i++){
			var vo = {};
			console.log(trs[i].children[0].children[0]);
			vo[trs[i].children[0].children[0].name] = trs[i].children[0].children[0].value;  // seq
			vo[trs[i].children[1].children[0].name] = trs[i].children[1].children[0].value;  // drcd
			vo[trs[i].children[4].children[0].name] = trs[i].children[4].children[0].value;  // drqty
			vo[trs[i].children[5].children[0].name] = trs[i].children[5].children[0].value;  // drgubun
			vo[trs[i].children[6].children[0].name] = trs[i].children[6].children[0].value;  // reqnur
			arr.push(vo);
		}

		
		
		console.log("=================================================",arr);
		console.log(arr[0]);
		
			if($('.dsdQty33').val() == ''){
				 Swal.fire({ //알트
                     icon: 'warning',
                     title: '주문 수량을 입력해주세요.',
                     showConfirmButton: false,
                     background: '#15243e',
                     timer: 5500,
                 }).then((value) => {
                     if(value){
                         console.log('gg');
                     }
                 });
				 return;
			} else {
				//주문요청 보내는 ajax
				Swal.fire({
		            title: '요청 하시겠습니까?',
		            icon: 'question',

		            showCancelButton: true,
		            ConfirmButtonColor: '#3085d6',
		            cancelButtonColor: '#d33',
		            confirmButtonText: '확인',
		            cancelButtonText: '취소',
		            background: '#15243e',

		            reverseButtons: false,

		        }).then(result => {
		        	if(result.isConfirmed){
		        		$("#drorList").empty();
						$.ajax({
							url:'/nurse/drOrder',
							data:JSON.stringify(arr),
							contentType:"application/json;charset=utf-8",
							dataType:'text',
							type:'post',
							beforeSend:function(xhr){
						           xhr.setRequestHeader(header,token);
							},
							success:function(result){
								console.log('result : ' + JSON.stringify(result));
								console.log('gkgkgkgk');
								//location.href("/nurse/drug"); 새로고침식으로 할려고했지만 실행 x
								//약품 요청 성공시 약품 요청내역 리스트 들고오기
								$.ajax({ 
									url:"/nurse/drorList",
									data: JSON.stringify(data),
									contentType:'application/json;charset=utf-8',
									dataType:'json',
									type:'post',
									beforeSend:function(xhr){
								           xhr.setRequestHeader(header,token);
									},
									success:function(rst){
										console.log('rst : ' + JSON.stringify(rst));
										$.each(rst,function(index,item){
											let cont="";
											cont += '<tr><th>' + item.drorCd + '</th>';
											cont += '<td>' + item.drCd + '</td>';
											cont += '<td>' + item.dsdName + '</td>';
											cont += '<td>' + item.dsdCom + '</td>';
											cont += '<td>' + item.drorQty + '</td>';
											cont += '<td>' + item.drorGubun + '</td>';
											cont += '<td>' + item.empName + '</td>';
											cont += '</tr>';
											$('#drorList').append(cont);
											
											 Swal.fire({ //알트
							                     icon: 'success',
							                     title: '요청되었습니다.',
							                     showConfirmButton: false,
							                     background: '#15243e',
							                     timer: 5500,
							                 }).then((value) => {
							                     if(value){
							                         console.log('gg');
							                     }
							                 });    
										});
										
										$.ajax({
											url:"/nurse/updateDrsd",
											data: JSON.stringify(arr2),
											contentType:'application/json;charset=utf-8',
											dataType:'json',
											type:'post',
											beforeSend:function(xhr){
										           xhr.setRequestHeader(header,token);
											},
											success:function(rs){
												console.log('rs : ' + JSON.stringify(rs));
												trClick();
												$("#drO").empty();
												num = 0;
											}
											
										});
									}
								});
							}
							
						});
		        	}else{
		        		/* location.reload(); */
		        		console.log("취소");
		        	}
		        });
			}
		
		
		
		//$("#drO").empty();
		num = 0;
		
	});
	
	$("#calcel").on('click',function(){
		$("#drO").empty();
		trClick();
		num = 0;
	});
	

});

</script>
