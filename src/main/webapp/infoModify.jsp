<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	 String cid = request.getParameter("uid");
	
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jspdb";
 	String username = "root";
	String password = "1234";
 	String sql = "SELECT * FROM members WHERE id=?";
  
  	Connection conn = null;
 	PreparedStatement pstmt = null;
 	ResultSet rs = null; 
 	String mid = "";
	String mpass = "";
	String memail = ""; 
	String mjointime = "";
  
  try {
	Class.forName(driverName);
	conn = DriverManager.getConnection(url, username, password);
		
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, cid);
	
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		mid = rs.getString("id");
		mpass = rs.getString("pass");
		memail = rs.getString("email");
		mjointime = rs.getString("signuptime");
	}
     
  } catch(ClassNotFoundException e) {
     out.println("DB 드라이버 로딩 실패!!!!!");   
  } catch(SQLException e) {
     out.println("DB 연결 실패!!!!!");
  } finally {
     try {
    	 if(pstmt != null) {
             pstmt.close();
          }
        if(conn != null) {
           conn.close();
        }
     } catch(Exception e) {
        e.printStackTrace();
     }
  }
	
	%>
<h2>회원 정보수정</h2>
	<hr>
	<form action="modifyOk.jsp" >
		아이디 : <input type="text" name="userID" size="16" value=<%= mid %> readonly="readonly"><br><br>
		비밀번호 : <input type="password" name="userPW" size="16" value=<%= mpass %>><br><br>
		이메일 : <input type="text" name="userMAIL" size="16" value=<%= memail %>><br><br>
		가입일 : <%= mjointime %>><br><br>
		<hr>
		<input type="submit" value="정보수정하기 ▶">
	</form>

</body>
</html>