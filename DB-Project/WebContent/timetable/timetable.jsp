<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import=" java.sql .*" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>시간표</title>
</head>
<body>
<%@include file="../top.jsp"%>
	<div>
	<h3>학기별 시간표 조회</h3>
		<div>
		<form method="post" action="timetable_verify.jsp"><!-- action 파일은 DB수정하는 기능 해야 함 -->
			<div style="float:left; width:25%;">
			<label for="years">학년도</label>
			<select id="year" name="year">
				<option value="2020">2020</option>
    			<option value="2019">2019</option>
    			<option value="2018">2018</option>
    			<option value="2017">2017</option>
    			</select>
			</div>
			<div style="float:left; width:25%;">
			<label for="semesters">학기</label>
				<select id="semester" name="semester">
					<option value="1">1</option>
	    			<option value="2">2</option>
	    			<option value="3">3</option>
	    			<option value="4">4</option>
	    			<option value="5">5</option>
	    			<option value="6">6</option>
	    			<option value="7">7</option>
	    			<option value="8">8</option>
	    			</select>
			</div>
			<div style="float:left; width:10%;"><input type="submit" value="검색"></div>
		</form>
		</div>
	</div>
	
	<div>
			
	</div>
</body>
</html>