<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF - 8">
<title>수강신청 시스템 로그인</title>
<style>
div.loginBox{
  	background-color: #FFFF99;
	text-align: center;
	padding:20px;
	position: absolute;
	top: 30%;
	left: 30%;
	height: 30%;
	width: 40%;
}

</style>
</head>
<body>
	<%@include file="../top.jsp"%>
	 
	<div class="loginBox">
	 로그인
	 <form method="post" action="login_verify.jsp">
	<div align="center"><input type="text" name="userID" placeholder="아이디"></div>
	<div align="center"><input type="password" name="userPassword" placeholder="패스워드"></div>
	<div align="center"><INPUT TYPE="SUBMIT" NAME="Submit" VALUE=" 로그인 " style="background-color:white;"></div>
	</form>
	</div>

</body>
</html>