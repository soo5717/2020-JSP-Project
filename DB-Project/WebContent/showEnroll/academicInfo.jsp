<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- CSS 스타일 -->
<link rel="stylesheet" type="text/css" href = "../CSS/base.css">

<!-- 학적 정보 -->
<% 
	//showEnroll에서 파라미터 받아오기
	String studentId = request.getParameter("studentId");
	String studentName = request.getParameter("studentName");
	String studentDepName = request.getParameter("departmentName");
	String studentSemester = request.getParameter("studentSemester");
	int studentGrade = Integer.parseInt(studentSemester)/2 ;
	String studentCredit = request.getParameter("studentCredit");	
%>


	
	<!--  showEnroll에 넣었던 내용
		<div class="row">
		<jsp:include page = "academicInfo.jsp">
			<jsp:param value="<%=studentId%>" name="studentId"/>
			<jsp:param value="<%=studentName%>" name="studentName"/>
			<jsp:param value="<%=departmentName%>" name="departmentName"/>
			<jsp:param value="<%=studentSemester%>" name="studentSemester"/>
			<jsp:param value="<%=studentGrade%>" name="studentGrade"/>
			<jsp:param value="<%=studentCredit%>" name="studentCredit"/>
		</jsp:include>
	</div><br><br><br>



 -->
	





<div class="container" id="fixedfooter">
	<table width="90%" border = "1"  align="center" height="100%">
		<thead>
			<tr style="background-color: #ffff8e; text-align: center;">학적 정보</tr>
		</thead><br>
		<tbody>
				<tr>
				<td>학번 </td><td><%=studentId%></td>
				<td>이름</td><td><%=studentName%></td>
				<td>소속</td><td><%=studentDepName%></td>
				</tr> 
			 	<tr>
			 	<td> 학년 </td><td><%=studentGrade%></td>
				<td>학기</td><td><%=studentSemester%></td>
				<td>수강가능학점</td><td><%=studentCredit%></td>
			 	</tr> 		
		</tbody>
	</table>	
</div>
<% %>
