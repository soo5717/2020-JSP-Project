<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>수강취소</title>
<!-- CSS 스타일 -->
<style type = "text/css">
	div{
		font-family: sans-serif; 
	}
</style>
</head>
<body>

<!-- 상단 메뉴 -->
<%@include file= "top.jsp"%> <br>

<!-- 수강신청 목록 -->
<div class="row" style="overflow:auto;">
	<table bgcolor="#A0AFFF" cellpadding="5" width="90%"  align="center" cellspacing="1" id="table_list">
		<thead>
			<%
				String list_item[]={"과목명","과목코드","분반","주관학과", "교과구분","강의시간","이수학점","담당교수","신청일"};
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

<!-- 수강확정내역 -->
<%@include file= "bottom.jsp"%>

</body>
</html>