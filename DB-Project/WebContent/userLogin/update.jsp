<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙명여대 비밀번호 변경</title>
<!-- CSS 스타일 -->
<link rel="stylesheet" type="text/css" href = "../CSS/base.css">
<!-- 상단 메뉴 -->
<jsp:include page = "../top.jsp" flush="false"/>
</head>
<body>
	
	<!-- 안내 멘트 -->
	<br><br><br>
	<table width= "50%" align="center" bgcolor ="#FFFF99" border> 
		<tr> <td><div align= "center">비밀번호를 입력해주세요</div></td> 
	</table>
	
	<!-- 비밀번호 수정 -->
	<table width= "50%" align="center" border> 
		<form method="post" action="update_verify.jsp">
			<tr>
				<td><div align= "center">기존 비밀번호</div></td> 
				<td><div align="center">
					<input type="text" name="userOldPassword">
				</div></td>
			</tr>
			<tr>
				<td><div align= "center">신규 비밀번호</div></td> 
				<td><div align="center">
					<input type="password" name="userPassword">
				</div></td>
			</tr>
			<tr>
				<td><div align= "center">신규 비밀번호 확인</div></td> 
				<td><div align="center">
					<input type="password" name="userPassword">
				</div></td>
			</tr>
			<tr>
				<td colspan= 2><div align="center"> 
					<input type="SUBMIT" name="checkPwd" value=" 확인 " style="background-color:white;">
					<input type= "RESET" value=" 취소 " style="background-color:white;"> 
			</tr> 
		</form>
	</table>
</body>
</html>
