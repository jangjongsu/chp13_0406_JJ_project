<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id 중복여부 출력</title>
</head>
<body>
	<%
		String cid = request.getParameter("uId");
	
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspdb";
	 	String username = "root";
		String password = "1234";
	 	String sql = "SELECT id FROM members where id = ?";
	  
	  	Connection conn = null;
	 	PreparedStatement pstmt = null;
	 	ResultSet rs = null; 
	  
  try {
	Class.forName(driverName);
	conn = DriverManager.getConnection(url, username, password);
		
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, cid);
	
	rs = pstmt.executeQuery();
	int count = 0;
	while(rs.next()){
		count++; 
	}
	if(count == 0){
		out.println(cid + "는 가입 가능한 아이디입니다.");
	} else {
     out.println(cid +"는 가입 불가능한 아이디입니다. 다른아이디를 입력하세요 ");
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