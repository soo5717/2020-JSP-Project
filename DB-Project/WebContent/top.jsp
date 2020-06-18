<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- CSS 스타일 -->
<link rel="stylesheet" type="text/css" href = "CSS/base.css">

<% 
	String session_id = (String) session.getAttribute("user"); 
	String log, up; 
	if (session_id == null){ 
		log = "<a href=login/login.jsp>로그인</a>";
		up = null;
	}
	else{
		log = "<a href=login/logout.jsp>로그아웃</a>"; 
		up = "<a href=login/update.jsp>사용자 정보 수정</a>";
	}
%> 

<!-- 상단 메뉴 -->
<table class="top" bgcolor ="#FFFF99" border> 
	<tr> 
		<td align= "center" width="240px"><b><a href ="main.jsp">숙명여자대학교 수강신청</a></b></td> 
		<td align= "center"><b><a href ="/DB-Project/insertEnroll/insert.jsp"> 수강신청</a></b></td> 
		<td align= "center"><b><a href ="/DB-Project/deleteEnroll/delete.jsp"> 수강취소</a></b></td> 
		<td align= "center"><b><a href ="lookup.jsp"> 수강조회</a></b></td> 
		<td align= "center"><b><a href ="timetable/timatable.jsp"></a>시간표</b></td>
		<% if(up != null){ %>
			<td align= "center"><b><%=up%></b></td>
		<%} %>
		<td align= "center"><b><%=log%></b></td>
	</tr> 
</table><br><br>