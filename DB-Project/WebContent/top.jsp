<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
	String session_id = (String) session.getAttribute("user"); 
	String log, up; 
	if (session_id == null){ 
		log = "<a href=login.jsp>�α���</a>";
		up = null;
	}
	else{
		log = "<a href=logout.jsp>�α׾ƿ�</a>"; 
		up = "<a href=update.jsp>����� ���� ����</a>";
	}
%> 

<!-- CSS ��Ÿ�� -->
<style type = "text/css">
	a{
		font-family: sans-serif; 
	}
</style>

<!-- ��� �޴� -->
<table width= "100%" align="center" bgcolor ="#FFFF99" border> 
	<tr> 
		<td align= "center" width="240px"><b><a href ="main.jsp">�����ڴ��б� ������û</b></td> 
		<td align= "center"><b><a href ="insert.jsp"> ������û</b></td> 
		<td align= "center"><b><a href ="delete.jsp"> �������</b></td> 
		<td align= "center"><b><a href ="lookup.jsp"> ������ȸ</b></td> 
		<td align= "center"><b><a href ="timatable.jsp">�ð�ǥ</b></td>
		<% if(up != null){ %>
			<td align= "center"><b><%=up%></b></td>
		<%} %>
		<td align= "center"><b><%=log%></b></td>
	</tr> 
</table>