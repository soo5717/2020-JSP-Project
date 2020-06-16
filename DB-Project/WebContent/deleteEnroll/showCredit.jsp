<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- CSS 스타일 -->
<link rel="stylesheet" type="text/css" href = "../CSS/base.css">

<!-- 수강확정내역 -->
<% 
	//insert와 delete에서 파라미터 받아오기
	String remainCredit = request.getParameter("remainCredit");
	String enrollCredit = request.getParameter("enrollCredit");
	String maxCredit = request.getParameter("maxCredit");
%>
<div class="bottom">
	<table width= "100%" align="center" bgcolor ="#FFFF99" border> 
		<tr> 
			<td width="55%">수강 확정 내역</td> 
			<td width="15%">잔여학점: <%=remainCredit%></td> 
			<td width="15%">신청학점: <%=enrollCredit%></td> 
			<td width="15%">최대 수강 학점: <%=maxCredit%></td>
		</tr> 
	</table>
</div>