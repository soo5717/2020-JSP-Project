<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= " java.sql .*"%>

<!-- DB연결 -->
<%@include file= "../utility/connection.jsp"%>

<% 
	String userID=(String)session.getAttribute("session_id");
	String userOldPassword=request.getParameter("userOldPassword");
	String userPassword=request.getParameter("userPassword");
	

	sql="update students set student_pw = '"+userPassword+"'where student_id='" + userID + "' and student_pw='" + userOldPassword + "'";
	try{ //업데이트 성공
		stmt = conn.createStatement();
		int row = stmt.executeUpdate(sql);
		
		if(row != 0){
%>
			<script>
				alert("비밀번호 수정이 완료됐습니다.");
				location.href = '/DB-Project/main.jsp';
			</script>	
<%		}
	} catch(SQLException ex) { //업데이트 실패
		System.err.println("SQLException: " + ex.getMessage());
		String sMessage;
	   	if (ex.getErrorCode() == 20002)
	   		sMessage="암호는 4자리 이상이어야 합니다";
	  	else if (ex.getErrorCode() == 20003)
		  	sMessage="암호에 공란은 입력되지 않습니다.";
	  	else
		  	sMessage="잠시 후 다시 시도하십시오";
%>
		<script>
			alert(<%=sMessage%>);
			location.href = '/DB-Project/main.jsp';
		</script>
<%
	}
	//stmt, conn 닫기
	stmt.close(); 
	conn.close(); 
%>
