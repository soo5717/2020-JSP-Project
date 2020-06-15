<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- CSS 스타일 -->
<style type = "text/css">
    	.bottom{
		position:fixed;
		left:0px;
		bottom:0px;
		width: 100%;
		text-align: left;
		font-family: sans-serif;
	}
</style>

<!-- 수강확정내역 -->
<% int remainCredit = 0, enrollCredit = 0, maxCredit = 0; %>
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