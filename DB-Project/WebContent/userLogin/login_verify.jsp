<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import=" java.sql .*" %>
<% 
	
	String userID=request.getParameter("userID");
	String userPassword=request.getParameter("userPassword");
	
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "db1715884";// here
	String passwd = "ss1"; // here
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

	mySQL="select student_id from students where student_id='" + userID + "' and student_pw='" + userPassword + "'";
	rs = stmt.executeQuery(mySQL);
	System.out.println(mySQL);
	
	
	
	if (rs.next()){
		String session_id = rs.getString("student_id");
		session.setAttribute("session_id", session_id );
		response.sendRedirect("../main.jsp");
		System.out.println("로그인 성공");
	}
	else{
		response.sendRedirect("login.jsp");
		System.out.println("로그인 실패");
	}

	stmt.close(); 
	myConn.close(); 
%>
