<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!-- CSS ��Ÿ�� -->
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

<!-- ����Ȯ������ -->
<% int remainCredit = 0, enrollCredit = 0, maxCredit = 0; %>
<div class="bottom">
	<table width= "100%" align="center" bgcolor ="#FFFF99" border> 
		<tr> 
			<td width="55%">���� Ȯ�� ����</td> 
			<td width="15%">�ܿ�����: <%=remainCredit%></td> 
			<td width="15%">��û����: <%=enrollCredit%></td> 
			<td width="15%">�ִ� ���� ����: <%=maxCredit%></td>
		</tr> 
	</table>
</div>