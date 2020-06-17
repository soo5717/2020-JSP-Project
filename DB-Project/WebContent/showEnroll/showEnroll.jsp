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
<!-- 스크립트 -->
<%@include file="enrollList.jsp"%>
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
	
	//변수 선언: 학번, 현재 년도, 현재 학기 
	String studnetId= (String) session.getAttribute("user");
	int nowYear = 0, nowSemester = 0;
	
	
	*/
	//과목명, 과목코드, 분반, 주관학과, 교과구분, 강의사간, 이수학점, 담당교수
	String subjectName = null, subjectId = null, couresDivision = null, departmentName = null, 
		 subjectCredit = null, professorName = null, course_room = null;
	//강의시간
	int course_start1,course_end1,course_start2,course_end2;

	//학번 - 세션 id int 형
	int sId = Integer.parseInt(studentId);
	//잔여학점, 수강학점, 최대 수강학점
	int remainCredit = 0, enrollCredit = 0, maxCredit = 0;
	//학생 이름,학생부서이름
	String studentName,studentDepName;
	//학생 학기, 학년, 수강가능 학점
	int studentSemester,studentGrade;
	int studentGrade = studentSemester,studentCredit;
	
	
	CallableStatement cstmt1 = null;
	CallableStatement cstmt2 = null;
	%>

	<!-- 학적 정보-->
	<div class="container">
	<%
	//부서명
		sql = "select s.student_name,d.department_name,s.student_semester,s.student_credit"+
		"from students s, departments d where s.department_id=d.department_id "+
		"AND s.student_id = "+ Integer.parseInt(studnetId);
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
		<div class="row">
		<jsp:include page = "academicInfo.jsp">
			<jsp:param value="<%=sId%>" name="studentId"/>
			<jsp:param value="<%=studentName%>" name="studentName"/>
			<jsp:param value="<%=departmentName%>" name="studentDepName"/>
			<jsp:param value="<%=studentSemester%>" name="studentSemester"/>
			<jsp:param value="<%=studentGrade%>" name="studentGrade"/>
			<jsp:param value="<%=studentCredit%>" name="studentCredit"/>
		</jsp:include>
	</div><br><br><br>
		
<!-- 학기별 수강 조회-->
	<div class="row">
		<table width="90%" border = "1"  align="center" height="100%">
			<thead>
				<tr style="background-color: #ffff8e; text-align: center;">학기별 수강  조회</tr>
			</thead>
			<br>
			<tbody>
				<tr>
				<td> 학년도 </td>
				<td><form>
					<select name="selectedYear" >
					<option value="none">=== 선택 ===</option>
					<option value="korean">2020</option>
					<option value="english">2019</option>
					<option value="chinese">2018</option>
					<option value="spanish">2017</option>
					</select></form>
				</td>
				<td> 학기 </td>
				<td><form>
					<select name="selectedSemester" >
					<option value="none">=== 선택 ===</option>
					<option value="korean">1학기</option>
					<option value="english">2학기</option>
					</select></form>
				</td>
				<%				
					//조회할 학년도,학기 값
					int selectedYear = Integer.parseInt(request.getParameter("selectedSemesterYear"));
					int selectedSemester = Integer.parseInt(request.getParameter("selectedSemester"));
					
				%>	
			
					<!--검색 버튼-->
					<input type="button" value="검색" onclick="add_new_row('table_list',selectedYear,selectedSemester);">
					
				</tr> 
			</tbody>
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
					sql = "select * from table(SelectTimeTable("+studnetId+","+selectedYear+","+ selectedSemester+"))";
					System.out.println(sql);
					resultSet = stmt.executeQuery(sql);
					
					if(resultSet != null){
						while(resultSet.next()){
							subjectId = resultSet.getString("subject_id");
							subjectName = resultSet.getString("subject_name");
							couresDivision = resultSet.getString("course_division");
							departmentName = resultSet.getString("department_name");

							course_start1 = resultSet.getInt("course_start1");
							course_end1 = resultSet.getInt("course_end1");
							course_start2 = resultSet.getInt("course_start2");
							course_end2 = resultSet.getInt("course_end2");
							course_room = resultSet.getString("course_room");
							professorName = resultSet.getString("professor_name"); 
							
			
							
							cstmt = conn.prepareCall("{? = call Number2TableTime(?,?,?,?,?)}")
							cstmt.registerOutParameter(1,java.sql.Types.VARCHAR);
							cstmt.setInt(2,course_start1);
							cstmt.setInt(3,course_end1);
							cstmt.setInt(4,course_start2);
							cstmt.setInt(5,course_end2);
							cstmt.setInt(6,course_room);
							cstmt.execute();
							String course_time = stmt2.getString(1);
							
							
							
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
	<%
		sql = "{call Select2TimeTable(?, ?, ?, ?, ?)}";
		cstmt = conn.prepareCall(sql);
		cstmt.setInt(1, Integer.parseInt(studnetId));
		cstmt.setInt(2, selectedYear);
		cstmt.setInt(3, selectedSemester);
		cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
		cstmt.registerOutParameter(5, java.sql.Types.VARCHAR);
		cstmt.execute();
		enrollCredit = Integer.parseInt(cstmt.getString(4));
		cstmt.close();
		conn.close();
	%>
	<jsp:include page = "../deleteEnroll/showCredit.jsp">
		<jsp:param value="<%=remainCredit%>" name="remainCredit"/>
		<jsp:param value="<%=enrollCredit%>" name="enrollCredit"/>
		<jsp:param value="<%=maxCredit%>" name="maxCredit"/>
	</jsp:include>
		
		
<%	
resultSet.close();
pstmt.close();
cstmt.close();
stmt.close();
conn.close();
%>
</body>
</html>