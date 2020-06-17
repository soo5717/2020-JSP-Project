<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= " java.sql .*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙명여대 수강취소</title>
<!-- CSS 스타일 -->
<link rel="stylesheet" type="text/css" href = "../CSS/base.css">
<!-- 상단 메뉴 -->
<%@include file= "../top.jsp"%>
<!-- DB연결 -->
<%@include file= "connection.jsp"%>
</head>
<body>
	<%
		//잔여학점, 수강학점, 최대 수강학점
		int remainCredit = 0, enrollCredit = 0, maxCredit = 0;
		//과목명, 과목코드, 분반, 주관학과, 교과구분, 강의시간, 이수학점, 담당교수
		String subjectName = null, subjectId = null, couresDivision = null, departmentName = null, 
				subjectGroup = null, courseTime = null, subjectCredit = null, professorName = null;
	%>
	
	<!-- 자바스크립트 동작 구현 -->
	<script type="text/javascript"></script>
	
	<!-- 수강신청 목록 -->
	<div class="row" style="overflow:auto;">
		<table cellpadding="5" width="90%"  align="center" cellspacing="1" id="table_list">
			<!-- 수강신청 헤드 -->
			<thead>
				<% String list_item[]={"과목명","과목코드","분반","주관학과", "교과구분","강의시간","이수학점","담당교수", "수강취소"};%>
				<tr bgcolor="#ffff8e">
					<% for(String s: list_item){%> <th><%=s%></th><%}%>
				</tr>
			</thead>
			<!-- 수강신청 바디 -->
			<tbody>
				<%  //목록 조회 함수 호출 : 테이블 return
					sql = "select * from table(SelectTimeTable("+studnetId+","+nowYear+","+nowSemester+"))";
					resultSet = stmt.executeQuery(sql);
					
					if(resultSet != null){
						while(resultSet.next()){
							subjectId = resultSet.getString("subject_id");
							subjectName = resultSet.getString("subject_name");
							couresDivision = resultSet.getString("course_division");
							departmentName = resultSet.getString("department_name");
							subjectGroup = resultSet.getString("subject_group");
							courseTime = resultSet.getString("course_time");
							subjectCredit = resultSet.getString("subject_credit");
							professorName = resultSet.getString("professor_name"); 
				%>
						<tr bgcolor="#ffffff" align="center"> 
							<td><%=subjectName%></td>
							<td><%=subjectId%></td>
							<td><%=couresDivision%></td>
							<td><%=departmentName%></td>
							<td><%=subjectGroup%></td>
							<td><%=courseTime%></td>
							<td><%=subjectCredit%></td>
							<td><%=professorName%></td>
							<td>
								<form method= "post" action="deleteVerify.jsp">
									<input type="hidden" name="subjectId" value="<%=subjectId%>">
									<input type="submit" name="submit" value="취소">
								</form>
							</td>
						</tr>
				<%		}
					}
				%>
			</tbody>
		</table>
	</div>
	
	<!-- 수강확정내역 -->
	<%	//수강확정 내역 조회 함수 : 최대 수강학점, 신청 학점 return 
		sql = "{call Select2TimeTable(?, ?, ?, ?, ?)}";
		cstmt = conn.prepareCall(sql);
		cstmt.setInt(1, Integer.parseInt(studnetId));
		cstmt.setInt(2, nowYear);
		cstmt.setInt(3, nowSemester);
		cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
		cstmt.registerOutParameter(5, java.sql.Types.VARCHAR);
		cstmt.execute();
		enrollCredit = Integer.parseInt(cstmt.getString(4));
		
		//stmt, conn 닫기
		stmt.close();
		cstmt.close();
		conn.close();
	%>
	<jsp:include page = "showCredit.jsp">
		<jsp:param value="<%=remainCredit%>" name="remainCredit"/>
		<jsp:param value="<%=enrollCredit%>" name="enrollCredit"/>
		<jsp:param value="<%=maxCredit%>" name="maxCredit"/>
	</jsp:include>
</body>
</html>