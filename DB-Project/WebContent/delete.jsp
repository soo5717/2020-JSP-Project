<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�������</title>
<!-- CSS ��Ÿ�� -->
<style type = "text/css">
	div{
		font-family: sans-serif; 
	}
</style>
</head>
<body>

<!-- ��� �޴� -->
<%@include file= "top.jsp"%> <br>

<!-- ������û ��� -->
<div class="row" style="overflow:auto;">
	<table bgcolor="#A0AFFF" cellpadding="5" width="90%"  align="center" cellspacing="1" id="table_list">
		<thead>
			<%
				String list_item[]={"�����","�����ڵ�","�й�","�ְ��а�", "��������","���ǽð�","�̼�����","��米��","��û��"};
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

		</tbody>
	</table>
</div>

<!-- ����Ȯ������ -->
<%@include file= "bottom.jsp"%>

</body>
</html>