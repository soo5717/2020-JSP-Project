<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!-- CSS ��Ÿ�� -->
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
<!-- ��ũ��Ʈ -->
<script>
function btn_click(value){
	if(value == "1"){
		document.getElementById("add").style.display = "";
	}else {
		document.getElementById("add").style.display = "none";
	}
}
</script>

<!-- ī�װ� -->
<table class="category" bgcolor ="#FFFF99" border> 
	<tr> 
		<td align= "center"><button type="button" value="1" onclick="btn_click(this.value);">�����Է�</button></td> 
		<td align= "center"><button type="button" value="2" onclick="btn_click(this.value);">��ü</button></td> 
		<td align= "center"><button type="button" value="3" onclick="btn_click(this.value);">����</button></td> 
		<td align= "center"><button type="button" value="4" onclick="btn_click(this.value);">����</button></td>
		<td align= "center"><button type="button" value="5" onclick="btn_click(this.value);">Ÿ����</button></td>
	</tr> 
</table>

<!-- �����Է� -->
<form action="insert.jsp" id="add">
    <fieldset>
        �����ȣ
        <input type="text" name="subject_id" size="4" required>
        �й�
        <input type="text" name="course_division" size="1" required>
        <input type="submit" value="��û">
    </fieldset>
</form>

