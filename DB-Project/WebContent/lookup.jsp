<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import=" java.sql .*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC - KR">
<title>데이터베이스를 활용한 수강신청 시스템입니다.</title>
<!-- CSS 스타일-->
<style tyle="text/css">
html,
body {
    margin:0;
    padding:0;
    height:100%;
}
#fixedfooter {
position:fixed;
left:0px;
bottom:0px;
width: 100%;
text-align: center;
}
.inner {
background:#A0AFFF;
color: white;
width: 100%;
padding: 15px;
display: inline-block;
}
</style>
</head>
<body>
<!-- 상단 메뉴-->
	<%@include file="top.jsp"%>
	
	<% if(session_id == null) response.sendRedirect("login.jsp"); %>
	
	<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	CallableStatement cstmt1 = null;
	CallableStatement cstmt2 = null;
	ResultSet rs = null;
	String mySql ="";
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "db1713749";
	String passwd = "oracle"; 
	
	//String userID = request.getParameter("userID");
	//String userPassword = request.getParameter("userPassword");
	%>

<!-- 학적 정보-->
<div class="container">
	<div class="row">
		<table width="90%" border = "1"  align="center" height="100%">
			<thead>
				<tr style="background-color: #ffff8e; text-align: center;">학적 정보</tr>
			</thead><br>
			<tbody>
			<%		
			try {
				Class.forName(dbdriver); 	
				conn = DriverManager.getConnection(dburl, user, passwd);
				mySql = "select student_id,student_name,department_name,student_semester,student_credit from STUDENTS s, DEPARTMENTS d where s.student_id = ? AND d.department_id = s.department_id ";
				pstmt =  conn.prepareStatement(mySql);
				
				rs = pstmt.executeQuery();
				pstmt.setInt(1, Integer.parseInt(session_id));
				if(rs.next()){
					int studentId = rs.getInt("student_id");
					String studentName = rs.getString("student_name");
					String studentDepName = rs.getString("department_name");
					int studentSemester = rs.getInt("student_semester");
					int studentGrade = studentSemester/2 ;
					int studentCredit = rs.getInt("student_credit");
				%>	
					<tr>
				 	<td> 학번 </td><td><%=studentId%></td>
				 	<td>아름</td><td><%=studentName%></td>
					<td>소속</td><td><%=studentDepName%></td>
					</tr> 
				 	<tr>
				 	<td> 학년 </td><td><%=studentGrade%></td>
					<td>학기</td><td><%=studentSemester%></td>
					<td>수강가능학점</td><td><%=studentCredit%></td>
				 	</tr> 
				<%}%>
	
			
			</tbody>
		</table>	
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
				</tr> 
			</tbody>
		</table>	
	</div><br><br><br>
			
	<div class="row" style="overflow:auto;">
		<table bgcolor="#A0AFFF" cellpadding="5" width="90%"  align="center" cellspacing="1" id="table_list">
		<%
			String selectedYear = request.getParameter("selectedSemesterYear");
			String selectedSemester = request.getParameter("selectedSemester");
					
			mySql = "{? = call SelectTimeTable(?,?,?)}"; 
			cstmt1 =  conn.prepareCall(mySql);
			cstmt1.registerOutParameter(1,OracleTypes.CURSOR);
			cstmt1.setInt(2, Integer.parseInt(session_id));
			cstmt1.setInt(3, Integer.parseInt(selectedYear));
			cstmt1.setInt(4, Integer.parseInt(selectedSemester));
			cstmt1.execute();
			rs = (ResultSet)pstmt.getObject();
			
		%>
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
			<tbody>
			<tr><td></td></tr>
				<% 
					
					while(rs.next()){
						String course_time = "";
						document.write("<tr>");
						document.write("<td>"+rs.getString(2)+"</tr>");//과목명
						document.write("<td>"+rs.getInt(1)+"</tr>");//과목코드
						document.write("<td>"+rs.getInt(3)+"</tr>");//분반
						document.write("<td>"+rs.getInt(3)+"</tr>");//주관학과-->수정필요
							course_time = "";
							cstmt2 = conn.prepareCall("{? = call Number2TableTime(?,?,?,?,?)}")
							cstmt2.registerOutParameter(1,java.sql.Types.VARCHAR);
							cstmt2.setInt(2,rs.getInt(6));
							cstmt2.setInt(3,rs.getInt(7));
							cstmt2.setInt(4,rs.getInt(8));
							cstmt2.setInt(5,rs.getInt(9));
							cstmt2.setInt(6,rs.getInt(5));
							cstmt2.execute();
							course_time = stmt2.getString(1);
						document.write("<td>"+course_time+"</tr>");//강의시간
						document.write("<td>"+rs.getInt(4)+"</tr>");//학점
						document.write("<td>"+rs.getInt(4)+"</tr>");//담당 교수 -->수정필요
						
						cstmt2.close();
						/*
						s.subject_id, s.subject_name, 
            c.course_division, s.subject_credit, 
            c.room_name, c.course_start1, c.course_end1, c.course_start2, c.course_end2
						
						*/
					}
				%>
			</tbody>
		</table>
	</div>
</div>
<!-- 하단 수강신청 확정 내역-->
<%@include file="bottom.jsp"%>
	
<div id="fixedfooter">
	<div class = "inner">
		<table width="90%" align="center" height="100%">
			<tr>
			<td> 총 신청 과목 수 : </td>
			<td id="s_name">333</td>
			<td>총 신청 학점</td>
			<td>333</td>
			</tr> 
		</table>	
	</div>
</div>		
		
<%	}catch (ClassNotFoundException e1) {
		System.out.println("jdbc driver 로딩 실패");
	}catch (SQLException e2) {
		System.out.println("오라클 연결 실패");		
	}catch(Throwable e3){ 
		System.out.println(e3);
	} finally{
		try{
			rs.close();
			pstmt.close();
			cstmt1.close();
			conn.close();
		}catch(Exception e){}
	}
%>
</body>
</html>
