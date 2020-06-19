<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@include file= "../utility/connection.jsp"%>

<!-- 로그인 안되어 있을 경우 -->
<%	if(studentId == null){
		response.sendRedirect("/DB-Project/main.jsp");
		return; 
	}
%>

<!-- 수강신청 검증 -->
<%
	String subjectId = request.getParameter("subjectId");
	String couresDivision = request.getParameter("couresDivision");

	sql = "{call InsertEnroll(?, ?, ?, ?)}";
	try{
		cstmt = conn.prepareCall(sql);
		cstmt.setInt(1, Integer.parseInt(studentId));
		cstmt.setInt(2, Integer.parseInt(subjectId));
		cstmt.setInt(3, Integer.parseInt(couresDivision));
		cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
		cstmt.execute();
		String result = cstmt.getString(4);	
%>
		<script>
		alert("<%=result%>"); 
		location.href="/DB-Project/insertEnroll/insert.jsp";
		</script>
<%	
	} catch(SQLException ex) {
		System.err.println("SQLException: " + ex.getMessage());
	} finally {
		if(cstmt != null)
			cstmt.close();
		if(conn != null)
			conn.close();
	}
%>