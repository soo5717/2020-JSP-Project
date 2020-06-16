<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= " java.sql .*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙명여대 수강신청</title>
<!-- CSS 스타일 -->
<link rel="stylesheet" type="text/css" href = "../CSS/base.css">
<!-- 상단 메뉴 -->
<%@include file= "../top.jsp"%> <br>
<!-- DB연결 -->
<%@include file= "../deleteEnroll/connection.jsp"%>
</head>
<body>
	<!-- 카테고리 -->
	<%@include file= "category.jsp"%> <br>
	
	<%
		//잔여학점, 수강학점, 최대 수강학점
		int remainCredit=0, enrollCredit=0, maxCredit=0;
	%>

	<!-- 수강신청 목록 -->
	<div class="row" style="overflow:auto;">
		<table bgcolor="#A0AFFF" cellpadding="5" width="90%"  align="center" cellspacing="1" id="table_list">
			<thead>
				<%
					String list_item[]={"과목명","과목코드","분반","주관학과","교과구분", "강의시간","이수학점","정원","신청","여석","담당교수", "신청"};
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
	<jsp:include page = "../deleteEnroll/showCredit.jsp">
		<jsp:param value="<%=remainCredit%>" name="remainCredit"/>
		<jsp:param value="<%=enrollCredit%>" name="enrollCredit"/>
		<jsp:param value="<%=maxCredit%>" name="maxCredit"/>
	</jsp:include>
</body>
</html>