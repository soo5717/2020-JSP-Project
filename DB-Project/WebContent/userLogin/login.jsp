<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF - 8">
<title>숙명여대 로그인</title>
<!-- CSS 스타일 -->
<link rel="stylesheet" type="text/css" href = "../CSS/base.css">
<!-- 상단 메뉴 -->
<jsp:include page = "../top.jsp" flush="false"/>
</head>
<body>
	
	<!-- 안내 멘트 -->
	<br><br><br>
	<table width= "50%" align="center" bgcolor ="#FFFF99" border> 
		<tr> <td><div align= "center">아이디와 패스워드를 입력해주세요</div></td> 
	</table>
	
	<!-- 로그인 -->
	<table width= "50%" align="center" border> 
		<form method="post" action="login_verify.jsp">
			<tr>
				<td><div align= "center"> 아이디 </div></td> 
				<td><div align="center">
					<input type="text" name="userID">
				</div></td>
			</tr>
			<tr>
				<td><div align= "center"> 패스워드 </div></td> 
				<td><div align="center">
					<input type="password" name="userPassword">
				</div></td>
			</tr>
			<tr>
				<td colspan= 2><div align="center"> 
					<input type="SUBMIT" name="Submit" VALUE=" 로그인 " style="background-color:white;">
					<input type= "RESET" value=" 취소 " style="background-color:white;"> 
				</div></td>
			</tr>
		</form>
	</table>
</body>
</html>