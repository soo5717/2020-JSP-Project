<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����ͺ��̽��� Ȱ���� ������û �ý����Դϴ�.</title>
<style tyle="text/css">
html,
body {
    margin:0;
    padding:0;
    height:100%;
}
#fixedfooter {
position:fixed;
left:0px;
bottom:0px;
width: 100%;
text-align: center;
}
.inner {
background:#A0AFFF;
color: white;
width: 100%;
padding: 15px;
display: inline-block;
}
</style>
</head>
<body>


	<%@include file="top.jsp"%><br>

	<div class="container">
		<div class="row">
			<table width="90%" border = "1"  align="center" height="100%">
				<thead>
					<tr style="background-color: #ffff8e; text-align: center;">���� ����</tr>
				</thead>
				<br>
				<tbody>
					 <tr>
						 <td> �й� </td>
						 <td id="s_name">333</td>
						 <td>�Ƹ�</td>
						 <td>333</td>
						  <td>�Ҽ�</td>
						 <td>333</td>
					 </tr> 
				 	<tr>
				 		 <td> �г� </td>
						 <td id="s_name">333></td>
						 <td>�б�</td>
						 <td>333</td>
						  <td>������������</td>
						 <td>333</td>
				 	</tr> 
	
	
				</tbody>
			</table>	
		</div>
		
		<br><br><br>
		
		<div class="row">
			<table width="90%" border = "1"  align="center" height="100%">
				<thead>
					<tr style="background-color: #ffff8e; text-align: center;">�б⺰ ����  ��ȸ</tr>
				</thead>
				<br>
				<tbody>
					 <tr>
						 <td> �г⵵ </td>
						 <td>
						 	<form>
							  <select name="year" >
							    <option value="none">=== ���� ===</option>
							    <option value="korean">2020</option>
							    <option value="english">2019</option>
							    <option value="chinese">2018</option>
							    <option value="spanish">2017</option>
							  </select>
							</form>
						</td>
						<td> �б� </td>
						 <td>
						 	<form>
							  <select name="semester" >
							    <option value="none">=== ���� ===</option>
							    <option value="korean">1�б�</option>
							    <option value="english">2�б�</option>
							  </select>
							</form>
						</td>
					 </tr> 
				</tbody>
			</table>	
			</div>
			
			<br><br><br>
			
			<div class="row" style="overflow:auto;">
			<table bgcolor="#A0AFFF" cellpadding="5" width="90%"  align="center" cellspacing="1" id="table_list">
				<thead>
					<%
						String list_item[]={"�����","�����ڵ�","�й�","��������","���ǽð�","�̼��ܰ�","����","��û","����","��米��","��������","��û"};
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
	</div>
	<div id="fixedfooter">
		<div class = "inner">
			<table width="90%" align="center" height="100%">
				 <tr>
					 <td> �� ��û ���� �� : </td>
					 <td id="s_name">333</td>
					 <td>�� ��û ����</td>
					 <td>333</td>
				 </tr> 
			</table>	
		</div>
	</div>		
	

</body>
</html>