<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF - 8">
<title>수강신청 시스템 비밀번호 변경</title>
<style>
.loginBox{
  	background-color: #D6D1FF;
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
	 
	<div class="loginBox">
	 비밀번호 수정
	<form method="post" action="update_verify.jsp"><!-- action 파일은 DB수정하는 기능 해야 함 -->
	<div align="center"><input type="text" name="userID" placeholder="학번"></div>
	<div align="center"><input type="text" name="userOldPassword" placeholder="기존 비밀번호"></div>
	<div align="center"><input type="password" name="userPassword" placeholder="신규 비밀번호"></div>
	<div align="center"><input type="password" name="userPassword" placeholder="신규 비밀번호 확인"></div>
	<div align="center"><INPUT TYPE="SUBMIT" NAME="checkPwd" VALUE=" 확인 " style="background-color:white;"></div> 
	</form>
	</div>

</body>
</html>
