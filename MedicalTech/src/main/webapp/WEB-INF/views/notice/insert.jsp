<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
.form-control{
	border: 0px;
}
.form-control-style{
	border: 4px #bcbcbc; 
	background-color: #6c757d;
	border-radius: 5px;
}
.form-group{
	display: inline-block;
}
.form-group-sun{
	display: inline-block;
}
</style>
<div class="content-header">
	<div class="d-flex align-items-center">
		<div class="me-auto">
			<h3 class="page-title">공지사항 등록</h3>
			<div class="d-inline-block align-items-center">
				<nav>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a></li>
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
				  <input class="form-control form-control-lg" type="text" id="title" name="ntTile" placeholder="제목을 작성하세요." style="padding: 0.5rem;">
				  <input type="hidden" id="noticeCd" name="ntCd">
				</div>
				<div class="box-body">
					<textarea class="form-control" rows="15" name="ntCont" id="content" placeholder="내용을 작성하세요."></textarea>
					<div id="test_cnt">(0 / 500)</div>
				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<div class="row">
						<div class="form-group" style="margin-bottom: 0rem;">
							<div class="form-group" id="attch" style="margin-bottom: 0rem;">
								<label class="form-label">첨부파일</label>
								<label class="file">
									<input type="file" id="fileUpload" name="fileCd" multiple="multiple" value="null">
								</label>
							</div>
						</div>
					</div>	
				</div>
				<!-- /.box-footer-->
				<div style="padding: 1.5rem; display:flex;justify-content:space-between;">
					<button class="btn btn-info" id="insertBtn">
						<i class="fa fa-save" style="padding-right: 3px;"></i> 저장
					</button>
					<a href="/notice"><button class="btn btn-danger" id="cancelBtn">
						<i class="fa fa-close" style="padding-right: 3px;"></i> 취소
					</button></a>
				</div>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
//공지사항 제목 글자수 체크
$(document).ready(function(){
	$("#title").on("keyup",function(){
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
//공지사항 내용 글자수 체크
	$("#content").on("keyup",function(){
		$("#test_cnt").html("(" + $(this).val().length + "/500)");
		
		if($(this).val().length > 500){
			$(this).val($(this).val().substring(0,500));
			$("#test_cnt").html("(500 / 500)");
			 Swal.fire({ //알트
                icon: 'success',
                title: '내용은 최대 500자 이내 입니다.',
                showConfirmButton: false,
                background: '#15243e',
                timer: 3000,
            });//알트 끝      
		}
	});
});
let header = "${_csrf.headerName}";
let token  = "${_csrf.token}";
//파일 업로드
//공지사항 insert시 파일 업로드 
$("#insertBtn").on("click",function(){
	let filelist = $("#fileUpload")[0].files;
	console.log(filelist.length);
	
	//파일 보내려면 FormData가 있어야 함
	let formData = new FormData();
	formData.append("ntTitle",$("#title").val());
	formData.append("ntCont",$("#content").val());
	formData.append("fileCd",$("#fileUpload").val());

	for(let i=0; i<filelist.length; i++){
		formData.append("uploads",filelist[i]); // 실제 파일 객체를 담아줘야 넘어감
	}

	$.ajax({
		method:"post",
		url:"/notice/insertPost",
		data:formData,
		cache:false,
		contentType:false,
		processData:false,
		dataType:"text",
		beforeSend:function(xhr){
			xhr.setRequestHeader(header,token);
		},
		success:function(data){
			console.log("insertData : " + data);
			if(data == 1){
				 window.location.href = "/notice";
			}else {
				window.location.href = "/notice";
			}
		}
	});
});	

</script>