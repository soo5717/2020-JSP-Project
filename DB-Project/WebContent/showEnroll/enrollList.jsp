<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- CSS 스타일 -->
<link rel="stylesheet" type="text/css" href = "../CSS/base.css">

<!-- 수강 신청 내역 확인 -->

			
<script>
	function btn_click(value){
		if(value == "1"){
			document.getElementById("table_list").style.display = "";
			
		}else {
			document.getElementById("table_list").style.display = "none";
		}
	}




	var num_rows=0;//https://lasdri.tistory.com/583
	var new_row_num=0;
;
	function add_new_row(obj,enroll_list[]) {
		
		$("#num_rows").val(++num_rows);
		var tag = ""
		tag +="<tr bgcolor=\"#ffffff\" id=\"tr_id"+(new_row_num + n)+"\">\n"; //행 ID 설정
		tag +="<td align=\"center\">"+((new_row_num + n) +1)+"</td>\n"; //첫번째 열 번호
		tag +="<td>\n";
		tag +="<input type=\"hidden\" name=\"cma_num[]\" id=\"cma_num"+(new_row_num + n)+"\" value=\""+(new_row_num + n)+"\" />\n";
		tag +="<input type=\"text\" name=\"cma_text[]\" id=\"cma_text"+(new_row_num + n)+"\" value=\"내용 "+(new_row_num+1)+"\" />\n";
		tag +="</td>\n";
		tag +="</td>\n";
		tag +="<td>\n";
		tag +="<input type=\"button\" value=\"아래로\" onclick=\"movedown('cma_text[]','cma_num[]','cma_text_value','tr_id',"+(new_row_num + n)+");\" />\n";
		tag +="</td>\n";
		tag +="<td align=\"center\">"+((new_row_num + n) +1)+"</td>\n"; //첫번째 열 번호
		tag +="<td>\n";
		tag +="<td align=\"center\">"+((new_row_num + n) +1)+"</td>\n"; //첫번째 열 번호
		tag +="<td>\n";
		tag +="<td align=\"center\">"+((new_row_num + n) +1)+"</td>\n"; //첫번째 열 번호
		tag +="<td>\n";
	
		tag +="</tr>\n";
	  
		$("#"+obj).append(tag);
		new_row_num++;
		addBasicData('cma_text[]','cma_text_value');
	}
	  
	
	function addBasicData(ctext,tval) {
		var i, tag=[];
		var tmp_text = document.getElementsByName(ctext);
		var tot = tmp_text.length;
		for (i = 0; i < tot; i++) {
			tag[i] = tmp_text[i].value;
		}
		document.getElementById(tval).value = tag.join(",");
	}
  
	function checkTableForm(ctext,cnum,tval,obj,n,stype) {
		var i, tag=[];
		var tmp_text = document.getElementsByName(ctext);
		var tmp_num = document.getElementsByName(cnum);
		var tot = tmp_text.length;
		tot = (stype == "delete") ? (tot-1) : tot;
		for (i = 0; i < tot; i++) {
			document.getElementById(obj+tmp_num[i].value).style.backgroundColor = "#fff";
			tag[i] = tmp_text[i].value;
		}
		document.getElementById(obj+n).style.backgroundColor = "#ffff80";
		document.getElementById(tval).value = tag.join(",");
	}
	location.href="delete.jsp"; 
</script>




