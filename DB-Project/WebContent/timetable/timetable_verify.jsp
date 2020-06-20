<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import=" java.sql .*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조회 시간표</title>
<!-- CSS 스타일 -->
<link rel="stylesheet" type="text/css" href = "../CSS/base.css">
<!-- DB연결 -->
<%@include file= "../utility/connection.jsp"%>
<!-- 시간표 상단 -->
<jsp:include page="timetable.jsp" flush="false"/>
</head>
<body>
	<!-- 로그인 안되어 있을 경우 -->
<%	if(studentId == null){
		response.sendRedirect("/DB-Project/main.jsp");
		return; 
	}
%>	
											
<% 
	String year=request.getParameter("year");
	String semester=request.getParameter("semester");
	String mySQL = null;
	
	try{
		stmt  = conn.createStatement();
	}catch(Exception e){
		System.out.println("DB연결오류");
	}
	
	String[][] timetable = new String[13][5];
	for(int i = 0; i < 13; i++){
		for(int j = 0; j < 5; j++){
			timetable[i][j] = "";
		}
	}
	
	
	mySQL="select * from timetables where student_id='" + studentId+"' and enroll_year = '"+year +"' and enroll_semester='"+semester+"'";
	try{
		resultSet = stmt.executeQuery(mySQL);
		System.out.println(mySQL);

		int all_credit = 0;
		int count = 0;
		
		%>
		<br>
		<br>
		<br> 
		<div style="position:relative">
		<table width="80%" align="center" font-family="sans-serif" border>
		<tr>
			<td bgcolor ="#FFFF99">시간</td>
			<td bgcolor ="#FFFF99">월요일</td>
			<td bgcolor ="#FFFF99">화요일</td>
			<td bgcolor ="#FFFF99">수요일</td>
			<td bgcolor ="#FFFF99">목요일</td>
			<td bgcolor ="#FFFF99">금요일</td>
		</tr>
		
		<%
		while(resultSet.next()){
			String table1 = "";
			String table2 = "";
			
			String sb_name = resultSet.getNString(2);
			int sb_id = resultSet.getInt(3);
			int cr_dv = resultSet.getInt(4);
			String pr_name = resultSet.getString(5);
			String room_name = resultSet.getString(6);
			int start1 = resultSet.getInt(7);
			int start2 = resultSet.getInt(8);
			int end1 = resultSet.getInt(9);
			int end2 = resultSet.getInt(10);
			int dum_year = resultSet.getInt(11);
			int dum_semester = resultSet.getInt(12);
			int credit = resultSet.getInt(13);
			
			table1 = sb_name+"\n"+sb_id +"-"+cr_dv+"\n"+pr_name+"\n"+room_name+"\n"+(start1%10000)/100+":"+(start1%100)+"~"+(end1%10000)/100+":"+(end1%100);
			System.out.println("table1: "+table1);
			if(start2 != 0){
				table2 = sb_name+"\n"+sb_id +"-"+cr_dv+"\n"+pr_name+"\n"+room_name+"\n"+(start2%10000)/100+":"+(start2%100)+"~"+(end2%10000)/100+":"+(end2%100);
				System.out.println("table2: "+table2);
			}
			//once a week
			int day1 =start1/10000;
			int s_hour1 = (start1%10000)/100;
			int e_hour1 = (end1%10000)/100;
			for(int i = s_hour1; i <= e_hour1; i++){ 
				timetable[i-9][day1-2] += table1;
				System.out.println("i:"+i);
				}
			
			//twice a week
			int day2 = 0;
			int s_hour2 = 0;
			int e_hour2 = 0;
			if(start2 != 0){
				day2 = start2/10000;
				s_hour2 = (start2%10000)/100;
				e_hour2 = (end2%10000)/100;
				for(int i = s_hour2; i <= e_hour2; i++){ timetable[i-9][day2-2] += table2;}
			}
			
			count++;
			all_credit += credit;
		}//end while
		
		//timetable draw//5 variables
		for(int i = 0; i< 13; i++){
			int teaching = i+1;
			String d1 = timetable[i][0];
			String d2 = timetable[i][1];
			String d3 = timetable[i][2];
			String d4 = timetable[i][3];
			String d5 = timetable[i][4];
		%>
		<tr>
			<td><%=teaching%></td>
			<td><%=d1%></td>
			<td><%=d2%></td>
			<td><%=d3%></td>
			<td><%=d4%></td>
			<td><%=d5%></td>
		</tr>
		<%	
		}//end for
		%>
		</table>		

		<%if (count == 0)  {%>
			<div align="center" style="position: absolute; left:0px; top:-24px; width:100%; height:128%; background-color:white;">해당 기간의 시간표가 존재하지 않습니다.</div>
			</div>
		<%} %>
		<div  align="center">
		<br>
		
		<p>
		<table width="74%" bgcolor ="#FFFF99" border>
		<tr>
			<th align="right">총 신청 과목수:<%=count%>&nbsp;&nbsp;</th>
			<th align="right">총 신청 학점:<%=all_credit%>&nbsp;&nbsp;</th>
		</tr>
		</table>
		</p>
		</div>
		

		<%
		stmt.close(); 
		}catch(SQLException ex){
		System.out.println("시간표 존재 하지 않음");	
	}
	conn.close(); 
%>

</body>
</html>