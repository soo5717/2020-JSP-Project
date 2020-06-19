<%@ page contentType="text/html; charset=UTF-8"%>

<!-- 세션 해제 -->
<% session.invalidate(); %>

<!-- 로그아웃 -->
<script>   
	alert("로그아웃 되었습니다.");   
	location.href="/DB-Project/main.jsp"; 
</script>