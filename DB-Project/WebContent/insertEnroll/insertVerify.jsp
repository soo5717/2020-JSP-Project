<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@include file= "../deleteEnroll/connection.jsp"%>

<!-- 수강신청 이벤트 -->
<%



%>
	<script>
	alert("수강 신청 되었습니다!"); 
	location.href="insert.jsp"; 
	</script>
<%	
	//conn, stmt 닫기
	//pstmt.close();
	conn.close();
%>