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
<jsp:include page = "../top.jsp" flush="false"/>
<!-- DB연결 -->
<%@include file= "../utility/connection.jsp"%>
</head>
<body>

	<!-- 로그인 안되어 있을 경우 -->
	<%	if(studentId == null){
			response.sendRedirect("/DB-Project/main.jsp");
			return; 
		}
	%>

	<!-- 변수 선언 -->
	<%
		//과목명, 과목코드, 분반, 주관학과, 교과구분, 강의시간, 이수학점, 담당교수
		String subjectName = null, subjectId = null, couresDivision = null, departmentName = null, 
				subjectGroup = null, courseTime = null, subjectCredit = null, professorName = null;
	%>
	
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
			<%  //목록 조회 함수 호출 : 테이블 return
				sql = "select * from table(SelectTimeTable("+studentId+","+nowYear+","+nowSemester+"))";
				
				try{
					stmt = conn.createStatement();
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
			<%			}
					}
				} catch(SQLException ex) {
					System.err.println("SQLException: " + ex.getMessage());
				} finally{
					if(stmt != null)
						stmt.close();
					if(conn != null)
						conn.close();
				}
			%>
		</table>
	</div>
	
	<!-- 수강확정내역 -->
	<jsp:include page = "../utility/showCredit.jsp" flush="false"/>
</body>
</html>