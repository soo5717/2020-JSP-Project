<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import=" java.sql .*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ ����</title>
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
		alert("�ű� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
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
		System.out.println("DB�������");
	}

	mySQL="update students set student_pw = '"+userPassword+"'where student_id='" + userID + "' and student_pw='" + userOldPassword + "'";
	try{
	rs = stmt.executeUpdate(mySQL);
	System.out.println(mySQL);%>
	<script>
	alert("��й�ȣ ������ �Ϸ�ƽ��ϴ�.");
	location.href = '../main.jsp';
	</script>
	<%
	} catch(SQLException ex) {
	   String sMessage;
	   if (ex.getErrorCode() == 20002) {
		   sMessage="��ȣ�� 4�ڸ� �̻��̾�� �մϴ�";
	   }
	  else if (ex.getErrorCode() == 20003) {
		  sMessage="��ȣ�� ������ �Էµ��� �ʽ��ϴ�.";
	  }
	  else {
		  sMessage="��� �� �ٽ� �õ��Ͻʽÿ�";
	  }
	   
	   System.out.println("��й�ȣ ���� ����");
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