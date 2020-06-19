<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@include file= "../utility/connection.jsp"%>

<!-- 수강신청 검증 -->
<%
	String subjectId = request.getParameter("subjectId");
	String couresDivision = request.getParameter("couresDivision");
	sql = "{call InsertEnroll(?, ?, ?, ?)}";
	cstmt = conn.prepareCall(sql);
	cstmt.setInt(1, Integer.parseInt(studentId));
	cstmt.setInt(2, Integer.parseInt(subjectId));
	cstmt.setInt(3, Integer.parseInt(couresDivision));
	cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
	cstmt.execute();
	
	String result = cstmt.getString(4);
	System.out.println(result);
%>
	<script>
	alert("<%=result%>"); 
	location.href="insert.jsp"; 
	</script>
<%	
	//cstmt, conn 닫기
	cstmt.close();
	conn.close();
%>