<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= " java.sql .*"%>

<!-- DB연결 -->
<%@include file= "../utility/connection.jsp"%>

<!-- 로그인 안되어 있을 경우 -->
<%	if(studentId == null){
		response.sendRedirect("/DB-Project/main.jsp");
		return; 
	}
%>

<!-- 수강취소 검증 -->
<%
	String subjectId = request.getParameter("subjectId");
	sql = "delete from enroll where student_id=? and subject_id=?";
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, studentId);
		pstmt.setString(2, subjectId);
		int row = pstmt.executeUpdate();
		
		if(row != 0){
%>
			<script>
			alert("수강 취소 되었습니다!"); 
			location.href="/DB-Project/deleteEnroll/delete.jsp";
			</script>
<%	
		}
		else{
%>
			<script>
			alert("수강 취소 실패했습니다!"); 
			location.href="/DB-Project/deleteEnroll/delete.jsp";
			</script>
<%
		}
	} catch(SQLException ex) {
		System.err.println("SQLException: " + ex.getMessage());
	} finally{
		if(pstmt != null)
			pstmt.close();
		if(conn != null)
			conn.close();
	}
%>