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
    			<option value="2016">2016</option>
    			<option value="2015">2015</option>
    			<option value="2014">2014</option>
    			<option value="2013">2013</option>
    			<option value="2012">2012</option>
    			<option value="2011">2011</option>
    			<option value="2010">2010</option>
    			<option value="2009">2009</option>
    			<option value="2008">2008</option>
    			<option value="2007">2007</option>
    			<option value="2005">2006</option>
    			<option value="2004">2004</option>
    			<option value="2003">2003</option>
    			<option value="2002">2002</option>
    			<option value="2001">2001</option>
    			<option value="2000">2000</option>
    			</select>
			</div>
			<div style="float:left; width:25%;">
			<label for="semesters">학기</label>
				<select id="semester" name="semester">
					<option value="1">1</option>
	    			<option value="2">2</option>
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