<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청 시스템 비밀번호 변경</title>
</head>
<body>
<%@include file="../top.jsp"%>


	<div width="50%" height="30" align="center">
	 <h2>비밀번호 수정</h2>
	<table bgcolor ="#FFFF99" border>
	<form method="post" action="update_verify.jsp"><!-- action 파일은 DB수정하는 기능 해야 함 -->
	<tr><td><div align="center"><input type="text" name="userOldPassword" placeholder="기존 비밀번호"></div></td></tr>
	<tr><td><div align="center"><input type="password" name="userPassword" placeholder="신규 비밀번호"></div></td></tr>
	<tr><td><div align="center"><input type="password" name="userPassword" placeholder="신규 비밀번호 확인"></div></td></tr>
	<tr><td><div align="center"><INPUT TYPE="SUBMIT" NAME="checkPwd" VALUE=" 확인 " style="background-color:white;"></div></td></tr> 
	</form>
	</table>
	</div>

</body>
</html>
