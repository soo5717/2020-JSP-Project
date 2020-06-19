<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import=" java.sql .*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 수정</title>
</head>
<body>
	<% 
	String userID=(String)session.getAttribute("session_id");
	String userOldPassword=request.getParameter("userOldPassword");
	String userPassword=request.getParameter("userPassword");
	String userPasswordCheck=request.getParameter("userPasswordCheck");
	
	if(!(userPasswordCheck.equals(userPassword))){
		%>
		<script>
		alert("신규 비밀번호가 일치하지 않습니다.");
		history.back();
		</script>
		<%
		//response.sendRedirect("../.jsp");
	}
	else{
	
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "db1715884";// here
	String passwd = "ss1"; // here
	Connection myConn = null;
	Statement stmt = null;
	int rs=0;
	String mySQL = null;
	
	try{
		Class.forName(dbdriver);
		myConn=DriverManager.getConnection(dburl, user, passwd);
		stmt  = myConn.createStatement();
	}catch(Exception e){
		System.out.println("DB연결오류");
	}

	mySQL="update students set student_pw = '"+userPassword+"'where student_id='" + userID + "' and student_pw='" + userOldPassword + "'";
	try{
	rs = stmt.executeUpdate(mySQL);
	System.out.println(mySQL);%>
	<script>
	alert("비밀번호 수정이 완료됐습니다.");
	location.href = '../main.jsp';
	</script>
	<%
	} catch(SQLException ex) {
	   String sMessage;
	   if (ex.getErrorCode() == 20002) {
		   sMessage="암호는 4자리 이상이어야 합니다";
	   }
	  else if (ex.getErrorCode() == 20003) {
		  sMessage="암호에 공란은 입력되지 않습니다.";
	  }
	  else {
		  sMessage="잠시 후 다시 시도하십시오";
	  }
	   
	   System.out.println("비밀번호 수정 실패");
	   %>
	   <script>
	    var msg = "<%=sMessage%>";
		alert(msg);
		history.back();
		</script>
		
	   <%
	}
	stmt.close(); 
	myConn.close(); 
	}
	%>
	


</body>
</html>