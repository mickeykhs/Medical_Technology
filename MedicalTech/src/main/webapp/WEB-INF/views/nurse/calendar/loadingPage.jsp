<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
    *{
		margin:0;
		padding:0;
	}
	body {
		background-color: #15243E;
	}
	#loading_bar{
        display:flex;
        justify-content:center;
        align-items:center;
		width: 9.9%;
		position:relative;
		left: 37%;
		bottom : 100px;
        height: 100vh;
        background-color: #15243E;
        font-family: 'Raleway', sans-serif;
    }

    #loading{
        font-size: 2rem;
        color: #fff;    
        position: relative;
    }
    #loading::before {
        content: attr(data-text);
        color: yellow;
        position: absolute;
        left: 0;
        overflow: hidden;
        width: 100%;
        animation: loading 1s ease infinite;
    }
    #loading::after {
        content: "";
        width: 100%;
        height: 3px;
        background-color: yellow;
        position: absolute;
        left: 0; bottom: -10px;
        animation: loading 1s ease infinite;
    }

    @keyframes loading {
        from {width: 0%;}  
        to {width: 100%;}  
    }
    @-webkit-keyframes loading {
        from {width: 0%;}  
        to {width: 100%;}
    }
    	
</style>

	
</head>
<body>
<!-- 로딩바 페이지 시작////////// -->
<div id="loading_bar" style="display:none;">
    <img src="/resources/upload/mtlogo.png" alt="" style="width: 200px;height:200px;">
    <h1 id="loading" data-text="LOADING">LOADING</h1>
</div>
<!-- 로딩바 페이지  끝 //////////-->
    
</body>
</html>


