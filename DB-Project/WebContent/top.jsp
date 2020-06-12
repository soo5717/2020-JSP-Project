<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
	String session_id = (String) session.getAttribute("user"); 
	String log, up; 
	if (session_id == null){ 
		log = "<a href=login.jsp>로그인</a>";
		up = null;
	}
	else{
		log = "<a href=logout.jsp>로그아웃</a>"; 
		up = "<a href=update.jsp>사용자 정보 수정</a>";
	}
%> 

<!-- CSS 스타일 -->
<style type = "text/css">
	a{
		font-family: sans-serif; 
	}
</style>

<!-- 상단 메뉴 -->
<table width= "100%" align="center" bgcolor ="#FFFF99" border> 
	<tr> 
		<td align= "center" width="240px"><b><a href ="main.jsp">숙명여자대학교 수강신청</b></td> 
		<td align= "center"><b><a href ="insert.jsp"> 수강신청</b></td> 
		<td align= "center"><b><a href ="delete.jsp"> 수강취소</b></td> 
		<td align= "center"><b><a href ="lookup.jsp"> 수강조회</b></td> 
		<td align= "center"><b><a href ="timatable.jsp">시간표</b></td>
		<% if(up != null){ %>
			<td align= "center"><b><%=up%></b></td>
		<%} %>
		<td align= "center"><b><%=log%></b></td>
	</tr> 
</table>