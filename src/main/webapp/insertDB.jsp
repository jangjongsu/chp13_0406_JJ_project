<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입성공</title>
</head>
<body>
	<%
		String mid = request.getParameter("userID");
		String mpw = request.getParameter("userPW");
		String memail = request.getParameter("userMAIL");
	%>
	<%
      String driverName = "com.mysql.jdbc.Driver";
      String url = "jdbc:mysql://localhost:3306/jspdb";
      String username = "root";
      String password = "1234";
      String sql = "INSERT INTO members (id, pass, email) VALUES (?,?,?)";
      
      Connection conn = null;
      PreparedStatement pstmt = null;
      
      try {
    	Class.forName(driverName);
		conn = DriverManager.getConnection(url, username, password);
			
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mid);
		pstmt.setString(2, mpw);
		pstmt.setString(3, memail);	
         
         int dbFlag=pstmt.executeUpdate();
         if (dbFlag == 1){
        	 System.out.print("회원가입성공");
        	 response.sendRedirect("signipSuccess.jsp");
         }else{
        	 System.out.print("회원가입실패");
        	 response.sendRedirect("signup.jsp");
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

</body>
</html>