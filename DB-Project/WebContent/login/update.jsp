<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF - 8">
<title>������û �ý��� ��й�ȣ ����</title>
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
<%@include file="../top.jsp"%>
	 
	<div class="loginBox">
	 ��й�ȣ ����
	<form method="post" action="update_verify.jsp"><!-- action ������ DB�����ϴ� ��� �ؾ� �� -->
	<div align="center"><input type="text" name="userOldPassword" placeholder="���� ��й�ȣ"></div>
	<div align="center"><input type="password" name="userPassword" placeholder="�ű� ��й�ȣ"></div>
	<div align="center"><input type="password" name="userPassword" placeholder="�ű� ��й�ȣ Ȯ��"></div>
	<div align="center"><INPUT TYPE="SUBMIT" NAME="checkPwd" VALUE=" Ȯ�� " style="background-color:white;"></div> 
	</form>
	</div>

</body>
</html>
