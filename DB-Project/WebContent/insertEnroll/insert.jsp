<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= " java.sql .*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙명여대 수강신청</title>
<!-- CSS 스타일 -->
<link rel="stylesheet" type="text/css" href = "../CSS/base.css">
<!-- 상단 메뉴 -->
<%@include file= "../top.jsp"%>
<!-- DB연결 -->
<%@include file= "../deleteEnroll/connection.jsp"%>
</head>
<body>
	<!-- 변수 선언 -->
	<%
		//과목명, 과목코드, 분반, 주관학과, 교과구분, 강의시간, 이수학점, 담당교수
		String subjectName = null, subjectId = null, couresDivision = null, departmentName = null, 
				subjectGroup = null, courseTime = null, subjectCredit = null, professorName = null;
		
		//정원, 신청 인원, 여석
		int maxNumber, enrollNumber, remainNumber;
		
		//그룹 ID (직접입력: 0, 전체: 1, 교양: 2, 전공: 3, 타전공: 4)
		String groupId = request.getParameter("groupId");
		if (groupId == null) groupId = "0";
		//System.out.println(groupId);
	%>
	
	<!-- 자바스크립트 동작 구현 -->
	<script type="text/javascript"></script>

	<!-- 그룹 선택 -->
	<jsp:include page = "groupSelect.jsp" flush="false"/>
	<%	if(groupId.equals("0")){ %>
		<!-- 직접입력 -->
		<form class="insert" action="insert.jsp" id="add">
		    <fieldset>
				과목번호<input type="text" name="subject_id" size="4" required>
				분반<input type="text" name="course_division" size="1" required>
		    	<input type="submit" value="신청">
		    </fieldset>
		</form><br>
	<% } %>

	<!-- 수강신청 목록 -->
	<br><div class="row" style="overflow:auto;">
		<table cellpadding="5" width="90%"  align="center" cellspacing="1" id="table_list">
			<!-- 수강신청 헤드 -->
			<thead>
				<% String list_item[]={"과목명","과목코드","분반","주관학과","교과구분", "강의시간","이수학점","담당교수", "정원","신청","여석", "신청"}; %>
				<tr bgcolor="#ffff8e">
					<% for(String s: list_item){%> <th><%=s%></th><%}%>
				</tr>
			</thead>
			<!-- 수강신청 바디 -->
			<%  //목록 조회 함수 호출 : 테이블 return
				sql = "select * from table(SelectTimeTable("+studentId+","+nowYear+","+nowSemester+"))";
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
							<form method= "post" action="insertVerify.jsp" name="insertForm" onsubmit="insertCheck()">
								<input type="hidden" name="subjectId" value="<%=subjectId%>">
								<input type="submit" name="submit" value="신청">
							</form>
						</td>
					</tr>
			<%		}
				}
				//stmt, conn 닫기
				stmt.close();
				conn.close();
			%>
		</table>
	</div>


	<!-- 수강확정내역 -->
	<jsp:include page = "../deleteEnroll/showCredit.jsp" flush="false"/>
</body>
</html>