<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Access Denied Page</title>
</head>
<body>
	<h3>Access Denied</h3>
	<h2>${SPRING_SECURITY_403_EXCEPTION.getMessage()}</h2>
	<!-- model.addAttribute("msg", "Access Denied"); -->
	<h2>${msg}</h2>
	<div class="container h-p100">
		<div class="row h-p100 align-items-center justify-content-center text-center">
			  <div class="col-lg-7 col-md-10 col-12">
				  <div class="rounded30 p-50">
					  <h1 class="fs-180 fw-bold error-page-title"> <i class="fa fa-gear fa-spin"></i></h1>
					  <h1>ACCESS DENIED</h1>
					  <h3>접근권한이 없습니다</h3>
					  <h4>Please check back later.</h4>	
				  </div>
			  </div>				
		</div>
	</div>
</body>
</html>