<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 결과</title>
</head>
<body>
	<%	
		String mid = request.getParameter("userID");
		String mpw = request.getParameter("userPW");
		String memail = request.getParameter("userMAIL");

    	String driverName = "com.mysql.jdbc.Driver";
    	String url = "jdbc:mysql://localhost:3306/jspdb";
     	String username = "root";
    	String password = "1234";
     	String sql = "UPDATE members SET pass=?, email=? where id=?";
      
      	Connection conn = null;
     	PreparedStatement pstmt = null;
      
      try {
    	Class.forName(driverName);
		conn = DriverManager.getConnection(url, username, password);
			
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(3, mid);
		pstmt.setString(1, mpw);
		pstmt.setString(2, memail);	
         
         int dbFlag=pstmt.executeUpdate();
         if (dbFlag == 1){
        	 System.out.print("회원정보수정성공");
        	 out.print("회원정보수정성공");
        
         }else{
        	 System.out.print("회원정보수정실패");
        	 out.print("회원정보수정실패");
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