<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= " java.sql .*"%>

<!-- DB연결 -->
<%@include file= "../utility/connection.jsp"%>

<!-- 비밀번호 수정 검증 -->
<% 
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
	}
	else{
		sql="update students set student_pw = '"+userPassword+"'where student_id='" + studentId + "' and student_pw='" + userOldPassword + "'";
		try{
			stmt  = conn.createStatement();
			int row = stmt.executeUpdate(sql);
			System.out.println(sql);
%>
			<script>
			alert("비밀번호 수정이 완료됐습니다.");
			location.href = '/DB-Project/main.jsp';
			</script>
<%
		} catch(SQLException ex) {
			String sMessage;
		   	if (ex.getErrorCode() == 20002) 
			   	sMessage="암호는 4자리 이상이어야 합니다";
		  	else if (ex.getErrorCode() == 20003)
			  	sMessage="암호에 공란은 입력되지 않습니다.";
		  	else
			  	sMessage="잠시 후 다시 시도하십시오";
		   //System.out.println("비밀번호 수정 실패");
%>
			<script>
			alert("<%=sMessage%>");
			history.back();
			</script>
<%
		} finally {
			if(stmt != null)
				stmt.close(); 
			if(conn != null)
				conn.close(); 
		}
	}
%>