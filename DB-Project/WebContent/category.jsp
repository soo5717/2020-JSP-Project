<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!-- CSS 스타일 -->
<style type = "text/css">
    .category{
		position:relative;
		left:5%;
		width: 50%;
		text-align: center;
		font-family: sans-serif;
	}
	form{
		position:relative;
		left:5%;
		width: 50%;
		font-family: sans-serif;
	}
</style>

<% int getValue = 0; %> 
<!-- 스크립트 -->
<script>
function btn_click(value){
	if(value == "1"){
		document.getElementById("add").style.display = "";
	}else {
		document.getElementById("add").style.display = "none";
	}
}
</script>

<!-- 카테고리 -->
<table class="category" bgcolor ="#FFFF99" border> 
	<tr> 
		<td align= "center"><button type="button" value="1" onclick="btn_click(this.value);">직접입력</button></td> 
		<td align= "center"><button type="button" value="2" onclick="btn_click(this.value);">전체</button></td> 
		<td align= "center"><button type="button" value="3" onclick="btn_click(this.value);">교양</button></td> 
		<td align= "center"><button type="button" value="4" onclick="btn_click(this.value);">전공</button></td>
		<td align= "center"><button type="button" value="5" onclick="btn_click(this.value);">타전공</button></td>
	</tr> 
</table>

<!-- 직접입력 -->
<form action="insert.jsp" id="add">
    <fieldset>
        과목번호
        <input type="text" name="subject_id" size="4" required>
        분반
        <input type="text" name="course_division" size="1" required>
        <input type="submit" value="신청">
    </fieldset>
</form>

