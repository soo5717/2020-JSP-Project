<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import=" java.sql .*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조회 시간표</title>
</head>
<body>

<jsp:include page="timetable.jsp" flush="false"/>
<div>		
			
			<script type="text/javascript">
				var x=15;
				var y=6;
				var timeNum = 1;
				var cellCount = 2;
				var tmpNum = 0;
				var start1 = 0;
				var end1 = 0;
				var start2 = 0;
				var end2 = 0;
				var tmp_start1= 0;
				var tmp_end1 = 0;
				var tmp_start2 = 0;
				var tmp_end2 = 0;
				var sub_str;
				
				
				var sb_name;
				var sb_id;
				var cr_dv;
				var pr_name;
				var room_name;
				document.write("<br><h4 align=\"left\">결과 검색</h4>");
				document.write("<table width=\"75%\" align=\"center\" border>");
				document.write("<tr>");
				document.write("<th bgcolor =\"#FFFF99\">시간</th>");
				document.write("<th bgcolor =\"#FFFF99\">월요일</th>");
				document.write("<th bgcolor =\"#FFFF99\">화요일</th>");
				document.write("<th bgcolor =\"#FFFF99\">수요일</th>");
				document.write("<th bgcolor =\"#FFFF99\">목요일</th>");
				document.write("<th bgcolor =\"#FFFF99\">금요일</th>");
				document.write("</tr>");
				for(i=0;i<x;i++)
				{
					document.write("<tr>");
					for(j=0;j<y;j++)
					{
						if(j % 6 == 0) {
							document.write("<td>"+timeNum+"</td>");
							timeNum++;
						}
						else {
						
							
					
<% 
	String session_id = (String)session.getAttribute("session_id");
	String year=request.getParameter("year");
	String semester=request.getParameter("semester");
	
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "db1715884";// here
	String passwd = "ss1"; //here
	Connection myConn = null;
	Statement stmt = null;
	ResultSet rs= null;
	String mySQL = null;
	
	try{
	Class.forName(dbdriver);
	myConn=DriverManager.getConnection(dburl, user, passwd);
	stmt  = myConn.createStatement();
	}catch(Exception e){
		System.out.println("DB연결오류");
	}
	System.out.println(session_id+ year+ semester);
	mySQL="select * from timetables where student_id='" + session_id+"' and enroll_year = '"+year +"' and enroll_semester='"+semester+"'";
	try{
		rs = stmt.executeQuery(mySQL);
		System.out.println(mySQL);
	
		int all_credit = 0;
		int count = 0;
		while(rs.next()){
			String sb_name = rs.getNString(2);
			int sb_id = rs.getInt(3);
			int cr_dv = rs.getInt(4);
			String pr_name = rs.getString(5);
			String room_name = rs.getString(6);
			int start1 = rs.getInt(7);
			int start2 = rs.getInt(8);
			int end1 = rs.getInt(9);
			int end2 = rs.getInt(10);
			int dum_year = rs.getInt(11);
			int dum_semester = rs.getInt(12);
			int credit = rs.getInt(13);
			count++;
			all_credit += credit;
			System.out.println(end1);
			%>
			
			start1 = <%=start1%>;
			end1 = <%=end1%>;
			start2 = <%=start2%>;
			end2 = <%=end2%>;
			
			sb_name = "<%=sb_name%>";
			sb_id = <%=sb_id%>;
			cr_dv = <%=cr_dv%>;
			pr_name = "<%=pr_name%>";
			room_name  = "<%=room_name%>";
			sub_str = sb_name + "<br>"+ sb_id+"-"+cr_dv+"<br>"+pr_name+"<br>"+room_name;
			
			tmp_start1 = parseInt((start1 % 10000)/100);
			tmp_end1 = parseInt((end1 % 10000)/100);
			if(start2 != 0) tmp_start2 = parseInt((start2 % 10000)/100);
			if(end2 != 0) tmp_end2 = parseInt((end2 % 10000)/100);
			
							tmpNum = cellCount-(timeNum-2)*5;
							if( (parseInt(start1 / 10000) == tmpNum) && (tmp_start1 <= timeNum+7) && (timeNum+7 <= tmp_end1) ){
								document.write("<td>"+sub_str+"<br>"+tmp_start1+":"+(start1 % 100)+"<br>"+tmp_end1+":"+(end1 % 100)+"</td>");
							}
							else if(start2 != 0 && end2 != 0 && parseInt(start2 / 10000) == tmpNum && (tmp_start2 <= timeNum+7) && (timeNum+7 <= tmp_end2)){
								document.write("<td>"+sub_str+"<br>"+tmp_start1+":"+(start2 % 100)+"<br>"+tmp_end1+":"+(end2 % 100)+"</td>");
							}
							else{
								document.write("<td/></td>");
								}
							
						//
			<%
			}
		%>
						
						cellCount++;
						}
					}
					document.write("</tr>");
				}
				document.write("</table>");
			</script>
				
		</div>
		<div  align="center">
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
	}catch(Exception e){
		%>
		<script>
		alert("해당 기간의 시간표는 존재하지 않습니다");
		</script>
		<%
	}
	myConn.close(); 
%>

</body>
</html>