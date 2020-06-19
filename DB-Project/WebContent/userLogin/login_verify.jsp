<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= " java.sql .*"%>
    
<!-- DB연결 -->
<%@include file= "../utility/connection.jsp"%>

<!-- 로그인 검증 -->
<% 
	String userID=request.getParameter("userID");
	String userPassword=request.getParameter("userPassword");
	
	sql="select student_id from students where student_id='" + userID + "' and student_pw='" + userPassword + "'";
	try{
		stmt = conn.createStatement();
		resultSet = stmt.executeQuery(sql);
		
		if(resultSet.next()){
			//세션에 학번 저장
			String session_id = resultSet.getString("student_id");
			session.setAttribute("session_id", session_id );	
%>
		<script>
			alert("로그인 성공했습니다!");
			location.href="/DB-Project/main.jsp"; 
		</script>
<%		}
		else{
%>
		<script>
			alert("로그인 실패했습니다!");
			history.back(); 
		</script>
<%		}
	} catch(Exception ex) {%>
		<script>
			alert("로그인 실패했습니다!");
			history.back(); 
		</script>
	<%
	} finally {
		if(stmt != null)
			stmt.close(); 
		if(conn != null)
			conn.close(); 
	}
%>
