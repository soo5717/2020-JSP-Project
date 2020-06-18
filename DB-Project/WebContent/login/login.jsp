<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF - 8">
<title>수강신청 시스템 로그인</title>
</head>
<body>

<%@include file="../top.jsp"%>
	 
	 <div align="center"><h2>로그인<h2></div>
	<table bgcolor ="#FFFF99" border width="40%" align="center">
	<form method="post" action="login_verify.jsp">
	<tr><td><div align="center"><input type="text" name="userID" placeholder="아이디"></div></td></tr>
	<tr><td><div align="center"><input type="password" name="userPassword" placeholder="패스워드"></div></td></tr>
	<tr><td><div align="center"><INPUT TYPE="SUBMIT" NAME="Submit" VALUE=" 로그인 " style="background-color:white;"></div></td></tr>
	</table>
	</form>
	</div>

</body>
</html>