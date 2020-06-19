<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- CSS 스타일 -->
<link rel="stylesheet" type="text/css" href = "../CSS/base.css">
<!-- DB연결 -->
<%@include file= "../utility/connection.jsp"%>

<!-- 수강확정내역 -->
<% 
	//showEnroll에서 선택 년도, 학기 가져옴
	String sYear = request.getParameter("selectedYear");
	String sSemester = request.getParameter("selectedSemester");
	
	if(sYear==null || sSemester==null){
		sYear = Integer.toString(nowYear);
		sSemester = Integer.toString(nowSemester);
	}

	//잔여학점, 수강학점, 최대 수강학점
	int remainCredit = 0, enrollCredit = 0, maxCredit = 0;

	//수강확정 내역 조회  프로시저 : 최대 수강학점, 신청 학점 return 
	sql = "{call Select2TimeTable(?, ?, ?, ?, ?, ?)}";
	try{
		cstmt = conn.prepareCall(sql);
		cstmt.setInt(1, Integer.parseInt(studentId));
		cstmt.setInt(2, Integer.parseInt(sYear));
		cstmt.setInt(3, Integer.parseInt(sSemester));
		cstmt.registerOutParameter(4, java.sql.Types.INTEGER);
		cstmt.registerOutParameter(5, java.sql.Types.INTEGER);
		cstmt.registerOutParameter(6, java.sql.Types.INTEGER);
		cstmt.execute();
		
		enrollCredit = cstmt.getInt(4);
		maxCredit = cstmt.getInt(6);
		remainCredit = maxCredit - enrollCredit;
	} catch(SQLException ex) {
		System.err.println("SQLException: " + ex.getMessage());
	} finally{
		if(cstmt != null)
			cstmt.close();
		if(conn != null)
			conn.close();						
	}
%>

<div class="bottom" id="fixedfooter">
	<table width= "100%" align="center" bgcolor ="#FFFF99" border> 
		<tr> 
			<td width="55%">수강 확정 내역</td> 
			<td width="15%">잔여학점: <%=remainCredit%></td> 
			<td width="15%">신청학점: <%=enrollCredit%></td> 
			<td width="15%">최대 수강 학점: <%=maxCredit%></td>
		</tr> 
	</table>
</div>