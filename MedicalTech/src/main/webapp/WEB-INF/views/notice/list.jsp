<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<div class="container-full">
<div class="content-header" >
	<div class="d-flex align-items-center">
		<div>
			<h3 class="page-title"><a href="/notice">공지사항 </a></h3>
<!-- 공지사항 옆에 집모양 -->
			<div class="d-inline-block align-items-center" style="padding-right:20px;">
				<nav>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/notice"><i class="mdi mdi-home-outline"></i></a></li>
					</ol>
				</nav>
	
			</div>
		</div>
<!-- 검색 //////////////////////////////-->
		<form id="submitform">
		<div style="padding-right: 10px;">
			<input type="search" id="noserarch" class="form-control col-10" placeholder="검색어를 입력하세요." name="keyword" value="${keyword}" />
		</div>
		</form>
			<button type="submit" form="submitform" id="noticeSearch" class="btn btn-primary btn-icon-split btn-sm">
		       <i class="fa fa-search" aria-hidden="true" style="padding-right: 10px;"></i>
			   <span class="text">통합검색</span>
			</button>
<!-- 검색 끝 //////////////////////////////-->
		<sec:authorize access="hasRole('ROLE_MASTER')">
			<div style="position:relative; left:1040px;">
				<a href="/notice/insert"><button class="btn btn-info" id="insertBtn">추가</button></a>
			</div>	
		</sec:authorize>	
	</div>
</div>

<div class="col-12">
	<div class="box">
	<!-- /.box-header -->
	<div class="box-body no-padding">
		<div class="table-responsive">
		  <table class="table table-hover">
			<thead>
			<tr>
			  <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">번호</font></font></th>
			  <th style="text-align: center;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">제목</font></font></th>
			  <th style="text-align: center;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit; width: 30%;">내용</font></font></th>
			  <th style="text-align: center;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">날짜</font></font></th>
			  <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">첨부파일</font></font></th>
			  <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">작성자</font></font></th>
			  <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">조회수</font></font></th>
			</tr>
			</thead>
			<!-- data.content => noticeList -->
			<tbody id="ntTable">
			<c:forEach  var="n" items="${data.content}" varStatus="stat">
				<tr style="cursor:pointer;" onclick="location.href='/notice/detail?ntCd=${n.ntCd}'">
				  <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${n.rnum}</font></font></td>
				  <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
				  	<c:choose>
				        <c:when test="${fn:length(n.ntTitle) gt 26}">
				        <c:out value="${fn:substring(n.ntTitle, 0, 25)}...">
				        </c:out></c:when>
				        <c:otherwise>
				        <c:out value="${n.ntTitle}">
				        </c:out></c:otherwise>
					 </c:choose></font></font>
				  <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
					  <c:choose>
				        <c:when test="${fn:length(n.ntCont) gt 51}">
				        <c:out value="${fn:substring(n.ntCont, 0, 50)}...">
				        </c:out></c:when>
				        <c:otherwise>
				        <c:out value="${n.ntCont}">
				        </c:out></c:otherwise>
					 </c:choose></font></font>
				  </td>
				  <td><span class="text-muted"><i class="fa fa-clock-o"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> <fmt:formatDate value='${n.ntEndt}' pattern='yyyy-MM-dd'/></font></font></span> </td>
				  <td onclick="event.cancelBubble=true"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
					  <c:if test="${n.fileCd !=null}">
					  	<a href="/resources/upload/${n.fileCd}" download><i class='fa fa-fw fa-file-text-o'></i></a>
					  </c:if>
					  <c:if test="${n.fileCd ==null}">
					  	<c:out value=" "></c:out>
					  </c:if>
					  </font></font>
				  </td>
				  <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${n.ntWt}</font></font></td>
				  <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${n.ntHit}</font></font></td>
				</tr>
			</c:forEach>
			</tbody>
		  </tbody>
		 </table>
		</div>
		<div style="display: flex;justify-content: space-between;">
			
			<div class="dataTables_info" id="example_info" role="status" aria-live="polite" style="padding-left: 30px;">
					<!-- 현재 페이지 -->
					<c:set var="currentPage" value="${param.currentPage}" />
					
					<!-- 한 화면에 보여지는 행 수 -->
					<c:set var="show" value="10" />
					
					<c:if test="${param.currentPage == null }">
						<c:set var="currentPage" value="1"/>
					</c:if>
					
					<!-- 종료행 번호 : currentPage * 10행 -->
					<c:set var="endRow" value="${currentPage * show}" />
					<%-- show : ${show} | currentPage : ${currentPage} | endRow : ${endRow} |  --%>
					
					<!-- 시작행 번호 : 종료행 번호 - (10 - 1) -->
					<c:set var="startRow" value="${endRow - (show-1)}" />
					<%-- startRow : ${startRow} | --%> 
					<c:if test="${endRow > data.total}">
						<c:set var="endRow" value="${data.total}" />
					</c:if>
					 <%-- endRow : ${endRow} | 
					total : ${data.total} |  --%>
				<!--  -->
				Showing ${startRow} to ${endRow} of ${data.total} entries
				<!-- Showing 1 to 10 of 13 entries -->
			</div>
			
			
			<div class="dataTables_paginate paging_simple_numbers" id="example_paginate" style="padding-right: 30px;">
				<ul class="pagination">
					<li class="paginate_button page-item previous <c:if test='${data.startPage lt 6}'>disabled</c:if>" id="example_previous">
						<a href="/notice?currentPage=${data.startPage-5}&show=${show}" aria-controls="example" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
					</li>
					<c:forEach var="pNo" begin="${data.startPage}" end="${data.endPage}">
							<li class="paginate_button page-item <c:if test='${currentPage==pNo}'> active</c:if>">
								<a href="/notice?currentPage=${pNo}&show=${show}&keyword=${keyword}"
								 aria-controls="example" data-dt-idx="1" tabindex="0" 
								 class="page-link">${pNo}</a></li>
					</c:forEach>
					<li class="paginate_button page-item next <c:if test='${data.endPage ge data.totalPages}'>disabled</c:if>" id="example_next">
					 	<a href="/notice?currentPage=${data.startPage+5}&show=${show}" aria-controls="example" data-dt-idx="7" tabindex="0"	class="page-link">Next</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- /.box-body -->
	</div>
	<!-- /.box -->
</div>
</div>
<script type="text/javascript">
 let enterKey = document.getElementById("noserarch");
 enterKey.addEventListener("keyup", function(e){
	if(e.keyCode === 13){
		e.perventDefault();
		document.getElementById("noticeSearch").click();
	} 
 });
	 
 

/*
$(function(){
	let header = "${_csrf.headerName}";
	let token  = "${_csrf.token}";
	
	//$('tbody tr').on('click', function(){
	//	console.log($(this).html());
	//	console.log('aaagg');
	//});
	
	$("#noticeSearch").on('click',function(){
		$('#ntTable').empty();
		$("#example_info").empty(); 
		let str = $("#noserarch").val();
		
		//alert(str);
		//검색결과  아작스에서 검색에 쓴 단어를 던젔을떄 컨트롤러에서 받을 수 있는가
		
		let data = {"ntTitle":str, "ntCont":str};
		console.log(data);
		console.log("data : " + JSON.stringify(str));
		
		//스프링 시큐리티를 위한 토큰 처리(csrf) -> 불토엔 큰 코스로 픽스!
		//let header = "${_csrf.headerName}";
		//let token = "${_csrf.token}"; 
		
		//console.log("header : " + header + ", token : " + token);
		//아작났어유
		//contentType : 나가는거
		//dataType : 들어오는 데이터 타입
		$.ajax({
			url:"/notice/list",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			dataType:"json",
			type:"post",
			beforeSend:function(xhr){
				xhr.setRequestHeader(header,token);
			},
			success:function(result){
				//console.log(str);
				console.log("result : " + result);
				//console.log(JSON.stringify(result.ntTitle));
				//console.log(JSON.stringify(result.ntCont));
				if(result == ""){
					//console.log("검색결과 없을때");
					//alert("검색결과 없습니다.");
					let cont = "";
					cont += '<tr><td colspan="7" style="text-align: center; font-size: large;"> 검색결과 없습니다. </td></tr>';
					$("#ntTable").append(cont);  
				}
				let page = "";
				$.each(result,function(index,item){
					console.log("cd값 확인 : " + item.ntCd);
					
// 					var ntCd = "'"+item.ntCd+"'";
					let content = "";
					
					content +='<tr style="cursor:pointer"; onclick="link('+item.ntCd+')">';
					content +='<td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">' + (index+1) + '</font></font></td>';
					content +='<td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">' + item.ntTitle + '</a></font></font></td>';
					content +='<td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">' + (item.ntCont).substr(0, 25) + '</font></font></td>';
					content +='<td><span class="text-muted"><i class="fa fa-clock-o"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">' + fn_getInsertDate(item.ntEndt).substr(0,10)+' </font></font></span></td>';
					content +='<td onclick="event.cancelBubble=true"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">';
					if(item.fileCd !=null){
						content += '<a href="/resources/upload/'+item.fileCd+'" download><i class="fa fa-fw fa-file-text-o"></i></a></font></font></td>';
					}else{
						content+='</font></font></td>';
					}
					content +='<td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">' + item.ntWt + '</font></font></td>';
					content +='<td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">' + item.ntHit +'</font></font></td></tr>';
					
	               
	                $("#ntTable").append(content);  
	                
 
				});
				page +='Showing 첫행 to 종료행 of 토탈 entries';
				$("#example_info").append(page); 
			}
		});
	});
});
function link(p_arg){
	window.location.href = "/notice/detail?ntCd="+p_arg;

}

//날짜 나오는 함수
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
*/
</script>
