<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- CSS 스타일 -->
<link rel="stylesheet" type="text/css" href = "../CSS/base.css">
 
<!-- 그룹 선택 -->						
<table class="category" bgcolor ="#FFFF99" border>
	<% int i=0; String list_item[]={"직접입력","전체","교양","전공", "타전공"}; %>	
	<tr>
		<% for(String s: list_item){ %>
		 <td>
		 	<form method= "post" action="insert.jsp">
				<input type="hidden" name="groupId" value="<%=i%>">
				<input type="submit" name="submit" value="<%=s%>">
			</form>
		</td>
		<% i++; } %>
	</tr>
</table>