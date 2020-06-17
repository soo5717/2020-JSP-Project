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
<%@include file= "../deleteEnroll/connection.jsp"%>

</head>
<body>
	<%
	/*
	//db 연결 정보
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	CallableStatement cstmt = null;
	String sql = null; 
	ResultSet resultSet = null;
	
	*/
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
	
		
	String searchYear = request.getParameter("selectedYear");
	String searchSemester = request.getParameter("selectedSemester");
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
			<tr style="background-color: #ffff8e; text-align: center;">학적 정보</tr>
		</thead><br>
		<tbody>
				<tr>
				<td>학번 </td><td><%=studentId%></td>
				<td>이름</td><td><%=studentName%></td>
				<td>소속</td><td><%=departmentName%></td>
				</tr> 
			 	<tr>
			 	<td> 학년 </td><td><%=studentGrade%></td>
				<td>학기</td><td><%=studentSemester%></td>
				<td>수강가능학점</td><td><%=studentCredit%></td>
			 	</tr> 		
			</tbody>
		</table>	
	</div>

		
<!-- 학기별 수강 조회-->
	<div class="row">
		<table width="90%" border = "1"  align="center" height="100%">
			<form method="post" id="year_semester" action="showEnroll.jsp?selectedYear=<%=searchYear%>&selectedSemester=<%=searchSemester%>">
			<thead>
				<tr style="background-color: #ffff8e; text-align: center;">학기별 수강  조회</tr>
			</thead>
			<br>
			<tbody>
				<tr>
				<td> 학년도 </td>
				<td>
					<select name="selectedYear" id="sYear" >
					<option value="2020">2020학년도</option>
					<option value="2019">2019학년도</option>
					<option value="2018">2018학년도</option>
					<option value="2017">2017학년도</option>
					</select>
				</td>
				<td> 학기 </td>
				<td>
					<select name="selectedSemester" id="sSemester" >
					<option value="1">1학기</option>
					<option value="2">2학기</option>
					</select>
				</td>
			
					<!--검색 버튼-->
					<td>  <button type="submit" name="submit">검색</button></td><td width="50%"></td>
					
					
				</tr> 
			</tbody>
			</form>
		</table>
		<%				
					//조회할 학년도,학기 값
			//int selectedYear = Integer.parseInt(request.getParameter("selectedSemesterYear"));
			//int selectedSemester = Integer.parseInt(request.getParameter("selectedSemester"));
					
		%>	
		<script>
			document.getElementById("sSemester").value = "<%=searchSemester%>";
			document.getElementById("sYear").value = "<%=searchYear%>";
		</script>
			
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
				
					sql = "select * from table(SelectTimeTable("+studentId+","+searchYear+","+ searchSemester+"))";
					System.out.println(sql);
					resultSet = stmt.executeQuery(sql);
					
					/* t.subject_id, t.subject_name, 
                                    t.course_division, t.department_name, 
                                    t.subject_group, t.subject_credit, 
                                    t.professor_name, course_time*/
					
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
	sql = "{call Select2TimeTable(?, ?, ?, ?, ?)}";
	cstmt = conn.prepareCall(sql);
	int temp = Integer.parseInt(searchYear);
	cstmt.setInt(1, Integer.parseInt(studentId));
	cstmt.setInt(2, temp );
	temp = Integer.parseInt(searchSemester) ;
	cstmt.setInt(3, temp);
	cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
	cstmt.registerOutParameter(5, java.sql.Types.VARCHAR);
	cstmt.execute();
	enrollCredit = Integer.parseInt(cstmt.getString(4));
	
	//stmt, conn 닫기
	stmt.close();
	cstmt.close();
	conn.close();
	%>
	<jsp:include page = "../deleteEnroll/showCredit.jsp">
		<jsp:param value="<%=remainCredit%>" name="remainCredit"/>
		<jsp:param value="<%=enrollCredit%>" name="enrollCredit"/>
		<jsp:param value="<%=maxCredit%>" name="maxCredit"/>
	</jsp:include>	
<%	

%>
</body>
</html>

