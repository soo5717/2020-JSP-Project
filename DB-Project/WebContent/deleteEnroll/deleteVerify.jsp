<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= " java.sql .*"%>

<!-- DB연결 -->
<%@include file= "../utility/connection.jsp"%>

<!-- 수강취소 이벤트 -->
<%
	String subjectId = request.getParameter("subjectId");
	sql = "delete from enroll where student_id=? and subject_id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, studentId);
	pstmt.setString(2, subjectId);
	resultSet = pstmt.executeQuery();
%>
	<script>
	alert("수강 취소 되었습니다!"); 
	location.href="delete.jsp"; 
	</script>
<%	
	//conn, pstmt 닫기
	pstmt.close();
	conn.close();
%>