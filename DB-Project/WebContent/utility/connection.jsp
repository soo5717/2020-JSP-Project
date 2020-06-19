<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= " java.sql .*"%>

<% 
	//DB연결 정보
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl"; 
	//수연, 윤정, 현진 -> 각자에 맞게 변경 후 push할 때는 connection 파일은 제외하고!
	String user = "db1712357";
	String password = "ss2";
	
	//변수 선언 : DB연결 관련
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	CallableStatement cstmt = null;
	String sql = null; 
	ResultSet resultSet = null;
	
	//변수 선언: 학번, 현재 년도, 현재 학기 
	String studentId= (String) session.getAttribute("session_id");
	int nowYear = 0, nowSemester = 0;
	
	//DB연결 부분
	try { //연결 성공
		Class.forName(driver); 
		conn = DriverManager.getConnection(url, user, password); 
		//stmt = conn.createStatement();
		
		//현재 년도 반환
		sql = "{? = call Date2EnrollYear(SYSDATE)}";
		cstmt = conn.prepareCall(sql);
		cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
		cstmt.execute();
		nowYear = cstmt.getInt(1);
		
		//현재 학기 반환
		sql = "{? = call Date2EnrollSemester(SYSDATE)}";
		cstmt = conn.prepareCall(sql);
		cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
		cstmt.execute();
		nowSemester = cstmt.getInt(1);
		
		cstmt.close();
		
	} catch(ClassNotFoundException e) { //드라이버 로딩 실패
		System.out.println("jdbc driver 로딩 실패"); 
	} catch(SQLException e) { //db연결 실패
		System.out.println("오라클 연결 실패"); 
	}
%>