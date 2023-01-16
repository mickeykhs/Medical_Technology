<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
.form-control{
	border: 0px;
}
.form-control border{
	
}

.form-group{
	display: inline-block;
}
.form-group-ck{
	display: inline-block;
	visibility: hidden;
}
.form-group-sun{
	display: inline-block;
}
</style>
<div class="content-header">
	<div class="d-flex align-items-center">
		<div class="me-auto">
			<h3 class="page-title">공지사항 상세 페이지</h3>
			<div class="d-inline-block align-items-center">
				<nav>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/notice"><i class="mdi mdi-home-outline"></i></a></li>
					</ol>
				</nav>
			</div>
		</div>
		
	</div>
</div>
<section class="content">
	<div class="row">
		<div class="col-12">
			<div class="box">
				<div class="box-header with-border">
				  <input class="form-control bod form-control-lg" type="text" id="title" name="ntTile" value="${noticeVO.ntTitle}" disabled>
				  <input type="hidden" id="ntcode" name="ntCd" value="${noticeVO.ntCd}">
				</div>
<!-- 파일 다운로드 -->
<div class="box-header with-border" style="padding: 10px 20px 10px 35px;">
  <i class="fa fa-fw fa-file"></i>
  <h5 class="box-title"><a href="/resources/upload/${noticeVO.fileCd}" download>${noticeVO.fileCd}</a></h5>
</div>
<!-- 파일 다운로드 끝 -->
				<div class="box-body">
					<textarea class="form-control bod" rows="10" name="ntCont" id="content" disabled>${noticeVO.ntCont}</textarea>
					<div id="test_cnt" style="display: none;">(0 / 500)</div>
				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<div class="row">
						<div class="form-group" style="margin-bottom: 0rem;">
						<!-- 파일 업로드 -->
							<div class="form-group-ck" id="attch" style="margin-right: 33%;">
								<label class="form-label"><i class="fa fa-fw fa-file-o"></i></label>
								<label class="file">
									<input type="file" id="fileUpload" name="fileCd" multiple="multiple">
								</label>
							</div>
						<!-- 파일 업로드 끝 -->
							<div class="form-group">
								<input type="text" class="form-control" name="ntWt" id="wt" value="${noticeVO.ntWt}" disabled>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="ntEndt" id="endt" value="<fmt:formatDate value='${noticeVO.ntEndt}' pattern='yyyy-MM-dd'/>" disabled>
							</div>
						</div>
					</div>	
				</div>
				<!-- /.box-footer-->
				<!-- 테이블 눌러서 상세화면으로 들어오면 보이는 버튼 -->
				<span id="spn1" style="padding: 1.5rem; display:flex;justify-content:space-between;">
				<a href="#" onclick="history.back(); return false;"><button class="btn btn-warning">
					<i class="fa fa-mail-reply" style="padding-right: 3px;"></i> 뒤로가기
				</button></a>
				<sec:authorize access="hasRole('ROLE_MASTER')">
				<button class="waves-effect waves-light btn lg bg-gradient-success" id="updateBtn">
					<i class="fa fa-edit" style="padding-right: 3px;"></i> 수정
				</button>
				<button class="btn btn-danger" id="deleteBtn">
					<i class="ti-trash" style="padding-right: 3px;"></i> 삭제
				</button>
				</sec:authorize>
				</span>
				<!-- 수정버튼 누른 후 보이는 버튼 -->
				<span id="spn2"  style="padding: 1.5rem; display: none; justify-content: space-between;">
				<button class="btn btn-info" id="checkBtn" style="margin-right: 10px;">
					<i class="fa fa-save" style="padding-right: 3px;"></i> 저장
				</button>
				<a href="/notice/detail?ntCd=${noticeVO.ntCd}"><button class="btn btn-danger" id="cancelBtn">
					<i class="fa fa-close" style="padding-right: 3px;"></i> 취소
				</button></a>
				</span> 
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
let header = "${_csrf.headerName}";
let token  = "${_csrf.token}";

//공지사항 내용 글자수 체크
$(document).ready(function(){
	$("#content").on('keyup',function(){
		$("#test_cnt").html("(" + $(this).val().length + "/500)");
		
		if($(this).val().length > 500){
			$(this).val($(this).val().substring(0,500));
			$('#this_cnt').html("(500 / 500)");
			 Swal.fire({ //알트
                 icon: 'success',
                 title: '내용은 최대 500자 이내 입니다.',
                 showConfirmButton: false,
                 background: '#15243e',
                 timer: 3000,
             });//알트 끝      
		}
	});
//공지사항 제목 글자수 체크
	$("#title").on('keyup',function(){
		if($(this).val().length > 300){
			$(this).val($(this).val().substring(0,300));
			 Swal.fire({ //알트
                 icon: 'success',
                 title: '제목은 최대 300자 이내 입니다.',
                 showConfirmButton: false,
                 background: '#15243e',
                 timer: 3000,
             });//알트 끝      
		}
	});
});


//공지사항 삭제 버튼
	console.log($("#ntcode").val());
	let no = $("#ntcode").val();
	$("#deleteBtn").on("click",function(){
		Swal.fire({
            title: '게시글을 삭제 하시겠습니까??',
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
			   $.ajax({
			      method:"post",
			      url:"/notice/delete",
			      data:JSON.stringify({
			         "ntCd":$("#ntcode").val()
			      }),
			      contentType:"application/json;charset=utf-8",
			      dataType:"text",
			      beforeSend:function(xhr){
			         xhr.setRequestHeader(header,token);
			      },
			      success:function(data){
			         if (data == 1) {
			            //alert("삭제가 성공되었습니다.");
			            //window.location.href = "/notice";
			             Swal.fire({
			                     icon: 'success',
			                     title: '삭제가 성공되었습니다.',
			                     showConfirmButton: false,
			                     background: '#15243e',
			                     timer: 3000,
			                 }).then((value) => {
			                     if(value){
			                          window.location.href = "/notice";
			                     }
			                 });//알트 끝   
			         } else {
			            //alert("삭제가 실패하였습니다.");
			            Swal.fire({
			                    icon: 'danger',
			                    title: '삭제가 실패되었습니다.',
			                    showConfirmButton: false,
			                    background: '#15243e',
			                    timer: 3000,
			                }).then((value) => {
			                    if(value){}
			                });//알트 끝  
			                     
			         }
			      }
			   });//ajax끝
           }
      });//swal끝
      
	});



//공지사항 수정하기버튼 누르면 input태그 disabled 삭제
$("#updateBtn").on("click",function(){
	$(".form-control").attr("disabled",false);
	$(".bod").attr("class","form-control border");
	$("#attch").attr("class", "form-group-sun");
	$("#spn1").css("display", "none");
	$("#spn2").css("display", "flex");
	$(".sun").css("display", "block");
	$("#test_cnt").css("display","block");//글자수 체크 보이게
});
//공지사항 수정 ajax(저장버튼 누르면 수정완료)
$("#checkBtn").on("click",function(){
	//파일 보내려면 FormData가 있어야 함
	let forFata = new FormData();
	formData.append("ntCd",$("#ntcode").val());
	formData.append("ntTitle",$("#title").val());
	formData.append("ntCont",$("#content").val());
	formData.append("ntWt",$("#wt").val());
	formData.append("ntEndt",$("#endt").val());
	formData.append("fileCd",$("#fileUpload").val());

	let filelist = $("#fileUpload")[0].files;
	for(let i=0; i<filelist.length; i++){
		formData.append("uploads",filelist[i]); // 실제 파일 객체를 담아줘야 넘어감
	}
	
	$.ajax({
		method:"post",
		url:"/notice/update",
		data:formData,
		cache:false,
		contentType:false,
		processData:false,
		dataType:"text",
		beforeSend:function(xhr){
			xhr.setRequestHeader(header,token);
		},
		success:function(data){
			console.log("성공시 뭐라고 찍히니?? : " + data);
			if (data != null) {
				//alert("수정에 성공하였습니다.");
				//window.location.href = "/notice/detail?ntCd="+ $("#ntcode").val();
				Swal.fire({
                    icon: 'success',
                    title: '수정에 성공하였습니다.',
                    showConfirmButton: false,
                    background: '#15243e',
                    timer: 3000,
                }).then((value) => {
                    if(value){
                    	window.location.href = "/notice/detail?ntCd="+ $("#ntcode").val();
                    }
                });//알트 끝  
			}else {
				//alert("수정에 실패하였습니다.");
				//window.location.href = "/notice";
				Swal.fire({
                    icon: 'danger',
                    title: '수정에 실패하였습니다.',
                    showConfirmButton: false,
                    background: '#15243e',
                    timer: 3000,
                }).then((value) => {
                    if(value){
                    	window.location.href = "/notice";
                    }
                });//알트 끝
			}
			
		}
	});
});

</script>