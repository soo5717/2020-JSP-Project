<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import=" java.sql .*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙명여대 수강 조회</title>
<!-- CSS 스타일 -->
<link rel="stylesheet" type="text/css" href = "../CSS/base.css">
<!-- 상단 메뉴-->
<%@include file="../top.jsp"%>
<!-- DB연결 -->
<%@include file= "../utility/connection.jsp"%>

</head>
<body>
	<%
	//과목명, 과목코드, 분반, 주관학과, 교과구분, 강의사간, 이수학점, 담당교수
	String subjectName = null, subjectId = null, couresDivision = null, departmentName = null, 
		 subjectCredit = null, professorName = null, course_room = null;
	//강의시간
	String course_time= null;
	//잔여학점, 수강학점, 최대 수강학점
	int remainCredit = 0, enrollCredit = 0, maxCredit = 0;
	//학생 이름,학생부서이름
	String studentName= null,studentDepName= null;
	//학생 학기, 학년, 수강가능 학점
	int studentSemester= 0,studentGrade= 0,studentCredit= 0;
	
	
	String selectedYear = request.getParameter("selectedYear");
	String selectedSemester = request.getParameter("selectedSemester");
	if(selectedYear == null ) selectedYear = Integer.toString(nowYear);
	if(selectedSemester == null ) selectedSemester = Integer.toString(nowSemester);
	
	%>

	<!-- 학적 정보-->
	<div class="container">
	<%
	//부서명
		sql = "select s.student_name,d.department_name,s.student_semester,s.student_credit from students s, departments d where s.department_id=d.department_id AND s.student_id = "+ Integer.parseInt(studentId);
		System.out.println(sql);
		stmt = conn.createStatement();
		resultSet = stmt.executeQuery(sql);
		if(resultSet.next()){
			studentName = resultSet.getString(1);
			departmentName = resultSet.getString(2);
			
			studentSemester = resultSet.getInt(3);
			studentGrade = studentSemester / 2;
			studentCredit = resultSet.getInt(4);
		}
	%>
	<div class="container" id="fixedfooter">
	<table width="90%" border = "1"  align="center" height="100%">
		<thead>
			<tr style="background-color: #ffff8e; text-align: center;"><th>학적 정보</th></tr>
		</thead><br>
		<tbody>
				<tr>
				<td>학번 </td><td>&nbsp;<%=studentId%></td>
				<td>이름</td><td>&nbsp;<%=studentName%></td>
				<td>소속</td><td>&nbsp;<%=departmentName%></td>
				</tr> 
			 	<tr>
			 	<td> 학년 </td><td>&nbsp;<%=studentGrade%></td>
				<td>학기</td><td>&nbsp;<%=studentSemester%></td>
				<td>수강가능학점</td><td>&nbsp;<%=studentCredit%></td>
			 	</tr> 		
			</tbody>
		</table>	
	</div>

		
<!-- 학기별 수강 조회-->
	<div class="row">
		<table width="90%" border = "1"  align="center" height="100%">
			<form method="get" id="year_semester" action="showEnroll.jsp">
			<thead>
				<tr style="background-color: #ffff8e; text-align: center;"><th>학기별 수강  조회</th></tr>
			</thead>
			<br>
			<tbody>
				<tr>
				<td> 학년도 </td>
				<td align="center">
					<select name="selectedYear" id="selectedYear">
					<option value=<%=selectedYear%>><%=selectedYear%>학년도</option>
					<option value=2020>2020학년도</option>
					<option value=2019>2019학년도</option>
					<option value=2018>2018학년도</option>
					<option value=2017>2017학년도</option>
					</select>
				</td>
				<td> 학기 </td>
				<td align="center">
					<select name="selectedSemester" id="selectedSemester">
					<option value=<%=selectedSemester%>><%=selectedSemester%>학기</option>
					<option value=1>1학기</option>
					<option value=2>2학기</option>
					</select>
				</td>
				<!--검색 버튼-->
				<td><input type="submit" name="submit" value="강의 검색"> </td><td width="50%"></td>
				</tr> 
			</tbody>
			</form>
		</table>

			
	</div><br><br><br>

	<!-- 조회할 과목 리스트 -->
	<div class="row" style="overflow:auto;">
		<table bgcolor="#A0AFFF" cellpadding="5" width="90%"  align="center" cellspacing="1">
		<thead>
		<%
			String list_item[]={"과목명","과목코드","분반","주관학과","강의시간","학점","담당교수"};
		%>
			<tr bgcolor="#ffff8e">
			<%
				for(String s: list_item){
			%>
				<th><%=s%></th>
			<%}%>
			</tr>
		</thead>
		<tbody id="table_list">
			<%  
			
				sql = "select * from table(SelectTimeTable("+studentId+","+selectedYear+","+selectedSemester+"))";
				stmt = conn.createStatement();
				resultSet = stmt.executeQuery(sql);
				
				if(resultSet != null){
					while(resultSet.next()){
						subjectId = resultSet.getString("subject_id");
						subjectName = resultSet.getString("subject_name");
						couresDivision = resultSet.getString("course_division");
						departmentName = resultSet.getString("department_name");
						course_time = resultSet.getString("course_time");
						subjectCredit = resultSet.getString("subject_credit");
						professorName = resultSet.getString("professor_name"); 			
				%>
						<tr bgcolor="#ffffff" align="center"> 
							<td><%=subjectName%></td>
							<td><%=subjectId%></td>
							<td><%=couresDivision%></td>
							<td><%=departmentName%></td>
							<td><%=course_time%></td>
							<td><%=subjectCredit%></td>
							<td><%=professorName%></td>
						</tr>
				<%		}
					}
					
				%>
		
		</tbody>
		
		
	</table>
	</div>
</div>
<!-- 하단 수강신청 확정 내역-->
		<!-- 수강확정내역 -->
	<%//수강확정 내역 조회 함수 : 최대 수강학점, 신청 학점 return 
	
	//stmt, conn 닫기
	stmt.close();
	cstmt.close();
	conn.close();
	%>
	
	<!-- 수강확정내역 -->
	<jsp:include page = "../utility/showCredit.jsp" flush="false"/>
</body>
</html>

