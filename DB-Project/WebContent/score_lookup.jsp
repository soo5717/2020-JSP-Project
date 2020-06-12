<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>데이터베이스를 활용한 수강신청 시스템입니다.</title>
</head>
<body>


	<%@include file="top.jsp"%>

	<div class="container">
		<div>	
			<h3>전체 학기 성적 조회</h3>
		</div>
		<div class="row" style="overflow:auto;">
			<h2>학기별 성적</h2>
			<table bgcolor="#A0AFFF" cellpadding="5" width="90%"  align="center" cellspacing="1" id="table_list">
				<thead>
					<%
						String list_item1[]={"과목명","과목코드","분반","교과구분","강의시간","이수단계","정원","신청","여석","담당교수","강의유형","신청"};
					%>
					<tr bgcolor="#ffff8e">
						<%
							for(String s: list_item1){
						%>
						<th><%=s%></th>
						<%}%>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
			</div>

			<br><br><br>

			<div class="row" style="overflow:auto;">
				<h2>과뫅별 성적</h2>
				<table bgcolor="#A0AFFF" cellpadding="5" width="90%"  align="center" cellspacing="1" id="table_list">
					<thead>
						<%
							String list_item2[]={"과목명","과목코드","분반","교과구분","강의시간","이수단계","정원","신청","여석","담당교수","강의유형","신청"};
						%>
						<tr bgcolor="#ffff8e">
							<%
								for(String s: list_item2){
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


</body>
</html> 