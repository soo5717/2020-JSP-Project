<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>데이터베이스를 활용한 수강신청 시스템입니다.</title>
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
					<tr style="background-color: #ffff8e; text-align: center;">학적 정보</tr>
				</thead>
				<br>
				<tbody>
					 <tr>
						 <td> 학번 </td>
						 <td id="s_name">333</td>
						 <td>아름</td>
						 <td>333</td>
						  <td>소속</td>
						 <td>333</td>
					 </tr> 
				 	<tr>
				 		 <td> 학년 </td>
						 <td id="s_name">333></td>
						 <td>학기</td>
						 <td>333</td>
						  <td>수강가능학점</td>
						 <td>333</td>
				 	</tr> 
	
	
				</tbody>
			</table>	
		</div>
		
		<br><br><br>
		
		<div class="row">
			<table width="90%" border = "1"  align="center" height="100%">
				<thead>
					<tr style="background-color: #ffff8e; text-align: center;">학기별 수강  조회</tr>
				</thead>
				<br>
				<tbody>
					 <tr>
						 <td> 학년도 </td>
						 <td>
						 	<form>
							  <select name="year" >
							    <option value="none">=== 선택 ===</option>
							    <option value="korean">2020</option>
							    <option value="english">2019</option>
							    <option value="chinese">2018</option>
							    <option value="spanish">2017</option>
							  </select>
							</form>
						</td>
						<td> 학기 </td>
						 <td>
						 	<form>
							  <select name="semester" >
							    <option value="none">=== 선택 ===</option>
							    <option value="korean">1학기</option>
							    <option value="english">2학기</option>
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
						String list_item[]={"과목명","과목코드","분반","교과구분","강의시간","이수단계","정원","신청","여석","담당교수","강의유형","신청"};
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
					 <td> 총 신청 과목 수 : </td>
					 <td id="s_name">333</td>
					 <td>총 신청 학점</td>
					 <td>333</td>
				 </tr> 
			</table>	
		</div>
	</div>		
	

</body>
</html>