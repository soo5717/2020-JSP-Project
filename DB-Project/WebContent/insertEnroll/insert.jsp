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
		
		//정원, 신청 인원, 여석
		int maxNumber, enrollNumber, remainNumber;
		
		//그룹 ID (직접입력: 0, 전체: 1, 교양: 2, 전공: 3, 타전공: 4)
		String groupId = request.getParameter("groupId");
		if (groupId == null){ 
			groupId = "-1";
		}
		else{
			switch(groupId){
			case "0": //직접입력
				groupId = "-1";
				break;
			case "1": //전체
				groupId = "2";
				break;
			case "2": //교양
				groupId = "0";
				break;
			case "3": //전공
				groupId = "1";
				break;
			case "4": //타전공
				groupId = "3";
				break;
			}
		}
		//System.out.println(groupId);
		
	%>
	
	<!-- 자바스크립트 동작 구현 -->
	<script type="text/javascript"></script>

	<!-- 그룹 선택 -->
	<jsp:include page = "groupSelect.jsp" flush="false"/>
	<%	if(groupId.equals("-1")){ %>
		<!-- 직접입력 -->
		<form class="insert" method= "post" action="insertVerify.jsp">
		    <fieldset>
				과목번호 <input type="text" name="subjectId" size="4" required>
				분반 <input type="text" name="couresDivision" size="1" required>
		    	<input type="submit" value="신청">
		    </fieldset>
		</form>
	<%	} %>

	<!-- 수강신청 목록 -->
	<br><div class="row" style="overflow:auto;">
		<table cellpadding="5" width="90%"  align="center" cellspacing="1" id="table_list">
			<!-- 수강신청 헤드 -->
			<thead>
				<%	String list_item[]={"과목명","과목코드","분반","주관학과","교과구분", "강의시간","이수학점","담당교수", "정원","신청","여석", "신청"}; %>
				<tr bgcolor="#ffff8e">
					<%	for(String s: list_item){%> <th><%=s%></th><%}%>
				</tr>
			</thead>
			<!-- 수강신청 바디 -->
			<%	//목록 조회 함수 호출 : 테이블 return
				if(!groupId.equals("-1")){
					sql = "select * from table(SelectEnrollTable("+studentId+","+groupId+"))";
					try{
						stmt = conn.createStatement();
						resultSet = stmt.executeQuery(sql);
					
						if(resultSet != null){
							while(resultSet.next()){
								subjectName = resultSet.getString("subject_name");
								subjectId = resultSet.getString("subject_id");
								couresDivision = resultSet.getString("course_division");
								departmentName = resultSet.getString("dep_name");
								subjectGroup = resultSet.getString("subject_group");
								courseTime = resultSet.getString("course_time");
								subjectCredit = resultSet.getString("subject_credit");
								professorName = resultSet.getString("professor_name"); 
								maxNumber = resultSet.getInt("course_personnel");
								enrollNumber = resultSet.getInt("course_pcount");
								remainNumber = resultSet.getInt("course_remain");
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
								<td><%=maxNumber%></td>
								<td><%=enrollNumber%></td>
								<td><%=remainNumber%></td>
								<td>
									<form method= "post" action="insertVerify.jsp">
										<input type="hidden" name="subjectId" value="<%=subjectId%>">
										<input type="hidden" name="couresDivision" value="<%=couresDivision%>">
										<input type="submit" name="submit" value="신청">
									</form>
								</td>
							</tr>
			<%				}
						}
					} catch(SQLException ex) {
						System.err.println("SQLException: " + ex.getMessage());
					} finally{
						if(stmt != null)
							stmt.close();
						if(conn != null)
							conn.close();						
					}
				}
			%>
		</table>
	</div><br><br>
 
	<!-- 수강확정내역 -->
	<jsp:include page = "../utility/showCredit.jsp" flush="false"/>
</body>
</html>