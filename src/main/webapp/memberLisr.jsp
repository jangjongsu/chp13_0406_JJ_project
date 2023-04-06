<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
</head>
<body>
	<h2>회원 리스트</h2>
	<hr>
	아이디 / 이메일 / 가입일시 <br>
	<%
	String driverName = "com.mysql.jdbc.Driver";
    	String url = "jdbc:mysql://localhost:3306/jspdb";
     	String username = "root";
    	String password = "1234";
     	String sql = "SELECT id, email, signuptime FROM members";
      
      	Connection conn = null;
     	PreparedStatement pstmt = null;
     	ResultSet rs = null; 
      
      try {
    	Class.forName(driverName);
		conn = DriverManager.getConnection(url, username, password);
			
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		int count = 0;
		while(rs.next()){
			String id = rs.getString("id");
			String email = rs.getString("email");
			String jointime = rs.getString("signuptime");
			
			
			out.print(id+"/"+email+"/"+jointime+"<br>");
			count++; // 총회원수
		}
         out.println("총 회원수 : "+ count+"명");         
         
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
     
      <br>
      <hr>
      <input type="button" value="회원정보수정" onclick="script:window.location.href='modifyInput.jsp'">
      
</body>
</html>