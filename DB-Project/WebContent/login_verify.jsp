<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import=" java.sql .*" %>
<% 
	String userID=request.getParameter("userID");
	String userPassword=request.getParameter("userPassword");
	
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "db1715884"; //individual
	String passwd = "ss1"; //individual
	Connection myConn = null;
	Statement stmt = null;
	ResultSet rs= null;
	String mySQL = null;
	
	try{
	Class.forName(dbdriver);
	myConn=DriverManager.getConnection(dburl, user, passwd);
	stmt  = myConn.createStatement();
	}catch(Exception e){
		System.out.println("DB연결오류");
	}

	mySQL="select s_id from students where s_id='" + userID + "' and s_pwd='" + userPassword + "'";
	rs = stmt.executeQuery(mySQL);
	System.out.println(mySQL);
	
	
	
	if (rs.next()){
		String session_id = rs.getString("s_id");
		 session.setAttribute("session_id", session_id );
		response.sendRedirect("main.jsp");
		System.out.println("로그인 성공");
	}
	else{
		response.sendRedirect("login.jsp");
		System.out.println("로그인 실패");
	}

	stmt.close(); 
	myConn.close(); 
%>
